--QUESTION 1. 1. Create a Stored Procedure that will insert a new film into the film table with the following 
--arguments: title, description, release_year, language_id, rental_duration, rental_rate, length, replace_cost, rating

--
--SELECT *
--FROM film;
--
--CREATE OR REPLACE PROCEDURE add_film(title VARCHAR, description TEXT, release_year YEAR, language_id INTEGER, rental_duration INTEGER, rental_rate NUMERIC(4,2), "length" INTEGER, replacement_cost NUMERIC (5,2), rating mpaa_rating)
--LANGUAGE plpgsql
--AS $$
--BEGIN 
--	INSERT INTO film(title, description, release_year, language_id, rental_duration, rental_rate, "length", replacement_cost, rating)
--	VALUES (title, description, release_year, language_id, rental_duration, rental_rate, "length", replacement_cost, rating);
--END;
--$$;
--
--
--CALL add_film('Pineapple Express','The plot centers on a process server and his marijuana dealer as they are forced to flee from hitmen and a corrupt police officer after witnessing them commit a murder', 2008, 1, 4, 5.99,  112, 39.99, 'R');
--
--
--SELECT film_id, *
--FROM film 
--ORDER BY film_id DESC;

--QUESTION 2.  Create a Stored Function that will take in a category_id and return the number of films in that category




CREATE OR REPLACE FUNCTION film_num_getter(category_id INTEGER)
RETURNS INTEGER
LANGUAGE plpgsql
AS $$
DECLARE 
	num_film INTEGER;
BEGIN
	SELECT COUNT(*) INTO num_film
	FROM film_category fc
	JOIN category c 
	ON c.category_id = fc.category_id
	WHERE fc.category_id = film_num_getter.category_id;
	RETURN num_film;
END;
$$;





SELECT film_num_getter(15);


