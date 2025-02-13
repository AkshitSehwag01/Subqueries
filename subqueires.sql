use restaurants_data;
select * from  restaurants;

-- 1. Which restaurant of abohar is visited by least number of people?


select * from restaurants where city = 'Abohar' and rating_count = (select min(rating_count) from restaurants where city = 'Abohar');

-- 2. Which restaurant has generated maximum revenue all over india?
select * from restaurants where rating_count*cost = (select max(rating_count*cost) from restaurants);

-- 3. How many restaurants are having rating more than the average rating?


select count(*) as 'total_restaurants' from restaurants where rating >= (select round(avg(rating),2) from restaurants);

-- 4. Which restaurant of Delhi has generated most revenue?
select * from restaurants where city = 'Delhi' and rating_count*cost = (select max(rating_count*cost) from restaurants where city = 'Delhi');

-- 5. Which restaurant has more than average cost of an restaurant in Delhi has generated most revenue?

select * from restaurants where 
	rating_count * cost = (select max(rating_count * cost) from restaurants where city = 'Delhi' )
							and
							 cost > (select avg(cost) from restaurants where city = 'Delhi')
									and city = 'Delhi';
                        
-- 6. Which restaurant chain has maximum number of restaurants?
select name, count(name) as 'max_no._restaurant' from restaurants group by name order by count(name) desc limit 5;

-- 7. Which restaurant chain has maximum number of restaurants?
select name, sum(rating_count*cost) as 'max_revenue' from restaurants group by name order by sum(rating_count*cost) desc limit 5;

-- 8. Which city has maximum number of restaurants?
select city, count(*) as max_restaurants from restaurants group by city order by count(*) desc limit 10;

-- 9. Which city has generated maximum revenue all over india?
select city,sum(rating_count*cost) as 'max_revenue' from restaurants group by city order by sum(rating_count*cost) desc limit 10;

-- 10. List 10 least expensive cuisines?
select cuisine, round(avg(cost),2) as 'least_expensive' from restaurants group by cuisine order by avg(cost) asc limit 10;

-- 11. List 10 most expensive cuisines?
select cuisine, round(avg(cost),2) as 'most_expensive' from restaurants group by cuisine order by avg(cost) desc limit 10;

-- 12. What is the city is having Biryani as most popular cuisine?
select city, sum(rating_count) as 'biryani_ratings' from restaurants
where cuisine = 'Biryani'
group by city
order by biryani_ratings desc limit 10;

-- 13. List top 10 unique restaurants with unique name only thorughout the dataset as per generate maximum revenue (Single restaurant with that name)
select name, sum(rating_count*cost) as 'max_revenue' from restaurants 
group by name having count(name)=1 order by max_revenue desc limit 10;


