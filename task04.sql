SET search_path = db_project, public;

---- Information about players

-- Player table
truncate table Player cascade;

insert into Player (nickname, first_name, last_name, address) 
values 
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
truncate table Blacklist cascade;

insert into Blacklist (ban_reason, ban_date, player_id) 
values 
    ('Player exhibited aggressive behavior towards other participants.',             '2023-02-28',  5), -- Ban player with ID 5 for aggressive behavior
    ('Player repeatedly violated game rules despite warnings.',                      '2023-04-25', 11), -- Ban player with ID 11 for violating rules
    ('Player cheated during a poker game.',                                          '2023-07-10',  3), -- Ban player with ID 3 for cheating
    ('Player caused disruption and confrontation at the roulette gambling table.',   '2023-09-18', 19), -- Ban player with ID 19 for disruptive conduct
    ('Player was caught attempting to manipulate game outcomes.',                    '2023-10-15', 14), -- Ban player with ID 14 for manipulating game outcomes
    ('Player engaged in fraudulent behavior, manipulating chip counts.',             '2023-12-03',  7); -- Ban player with ID 7 for fraudulent behavior

---- Information about games

-- Game description table
truncate table Game_Description cascade;

insert into Game_Description (game_name, min_players, max_players, hall)
values 
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
truncate table Gambling_Table cascade;

insert into Gambling_Table (out_of_order, game_id)
values 
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

-- Event table
truncate table Event_Table cascade;

DO $$DECLARE
    event_count INTEGER := 2000;

    first_date TIMESTAMP := '2023-01-01 00:00:00';
    last_date TIMESTAMP := '2023-12-01 00:00:00';

    f_r NUMERIC := 0;
    s_r NUMERIC := 0;

    f_r_d TIMESTAMP := '2023-01-01 00:00:00';
    s_r_d TIMESTAMP := '2023-12-01 00:00:00';

    r_tb INTEGER := 0;
BEGIN
    FOR i IN 1..event_count LOOP
        f_r := RANDOM();
        s_r := f_r + 0.00002 + RANDOM() / 6000;

        f_r_d := first_date + (least(f_r, s_r) * (last_date - first_date));
        s_r_d := first_date + (greatest(f_r, s_r) * (last_date - first_date));

        if random() > 0.5 then
            r_tb := 1 + FLOOR(RANDOM() * 13);
        else
            r_tb := 22 + FLOOR(RANDOM() * 6);
        end if;

        if exists (select * from Event_Table where table_id = r_tb and date_start < s_r_d and date_end > f_r_d) then
            continue;
        end if;

        insert into Event_Table (table_id, date_start, date_end)
        values (r_tb, f_r_d, s_r_d);
    END LOOP;
END$$;

delete from Event_Table
 where table_id = 10
   and date_start > '2023-09-18 00:00:00';

-- Cached

-- insert into Event_Table (table_id, date_start, date_end)
-- values ;

-- Participation table
truncate table Participation cascade;

DO $$DECLARE
    player_count INTEGER := 27;

    g_id INTEGER := 0;
    e_start TIMESTAMP := '2023-01-01 00:00:00';

    r_player_count INTEGER := 0;
    min_player_count INTEGER := 0;
    max_player_count INTEGER := 0;

    r_player_id INTEGER;

    i INTEGER;
BEGIN
    FOR i IN select event_id from Event_Table LOOP
        e_start := (select date_start from Event_Table where event_id = i);

        g_id = (select game_id
                  from Gambling_Table
                 where table_id = (select table_id
                                     from Event_Table
                                    where event_id = i));

        min_player_count := (select min_players
                              from Game_Description
                             where game_id = g_id);
        max_player_count := (select max_players
                               from Game_Description
                              where game_id = g_id);

        r_player_count := min_player_count + FLOOR(RANDOM() * (max_player_count - min_player_count));

        FOR _ IN 1..r_player_count LOOP
            r_player_id := 1 + FLOOR(RANDOM() * player_count);

            if exists (select * from Participation where r_player_id = player_id and event_id = i) then
                continue;
            end if;

            if exists (select * from Blacklist where player_id = r_player_id and ban_date > e_start) then
                continue;
            end if;

            insert into Participation (player_id, event_id)
            values (r_player_id, i);
        END LOOP;
    END LOOP;
END$$;

-- Cached
-- insert into Participation (player_id, event_id)
-- values ;

---- Bar

-- Drink info table
truncate table Drink_Info cascade;

insert into Drink_Info (drink_title, alcohol_percentage, drink_price)
values
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


-- Order table
truncate table Order_Table cascade;

DO $$
DECLARE
    player_count INTEGER := (select count(*) from Player);
    min_player INTEGER := (select min(player_id) from Player);

    order_count INTEGER := 500;

    first_date TIMESTAMP := '2020-01-01 00:00:00';
    last_date TIMESTAMP := '2023-12-01 00:00:00';

    r_player_id INTEGER;
    r_order_date TIMESTAMP;
BEGIN
    FOR _ IN 1..order_count LOOP
        r_player_id := min_player + FLOOR(RANDOM() * player_count);
        r_order_date := (first_date + (RANDOM() * (last_date - first_date)));

        if exists (select * from Order_Table where player_id = r_player_id and order_date < r_order_date) then
            continue;
        end if;

        insert into Order_Table (player_id, order_date)
        values (r_player_id, r_order_date);
    END LOOP;
END$$;

-- Cached
-- insert into Order_Table (player_id, order_date)
-- values ;

-- Sales table
truncate table Sale cascade;

DO $$
DECLARE
    count_drink INTEGER := (select count(drink_id) from Drink_Info);
    min_drink INTEGER := (select min(drink_id) from Drink_Info);

    r_drink_id INTEGER;
    r_order_id INTEGER;
    r_order_drink_count INTEGER;
    r_drink_quantity INTEGER;

    i INTEGER;
BEGIN
    FOR i IN select order_id from Order_Table LOOP
        r_order_id := i;
        r_order_drink_count := 1 + FLOOR(RANDOM() * 3);

        FOR _ IN 1..r_order_drink_count LOOP
            r_drink_id := min_drink + FLOOR(RANDOM() * count_drink);
            r_drink_quantity := 1 + FLOOR(RANDOM() * 3);

            if exists (select * from Sale where drink_id = r_drink_id and order_id = r_order_id) then
                continue;
            end if;

            insert into Sale (drink_id, order_id, quantity)
            values (r_drink_id, r_order_id, r_drink_quantity);
        END LOOP;
    END LOOP;
END$$;

-- Cached
-- insert into Sales (drink_id, order_id, drink_count)
-- values ;

---- Transactions

-- Transaction table (under maintenance)
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
--         insert into Transaction (player_id, transaction_date, transaction_amount)
--         values (player_id, transaction_date, transaction_amount);
--     END LOOP;
-- END
-- $$;

-- Cached

-- insert into Transaction (player_id, transaction_date, transaction_amount)
-- values ;
