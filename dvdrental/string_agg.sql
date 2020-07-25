-- PostgreSQL with dvdrental database.
select
    country,
    string_agg(email, ';') email_list
from
    customer
inner join
    address
using
    (address_id)
inner join
    city
using
    (city_id)
inner join
    country
using
    (country_id)
group by
    country
order by
    country;
