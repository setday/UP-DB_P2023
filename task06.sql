-- 1
-- В результате выполнения запроса выведутся участники, у которых суммы транзакций больше 50 (богатые буратины, так сказать)
select p.player_id, p.nickname, sum(ct.amount) as total_amount
from player p
join chip_transaction ct on p.player_id = ct.player_id
where ct.type_of_the_transaction != 'Game_Result'
group by p.player_id, p.nickname
having sum(ct.amount) > 50
order by total_amount desc;

-- 2
-- В результате выполнения запроса для каждого участника выведется количество сыгранных игр (азартные буратины, так сказать)
select p.player_id, p.nickname, count(distinct pa.event_id) as games_played
from player p
join participation pa on p.player_id = pa.player_id
group by p.player_id, p.nickname
order by games_played desc;

-- 3
-- В результате выполнения запроса выведется среднее значение сумм транзакций для каждого участника (средние буратины, так сказать)
select player_id,
       avg(amount) over (partition by player_id) as avg_amount
from chip_transaction
group by player_id, amount
order by avg_amount desc;

-- 4
-- В результате выполнения запроса для каждого стола выведется количество игр, в которых он участвовал (популярные столы, так сказать)
select distinct
    e.table_id,
    count(*) over (partition by e.table_id) as games_played_on_table
from
    event_table e
order by
    e.table_id;

-- 5
-- В результате выполнения запроса для каждого участника выведется игра, в которую тот играл больше всего раз (любимые игры, так сказать)
select
    p.player_id,
    p.nickname,
    (
        select
            gd.game_name
        from
            chip_transaction ct
            join participation pa on ct.participation_id = pa.participation_id
            join event_table e on pa.event_id = e.event_id
            join gambling_table gt on e.table_id = gt.table_id
            join game_description gd on gt.game_id = gd.game_id
        where
            ct.player_id = p.player_id
        group by
            gd.game_name
        order by
            sum(ct.amount) desc
        limit 1
    ) as favorite_game
from
    player p;


-- 6
-- В результате выполнения запроса выведется для каждой транзакции участника информация о предыдущей транзакции (тёмное прошлое, так сказать)
select
    ct.player_id,
    ct.transaction_id,
    ct.transaction_date,
    ct.amount as current_transaction_amount,
    lag(ct.transaction_id) over (
        partition by ct.player_id
        order by ct.transaction_date
    ) as previous_transaction_id,
    lag(ct.amount) over (
        partition by ct.player_id
        order by ct.transaction_date
    ) as previous_transaction_amount
from
    chip_transaction ct
order by
    ct.player_id,
    ct.transaction_date;
