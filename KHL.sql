CREATE SCHEMA KHL;

CREATE TABLE KHL.TEAM
(
    team_id            INT         NOT NULL UNIQUE PRIMARY KEY,
    team_nm            VARCHAR(30) NOT NULL,
    conference_nm      VARCHAR(30) NOT NULL,
    division_nm        VARCHAR(30) NOT NULL,
    team_foundation_dt DATE        NOT NULL
);

CREATE TABLE KHL.COACH
(
    coach_id    INT         NOT NULL UNIQUE PRIMARY KEY,
    team_id     INT         NOT NULL,
    first_nm    VARCHAR(30) NOT NULL,
    middle_nm   VARCHAR(30),
    last_nm     VARCHAR(30) NOT NULL,
    birthday_dt DATE        NOT NULL,
    FOREIGN KEY (team_id) REFERENCES KHL.TEAM (team_id)
);

CREATE TABLE KHL.PLAYER
(
    player_id   INT         NOT NULL UNIQUE PRIMARY KEY,
    team_id     INT         NOT NULL,
    first_nm    VARCHAR(30) NOT NULL,
    middle_nm   VARCHAR(30),
    last_nm     VARCHAR(30) NOT NULL,
    country_nm  VARCHAR(30) NOT NULL,
    position_nm VARCHAR(30) NOT NULL,
    FOREIGN KEY (team_id) REFERENCES KHL.TEAM (team_id)
);

CREATE TABLE KHL.HOME_STADIUM
(
    home_stadium_id       INT         NOT NULL UNIQUE PRIMARY KEY,
    team_id               INT         NOT NULL,
    stadium_city          VARCHAR(30) NOT NULL,
    stadium_foundation_dt DATE        NOT NULL,
    stadium_sp            INT         NOT NULL,
    FOREIGN KEY (team_id) REFERENCES KHL.TEAM (team_id)
);

CREATE TABLE KHL.GAME
(
    home_team_id  INT     NOT NULL,
    guest_team_id INT     NOT NULL,
    game_dt       DATE    NOT NULL,
    home_score    INT     NOT NULL,
    guest_score   INT     NOT NULL,
    bullit_flag   BOOLEAN NOT NULL DEFAULT FALSE,
    CHECK (home_score BETWEEN 0 AND 20),
    CHECK (guest_score BETWEEN 0 AND 20),
    FOREIGN KEY (home_team_id) REFERENCES KHL.TEAM (team_id),
    FOREIGN KEY (guest_team_id) REFERENCES KHL.TEAM (team_id),
    PRIMARY KEY (home_team_id, guest_team_id, game_dt)
);
------------------------------------------------------------------------
INSERT INTO KHL.TEAM
VALUES (1, 'Трактор', 'Восток', 'Харламова', '1947-12-27');

INSERT INTO KHL.TEAM
VALUES (2, 'Авангард', 'Восток', 'Чернышева', '1950-11-7');

INSERT INTO KHL.TEAM
VALUES (3, 'СКА', 'Запад', 'Боброва', '1946-1-1');

INSERT INTO KHL.TEAM
VALUES (4, 'Витязь', 'Запад', 'Тарасова', '1996-1-1');

INSERT INTO KHL.TEAM
VALUES (5, 'Металлург', 'Восток', 'Харламова', '1955-1-1');

INSERT INTO KHL.COACH
VALUES (1, 1, 'Алексей', 'Викторович', 'Тертышный', '1977-3-27');

INSERT INTO KHL.COACH
VALUES (2, 2, 'Боб', NULL, 'Харли', '1960-9-7');

INSERT INTO KHL.COACH
VALUES (3, 3, 'Илья', 'Петрович', 'Воробьёв', '1975-3-16');

INSERT INTO KHL.COACH
VALUES (4, 4, 'Валерий', 'Геннадьевич', 'Белов', '1967-1-24');

INSERT INTO KHL.COACH
VALUES (5, 5, 'Йозеф', NULL, 'Яндач', '1968-11-12');

INSERT INTO KHL.HOME_STADIUM
VALUES (1, 1, 'Челябинск', '2009-01-17', 7500);

INSERT INTO KHL.HOME_STADIUM
VALUES (2, 2, 'Омск', '2007-08-31', 10318);

INSERT INTO KHL.HOME_STADIUM
VALUES (3, 3, 'Санкт-Петербург', '2000-4-1', 12300);

INSERT INTO KHL.HOME_STADIUM
VALUES (4, 4, 'Подольск', '2000-3-18', 5500);

INSERT INTO KHL.HOME_STADIUM
VALUES (5, 5, 'Магнитогорск', '2007-01-12', 7700);

INSERT INTO KHL.GAME
VALUES (2, 1, '2018-01-18', 1, 2);

INSERT INTO KHL.GAME
VALUES (1, 3, '2019-02-22', 1, 3);

INSERT INTO KHL.GAME
VALUES (4, 1, '2018-11-14', 3, 4, TRUE);

INSERT INTO KHL.GAME
VALUES (5, 1, '2019-01-24', 2, 0);

INSERT INTO KHL.GAME
VALUES (2, 3, '2019-02-04', 2, 0);

INSERT INTO KHL.GAME
VALUES (4, 2, '2018-10-2', 0, 6);

INSERT INTO KHL.GAME
VALUES (2, 5, '2018-12-01', 1, 2);

INSERT INTO KHL.GAME
VALUES (3, 4, '2019-01-13', 3, 1);

INSERT INTO KHL.GAME
VALUES (3, 5, '2018-11-18', 2, 1);

INSERT INTO KHL.GAME
VALUES (4, 5, '2018-11-16', 1, 4);

INSERT INTO KHL.PLAYER
VALUES (1, 1, 'Василий', 'Викторович', 'Демченко', 'Россия', 'вратарь');

INSERT INTO KHL.PLAYER
VALUES (2, 1, 'Виктор', 'Викторович', 'Селивёрстов', 'Россия', 'вратарь');

INSERT INTO KHL.PLAYER
VALUES (3, 1, 'Дмитрий', 'Витальевич', 'Алексеев', 'Россия', 'защитник');

INSERT INTO KHL.PLAYER
VALUES (4, 1, 'Артём', 'Юрьевич', 'Бородкин', 'Россия', 'защитник');

INSERT INTO KHL.PLAYER
VALUES (5, 1, 'Григорий', 'Олегович', 'Желдаков', 'Россия', 'защитник');

INSERT INTO KHL.PLAYER
VALUES (6, 1, 'Игорь', 'Анатольевич', 'Исаев', 'Россия', 'защитник');

INSERT INTO KHL.PLAYER
VALUES (7, 1, 'Илья', 'Игоревич', 'Карпухин', 'Россия', 'защитник');

INSERT INTO KHL.PLAYER
VALUES (8, 1, 'Никита', 'Александрович', 'Никитин', 'Россия', 'защитник');

INSERT INTO KHL.PLAYER
VALUES (9, 1, 'Александер', NULL, 'Бергстрём', 'Швеция', 'нападающий');

INSERT INTO KHL.PLAYER
VALUES (10, 1, 'Антон', 'Владимирович', 'Глинкин', 'Россия', 'нападающий');

INSERT INTO KHL.PLAYER
VALUES (11, 1, 'Данил', 'Евгеньевич', 'Губарев', 'Россия', 'нападающий');

INSERT INTO KHL.PLAYER
VALUES (12, 1, 'Егор', 'Игоревич', 'Дугин', 'Россия', 'нападающий');

INSERT INTO KHL.PLAYER
VALUES (13, 1, 'Андрей', 'Владимирович', 'Ерофеев', 'Россия', 'нападающий');

INSERT INTO KHL.PLAYER
VALUES (14, 1, 'Илья', 'Игоревич', 'Зиновьев', 'Россия', 'нападающий');

INSERT INTO KHL.PLAYER
VALUES (15, 1, 'Пол', NULL, 'Щехура', 'Канада', 'нападающий');


INSERT INTO KHL.PLAYER
VALUES (16, 2, 'Игорь', 'Сергеевич', 'Бобков', 'Россия', 'вратарь');

INSERT INTO KHL.PLAYER
VALUES (17, 2, 'Иван', 'Геннадьевич', 'Налимов', 'Россия', 'вратарь');

INSERT INTO KHL.PLAYER
VALUES (18, 2, 'Максим', 'Михайлович', 'Березин', 'Россия', 'защитник');

INSERT INTO KHL.PLAYER
VALUES (19, 2, 'Алексей', 'Андреевич', 'Бондарев', 'Россия', 'защитник');

INSERT INTO KHL.PLAYER
VALUES (20, 2, 'Алексей', 'Вячеславович', 'Емелин', 'Россия', 'защитник');

INSERT INTO KHL.PLAYER
VALUES (21, 2, 'Егор', 'Сергеевич', 'Мартынов', 'Россия', 'защитник');

INSERT INTO KHL.PLAYER
VALUES (22, 2, 'Евгений', 'Владимирович', 'Медведев', 'Россия', 'защитник');

INSERT INTO KHL.PLAYER
VALUES (23, 2, 'Никита', 'Васильевич', 'Пивцакин', 'Россия', 'защитник');

INSERT INTO KHL.PLAYER
VALUES (24, 2, 'Вилле', NULL, 'Покка', 'Финляндия', 'защитник');

INSERT INTO KHL.PLAYER
VALUES (25, 2, 'Ансель', 'Габдельнурович', 'Галимов', 'Россия', 'нападающий');

INSERT INTO KHL.PLAYER
VALUES (26, 2, 'Матвей', 'Евгеньевич', 'Заседа', 'Россия', 'нападающий');

INSERT INTO KHL.PLAYER
VALUES (27, 2, 'Денис', 'Игоревич', 'Зернов', 'Россия', 'нападающий');

INSERT INTO KHL.PLAYER
VALUES (28, 2, 'Семён', 'Юрьевич', 'Кошелев', 'Казахстан', 'нападающий');

INSERT INTO KHL.PLAYER
VALUES (29, 2, 'Артём', 'Арутюнович', 'Манукян', 'Россия', 'нападающий');

INSERT INTO KHL.PLAYER
VALUES (30, 2, 'Михаил', 'Александрович', 'Фисенко', 'Россия', 'нападающий');


INSERT INTO KHL.PLAYER
VALUES (31, 3, 'Никита', 'Владимирович', 'Богданов', 'Россия', 'вратарь');

INSERT INTO KHL.PLAYER
VALUES (32, 3, 'Павел', 'Юрьевич', 'Давыдюк', 'Россия', 'вратарь');

INSERT INTO KHL.PLAYER
VALUES (33, 3, 'Антон', 'Сергеевич', 'Белов', 'Россия', 'защитник');

INSERT INTO KHL.PLAYER
VALUES (34, 3, 'Данила', 'Юрьевич', 'Галенюк', 'Россия', 'защитник');

INSERT INTO KHL.PLAYER
VALUES (35, 3, 'Артём', 'Игоревич', 'Земчёнок', 'Россия', 'защитник');

INSERT INTO KHL.PLAYER
VALUES (36, 3, 'Артём', 'Валерьевич', 'Зуб', 'Россия', 'защитник');

INSERT INTO KHL.PLAYER
VALUES (37, 3, 'Андрей', 'Сергеевич', 'Зубарев', 'Россия', 'защитник');

INSERT INTO KHL.PLAYER
VALUES (38, 3, 'Николай', 'Александрович', 'Кныжов', 'Россия', 'защитник');

INSERT INTO KHL.PLAYER
VALUES (39, 3, 'Давид', NULL, 'Рундблад', 'Швеция', 'защитник');

INSERT INTO KHL.PLAYER
VALUES (40, 3, 'Александр', 'Дмитриевич', 'Барабанов', 'Россия', 'нападающий');

INSERT INTO KHL.PLAYER
VALUES (41, 3, 'Алексей', 'Александрович', 'Бывальцев', 'Россия', 'нападающий');

INSERT INTO KHL.PLAYER
VALUES (42, 3, 'Павел', 'Валерьевич', 'Дацюк', 'Россия', 'нападающий');

INSERT INTO KHL.PLAYER
VALUES (43, 3, 'Александр', 'Викторович', 'Дергачёв', 'Россия', 'нападающий');

INSERT INTO KHL.PLAYER
VALUES (44, 3, 'Артём', 'Андреевич', 'Жук', 'Россия', 'нападающий');

INSERT INTO KHL.PLAYER
VALUES (45, 3, 'Иван', 'Дмитриевич', 'Морозов', 'Россия', 'нападающий');


INSERT INTO KHL.PLAYER
VALUES (46, 4, 'Йони ', NULL, 'Ортио', 'Финляндия', 'вратарь');

INSERT INTO KHL.PLAYER
VALUES (47, 4, 'Игорь', 'Александрович', 'Сапрыкин', 'Россия', 'вратарь');

INSERT INTO KHL.PLAYER
VALUES (48, 4, 'Егор', 'Денисович', 'Воронков', 'Россия', 'защитник');

INSERT INTO KHL.PLAYER
VALUES (49, 4, 'Игорь', 'Михайлович', 'Головков', 'Россия', 'защитник');

INSERT INTO KHL.PLAYER
VALUES (50, 4, 'Георгий', 'Юрьевич', 'Дедов', 'Россия', 'защитник');

INSERT INTO KHL.PLAYER
VALUES (51, 4, 'Александр', 'Анатольевич', 'Евсеенков', 'Россия', 'защитник');

INSERT INTO KHL.PLAYER
VALUES (52, 4, 'Михаил', 'Александрович', 'Епишин', 'Россия', 'защитник');

INSERT INTO KHL.PLAYER
VALUES (53, 4, 'Евгений', 'Алексеевич', 'Катичев', 'Россия', 'защитник');

INSERT INTO KHL.PLAYER
VALUES (54, 4, 'Войтех', NULL, 'Мозик', 'Чехия', 'защитник');

INSERT INTO KHL.PLAYER
VALUES (55, 4, 'Марк', 'Михайлович', 'Верба', 'Россия', 'нападающий');

INSERT INTO KHL.PLAYER
VALUES (56, 4, 'Никита', 'Сергеевич', 'Выглазов', 'Россия', 'нападающий');

INSERT INTO KHL.PLAYER
VALUES (57, 4, 'Никита', 'Андреевич', 'Гончаров', 'Россия', 'нападающий');

INSERT INTO KHL.PLAYER
VALUES (58, 4, 'Денис', 'Сергеевич', 'Кокарев', 'Россия', 'нападающий');

INSERT INTO KHL.PLAYER
VALUES (59, 4, 'Александр', 'Ильич', 'Кулагин', 'Россия', 'нападающий');

INSERT INTO KHL.PLAYER
VALUES (60, 4, 'Геннадий', 'Викторович', 'Столяров', 'Россия', 'нападающий');


INSERT INTO KHL.PLAYER
VALUES (61, 5, 'Артём', 'Ринатович', 'Загидулин', 'Россия', 'вратарь');

INSERT INTO KHL.PLAYER
VALUES (62, 5, 'Василий', 'Владимирович', 'Кошечкин', 'Россия', 'вратарь');

INSERT INTO KHL.PLAYER
VALUES (63, 5, 'Вадим', 'Владимирович', 'Антипин', 'Россия', 'защитник');

INSERT INTO KHL.PLAYER
VALUES (64, 5, 'Виктор', 'Владимирович', 'Антипин', 'Россия', 'защитник');

INSERT INTO KHL.PLAYER
VALUES (65, 5, 'Алексей', 'Алексеевич', 'Береглазов', 'Россия', 'защитник');

INSERT INTO KHL.PLAYER
VALUES (66, 5, 'Евгений', 'Николаевич', 'Бирюков', 'Россия', 'защитник');

INSERT INTO KHL.PLAYER
VALUES (67, 5, 'Никита', 'Витальевич', 'Бобряшов', 'Россия', 'защитник');

INSERT INTO KHL.PLAYER
VALUES (68, 5, 'Валерий', 'Сергеевич', 'Васильев', 'Россия', 'защитник');

INSERT INTO KHL.PLAYER
VALUES (69, 5, 'Иван', 'Алексеевич', 'Верещагин', 'Россия', 'защитник');

INSERT INTO KHL.PLAYER
VALUES (70, 5, 'Павел', 'Павлович', 'Варфоломеев', 'Россия', 'нападающий');

INSERT INTO KHL.PLAYER
VALUES (71, 5, 'Павел', 'Игоревич', 'Дорофеев', 'Россия', 'нападающий');

INSERT INTO KHL.PLAYER
VALUES (72, 5, 'Николай', 'Владимирович', 'Кулёмин', 'Россия', 'нападающий');

INSERT INTO KHL.PLAYER
VALUES (73, 5, 'Сергей', 'Валерьевич', 'Мозякин', 'Россия', 'нападающий');

INSERT INTO KHL.PLAYER
VALUES (74, 5, 'Ник', NULL, 'Шор', 'США', 'нападающий');

INSERT INTO KHL.PLAYER
VALUES (75, 5, 'Мэтт', NULL, 'Эллисон', 'Канада', 'нападающий');

--------------------------------------------------------------------------------

--Средний возраст тренера--
SELECT AVG(date_part('year', age(birthday_dt)))
FROM KHL.COACH;

--Все легионеры в командах--
SELECT first_nm, last_nm, country_nm
FROM KHL.PLAYER
WHERE country_nm <> 'Россия';

--Максимальная, средняя и минимальная вместимость стадиона--
SELECT MAX(stadium_sp), AVG(stadium_sp), MIN(stadium_sp)
FROM KHL.HOME_STADIUM;

--Максимальное число шайб, заброшенных командой в матче--
WITH res AS (
    SELECT team_nm, guest_score as score
    FROM KHL.GAME
             INNER JOIN KHL.TEAM
                        ON game.guest_team_id = team.team_id
    UNION ALL
    SELECT team_nm, home_score as score
    FROM KHL.GAME
             INNER JOIN KHL.TEAM
                        ON game.home_team_id = team.team_id)
SELECT team_nm, score
FROM res
WHERE score = (SELECT GREATEST(MAX(home_score), MAX(guest_score)) FROM KHL.GAME);

--Команды, выигрывшие наибольшее количество матчей, играя в гостях--
WITH res AS (
    SELECT team_nm, COUNT(team_nm) as count
    FROM KHL.TEAM
             INNER JOIN KHL.GAME
                        ON team.team_id = game.guest_team_id
    WHERE home_score < guest_score
    GROUP BY team_nm)
SELECT team_nm, count
FROM res
WHERE count = (SELECT MAX(count) FROM res);

-----------------------------------------------------------------------

SELECT COUNT(*)
FROM KHL.TEAM;

INSERT INTO KHL.TEAM
VALUES (6, 'Динамо', 'Восток', 'Тарасова', '1948-1-1');

UPDATE KHL.TEAM
SET conference_nm = 'Запад'
WHERE team_id = 6;

DELETE
FROM KHL.TEAM
WHERE team_id = 6;


SELECT *
FROM KHL.PLAYER
WHERE position_nm = 'вратарь';

INSERT INTO KHL.PLAYER
VALUES (76, 1, 'Пони', 'Пониевич', 'Поневич', 'Эквестрия', 'пони');

UPDATE KHL.PLAYER
SET position_nm = 'волшебница'
WHERE player_id = 76;

DELETE
FROM KHL.PLAYER
WHERE player_id= 76;