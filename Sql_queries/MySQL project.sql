-- create database
create database OnlineBookstore;

-- switch to the database
use OnlineBookstore;

-- create tables
drop table if exists books;
create table books(
	Book_ID serial primary key,
    Title varchar(100),
    Author varchar(100),
    Genre varchar(50),
    Published_Year int,
    Price numeric(10,2),
    Stock int
);

drop table if exists customers;
create table customers(
	Customer_ID serial primary key,
    Name varchar(100),
    Email varchar(100),
    Phone varchar(15),
    City varchar(50),
    Country varchar(150)
);

drop table if exists orders;
create table orders(
	Order_ID serial primary key,
    Customer_ID int references customers(Customer_ID),
    Book_ID int references books(Book_ID),
    Order_Date date,
    Quantity int,
    Total_Amount numeric(10,2)
);

select * from books;
select * from customers;
select * from orders;

-- import data into tables

-- 1) Retrieve all books in the 'Fiction' genre;

select Book_ID, Title from books
where Genre = 'Fiction';

-- 2) find books published after the year 1950;

select Book_ID, Title, Published_Year from books
where Published_Year > 1950;

-- 3) list all customers from canada;

select * from customers
where Country = 'Canada';

-- 4) show orders placed in november 2023;

select * from orders
where Order_Date between '2023-11-01' and '2023-11-30';

-- 5) retrieve the total stocks of books available;

select sum(Stock) as Total_Stock from books;

-- 6) find the details of the most expensive book;

select * from books
order by Price desc
limit 1;

-- 7) show all customers who ordered more than 1 quantity of book;

select * from orders
where Quantity > 1;

-- 8) retrieve all orders where the total amount exceeds $20;

select * from orders
where Total_Amount > 20;

-- 9) list all genres available in books table;

select distinct Genre from books;

-- 10) find the book with lowest stock;

select * from books
order by Stock asc
limit 1;

-- 11) calculate the total revenue generated from all orders;

select sum(Total_Amount) as Total_Revenue from orders;

-- advance questions

-- 1) retrieve the total number of books sold for each genre;

select b.Genre, sum(o.Quantity) as Total_Quantity
from orders as o
join books as b
on o.Book_ID = b.Book_ID
group by b.Genre;

-- 2) find the average price of books in 'fantasy' genre;

select avg(Price) as avg_price, Genre from books
where Genre = 'Fantasy';

-- 3) list customers who have placed at least 2 orders;

select o.Customer_ID, c.Name, count(o.Order_ID) as Total_order
from orders as o
join customers as c
on o.Customer_ID = c.Customer_ID
group by o.Customer_ID, c.Name
having count(o.Order_ID) >= 2;

-- 4) find the most frequently ordered book;

select o.Book_ID, b.Title, count(o.Order_ID) as Total_Order
from orders as o
join books as b
on o.Book_ID = b.Book_ID
group by o.Book_ID
order by Total_Order desc
limit 1;

-- 5) show the top 3 most expensive books of 'fantasy' genre;

select * from books
where Genre = 'Fantasy'
order by Price desc
limit 3;

-- 6) retrieve the total quantity of books sold by each author;

select b.Author, sum(o.Quantity) as Total_Quantity
from orders as o
join books as b
on b.Book_ID = o.Book_ID
group by b.Author;

-- 7) list the cities where customers who spent over $30 are located;

select distinct c.City, o.Total_Amount
from orders as o
join customers as c
on o.Customer_ID = c.Customer_ID
where Total_Amount > 30;

-- 8) find the customer who spent the most on orders;

select c.Name, c.Customer_ID, sum(o.Total_Amount) as Total_Amount
from orders as o
join customers as c
on o.Customer_ID = c.Customer_ID
group by c.Customer_ID, c.Name
order by sum(o.Total_Amount) desc
limit 1;

-- 9) calculate the stock remaining after fulfiling all orders;

select b.Book_ID, b.Title, b.Stock, coalesce(sum(o.Quantity),0) as Order_Quantity, b.Stock - coalesce(sum(o.Quantity),0) as Remaining_Quantity
from books as b
left join orders as o
on b.Book_ID = o.Book_ID
group by b.Book_ID
order by b.Book_ID;