-- CREATE DATABASE DEVER_TEST_SQL;

/* DDL Testing section */
-- Quest 1:
CREATE TABLE Customer
(
    customerID int primary key,
    fullName varchar(50) not null,
    email varchar(50) not null,
    phoneNumber char(13) not null,
    gender boolean not null
);

-- Quest 2:
alter TABLE Customer
add constraint email_unique UNIQUE(email);

alter TABLE Customer
add constraint email_check check(email like '%@%');

alter TABLE Customer
add constraint phoneNumber_check check (phoneNumber ~ '^[0]{1}[0-9]+');


/* DML Testing section */
-- Quest 1:
select c.country_id, c.country, count(ct.city_id) as "Number of City"
from country c
left join city ct on c.country_id = ct.country_id
group by c.country_id, c.country
order by c.country_id
limit 10

-- Quest 2:
select c.customer_id ,f.film_id, title, rating, release_year
from customer c 
inner join rental r on c.customer_id = r.customer_id
inner join inventory i on i.inventory_id = r.inventory_id
inner join film f on f.film_id = i.film_id
where c.customer_id = 3
order by f.film_id
limit 5

-- Quest 3:
select customer_id, first_name, last_name, email, a.address_id, ct.city_id, city, cnt.country_id, country
from Customer c
inner join address a on a.address_id = c.address_id
inner join city ct on ct.city_id = a.city_id
inner join country cnt on cnt.country_id = ct.country_id 
where cnt.country_id = 3




