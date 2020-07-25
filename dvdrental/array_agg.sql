-- PostgreSQL with dvdrental database.
select
    title,
    array_agg(concat(first_name,' ',last_name)
        order by first_name, last_name) actors
from
    film
inner join
    film_actor
using
    (film_id)
inner join
    actor
using
    (actor_id)
group by
    title
order by
    title;
