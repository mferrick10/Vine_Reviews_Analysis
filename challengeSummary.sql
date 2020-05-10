-- showing all reviews for games that had verified purchases
select * from vine_table;

-- count of all reviews for games that had verified purchases
select count(*) from vine_table;

-- shows all rows for vine user reviews
select * from vine_table where vine != 'N';

-- shows all rows for non-vine user reviews
select * from vine_table where vine = 'N';

-- mean of helpful_votes for vine users
select avg(helpful_votes) from vine_table where vine != 'N';

-- mean of helpful_votes for non-vine users
select avg(helpful_votes) from vine_table where vine = 'N';

-- shows all rows where helpful_votes were 2 or more for a review
select * from vine_table where helpful_votes >= 1;

-- breaks reviews into groups based on ratings for non-vine users
select star_rating, count(*)
from
(
select case when star_rating = 1 then '1 star'
	when star_rating = 2 then '2 star'
	when star_rating = 3 then '3 star'
	when star_rating = 4 then '4 star'
	when star_rating = 5 then '5 star'
	end as star_rating
	from vine_table where vine = 'N'
) t 
group by star_rating;

-- average helpful_votes and total_votes for vine users
select star_rating, avg(helpful_votes)as helpfulVotes, avg(total_votes) as totalVotes
from vine_table
where vine = 'N'
group by star_rating;

-- total count and percentage of total count for helpful_votes >=1 for vine users
select star_rating, count(helpful_votes) as helpfulVotes, (count(helpful_votes) * 100) / (SELECT count(helpful_Votes)from vine_table where vine = 'N') as percentage
from vine_table
where vine = 'N' and helpful_votes >= 1
group by star_rating;


-- breaks reviews into groups based on ratings for vine-users
select star_rating, count(*)
from
(
select case when star_rating = 1 then '1 star'
	when star_rating = 2 then '2 star'
	when star_rating = 3 then '3 star'
	when star_rating = 4 then '4 star'
	when star_rating = 5 then '5 star'
	end as star_rating
	from vine_table where vine != 'N'
) t 
group by star_rating;

-- average helpful_votes and total_votes for non_vine users
select star_rating, avg(helpful_votes)as helpfulVotes, avg(total_votes) as totalVotes
from vine_table
where vine != 'N'
group by star_rating;

-- total count and percentage of total count for helpful_votes >=1 for non_vine users
select star_rating, count(helpful_votes) as helpfulVotes, (count(helpful_votes) * 100) / (SELECT count(helpful_Votes)from vine_table where vine != 'N') as percentage
from vine_table
where vine != 'N' and helpful_votes >= 1
group by star_rating;

-- distribution of helpful_vote counts
select helpful_votes, count(helpful_votes)
from vine_table
group by helpful_votes
order by helpful_votes DESC;

-- number of reviews with 1 or more helpful_votes
select count(helpful_votes) from vine_table where helpful_votes >= 1;

-- distribution of total_votes for reviews
select total_votes, count(total_votes) from vine_table group by total_votes order by total_votes ASC;

-- average star rating for vine users
select avg(star_rating) from vine_table where vine = 'Y';

-- average star rating for non vine users
select avg(star_rating) from vine_table where vine = 'N';

-- count of vine and non-vine users
select vine , count(vine) from vine_table group by vine;


