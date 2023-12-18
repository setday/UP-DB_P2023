-- Написать CRUD-запросы (INSERT, SELECT, UPDATE, DELETE) к двум таблицам БД.
-- b8ee52a55d565a9c638a75eb780fd749e85401a7

---- Players

-- Nikolay Skripko has joined the club
insert into Player (nickname, first_name, last_name, address)
values ('Skripkon', 'Николай', 'Скрипко', 'пр. Ленина, 23, г. Санкт-Петербург, Россия');

-- Alexander Serkov has changed his nickname
update Player
set nickname = 'SetMidnight'
where first_name = 'Александр'
  and last_name = 'Серков';

-- RedHat has problems with the law so lets get rid of the evidence

delete from Player
where nickname = 'RedHat';

-- Finally we have S-party in the club, lets see who is invited

select * from Player
where nickname like 'S%';

---- Bar

-- Add a payment for the last order

insert into Chip_Transaction (type_of_the_transaction, amount, transaction_date, player_id, participation_id, order_id)
values ('Bar', -14, '2023-09-08 11:07:08', 24, null, 17);
insert into Chip_Transaction (type_of_the_transaction, amount, transaction_date, player_id, participation_id, order_id)
values ('Bar', -14, '2023-09-08 11:07:08', 24, null, 17);

-- Unfortunate mistake, we have added two payments for the last order instead of one, lets fix it

delete from Chip_Transaction
where transaction_id = (select max(transaction_id)
                        from Chip_Transaction
                        where type_of_the_transaction = 'Bar'
                          and transaction_date = '2023-09-08 11:07:08'
                          and player_id = 24);

-- Unfortunately, we set the wrong amount, lets fix it

update Chip_Transaction
set amount = -24
where type_of_the_transaction = 'Bar'
  and transaction_date = '2023-09-08 11:07:08'
  and player_id = 24;

-- Lets see if there is only one payment for the last order and if the amount is correct

select * from Chip_Transaction
where type_of_the_transaction = 'Bar'
  and transaction_date = '2023-09-08 11:07:08'
  and player_id = 24;
