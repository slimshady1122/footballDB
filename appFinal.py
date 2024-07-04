import requests
from bs4 import BeautifulSoup
from faker import Faker
import mysql.connector

def reset_auto_increment(cursor, table_name):
    cursor.execute(f"ALTER TABLE {table_name} AUTO_INCREMENT = 1;")

def clear_table(cursor, table_name):
    cursor.execute(f"DELETE FROM {table_name};")
    reset_auto_increment(cursor, table_name)

# Establish connection to MySQL database



        # Create tables
        cursor.execute("""
        CREATE TABLE IF NOT EXISTS leagues (
            league_id INT AUTO_INCREMENT PRIMARY KEY,
            league_name VARCHAR(100) NOT NULL,
            league_country VARCHAR(100) NOT NULL,
            start_date DATE NOT NULL,
            end_date DATE NOT NULL
        );
        """)


        cursor.execute("""
        CREATE TABLE IF NOT EXISTS stadiums (
            stadium_id INT AUTO_INCREMENT PRIMARY KEY,
            stadium_name VARCHAR(100) NOT NULL,
            city VARCHAR(100) NOT NULL,
            capacity INT NOT NULL
        );
        """)

        cursor.execute("""
        CREATE TABLE IF NOT EXISTS teams (
            team_id INT AUTO_INCREMENT PRIMARY KEY,
            team_name VARCHAR(100) NOT NULL UNIQUE,
            coach VARCHAR(100) NOT NULL,
            league_id INT,
            stadium_id INT,
            FOREIGN KEY (league_id) REFERENCES leagues (league_id) ON DELETE CASCADE,
            FOREIGN KEY (stadium_id) REFERENCES stadiums (stadium_id) ON DELETE SET NULL
        );
        """)

        cursor.execute("""
        CREATE TABLE IF NOT EXISTS players (
            player_id INT AUTO_INCREMENT PRIMARY KEY,
            player_name VARCHAR(100) NOT NULL,
            position VARCHAR(50) NOT NULL,
            age INT NOT NULL,
            nationality VARCHAR(100) NOT NULL,
            team_id INT,
            FOREIGN KEY (team_id) REFERENCES teams (team_id) ON DELETE CASCADE
        );
        """)

        # Ensure team_name is indexed before creating the matches table
        cursor.execute("CREATE INDEX idx_team_name ON teams(team_name);")

        

        cursor.execute("""
        CREATE TABLE IF NOT EXISTS matches (
            match_id INT AUTO_INCREMENT PRIMARY KEY,
            match_date DATE NOT NULL,
            match_time TIME NOT NULL,
            home_team VARCHAR(100) NOT NULL,
            away_team VARCHAR(100) NOT NULL,
            stadium_id INT,
            league_id INT,
            FOREIGN KEY (home_team) REFERENCES teams (team_name) ON DELETE CASCADE,
            FOREIGN KEY (away_team) REFERENCES teams (team_name) ON DELETE CASCADE,
            FOREIGN KEY (stadium_id) REFERENCES stadiums (stadium_id) ON DELETE CASCADE,
            FOREIGN KEY (league_id) REFERENCES leagues (league_id) ON DELETE CASCADE
        );
        """)

        # Clear tables before re-inserting data
        clear_table(cursor, 'players')
        clear_table(cursor, 'matches')
        clear_table(cursor, 'teams')
        clear_table(cursor, 'stadiums')
        clear_table(cursor, 'leagues')
        

        # Insert initial data into leagues, stadiums, and teams
        cursor.execute('''
            INSERT INTO leagues (league_name, league_country, start_date, end_date)
            VALUES ('Premier League', 'England', '2024-08-01', '2025-05-30'),
                   ('La Liga', 'Spain', '2024-09-01', '2025-06-30'),
                   ('Serie A', 'Italy', '2024-07-15', '2025-06-15');
        ''')

        cursor.execute("INSERT INTO stadiums (stadium_name, city, capacity) VALUES \
                        ('Anfield', 'Liverpool', 54074), \
                        ('Etihad Stadium', 'Manchester', 55097), \
                        ('Camp Nou', 'Barcelona', 99354), \
                        ('Santiago Bernabeu', 'Madrid', 81044), \
                        ('San Siro', 'Milan', 80018), \
                        ('Allianz Stadium', 'Turin', 41507);")

        cursor.execute("INSERT INTO teams (team_name, coach, league_id, stadium_id) VALUES \
                        ('Liverpool', 'Jurgen Klopp', 1, 1), \
                        ('Manchester City', 'Pep Guardiola', 1, 2), \
                        ('Barcelona', 'Xavi', 2, 3), \
                        ('Real Madrid', 'Carlo Ancelotti', 2, 4), \
                        ('AC Milan', 'Stefano Pioli', 3, 5), \
                        ('Juventus', 'Massimiliano Allegri', 3, 6);")

        # Commit initial data
        connection.commit()

        print('Initial data inserted into leagues, stadiums, and teams tables')

        # Function to insert players
        fake = Faker()

        def insert_player(cursor, player_name, player_position, age, nationality, team_name):
            # Check if the player already exists
            check_query = """
            SELECT COUNT(*)
            FROM players
            WHERE player_name = %s AND team_id = (SELECT team_id FROM teams WHERE team_name = %s)
            """
            cursor.execute(check_query, (player_name, team_name))
            result = cursor.fetchone()

            if result[0] == 0:
                # Insert the player if not exists
                query = """
                INSERT INTO players (player_name, position, age, nationality, team_id)
                VALUES (%s, %s, %s, %s, (SELECT team_id FROM teams WHERE team_name = %s));
                """
                cursor.execute(query, (player_name, player_position, age, nationality, team_name))
            else:
                print(f"Player {player_name} already exists in team {team_name}")

        # Function to scrape and add players for a team
        def add_players_for_team(url, team_name):
            response = requests.get(url)
            if response.status_code == 200:
                soup = BeautifulSoup(response.content, "html.parser")
                player_cards = soup.find_all("div", class_="EntityNavigationLink_content__kytlW")

                for card in player_cards:
                    player_name = card.find("p", class_="EntityNavigationLink_title__zbfTk").text.strip()
                    player_position = card.find("p", class_="EntityNavigationLink_subtitle__s9Y3m").text.strip()
                    age = fake.random_int(min=18, max=40)
                    nationality = fake.country()
                    insert_player(cursor, player_name, player_position, age, nationality, team_name)
                connection.commit()
                print(f'Players added successfully to team {team_name}')
            else:
                print(f'Failed to fetch data from {url}')

        # Debugging step to check if the team exists before adding players
        cursor.execute("SELECT team_name FROM teams")
        teams = cursor.fetchall()
        for team in teams:
            print(f"Team Name: {team[0]}")

        # Add players for each team
        add_players_for_team("https://onefootball.com/en/team/liverpool-18/squad", 'Liverpool')
        add_players_for_team("https://onefootball.com/en/team/manchester-city-33/squad", 'Manchester City')
        add_players_for_team("https://onefootball.com/en/team/fc-barcelona-5/squad", 'Barcelona')
        add_players_for_team("https://onefootball.com/en/team/real-madrid-26/squad", 'Real Madrid')
        add_players_for_team("https://onefootball.com/en/team/milan-23/squad", 'AC Milan')
        add_players_for_team("https://onefootball.com/en/team/juventus-17/squad", 'Juventus')

        # Insert matches with team names
        cursor.execute('''
        INSERT INTO matches (match_date, match_time, home_team, away_team, stadium_id, league_id)
        VALUES  ('2024-08-10', '15:00:00', 'Liverpool', 'Manchester City', 1, 1), \
                ('2024-08-12', '16:30:00', 'Barcelona', 'Real Madrid', 3, 2), \
                ('2024-08-15', '14:00:00', 'AC Milan', 'Juventus', 5, 3);
        ''')

        connection.commit()
        print('Matches added successfully')

except mysql.connector.Error as error:
    print('Error:', error)

finally:
    if 'connection' in locals() and connection.is_connected():
        cursor.close()
        connection.close()
        print('MySQL connection closed')
