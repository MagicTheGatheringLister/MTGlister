CREATE DATABASE MTGLister_db;

USE MTGLister_db;

# DROP TABLE IF EXISTS ads;
# DROP TABLE IF EXISTS users;

CREATE TABLE Users (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    username VARCHAR(240) NOT NULL,
    email VARCHAR(240) NOT NULL,
    password VARCHAR(255) NOT NULL,
    deck_list INT UNSIGNED NULL,
    FOREIGN KEY (deck_list) REFERENCES Deck(id)
        ON DELETE CASCADE,
    PRIMARY KEY (id)
);

CREATE TABLE Deck (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    deck_name VARCHAR(50) not null,
    user_id INT UNSIGNED NOT NULL,
    date_created DATETIME NOT NULL,
    description TEXT NOT NULL,
    card_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES Users(id)
        ON DELETE CASCADE,
    FOREIGN KEY (card_id ) REFERENCES Card(id)
        ON DELETE CASCADE

);
CREATE TABLE Card (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    card_name  VARCHAR(240) NOT NULL,
    text TEXT NOT NULL,
    PRIMARY KEY (id)
#                   need more
);