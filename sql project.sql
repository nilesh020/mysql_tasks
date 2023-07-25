-- Task 1 
use sakila;
select * from actor;
select concat(first_name,last_name) as full_name from actor; 

-- Task 2.1
select first_name ,count(first_name) from actor group by first_name; 
-- Task 2.2
select first_name, count(first_name) as Count from actor group by first_name having count(first_name)=1;

-- task 3.1
select last_name ,count(last_name) from actor group by last_name; 
-- task 3.2
select last_name, count(last_name) as Count from actor group by last_name having count(last_name)=1;

-- task 4.1
select * from film;
select title,rating from film where rating="R";
-- task 4.2
select title,rating from film where rating!="R";
-- task 4.3
select title,rating from film where rating="G" OR rating="PG" ;
select title,rating from film where rating in ("G","PG");

-- task 5.1
select title,replacement_cost from film where replacement_cost<=11;
-- task 5.2
select title,replacement_cost from film where replacement_cost between 11 and 20 ;
-- task 5.3
select title,replacement_cost from film order by replacement_cost desc ;

-- task 6
select * from film_actor;
select * from film ; 
select film.title,count(film_actor.actor_id) as actors_count from film inner join film_actor on film.film_id=film_actor.film_id group by film.title order by  actors_count desc limit 5;

-- task 7 
select * from film where title like 'k%' or title like 'q%'; 

-- task 8
select * from actor;
select * from film_actor;
select * from film ; 
select concat(actor.first_name,actor.last_name) as full_name from actor inner join film_actor on actor.actor_id=film_actor.actor_id inner join film on film_actor.film_id=film.film_id where film.title="Agent truman" ;

-- task 9
select * from category;
select * from film_category;
select * from film ; 
select film.title, category.name from film inner join film_category on film.film_id=film_category.film_id inner join category on film_category.category_id=category.category_id where film_category.category_id=8;

-- task 10.1
select rating, avg(rental_rate) as Avg_rental_rate, min(rental_rate) as Mini_rental_rate, max(rental_rate) as Max_rental_rate from film group by rating order by Avg_rental_rate desc ;
-- task 10.2
select * from film order by rental_duration desc;

-- task 11
select * from category ;
select * from film_category ;
select * from film;
select category.name,avg(film.replacement_cost),avg(film.rental_rate), (avg(film.replacement_cost)-avg(film.rental_rate)) as Avg_diff from film inner join film_category on film.film_id=film_category.film_id inner join category on film_category.category_id=category.category_id group by category.name having avg(film.replacement_cost)-avg(film.rental_rate)>15;

-- task 12
select category.name, count(film.title) as film_count from film inner join film_category on film.film_id=film_category.film_id inner join category on film_category.category_id=category.category_id group by category.name having film_count>70 ;
