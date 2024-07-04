DROP TABLE IF EXISTS GAME_EVENTS CASCADE;

DROP TABLE IF EXISTS CLUB_GAMES CASCADE;

DROP TABLE IF EXISTS GAMES CASCADE;

DROP TABLE IF EXISTS PLAYERS CASCADE;

DROP TABLE IF EXISTS CLUBS CASCADE;

/* Tables */
CREATE TABLE
    GAMES (
        game_id INTEGER NOT NULL,
        competition_id VARCHAR(16) NOT NULL,
        season INTEGER NOT NULL,
        round VARCHAR(60) NOT NULL,
        game_date DATE NOT NULL,
        stadium VARCHAR(60),
        attendance INTEGER,
        referee VARCHAR(60),
        PRIMARY KEY (game_id)
    );

CREATE TABLE
    CLUBS (
        club_id INTEGER NOT NULL,
        club_name VARCHAR(60) NOT NULL,
        squad_size INTEGER NOT NULL,
        average_age REAL,
        foreigners_number INTEGER NOT NULL,
        foreigners_percentage REAL NOT NULL,
        national_team_players INTEGER NOT NULL,
        stadium_name VARCHAR(60) NOT NULL,
        stadium_seats INTEGER NOT NULL,
        net_transfer_record INTEGER NOT NULL,
        last_season INTEGER NOT NULL,
        local_competition_code VARCHAR(32) NOT NULL,
        PRIMARY KEY (club_id)
    );

CREATE TABLE
    PLAYERS (
        player_id INTEGER NOT NULL,
        last_name VARCHAR(60) NOT NULL,
        player_name VARCHAR(60) NOT NULL,
        last_season INTEGER NOT NULL,
        current_club_id INTEGER NOT NULL,
        country_of_birth VARCHAR(40),
        city_of_birth VARCHAR(70),
        country_of_citizenship VARCHAR(40),
        date_of_birth DATE,
        foot VARCHAR(5),
        height_in_cm INTEGER,
        sub_position VARCHAR(32),
        position VARCHAR(32),
        value_eur INTEGER,
        top_value_eur INTEGER,
        contract_expiration_date DATE,
        agent_name VARCHAR(60),
        image_url VARCHAR(150) NOT NULL,
        PRIMARY KEY (player_id),
        FOREIGN KEY (current_club_id) REFERENCES CLUBS(club_id)
    );

CREATE TABLE
    GAME_EVENTS (
        game_event_id VARCHAR(40) NOT NULL,
        minute INTEGER NOT NULL,
        event_type VARCHAR(32) NOT NULL,
        club_id INTEGER NOT NULL,
        event_description VARCHAR(150),
        player_in_id INTEGER,
        player_assist_id INTEGER,
        game_id INTEGER NOT NULL,
        player_id INTEGER NOT NULL,
        PRIMARY KEY (game_event_id),
        FOREIGN KEY (game_id) REFERENCES GAMES(game_id),
        FOREIGN KEY (player_id) REFERENCES PLAYERS(player_id)
    );

CREATE TABLE
    CLUB_GAMES (
        game_id INTEGER NOT NULL,
        club_id INTEGER NOT NULL,
        own_goal INTEGER NOT NULL,
        own_position INTEGER NOT NULL,
        own_manager_name VARCHAR(60),
        hosting BOOLEAN NOT NULL,
        is_win BOOLEAN NOT NULL,
        club_formation VARCHAR(40),
        PRIMARY KEY (game_id, club_id),
        FOREIGN KEY (game_id) REFERENCES GAMES(game_id),
        FOREIGN KEY (club_id) REFERENCES CLUBS(club_id)
    );
