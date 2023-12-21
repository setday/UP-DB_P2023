-- Отмена операции описания фишек, если:
-- 1. Участник ЗАБАНЕН
-- 2. Участник уходит в МИНУС
create or replace function check_transaction()
returns trigger as $$
declare
  total_amount int;
  is_blacklisted boolean;
begin

  select exists(select 1 from blacklist where player_id = new.player_id) into is_blacklisted;

  if is_blacklisted then
    raise notice 'Участник с player_id % ЗАБАНЕН. Транзакция невозможна.', new.player_id;
    return null;
  end if;
  if new.amount < 0 then
      select sum(ct.amount)
  	  into total_amount
      from player p
      join chip_transaction ct on p.player_id = ct.player_id
      where p.player_id = new.player_id;
     if total_amount + new.amount < 0 then
      raise notice 'У участника с player_id % не хватает фишек.', new.player_id;
       return null;
     end if;
  return new;
  end if;

  return new;
end;
$$ language plpgsql;

create or replace trigger check_transaction_trigger
before insert on chip_transaction
for each row
execute function check_transaction();


-- Отмена операции добавления в игру, если участник ЗАБАНЕН
create or replace function check_blacklist()
returns trigger as $$
begin
    if exists (
        select 1
        from blacklist
        where player_id = new.player_id
    ) then
    	raise notice 'Участник с player_id % ЗАБАНЕН. Участие невозможно.', new.player_id;
        return null;
    end if;

    return new;

end;
$$ language plpgsql;


create or replace trigger check_blacklist_trigger
before insert on participation
for each row
execute function check_blacklist();
