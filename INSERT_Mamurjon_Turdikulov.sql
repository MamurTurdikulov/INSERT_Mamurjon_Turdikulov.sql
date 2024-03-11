-- 1. Inserting a new record into the "film" table
INSERT INTO film (title, rental_rate, rental_duration)
VALUES ('The Conjuring', 4.99, 14); -- Assuming the rental duration is specified in days, 2 weeks = 14 days

-- 2. Inserting records into the "actor" and "film_actor" tables

-- Inserting actors into the "actor" table (assuming they don't exist already)
INSERT INTO actor (first_name, last_name)
VALUES
    ('Vera', 'Farmiga'),
    ('Patrick', 'Wilson'),
    ('Taissa', 'Farmiga');

-- Getting the IDs of the actors we just inserted
SET @actor1_id = LAST_INSERT_ID();
SET @actor2_id = LAST_INSERT_ID() - 1;
SET @actor3_id = LAST_INSERT_ID() - 2;

-- Inserting records into the "film_actor" table
-- Assuming the film ID for "The Conjuring" is obtained from the film table
SET @film_id = (SELECT film_id FROM film WHERE title = 'The Conjuring');

INSERT INTO film_actor (film_id, actor_id)
VALUES
    (@film_id, @actor1_id),
    (@film_id, @actor2_id),
    (@film_id, @actor3_id);

-- 3. Adding "The Conjuring" to any store's inventory
-- Assuming the store ID is specified as 1 for simplicity

-- First, we need to get the film ID of "The Conjuring"
SET @film_id = (SELECT film_id FROM film WHERE title = 'The Conjuring');

-- Inserting the movie into the inventory
INSERT INTO inventory (film_id, store_id)
VALUES (@film_id, 1);