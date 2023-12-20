--	The "Player_Activity_Statistics" view provides a comprehensive overview of a 
--	player's activity,  including the number of games played, total chips used and won, 
-- 	and the total money spent in the bar.

-- DROP VIEW Player_Activity_Statistics;
CREATE OR REPLACE VIEW Player_Activity_Statistics AS
SELECT
    p.player_id,
    p.nickname,
    COUNT(DISTINCT et.event_id) AS games_played,
    COALESCE(SUM(CASE WHEN ct.type_of_the_transaction = 'Chip' AND ct.amount > 0 THEN ct.amount ELSE 0 END), 0) AS chips_bought_at_the_checkout,
    COALESCE(SUM(CASE WHEN ct.type_of_the_transaction = 'Chip'AND ct.amount < 0 THEN -ct.amount ELSE 0 END), 0) AS chips_sold,
    -COALESCE(SUM(CASE WHEN ct.type_of_the_transaction = 'Game' THEN ct.amount ELSE 0 END), 0) AS chips_used_during_the_games,
    COALESCE(SUM(CASE WHEN ct.type_of_the_transaction = 'Game_Result' AND ct.amount > 0 THEN ct.amount ELSE 0 END), 0) AS chips_won,
    COALESCE(SUM(CASE WHEN ct.type_of_the_transaction = 'Bar' THEN -ct.amount ELSE 0 END), 0) AS bar_spending
FROM
    Player p
LEFT JOIN Participation pt ON p.player_id = pt.player_id
LEFT JOIN Event_Table et ON pt.event_id = et.event_id
LEFT JOIN Chip_Transaction ct ON p.player_id = ct.player_id
GROUP BY
    p.player_id;

-- SELECT * FROM Player_Activity_Statistics;


--The "Drink_Statistics" view provides insights into the purchasing patterns of drinks at the bar.
--		times_purchased: The number of times the drink has been purchased.
--		total_revenue: The cumulative revenue generated for the bar from the sales of this drink.
--		last_purchase_date: The date of the most recent purchase of this drink.
   
-- DROP VIEW Drink_Statistics;
CREATE OR REPLACE VIEW Drink_Statistics AS
SELECT
    DI.drink_id,
    DI.drink_title,
    COUNT(S.order_id) AS times_bought,
    DI.drink_price * COUNT(S.order_id) AS total_revenue,
    MAX(OT.order_date) AS last_purchase_date
FROM
    Drink_Info DI
LEFT JOIN
    Sale S ON DI.drink_id = S.drink_id
LEFT JOIN
    Order_Table OT ON S.order_id = OT.order_id
GROUP BY
    DI.drink_id, DI.drink_title;
   
-- SELECT * FROM Drink_Statistics;
   
   
--  The `Game_Statistics` view provides statistical information for each game, 
--	summarizing player participation, total playtime, investments, and venue earnings.
   
-- DROP VIEW Game_Statistics; 
CREATE OR REPLACE VIEW Game_Statistics AS
SELECT
    gd.game_id,
    gd.game_name,
    COUNT(DISTINCT p.player_id) AS players_count,
    SUM(EXTRACT(EPOCH FROM et.date_end - et.date_start)) AS total_play_time_seconds,
    -SUM(CASE WHEN ct.type_of_the_transaction = 'Game' THEN ct.amount ELSE 0 END) AS total_investment,
    COALESCE(SUM(CASE WHEN ct.type_of_the_transaction = 'Game_Result' THEN ct.amount ELSE 0 END), 0) AS total_venue_expenses
FROM
    Game_Description gd
JOIN
    Gambling_Table gt ON gd.game_id = gt.game_id
JOIN
    Event_Table et ON gt.table_id = et.table_id
LEFT JOIN
    Participation p ON et.event_id = p.event_id
LEFT JOIN
    Chip_Transaction ct ON p.participation_id = ct.participation_id
WHERE
    ct.type_of_the_transaction IN ('Game', 'Game_Result')
GROUP BY
    gd.game_id, gd.game_name;
   

 -- SELECT * from Game_Statistics


   
    
   
