-- 1. How many rows are in the data_analyst_jobs table?
-- select count (*) 
-- from d_a_jobs;
-- Answer: 1793 lines

-- 2. Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?
-- select company 
-- from d_a_jobs
-- limit 10
-- Answer: ExxonMobil

-- 3A. How many postings are in Tennessee? 
-- SELECT count(*)
-- from d_a_jobs
-- where location = 'TN'
-- Answer: 21

-- 3B. How many are there in either Tennessee or Kentucky?
-- SELECT count(*)
-- from d_a_jobs
-- where location in ('TN', 'KY')
-- Answer: 27

-- 4. How many postings in Tennessee have a star rating above 4?
-- SELECT count(star_rating)
-- from d_a_jobs
-- where location = 'TN'
-- and star_rating >4
-- Answer: 3

-- 5. How many postings in the dataset have a review count between 500 and 1000?
-- SELECT count(review_count)
-- FROM d_a_jobs
-- WHERE review_count >= 500
-- AND review_count <= 1000;
-- Answer: 151

-- 6. Show the average star rating for companies in each state. The output should show the state as state and the average rating for the state as avg_rating. Which state shows the highest average rating?
-- SELECT location as state, AVG(star_rating) as avg_rating
-- from d_a_jobs
-- group by state
-- order by avg_rating desc
-- Answer: NE 4.19

-- 7. Select unique job titles from the data_analyst_jobs table. How many are there?
-- select count(distinct title)
-- from d_a_jobs 
-- where company IS NOT NULL
-- Answer: 876 (fact check in excel showed 879. unsure about discrepency)

-- 8. How many unique job titles are there for California companies?
-- select count(Distinct title)
-- from d_a_jobs
-- where location = 'CA'
-- Answer: 230

-- 9. Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?
-- select company, 
-- 		avg(star_rating) as rating
-- from d_a_jobs
-- where review_count >5000
-- 		AND company IS NOT NULL
-- group by company
-- order by rating
-- Answer: 40

-- 10. Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?
-- select company, 
-- 		round(avg(star_rating), 2) as rating
-- from d_a_jobs
-- where review_count >5000
-- 		AND company IS NOT NULL
-- group by company
-- order by rating desc;
-- Answer: Unilever (tied in top 6) 4.199 or with round to 4.20

-- 11. Find all the job titles that contain the word ‘Analyst’. How many different job titles are there?
-- select count(DISTINCT title)
-- from d_a_jobs
-- where title iLIKE '%analyst%'
/* iLIKE statement to eliminate use of OR statements*/
-- Answer: 774

-- 12A. How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? 
-- select count(title)
-- from d_a_jobs
-- where title NOT Ilike '%analy%'
-- Answer: 4

-- 12B. What word do these positions have in common?
-- select title
-- from d_a_jobs
-- where title NOT Ilike '%analy%'
-- Answer: Tableau

-- BONUS:
-- BonusA. Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks.
-- Select count(title)
-- from d_a_jobs
-- where domain is not null
-- and days_since_posting >21
-- and skill ilike '%SQL%'
-- Answer: 403 Jobs

-- BonusB. Which three industries are in the top 4 on this list? 
-- BonusC. How many jobs have been listed for more than 3 weeks for each of the top 4?
-- Select count(domain), 
-- 		domain
-- from d_a_jobs
-- where domain is not null
-- 		and days_since_posting >21
-- 		and skill ilike '%SQL%'
-- group by domain
-- order by count(domain) desc
-- Answer: 
-- 62	"Internet and Software"
-- 61	"Banks and Financial Services"
-- 57	"Consulting and Business Services"
-- 52	"Health Care"