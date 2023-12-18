-- Заполнить БД данными (по 5–10 записей в каждую таблицу).
-- Для заполнения можно использовать как INSERT, так и внешние источники данных (XLS, CSV).
-- 5dd145e4d040f7a382ec57649179f7d008b522c4

truncate table Player cascade;
truncate table Blacklist cascade;
truncate table Game_Description cascade;
truncate table Gambling_Table cascade;
truncate table Event_Table cascade;
truncate table Participation cascade;
truncate table Drink_Info cascade;
truncate table Order_Table cascade;
truncate table Sale cascade;
truncate table chip_transaction cascade;
alter sequence player_player_id_seq restart with 1;
alter sequence blacklist_blacklist_id_seq restart with 1;
alter sequence game_description_game_id_seq restart with 1;
alter sequence gambling_table_table_id_seq restart with 1;
alter sequence event_table_event_id_seq restart with 1;
alter sequence participation_participation_id_seq restart with 1;
alter sequence drink_info_drink_id_seq restart with 1;
alter sequence order_table_order_id_seq restart with 1;
alter sequence chip_transaction_transaction_id_seq restart with 1;

---- Information about players

-- Player table
-- truncate table Player cascade;
-- alter sequence player_player_id_seq restart with 1;

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
    ('AllInAce',       'Дарья',     'Орлова',       'ул. Мира, 22, г. Киров, Россия'),
    ('SetDay',         'Александр', 'Серков',       'ул. Коллонтай, 24, г. Санкт-Петербург, Россия');

-- Banned table
-- truncate table Blacklist cascade;
-- alter sequence blacklist_blacklist_id_seq restart with 1;

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
-- truncate table Game_Description cascade;
-- alter sequence game_description_game_id_seq restart with 1;

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
-- truncate table Gambling_Table cascade;
-- alter sequence gambling_table_table_id_seq restart with 1;

insert into Gambling_Table (out_of_order, game_id)
values 
    (false, 1),  -- Baccarat
    (false, 1),  -- Baccarat
    (false, 2),  -- Blackjack
    (false, 2),  -- Blackjack
    (false, 2),  -- Blackjack
    (false, 3),  -- Poker
    (false, 3),  -- Poker
    (false, 3),  -- Poker
    (false, 4),  -- Crazy Eights
    
    (true,  5),  -- European Roulette
    (false, 5),  -- European Roulette
    (false, 5),  -- European Roulette
    (false, 6),  -- Bingo

-- This hall is under maintenance
    (true, 7),   -- Keno
    (true, 8),   -- Cribbage
    (true, 8),   -- Cribbage
    (true, 9),   -- Pontoon
    (true, 9),   -- Pontoon
    (true, 9),   -- Pontoon
    (true, 10),  -- Hearts
    (true, 10),  -- Hearts
    (true, 10),  -- Hearts

    (false, 11), -- Craps
    (false, 11), -- Craps
    (false, 12), -- War
    (false, 13), -- Pai Gow Poker
    (false, 13), -- Pai Gow Poker
    (false, 13); -- Pai Gow Poker

-- Event table
-- truncate table Event_Table cascade;
-- alter sequence event_table_event_id_seq restart with 1;

do $$
declare
    event_count integer := 2000;

    first_date timestamp := '2023-01-01 00:00:00';
    last_date timestamp := '2023-12-01 00:00:00';

    f_r NUMERIC := 0;
    s_r NUMERIC := 0;

    f_r_d timestamp := '2023-01-01 00:00:00';
    s_r_d timestamp := '2023-12-01 00:00:00';

    r_tb integer := 0;
begin
    for _ in 1..event_count loop
        f_r := random();
        s_r := f_r + 0.00002 + random() / 6000;

        f_r_d := first_date + (least(f_r, s_r) * (last_date - first_date));
        s_r_d := first_date + (greatest(f_r, s_r) * (last_date - first_date));

        if random() > 0.5 then
            r_tb := 1 + floor(random() * 13);
        else
            r_tb := 22 + floor(random() * 6);
        end if;

        if r_tb = 10 and f_r_d > '2023-09-18 00:00:00' then
            continue;
        end if;

        if exists (select *
                     from Event_Table
                    where table_id = r_tb
                      and date_start < s_r_d
                      and date_end > f_r_d) then
            continue;
        end if;

        insert into Event_Table (table_id, date_start, date_end)
        values (r_tb, f_r_d, s_r_d);
    end loop;
end
$$;

-- Participation table
-- truncate table Participation cascade;
-- alter sequence participation_participation_id_seq restart with 1;

do $$
declare
    player_count integer := (select count(*) from Player);

    r_player_count integer := 0;

    event_row record;

    r_player_id integer;
begin
    for event_row in (select event_id, date_start, date_end, min_players, max_players
                        from Event_Table
                        join gambling_table   using (table_id)
                        join Game_Description using (game_id)) loop
        r_player_count := event_row.min_players + floor(random() * (event_row.max_players - event_row.min_players));

        for _ in 1..r_player_count loop
            r_player_id := 1 + floor(random() * player_count);

            if exists (select *
                         from Participation
                         join Event_Table using (event_id)
                        where player_id = r_player_id
                          and ((date_start < event_row.date_end
                          and date_end > event_row.date_start)
                          or event_id = event_row.event_id)) then
                continue;
            end if;

            insert into Participation (player_id, event_id)
            values (r_player_id, event_row.event_id);
        end loop;
    end loop;
end
$$;

---- Bar

-- Drink info table
-- truncate table Drink_Info cascade;
-- alter sequence drink_info_drink_id_seq restart with 1;

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
-- truncate table Order_Table cascade;
-- alter sequence order_table_order_id_seq restart with 1;

do $$
declare
    player_count integer := (select count(*) from Player);
    min_player integer := (select min(player_id) from Player);

    order_count integer := 500;

    first_date timestamp := '2020-01-01 00:00:00';
    last_date timestamp := '2023-12-01 00:00:00';

    r_player_id integer;
    r_order_date timestamp;
begin
    for _ in 1..order_count loop
        r_player_id := min_player + floor(random() * player_count);
        r_order_date := (first_date + (random() * (last_date - first_date)));

        if exists (select *
                     from Order_Table
                    where player_id = r_player_id
                      and order_date < r_order_date) then
            continue;
        end if;

        insert into Order_Table (player_id, order_date)
        values (r_player_id, r_order_date);
    end loop;
end
$$;

-- Sales table
-- truncate table Sale cascade;

do $$
declare
    count_drink integer := (select count(drink_id) from Drink_Info);
    min_drink integer := (select min(drink_id) from Drink_Info);

    r_drink_id integer;
    r_order_id integer;
    r_order_drink_count integer;
    r_drink_quantity integer;

    i integer;
begin
    for i in select order_id from Order_Table loop
        r_order_id := i;
        r_order_drink_count := 1 + floor(random() * 3);

        for _ in 1..r_order_drink_count loop
            r_drink_id := min_drink + floor(random() * count_drink);
            r_drink_quantity := 1 + floor(random() * 3);

            if exists (select *
                         from Sale
                        where drink_id = r_drink_id
                          and order_id = r_order_id) then
                continue;
            end if;

            insert into Sale (drink_id, order_id, quantity)
            values (r_drink_id, r_order_id, r_drink_quantity);
        end loop;
    end loop;
end
$$;

---- Transactions

-- Chip transaction table (Under maintenance)
-- truncate table chip_transaction cascade;
-- alter sequence chip_transaction_transaction_id_seq restart with 1;

do $$
declare
    first_date timestamp := '2020-01-01 00:00:00';
    last_date timestamp := '2023-12-01 00:00:00';

    r_player_id integer;
    r_date timestamp;
    r_amount integer;

    i_player integer;
    p_amount integer;
    d_amount integer;

    table_row record;
begin
    for table_row in (select order_id, order_date, player_id, sum(quantity * drink_price)
                        from Order_Table
                               join Sale       using (order_id)
                               join Drink_Info using (drink_id)
                    group by order_id, order_date, player_id
                    order by order_date) loop

        insert into Chip_Transaction (type_of_the_transaction, amount, transaction_date, player_id, participation_id, order_id)
        values ('Bar', -table_row.sum, table_row.order_date, table_row.player_id, null, table_row.order_id);
    end loop;

    for _ in 1..600 loop
        r_player_id := 1 + floor(random() * 27);
        r_date := (first_date + (random() * (last_date - first_date)));

        if exists (select *
                     from blacklist
                    where player_id = r_player_id
                      and ban_date > r_date) then
            continue;
        end if;

        insert into Chip_Transaction (type_of_the_transaction, amount, transaction_date, player_id, participation_id, order_id)
        values ('Other',
                -1 - floor(random() * 200),
                r_date,
                r_player_id,
                null,
                null);
    end loop;

    for table_row in (select player_id, event_id, date_start, date_end
                      from participation
                      join Event_Table using (event_id)) loop
        r_date = table_row.date_start + (random() * (table_row.date_end - table_row.date_start));
        if random() > 0.9 then
            r_amount = 1 + floor(random() * 10000);
        else
            r_amount = 1 + floor(random() * 100);
        end if;

        insert into Chip_Transaction (type_of_the_transaction, amount, transaction_date, player_id, participation_id, order_id)
        values ('Game',
                -r_amount,
                r_date,
                table_row.player_id,
                table_row.event_id,
                null);
    end loop;

    -- wins
    for table_row in (select event_id, date_end, -floor(sum(amount) * 0.8) as total_amount
                        from event_table et
                        join participation p using (event_id)
                        join chip_transaction ct using (participation_id)
                       where type_of_the_transaction = 'Game'
                    group by event_id) loop
        r_player_id := (select player_id
                          from participation
                         where event_id = table_row.event_id
                         order by random()
                         limit 1);

        insert into Chip_Transaction (type_of_the_transaction, amount, transaction_date, player_id, participation_id, order_id)
        values ('Game_Result',
                table_row.total_amount,
                table_row.date_end,
                r_player_id,
                table_row.event_id,
                null);
    end loop;

    for i_player in (select player_id from player) loop
        p_amount := 0;

        for table_row in (select ct.transaction_date, sum(ct.amount) over (
                                                                                 partition by ct.player_id
                                                                                 order by ct.transaction_date
                                                                            ) as total_amount
                              from chip_transaction ct
                             where player_id = i_player
                          order by ct.player_id, ct.transaction_date) loop

            if table_row.total_amount + p_amount < 0 then
                d_amount := -(table_row.total_amount + p_amount) + floor(random() * 1000);
                p_amount := p_amount + d_amount;
                insert into chip_transaction (type_of_the_transaction, amount, transaction_date, player_id, participation_id, order_id)
                values ('Chip',
                        d_amount,
                        table_row.transaction_date - random() * ('2023-12-03'::timestamp - '2023-12-01'::timestamp),
                        i_player,
                        null,
                        null);
            else
                if random() > 0.75 then
                    d_amount := -(table_row.total_amount + p_amount) * random();
                    p_amount := p_amount + d_amount;
                    insert into chip_transaction (type_of_the_transaction, amount, transaction_date, player_id, participation_id, order_id)
                    values ('Chip',
                            d_amount,
                            table_row.transaction_date + random() * ('2023-12-01 12:00:00'::timestamp - '2023-12-01 1:00:00'::timestamp),
                            i_player,
                            null,
                            null);
                end if;
            end if;
            end loop;
    end loop;
end
$$;
