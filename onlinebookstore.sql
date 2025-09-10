# 1]Retrieve all books in the “Fiction” genre. 
select * from books where Genre = 'Fiction';

# 2]Find books published after the year 1950. 
select * from books where published_year > 1950;

# 3]List all customers from Canada. 
select * from customers where country = 'Canada';

# 4]Show orders placed in November 2023.
SELECT * FROM orders WHERE order_date >= '2023-11-01' and order_date < '2023-12-01';

# 5]Retrieve the total stock of books available.
select sum(stock) from books;

# 6]Find the details of the most expensive book. 
select * from books where price = (select max(price) from books);

# 7]Show all customers who ordered more than 1 quantity of a book. 
select c.name, o.quantity
from customers c
join orders o
on c.customer_id = o.customer_id
where quantity > 1;

#8]List all distinct genres in the bookstore. 
select  distinct genre from books ;

#9] Find the book with the lowest stock available.
select * from books where stock = (select min(stock) from books);

#10]Calculate the total revenue from all orders.
select sum(total_amount) total_revenue from orders;

#11]Retrieve the total number of books sold for each genre. 
select b.genre, sum(o.quantity) as total_number_of_books
from books b
join orders o
on b.book_id = o.order_id
GROUP BY b.genre;

#12] Find the average price of books in the “Fantasy” genre. 
select avg(price) from books where genre = 'Fantasy';

#13] List customers who have placed at least 2 orders. 
select c.name, o.quantity 
from customers c
join orders o 
on c.customer_id = o.customer_id
where o.quantity >= 2;

#14]Find the most frequently ordered book. 
select b.title, sum(o.quantity) total
from books b
join orders o 
on o.book_id = b.book_id
GROUP BY b.title
Order by total desc
limit 1;

#15] Show the top 3 most expensive books of the “Fantasy” genre.
select genre,price from books WHERE genre = 'Fantasy' order by price desc
limit 3;

#16] Retrieve the total quantity of books sold by each author.
select b.author, sum(o.quantity) total
from books b 
join orders o
on b.book_id = o.book_id
GROUP BY b.author;

#17] List the cities of customers who spent over $30.
select c.city, o.total_amount
from customers c
join orders o
on c.customer_id = o.customer_id
WHERE total_amount > 30;

#18] Find the customer who spent the most on orders. 
select c.name, sum(o.total_amount) total
from customers c
join orders o
on c.customer_id = o.customer_id
GROUP BY c.name
order by total desc
limit 1;
