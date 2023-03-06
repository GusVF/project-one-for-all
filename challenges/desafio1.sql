DROP SCHEMA IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE
    plan (
        id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
        plan_type VARCHAR(50) NOT NULL,
        plan_price DECIMAL(5, 2)
    );

INSERT INTO
    plan (plan_type, plan_price)
VALUES ('gratuito', 0), ('familiar', 7.99), ('universitário', 5.99), ('pessoal', 6.99);

CREATE TABLE
    user (
        id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
        user_name VARCHAR(50) NOT NULL,
        user_age INT NOT NULL,
        plan_sign_date DATE NOT NULL,
        plan_id INT NOT NULL,
        FOREIGN KEY (plan_id) REFERENCES plan (id)
    );

INSERT INTO
    user (
        user_name,
        user_age,
        plan_sign_date,
        plan_id
    )
VALUES (
        'Barbara Liskov',
        82,
        '2019-10-20',
        1
    ), (
        'Robert Cecil Martin',
        58,
        '2017-01-06',
        1
    ), (
        'Ada Lovelace',
        37,
        '2017-12-30',
        2
    ), (
        'Martin Fowler',
        46,
        '2017-01-17',
        2
    ), (
        'Sandi Metz',
        58,
        '2018-04-29',
        2
    ), (
        'Paulo Freire',
        19,
        '2018-02-14',
        3
    ), (
        'Bell Hooks',
        26,
        '2018-01-05',
        3
    ), (
        'Christopher Alexander',
        85,
        '2019-06-05',
        4
    ), (
        'Judith Butler',
        45,
        '2020-05-13',
        4
    ), (
        'Jorge Amado',
        58,
        '2017-02-17',
        4
    );

CREATE TABLE
    artist (
        id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
        artist_name VARCHAR(45) NOT NULL
    );

INSERT INTO
    artist (artist_name)
VALUES ('Beyoncé'), ('Queen'), ('Elis Regina'), ('Baco Exu do Blues'), ('Blind Guardian'), ('Nina Simone');

CREATE TABLE
    album (
        id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
        album_name VARCHAR(45) NOT NULL,
        artist_id INT NOT NULL,
        release_year YEAR NOT NULL,
        FOREIGN KEY (artist_id) REFERENCES artist (id)
    );

INSERT INTO
    album (
        album_name,
        release_year,
        artist_id
    )
VALUES ('Renaissance', '2022', 1), ('Jazz', '1978', 2), ('Hot Space', '1982', 2), ('Falso Brilhante', '1998', 3), ('Vento de Maio', '2001', 3), ('QVVJFA?', '2003', 4), (
        'Somewhere Far Beyond',
        '2007',
        5
    ), (
        'I Put A Spell On You',
        '2012',
        6
    );

CREATE TABLE
    songs (
        id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
        song_name VARCHAR(60) NOT NULL,
        length INT NOT NULL,
        album_id INT NOT NULL,
        FOREIGN KEY (album_id) REFERENCES album (id)
    );

INSERT INTO
    songs (song_name, length, album_id)
VALUES ('"BREAK MY SOUL"', 279, 1), ("VIRGO\'S GROOVE", 369, 1), ("ALIEN SUPERSTAR", 116, 1), ("Don\'t Stop Me Now", 203, 2), ("Under Pressure", 152, 2), ("Como Nossos Pais", 105, 3), (
        "O Medo de Amar é o Medo de Ser Livre",
        207,
        3
    ), ("Samba em Paris", 267, 4), ("The Bard\'s Song", 244, 5), ("Feeling Good", 100, 6);

CREATE TABLE
    play_history (
        user_id INT NOT NULL,
        songs_id INT NOT NULL,
        play_date DATETIME NOT NULL,
        PRIMARY KEY (user_id, songs_id),
        FOREIGN KEY (songs_id) REFERENCES songs (id),
        FOREIGN KEY (user_id) REFERENCES user (id)
    );

INSERT INTO
    play_history (play_date, songs_id, user_id)
VALUES ('2022-02-28 10:45:55', 8, 1), ('2020-05-02 05:30:35', 2, 1), ('2020-03-06 11:22:33', 10, 1), ('2022-08-05 08:05:17', 10, 2), ('2020-01-02 07:40:33', 7, 2), ('2020-11-13 16:55:13', 10, 3), ('2020-12-05 18:38:30', 2, 3), ('2021-08-15 17:10:10', 8, 4), ('2022-01-09 01:44:33', 8, 5), ('2020-08-06 15:23:43', 5, 5), ('2017-01-24 00:31:17', 7, 6), ('2017-10-12 12:35:20', 1, 6), ('2011-12-15 22:30:49', 4, 7), ('2012-03-17 14:56:41', 4, 8), ('2022-02-24 21:14:22', 9, 9), ('2015-12-13 08:30:22', 3, 10);

CREATE TABLE
    user_favorite_artist (
        user_id INT NOT NULL,
        artist_id INT NOT NULL,
        PRIMARY KEY (user_id, artist_id),
        FOREIGN KEY (artist_id) REFERENCES artist (id),
        FOREIGN KEY (user_id) REFERENCES user (id)
    );

INSERT INTO
    user_favorite_artist (user_id, artist_id)
VALUES (1, 1), (1, 2), (1, 3), (2, 1), (2, 3), (3, 2), (4, 4), (5, 5), (5, 6), (6, 1), (6, 6), (7, 6), (9, 3), (10, 2);