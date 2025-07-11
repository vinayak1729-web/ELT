SELECT * FROM netflix_table
WHERE show_id = 's5023';

select show_id,count(*)
from netflix_table
group by show_id
having count(*)>1;


--HANDLED ALL DUBLICATES--
select * from netflix_table
where concat(UPPER(title),type) in(
select concat(UPPER(title),type)
from netflix_table
group by UPPER(title),TYPE
having count(*)>1
)
order by title;

with cte as(
select * 
,ROW_NUMBER() OVER(partition BY title,type order by show_id) as rn

from netflix_table
)
SELECT *
from cte 
where rn=1;



SELECT show_id,value as director
into netflix_directors
from netflix_table 
cross apply string_split(director,',');

SELECT show_id,trim(value) as genre
into netflix_genre
from netflix_table 
cross apply string_split(listed_in,',');

SELECT show_id,value as country
into netflix_country
from netflix_table 
cross apply string_split(country,',');

SELECT show_id,value as cast
into netflix_cast
from netflix_table 
cross apply string_split(cast,',');

--adding date type in the conversations
with cte as(
select * 
,ROW_NUMBER() OVER(partition BY title,type order by show_id) as rn

from netflix_table
)
SELECT show_id,type,title,cast(date_added as date) as date_added,release_year,rating,duration,description
from cte 
where rn=1;

--populate missing values in country , during columns 

select * --show_id,country
from netflix_table
where country is null;

select * from netflix_table where director = 'Ahishor Solomon';

select director,country from
netflix_country nc
inner join netflix_directors nd on nc.show_id = nd.show_id
group by director,country
order by director;

insert into netflix_country
select show_id,m.country
from netflix_table nr
inner join(
select director,country 
from netflix_country nc
inner join netflix_directors nd on nc.show_id = nd.show_id
group by director,country
) m on nr.director = m.director
where nr.country is null;


---------------
-- handling the duration the null values
select * from netflix_table where duration is null


with cte as(
select * 
,ROW_NUMBER() OVER(partition BY title,type order by show_id) as rn

from netflix_table
)
SELECT show_id,type,title,cast(date_added as date) as date_added,release_year,rating,case when duration is null then rating else duration end as duration,description 
into netflix_stg
from cte;

select * from netflix_stg
