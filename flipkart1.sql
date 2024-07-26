use flipkart;
select * from products;
select Brand,No_of_ratings, count(*) as Total_No_of_Ratings from products group by Brand, No_of_ratings;
select brand, count(*) as Total_sales_of_brands from products group by brand;
select brand, Avg(MRP) as Avg_MRP_of_Brands from products group by brand;
select brand, Avg(MSP) as Avg_MSP_of_Brands from products group by brand;
select Brand, Avg(Discount) as Avg_Discount_on_Brands from products group by brand;
select sum(MRP) as Total_of_MRP,sum(MSP) as Total_of_MSP from products;
select Brand, max(MRP) as Max_MRP_of_Brand, min(MSP) as Min_MSP_of_Brand FROM products group by BRAND;
select Brand,MAX(MRP) AS Max_MRP_of_brand,MIN(MSP) AS Min_MSP_of_brand FROM products group by brand HAVING COUNT(*) > 20000;
select Brand,No_of_reviews, count(*) as Total_No_of_reviews from products Group by Brand,No_of_reviews;
select * from products order by 'MRP' DESC LIMIT 10;
select * from products order by 'MSP' DESC LIMIT 5;
select Brand,max(Discount) as MAX_Discount_on_brand from products group by brand;
select Brand, count(*) as top_brand from products group by brand order by top_brand ASC limit 1; 
select Brand, count(*) as top_brand from products group by brand order by top_brand ASC limit 1 offset 1;
select Brand, count(*) as top_brand from products group by brand order by top_brand desc limit 1; 
select Brand, count(*) as top_brand from products group by brand order by top_brand desc limit 1 offset 1; 
select productName,Brand from products order by MRP desc limit 5;
select productName,Brand from products order by MRP asc limit 5;
select Brand,MRP from products where MRP > 25000;
select * from products where MRP between 10000 and 20000;
select productname,Brand,Ratings from products where Ratings >= 4.5;
select Brand,AVG(Ratings) as AvgRating from products where Brand = 'poco' group by Brand;
select ProductName,Brand,MRP,MSP,(MRP-MSP) as Pricedifference from products;
select * from products where MSP > MRP;
select 	(count(*) *100.0/(select count(*)from products)) as DiscountPercentage from products where Discount > 20;
-- Ranking products by their discount within each brand:
select ProductName,Brand,Discount, Rank() over(partition by Brand order by Discount desc) as Discount_Rank from products;
set sql_safe_updates = 0;
set sql_mode = only_full_group_by;
-- Finding the most reviewed product for each rating level
select Ratings,ProductName, max(No_of_reviews) as MAX_Reviews from products group by Ratings,ProductName 
having max(No_of_Reviews) = ( select max(No_of_Reviews) from products as innertable where innertable.ratings = products.ratings);



