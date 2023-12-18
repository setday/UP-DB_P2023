create schema if not exists db_project_view;

set
search_path = db_project_view, db_project,
public;
-- Player
create or replace
view v_player as
select
	p.nickname as "Кличка",
	overlay(p.first_name placing repeat('*', length(p.first_name) - 1) from 1) || ' ' || overlay(p.last_name placing repeat('*', length(p.last_name) - 1) from 1) as "Имя, Фамилия",
	overlay(p.address placing repeat('*', position(',' in p.address) + 1) from 1) as "Адрес"
from
	db_project.Player p;

-- Blacklist;
create or replace
view v_blacklist as
select
	p.nickname as "Игрок",
	b.ban_date as "Дата занесения в черный список",
	b.ban_reason as "Причина занесения в черный список"
from
	db_project.Blacklist b
inner join db_project.Player p on
	b.player_id = p.player_id;

-- Game_Description;
create or replace
view v_game_description as
select
	g.game_name as "Название игры",
	case
		when g.min_players = g.max_players then 'ровно ' || g.min_players
		else 'от ' || g.min_players || ' до ' || g.max_players
	end as "Возможное количество игроков",
		g.hall as "Зал"
from
		db_project.Game_Description g

-- Gambling_Table;
create or replace
view v_gambling_table as
select
	gd.game_name as "Название игры", 
	count(1) as "Количество сломанных столов"
from
	db_project.Gambling_Table g
inner join db_project.Game_Description gd on
	g.game_id = gd.game_id
where
	g.out_of_order is true
group by
	gd.game_name;

-- Event_Table;
create or replace
view v_event_table as
select
	gd.game_name as "Название игры",
	'c ' || et.date_start ||
	case
		when et.date_end = '3000-01-01' then ' еще длится'
		else ' до ' || et.date_end
	end as "Время игры"
from
	db_project.Event_Table et
inner join db_project.gambling_table gt on
	et.table_id = gt.table_id
inner join db_project.game_description gd on
	gt.game_id = gd.game_id;

-- Participation;
create or replace
view v_participation as
select
	p2.nickname as "Кличка",
	gd.game_name as "Имя игры",
	'c ' || et.date_start ||
	case
		when et.date_end = '3000-01-01' then ' еще длится'
		else ' до ' || et.date_end
	end as "Время игры"
from
	db_project.Participation p
inner join db_project.event_table et on
	p.event_id = et.event_id
inner join db_project.gambling_table gt on
	et.table_id = gt.table_id
inner join db_project.game_description gd on
	gt.game_id = gd.game_id
inner join db_project.player p2 on
	p.player_id = p2.player_id;

-- Drink_Info;
create or replace
view v_drink_info as
select
	di.drink_title as "Название напитка",
	di.alcohol_percentage as "Крепость напитка",
	di.drink_price as "Цена напитка"
from
	db_project.Drink_info di;

-- Order_Table;
create or replace
view v_order_table as
select
	ot.order_date as "Дата",
	sum(s.quantity) as "Количество напитков"
	-- string_agg(distinct di.drink_title, ', ') as "Названия напитков"
from
	db_project.Order_table ot
inner join db_project.sale s on
	ot.order_id = s.order_id
inner join db_project.drink_info di on
	di.drink_id = s.drink_id
group by
	ot.order_date;

-- Sale;
create or replace
view v_sale as
select
	p.nickname as "Кличка",
	di.drink_title as "Название напитка",
	s.quantity as "Количество напитков",
	ot.order_date as "Дата"
from
	db_project.Sale s
inner join db_project.drink_info di on
	di.drink_id = s.drink_id
inner join db_project.order_table ot on
	ot.order_id = s.order_id
inner join db_project.player p on
	p.player_id = ot.player_id;

-- Chip_Transaction;
create or replace
view v_chip_transaction as
select
	(
	select
		p.nickname
	from
		db_project.player p
	where
		p.player_id = ct.player_id) as "Кличка",
	sum(ct.amount) as "Сумма"
from
	db_project.chip_transaction ct
group by
	ct.player_id;
	
	
