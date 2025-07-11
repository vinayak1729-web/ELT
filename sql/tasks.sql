--1. for each director count the number of moives and tv shows ,created by them in seperate colums for direcotrs who have created tv shows and moives both

select nd.director  
,count( distinct case when n.type='Movie' then n.show_id end) as no_of_moives -- count(distinct n.type) as distinct_type --n.show_id , n.type  
,count(distinct case when n.type='TV Show' then n.show_id end) as no_of_tv_shows -- count(distinct n.type) as distinct_type --n.show_id , n.type  
from netflix_stg n 
inner join netflix_directors nd on n.show_id = nd.show_id
group by nd.director
having count(distinct n.type)>1

--2. which country has the highest number of comedy moives

SELECT  nc.country, COUNT(DISTINCT ng.show_id) AS no_of_movies
FROM netflix_genre ng
INNER JOIN netflix_country nc ON ng.show_id = nc.show_id
INNER JOIN netflix_stg n ON ng.show_id = n.show_id 
WHERE ng.genre = 'Comedies' AND n.type = 'Movie'
GROUP BY nc.country, ng.show_id
ORDER BY no_of_movies DESC


--3. for each year ( as per date added to netflix ) which director has the maximum number of moives realeased
with cte as(
select nd.director,year(date_added) as date_year, count(distinct n.show_id) as no_of_moives
from netflix_stg n
inner join netflix_directors nd on n.show_id = nd.show_id
where type = 'Movie'
group by nd.director,year(date_added)
)
,cte2 as(
select *
,row_number() over(partition by date_year order by no_of_moives desc,director) as rn
from cte
--order by date_year,no_of_moives desc
)
select * from cte2 where rn = 1



--4 what is average duration of moives in each genre 
select ng.genre, avg(cast(replace( duration,'min','')as int)) as avg_duration
from netflix_stg n
inner join netflix_genre ng on n.show_id = ng.show_id
where type ='Movie'
group by ng.genre


--5 find the list of directors who have created horror and comedy movies both 
select nd.director
,count(distinct case when ng.genre ='Comedies' then n.show_id end) as no_of_comedy
,count(distinct case when ng.genre ='Horror Movies' then n.show_id end) as no_of_horror
from netflix_stg n
inner join netflix_genre ng on n.show_id = ng.show_id
inner join netflix_directors nd on n.show_id = nd.show_id
where type = 'Movie' and ng.genre in('Horror Movies' , 'Comedies')
group by nd.director
having count(distinct ng.genre)=2

select * from netflix_genre where show_id in
(select show_id from netflix_directors where director = 'Steve Brill')
order by genre

