---- Information about players

-- Player table
INSERT INTO Player (nickname, first_name, last_name, address) 
VALUES 
    ('RedHat',         'Иван',      'Смирнов',      'ул. Приморская, 1, г. Москва, Россия'),
    ('SteelPan',       'Анастасия', 'Иванова',      'пр. Ленина, 23, г. Санкт-Петербург, Россия'),
    ('WildCard',       'Мария',     'Кузнецова',    'ул. Ленинградская, 5, г. Новосибирск, Россия'),
    ('LuckyStrike',    'Дмитрий',   'Смирнов',      'пр. Московский, 78, г. Екатеринбург, Россия'),
    ('AceBlade',       'Анна',      'Попова',       'ул. Красная, 12, г. Нижний Новгород, Россия'),
    ('SilverBullet',   'Артём',     'Морозов',      'пр. Кирова, 41, г. Казань, Россия'),
    ('MysticJoker',    'София',     'Петрова',      'ул. Революции, 87, г. Челябинск, Россия'),
    ('GoldenChip',     'Максим',    'Соколов',      'пр. Гагарина, 34, г. Омск, Россия'),
    ('ShadowBet',      'Елизавета', 'Волкова',      'ул. Советская, 56, г. Самара, Россия'),
    ('EagleEye',       'Никита',    'Павлов',       'пр. Ленинградский, 2, г. Уфа, Россия'),
    ('ChipChampion',   'Даниил',    'Козлов',       'ул. Железнодорожная, 9, г. Ростов-на-Дону, Россия'),
    ('QueenOfHearts',  'Татьяна',   'Семёнова',     'пр. Мира, 7, г. Красноярск, Россия'),
    ('AceOfSpades',    'Ирина',     'Макарова',     'ул. Луговая, 4, г. Воронеж, Россия'),
    ('LoneRanger',     'Сергей',    'Попов',        'пр. Строителей, 15, г. Иркутск, Россия'),
    ('HighRoller',     'Ольга',     'Лебедева',     'ул. Лесная, 28, г. Ульяновск, Россия'),
    ('PocketPair',     'Александр', 'Сорокин',      'пр. Октября, 62, г. Тюмень, Россия'),
    ('Maverick',       'Евгений',   'Ковалёв',      'ул. Центральная, 3, г. Тольятти, Россия'),
    ('BettingBeast',   'Оксана',    'Федорова',     'пр. Лесной, 18, г. Хабаровск, Россия'),
    ('RiskyBusiness',  'Денис',     'Морозов',      'ул. Заводская, 31, г. Кемерово, Россия'),
    ('CardSharp',      'Ангелина',  'Голубева',     'пр. Чайковского, 50, г. Астрахань, Россия'),
    ('FinalTable',     'Павел',     'Беляков',      'ул. Ленинградская, 91, г. Ярославль, Россия'),
    ('RaiseKing',      'Маргарита', 'Медведева',    'пр. Советский, 27, г. Томск, Россия'),
    ('RiverRat',       'Кирилл',    'Поляков',      'ул. Профсоюзная, 10, г. Оренбург, Россия'),
    ('BluffMaster',    'Екатерина', 'Никитина',     'пр. Победы, 38, г. Липецк, Россия'),
    ('ChipLeader',     'Артур',     'Макаров',      'ул. Заречная, 72, г. Балашиха, Россия'),
    ('LuckStruck',     'Евгения',   'Андреева',     'пр. Ломоносова, 5, г. Новокузнецк, Россия'),
    ('AllInAce',       'Дарья',     'Орлова',       'ул. Мира, 22, г. Киров, Россия');


-- Banned table
INSERT INTO Blacklist (ban_reason, ban_date, player_id) 
VALUES 
    ('Player repeatedly violated game rules despite warnings.',                      '25-04-2020', 11), -- Ban player with ID 11 for violating rules
    ('Player cheated during a poker game.',                                          '10-07-2021',  3), -- Ban player with ID 3 for cheating
    ('Player was caught attempting to manipulate game outcomes.',                    '15-10-2021', 14), -- Ban player with ID 14 for manipulating game outcomes
    ('Player exhibited aggressive behavior towards other participants.',             '28-02-2022',  5), -- Ban player with ID 5 for aggressive behavior
    ('Player engaged in fraudulent behavior, manipulating chip counts.',             '03-12-2022',  7), -- Ban player with ID 7 for fraudulent behavior
    ('Player caused disruption and confrontation at the roulette gambling table.',   '18-09-2023', 19); -- Ban player with ID 19 for disruptive conduct

---- Information about games

-- Game description table
INSERT INTO Game_Description (game_name, min_players, max_players, hall)
VALUES 
    ('Baccarat',          1,   8, 'Red'),
    ('Blackjack',         1,   7, 'Red'),
    ('Poker',             2,  10, 'Red'),
    ('Crazy Eights',      2,  10, 'Red'),
    ('European Roulette', 1,   8, 'Green'),
    ('Bingo',             1,  50, 'Green'),
    ('Keno',              1,  20, 'Blue'),
    ('Cribbage',          2,   6, 'Blue'),
    ('Pontoon',           1,   7, 'Blue'),
    ('Hearts',            4,   4, 'Blue'),
    ('Craps',             2,  10, 'Yellow'),
    ('War',               2,   8, 'Yellow'),
    ('Pai Gow Poker',     2,  10, 'Yellow');

-- Gambling table table
INSERT INTO Gambling_Table (out_of_order, game_id)
VALUES 
    (FALSE, 1),  -- Baccarat
    (FALSE, 1),  -- Baccarat
    (FALSE, 2),  -- Blackjack
    (FALSE, 2),  -- Blackjack
    (FALSE, 2),  -- Blackjack
    (FALSE, 3),  -- Poker
    (FALSE, 3),  -- Poker
    (FALSE, 3),  -- Poker
    (FALSE, 4),  -- Crazy Eights
    
    (TRUE,  5),  -- European Roulette
    (FALSE, 5),  -- European Roulette
    (FALSE, 5),  -- European Roulette
    (FALSE, 6),  -- Bingo

-- This hall is under maintenance
    (TRUE, 7),   -- Keno
    (TRUE, 8),   -- Cribbage
    (TRUE, 8),   -- Cribbage
    (TRUE, 9),   -- Pontoon
    (TRUE, 9),   -- Pontoon
    (TRUE, 9),   -- Pontoon
    (TRUE, 10),  -- Hearts
    (TRUE, 10),  -- Hearts
    (TRUE, 10),  -- Hearts

    (FALSE, 11), -- Craps
    (FALSE, 11), -- Craps
    (FALSE, 12), -- War
    (FALSE, 13), -- Pai Gow Poker
    (FALSE, 13), -- Pai Gow Poker
    (FALSE, 13); -- Pai Gow Poker

-- Event table (Under maintenance)
-- DO $$DECLARE
--     first_date DATE := '2020-01-01';
--     last_date DATE := '2023-12-01';

--     f_r_d DATE := '2020-01-01';
--     s_r_d DATE := '2023-12-01';
-- BEGIN
--     FOR i IN 1..120 LOOP
--         INSERT INTO Event_Table (table_id, date_start, date_end)
--         f_r_d := TIMESTAMP first_date + (RANDOM() * (TIMESTAMP last_date - TIMESTAMP first_date))::interval;
--         s_r_d := TIMESTAMP first_date + (RANDOM() * (TIMESTAMP last_date - TIMESTAMP first_date))::interval;
--         VALUES 
--             (
--                 1 + FLOOR(RANDOM() * 13),
--                 m;
--             (22 + FLOOR(RANDOM() * 6), CURRENT_DATE + (i * INTERVAL '1 day'), CURRENT_DATE + ((i + 1) * INTERVAL '1 day'));
--     END LOOP;
-- END$$;

-- Cached

-- INSERT INTO Event_Table (table_id, date_start, date_end)
-- VALUES ;

-- Participation table (Under maintenance)
-- DO $$DECLARE
--     player_count INTEGER := 27;
--     event_count INTEGER := 120;
--
--     player_id INTEGER;
--     event_id INTEGER;
-- BEGIN
--     FOR i IN 1..event_count LOOP
--         player_id := 1 + FLOOR(RANDOM() * player_count);
--         event_id := i;
--
--         INSERT INTO Participation (player_id, event_id)
--         VALUES (player_id, event_id);
--     END LOOP;
-- END$$;

-- Cached

-- INSERT INTO Participation (player_id, event_id)
-- VALUES ;

---- Bar

-- Drink info table
INSERT INTO Drink_Info (drink_title, alcohol_percentage, drink_price)
VALUES
    ('Whiskey',      40.0,  10),
    ('Vodka',        40.0,   8),
    ('Beer',          5.0,   5),
    ('Rum',          35.0,   9),
    ('Wine',         12.0,  12),
    ('Tequila',      38.0,  11),
    ('Gin',          40.0,  10),
    ('Brandy',       36.0,  13),
    ('Cider',         4.5,   6),
    ('Sake',         15.0,  14),
    ('Absinthe',     70.0,  15),
    ('Scotch',       40.0,  12),
    ('Bourbon',      45.0,  11),
    ('Rum and Coke', 10.0,   9),
    ('Martini',      30.0,  13);


-- Order table (Under maintenance)
-- DO $$
-- DECLARE
--     player_count INTEGER := 27;
--     order_count INTEGER := 40;
--
--     first_date TIMESTAMP := '2020-01-01 00:00:00';
--     last_date TIMESTAMP := '2023-12-01 00:00:00';
--
--     player_id INTEGER;
--     order_date TIMESTAMP;
-- BEGIN
--     FOR i IN 1..order_count LOOP
--         player_id := 1 + FLOOR(RANDOM() * player_count);
--         order_date := (first_date + (RANDOM() * (last_date - first_date)));
--
--         INSERT INTO Order_Table (player_id, order_date)
--         VALUES (player_id, order_date);
--     END LOOP;
-- END
-- $$;

-- Cached

-- INSERT INTO Order_Table (player_id, order_date)
-- VALUES ;

-- Sales table (Under maintenance)
-- DO $$
-- DECLARE
--     drink_count INTEGER := 15;
--     order_count INTEGER := 40;
--
--     drink_id INTEGER;
--     order_id INTEGER;
--     drink_count INTEGER;
-- BEGIN
--     FOR i IN 1..order_count LOOP
--         drink_id := 1 + FLOOR(RANDOM() * drink_count);
--         order_id := i;
--         drink_count := 1 + FLOOR(RANDOM() * 5);
--
--         INSERT INTO Sales (drink_id, order_id, drink_count)
--         VALUES (drink_id, order_id, drink_count);
--     END LOOP;
-- END
-- $$;
-- INSERT INTO Sales (drink_id, order_id, drink_count)
-- VALUES ;

---- Transactions

-- Transaction table
-- DO $$
-- DECLARE
--     player_count INTEGER := 27;
--     transaction_count INTEGER := 100;
--
--     player_id INTEGER;
--     transaction_date TIMESTAMP;
--     transaction_amount INTEGER;
-- BEGIN
--     FOR i IN 1..transaction_count LOOP
--         player_id := 1 + FLOOR(RANDOM() * player_count);
--         transaction_date := (CURRENT_DATE - (RANDOM() * 365));
--         transaction_amount := 1 + FLOOR(RANDOM() * 1000);
--
--         INSERT INTO Transaction (player_id, transaction_date, transaction_amount)
--         VALUES (player_id, transaction_date, transaction_amount);
--     END LOOP;
-- END
-- $$;

-- Cached

-- INSERT INTO Transaction (player_id, transaction_date, transaction_amount)
-- VALUES ;
