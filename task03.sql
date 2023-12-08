CREATE SCHEMA IF NOT EXISTS db_project;
SET search_path = db_project, public;

-- DROP TABLE Player;
CREATE TABLE IF NOT EXISTS Player (
    player_id INTEGER PRIMARY KEY,
    nickname TEXT,
    first_name TEXT,
    last_name TEXT,
    address TEXT,
    CONSTRAINT address_format CHECK (address LIKE '%,%,%')
);

-- DROP TABLE Blacklist;
CREATE TABLE IF NOT EXISTS Blacklist (
    blacklist_id INTEGER PRIMARY KEY,
    ban_reason TEXT,
    ban_date DATE NOT NULL DEFAULT now()::date,
    player_id INTEGER,
    CONSTRAINT fk_blacklist 
    	FOREIGN KEY (player_id) 
    		REFERENCES Player(player_id)
    			ON DELETE CASCADE
);

-- DROP TABLE Game_Description;
CREATE TABLE IF NOT EXISTS Game_Description (
    game_id INTEGER PRIMARY KEY,
    game_name TEXT,
    min_players INTEGER NOT NULL,
    max_players INTEGER NOT NULL,
    hall TEXT,
    CONSTRAINT valid_hall CHECK (hall IN ('Red', 'Green', 'Blue', 'Black', 'Yellow'))
);

-- DROP TABLE Gambling_Table;
CREATE TABLE IF NOT EXISTS Gambling_Table (
	table_id INTEGER PRIMARY KEY,
	out_of_order BOOLEAN DEFAULT FALSE,
	game_id INTEGER,
	CONSTRAINT fk_gambling_table
		FOREIGN KEY (game_id)
			REFERENCES Game_Description(game_id)
				ON DELETE CASCADE
);

-- DROP TABLE Event_Table;
CREATE TABLE IF NOT EXISTS Event_Table (
	event_id INTEGER PRIMARY KEY,
	table_id INTEGER,
	date_start DATE NOT NULL DEFAULT now()::date,
	date_end DATE NOT NULL DEFAULT '3000-01-01',
	CONSTRAINT fk_event_table
		FOREIGN KEY (table_id)
			REFERENCES Gambling_Table(table_id)
				ON DELETE CASCADE
);

-- DROP TABLE Participation;
CREATE TABLE IF NOT EXISTS Participation (
	participation_id INTEGER PRIMARY KEY,
	player_id INTEGER,
	event_id INTEGER,
	CONSTRAINT fk_participation_1
		FOREIGN KEY (player_id)
			REFERENCES Player(player_id)
				ON DELETE CASCADE,
	CONSTRAINT fk_participation_2
		FOREIGN KEY (event_id)
			REFERENCES Event_Table(event_id)
				ON DELETE CASCADE
);

-- DROP TABLE Drink_Info;
CREATE TABLE IF NOT EXISTS Drink_Info (
	drink_id INTEGER PRIMARY KEY,
	drink_title TEXT,
	alcohol_percentage NUMERIC NOT NULL,
	drink_price INTEGER NOT NULL
);

-- DROP TABLE Order_Table;
CREATE TABLE IF NOT EXISTS Order_Table (
	order_id INTEGER PRIMARY KEY,
	player_id INTEGER,
	order_date DATE NOT NULL DEFAULT now()::date,
	CONSTRAINT fk_order_table
		FOREIGN KEY (player_id)
			REFERENCES Player(player_id)
				ON DELETE CASCADE
);

-- DROP TABLE Sale;
CREATE TABLE IF NOT EXISTS Sale (
	quantity INTEGER NOT NULL DEFAULT 1,
	drink_id INTEGER,
	order_id INTEGER,
	CONSTRAINT fk_sale_1
		FOREIGN KEY (drink_id)
			REFERENCES Drink_Info(drink_id)
				ON DELETE CASCADE,
	CONSTRAINT fk_sale_2
		FOREIGN KEY (order_id)
			REFERENCES Order_Table(order_id)
				ON DELETE CASCADE
);

-- DROP TABLE Chip_Transaction;
CREATE TABLE IF NOT EXISTS Chip_Transaction (
	type_of_the_transaction TEXT,
	amount DECIMAL NOT NULL,
	transaction_date DATE NOT NULL DEFAULT now()::date,
	player_id INTEGER,
	participation_id INTEGER,
	order_id INTEGER,
	CONSTRAINT fk_chip_transaction_1
		FOREIGN KEY (player_id)
			REFERENCES Player(player_id)
				ON DELETE CASCADE,
	CONSTRAINT fk_chip_transaction_2
		FOREIGN KEY (participation_id)
			REFERENCES Participation(participation_id)
				ON DELETE CASCADE,
	CONSTRAINT fk_chip_transaction_3
		FOREIGN KEY (order_id)
			REFERENCES Order_Table(order_id)
				ON DELETE CASCADE,
	CONSTRAINT valid_type CHECK (type_of_the_transaction IN ('Bar', 'Game', 'Chip'))
);


