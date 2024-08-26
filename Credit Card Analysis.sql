/*
Credit Crad Data Exploration 
*/

--All data
select * from credit_card_transcations

--No of cards in each city
select count(city) as No_of_Cards,city from credit_card_transcations group by city order by count(city)  desc

--No of cards in each card type
select count(card_type) as No_of_Cards, card_type from credit_card_transcations group by card_type

--No of cards vs Gender
select  count(card_type) as No_of_Cards, gender from credit_card_transcations group by gender

--Total amount in each city
select city, sum(amount) as Total_Amt_In_City from credit_card_transcations group by city order by sum(amount) desc

--Total expenses in each expense category
select exp_type, sum(amount) as Total_Amt_In_Category from credit_card_transcations group by exp_type order by sum(amount) desc

--Amount spent on Sunday in each city
select sum(amount) as Money_Spent_On_Sunday, city  from credit_card_transcations where  DATEPART(WEEKDAY, date) = 1 group by amount, city order by sum(amount) desc 

--percentage contribution of spends by females for each expense type
select exp_type,
sum(case when gender='F' then amount else 0 end)*1.0/sum(amount) as percentage_female_contribution
from credit_card_transcations
group by exp_type
order by percentage_female_contribution desc;

--During weekends city with highest total spend to total no of transcations ratio 
select top 1 city , sum(amount)*1.0/count(1) as ratio
from credit_card_transcations
where datepart(weekday,date) in (1,7)
--where datename(weekday,transaction_date) in ('Saturday','Sunday')
group by city
order by ratio desc;
