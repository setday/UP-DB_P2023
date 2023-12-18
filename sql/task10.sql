create schema if not exists db_project;

set
search_path = db_project,
public;

-- 01
drop procedure if exists search_event;
-- найти игру и добавить участие в Participation, начало которой между date_from и date_to, в которой не достигнуто максимальное количество игроков
create procedure add_participation(player_id_new integer, date_from date, date_to date)
as $$
declare
    event_search integer;
begin
	if (select count(1) from Player where
	player_id = player_id_new) = 0 then
	raise exception 'Игрока с номером % не существует!', player_id_new;
	end if;

	if (select count(1) from Blacklist where
	player_id = player_id_new) > 0 then
	raise exception 'Игрок с номером % в черном списке!', player_id_new;
	end if;

	for event_search in (select event_id from Event_table where date_start >= date_from and date_start <= date_to)
	loop
		if (select count(1) from Participation where player_id = player_id_new and event_id = event_search) = 0 then -- игрок еще не записан на эту игру
			if (select count(1) from Participation where event_id = event_search) < (   -- максимальное количество игроков не достигнуто
			select gd.max_players from Game_description gd where
			game_id = (select gt.game_id from Gambling_table gt where
			table_id = (select et.table_id from Event_table et where event_id = event_search))) then 
			insert into Participation (player_id, event_id) values (player_id_new, event_search);
			exit;
			end if;
		end if; 
	end loop;
	
end;
$$
language plpgsql;


-- call add_participation(3, '2022-10-01', '2022-10-02');

-- 02
drop procedure if exists order_drink_for_event;
-- сделать заказ напитка для каждого игрока события к началу игры
create procedure order_drink_for_event(event_id_ integer, drink_id_ integer)
as $$
declare
    player_in_event integer;
   price_of_drink numeric;
  date_of_event date;
 last_id integer;
begin
	if (select count(1) from Event_table where
	event_id = event_id_) = 0 then
	raise exception 'События с номером % не существует!', player_id_new;
	end if;

	if (select count(1) from drink_info where
	drink_id = drink_id_) = 0 then
	raise exception 'Напитка с номером % не существует!', player_id_new;
	end if;

	execute 'select drink_price from Drink_info where drink_id = $1' -- цена напитка
	into price_of_drink
	using drink_id_;

	execute 'select date_start from Event_table where event_id = $1' -- дата начала игры
	into date_of_event
	using event_id_;


	for player_in_event in (select player_id from Participation where event_id = event_id_)
	loop
		insert into Order_table(player_id, order_date) values(player_in_event, date_of_event) returning order_id into last_id;
		insert into Sale(drink_id, order_id) values (drink_id_, last_id);
		insert into Chip_transaction(player_id, order_id, type_of_the_transaction, amount, transaction_date) values(player_in_event, last_id, 'Bar', price_of_drink, date_of_event);
	end loop;
	
end;
$$
language plpgsql;


-- call order_drink_for_event(1, 1);
-- call order_drink_for_event(2, 3);
