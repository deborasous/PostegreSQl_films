-- Active: 1688235154457@@127.0.0.1@5432@films@public

CREATE TABLE
    Actor(
        id SERIAL PRIMARY KEY,
        nome VARCHAR(200),
        data_nasc DATE,
        altura VARCHAR(20),
        peso VARCHAR(20)
    );

CREATE TABLE
    Films(
        id SERIAL PRIMARY KEY,
        titulo VARCHAR(100),
        duracao_filme VARCHAR(10)
    );

CREATE TABLE
    Genre(
        id SERIAL PRIMARY KEY,
        nome VARCHAR(200)
    );

CREATE TABLE
    Genre_film(
        id SERIAL PRIMARY KEY,
        film_id INTEGER,
        genre_id INTEGER,
        Foreign Key (film_id) REFERENCES Films(id),
        Foreign Key (genre_id) REFERENCES Genre(id)
    );

/*INSERIR ALGUNS DADOS*/

INSERT INTO
    Actor(nome, data_nasc, altura, peso)
VALUES (
        'Lily Sullivan',
        '2000-10-04',
        '1.73',
        '55'
    );

INSERT INTO
    Films(titulo, duracao_filme)
VALUES ('Evil Dead Rise', '1:36');

INSERT INTO Genre(nome) VALUES ('Comedia');

INSERT INTO
    Genre_film(film_id, genre_id)
VALUES(1, 1), (2, 1), (3, 4);

/*Consultar pelo nome e duração do filme, selecionando o filme pelo genero e ordenando pela duracao_film*/

SELECT
    f.titulo,
    f.duracao_filme
FROM films f
    JOIN genre_film gf ON f.id = gf.film_id
    JOIN genre g ON gf.genre_id = g.id
WHERE g.nome LIKE '%Ação'
ORDER BY f.duracao_filme;