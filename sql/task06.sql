-- 1
-- В результате выполнения запроса выведутся участники, у которых суммы
-- транзакций больше 500 (богатые буратины, так сказать)
select p.player_id, p.nickname, sum(ct.amount) as total_amount
from player p
join chip_transaction ct on p.player_id = ct.player_id
group by p.player_id, p.nickname
having sum(ct.amount) > 500
order by total_amount desc;


-- 2
-- В результате выполнения запроса для каждого участника выведется количество
-- сыгранных игр (азартные буратины, так сказать)
select p.player_id, p.nickname, count(pa.event_id) as games_played
from player p
join participation pa on p.player_id = pa.player_id
group by p.player_id
order by games_played desc;


-- 3
-- В результате выполнения запроса выведется среднее значение сумм транзакций
-- для каждого участника (средние буратины, так сказать)
select
  distinct player_id,
  avg(amount) over (partition by player_id) as avg_amount
from
  chip_transaction
order by
  avg_amount desc;


-- 4
-- В результате выполнения запроса для каждого стола выведется количество игр,
-- в которых он участвовал (популярные столы, так сказать)
select distinct
    e.table_id,
    count(*) over (partition by e.table_id) as games_played_on_table
from
    event_table e
order by
    e.table_id;


-- 5
-- В результате выполнения запроса для каждого участника выведется игра,
-- в которую тот играл больше всего раз (любимые игры, так сказать)
select fav_game_id.player_id, gd.game_name
from (
    select
        distinct on (pa.player_id) pa.player_id,
        game_id,
        count(*) over (partition by pa.player_id, gt.game_id) as pa_count
    from
        participation pa
        join event_table e on pa.event_id = e.event_id
        join gambling_table gt on gt.table_id = e.table_id
    group by
        pa.player_id, pa.participation_id, e.event_id, gt.game_id
    order by
        pa.player_id, pa_count desc
) as fav_game_id
join game_description gd on gd.game_id = fav_game_id.game_id
group by fav_game_id.player_id, gd.game_name
order by fav_game_id.player_id;


-- 6
-- В результате выполнения запроса выведется для каждой транзакции участника
-- информация о предыдущей транзакции (тёмное прошлое, так сказать)
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


-- 7
-- В результате выполнения запроса выведутся суммы транзанзакций по дням для
-- каждого участника
select
    p.nickname,
    ct.transaction_date,
    sum(ct.amount) over (
        partition by ct.player_id
        order by ct.transaction_date
    ) as total_amount
from
    chip_transaction ct
join
    player p using (player_id)
order by
    ct.player_id,
    ct.transaction_date;


-- 8
-- В результате выполнения запроса для каждой игры выведется рейтинг участников
select
  eap.event_id,
  eap.player_id,
  sum(ct.amount) as total_amount,
  rank() over (partition by eap.event_id order by sum(ct.amount) desc) as participant_rank
from
  (
    select
      et.event_id,
      p.player_id,
      p.participation_id
    from
      event_table et
      join participation p on p.event_id = et.event_id
  ) as eap
join chip_transaction ct on ct.participation_id = eap.participation_id
where
  ct.type_of_the_transaction in ('Game_Result', 'Game')
group by
  eap.event_id, eap.player_id
order by
  eap.event_id;


-- 9
-- В результате выполнения запроса для каждого игрока будет выведен тип транзакций,
-- которые чаще всего предшествуют ЗАГУЛУ (покупке алкоголя)
select
 distinct on (player_id)
    player_id,
    type_of_the_transaction,
    count(*) as transactioncount
from (
    select
        ct.player_id,
        ct.transaction_id,
        ct.type_of_the_transaction,
        lead(ct.type_of_the_transaction) over (partition by ct.player_id order by ct.transaction_date) as nexttransactiontype
    from chip_transaction ct
) ot
where ot.nexttransactiontype = 'Bar' and ot.type_of_the_transaction != 'Bar'
group by player_id, type_of_the_transaction
order by player_id, transactioncount desc;


-- 10
-- В результате выполнения запроса для каждого игрока будет найден игрок,
-- с которым он играет чаще всего
select
    player1_id,
    player2_id,
    gamesplayedtogether
from (
    select
        p1.player_id as player1_id,
        p2.player_id as player2_id,
        count(*) as gamesplayedtogether,
        rank() over (partition by p1.player_id order by count(*) desc) as pair_rank
    from
        participation p1
        join participation p2 on p1.event_id = p2.event_id and p1.player_id != p2.player_id
    group by
        p1.player_id, p2.player_id
) as rankedpairs
where
    pair_rank = 1;

-- 11
-- В результате выполнения запроса для каждого ЗАБАНЕННОГО игрока выведется
-- последняя транзакция, перед которой тот попал В БАНЮ
select
	distinct on (player_id)
    ct.player_id,
    ct.transaction_id,
    ct.transaction_date
from
    chip_transaction ct
    join blacklist bl on ct.player_id = bl.player_id
where
    ct.transaction_date < bl.ban_date
order by
    player_id, ct.transaction_date desc;
