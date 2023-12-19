-- Debt-triggered blacklist addition
create or replace function auto_blacklist_fordebt()
returns trigger as $$
declare
  total_amount int;
  is_blacklisted boolean;
begin

  select exists(select 1 from blacklist where player_id = new.player_id) into is_blacklisted;

  if new.amount < 0 and not is_blacklisted then
      select sum(ct.amount)
  	  into total_amount
      from player p
      join chip_transaction ct on p.player_id = ct.player_id
      where p.player_id = new.player_id;
     if total_amount + new.amount < -10000 then
      raise notice 'Участник с player_id % забанен.', new.player_id;
      insert into blacklist (player_id, ban_reason, ban_date)
      values (new.player_id, 'Debt exceeding limit', current_date);
     end if;

  end if;

  return new;
end;
$$ language plpgsql;

create or replace trigger auto_blacklist_fordebt_trigger
after insert on chip_transaction
for each row
execute function auto_blacklist_fordebt();


-- Сhecking the player is not blacklisted
create or replace function check_blacklist()
returns trigger as $$
begin
    if exists (
        select 1
        from blacklist
        where player_id = new.player_id
    ) then
    	raise notice 'Участник с player_id % в черном списке. Участие невозможно.', new.player_id;
        return null;
    end if;

    return new;

end;
$$ language plpgsql;


create or replace trigger check_blacklist_trigger
before insert on participation
for each row
execute function check_blacklist();
