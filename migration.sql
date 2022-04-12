USE
MTGLister_db;

DROP TABLE IF EXISTS deck;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS card;

CREATE TABLE users
(
    id       INT UNSIGNED NOT NULL AUTO_INCREMENT,
    username VARCHAR(240) NOT NULL,
    email    VARCHAR(240) NOT NULL,
    password VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE deck
(
    deck_id      INT UNSIGNED NOT NULL AUTO_INCREMENT,
    deck_name    VARCHAR(50) NOT NULL,
    user_id      INT UNSIGNED NOT NULL,
    date_created DATETIME    NOT NULL,
    description  TEXT        NOT NULL,
    PRIMARY KEY (deck_id),
    FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE TABLE card
(
    card_id        INT UNSIGNED NOT NULL AUTO_INCREMENT,
    card_name      VARCHAR(240) NOT NULL,
    card_image     varchar (240) NOT NULL,
    card_deck_id   INT UNSIGNED NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (card_id),
    FOREIGN KEY (card_deck_id) REFERENCES deck (deck_id)
);