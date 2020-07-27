-- General form of case-when
select
	sum(
        case
            when rental_rate = 0.99 then 1
            else 0
	    end
	) as "economy",
	sum(
		case
		    when rental_rate = 2.99 then 1
		    else 0
		end
	) as "mass",
	sum(
		case
		    when rental_rate = 4.99 then 1
            else 0
		end
	) as "premium"
from
	film;

-- Simple form of case-when
select
    sum(
        case rating
            when 'G' then 1
            else 0
        end
    ) as general_audiences,
    sum(
        case rating
            when 'PG' then 1
            else 0
        end
    ) as parental_guidance_suggested,
    sum(
        case rating
            when 'PG-13' then 1
            else 0
        end
    ) as parents_strongly_cautioned,
    sum(
        case rating
            when 'R' then 1
            else 0
        end
    ) as restricted,
    sum(
        case rating
            when 'NC-17' then 1
            else 0
        end
    ) as adults_only
from
    film;
