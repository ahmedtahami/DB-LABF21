show databases;
use classicmodels;

select e.firstName, e.lastName from employees as e, offices as o
where exists
(select officeCode from offices where e.officeCode = offices.officeCode and o.country = 'USA');

select * from customers
where customers.customerNumber in 
(select payments.customerNumber from payments where amount > 1000 and amount < 5000);

select customerName, phone from customers
where customers.customerNumber in 
(select orders.customerNumber from orders where year(orderDate) = 2003 and year(shippedDate) = 2003);	

select * from customers
where not exists
(select customerNumber from orders where customers.customerNumber = orders.customerNumber);

select c.customername from customers c where c.customernumber in
(select o.customernumber from orders o where o.status = 'cancelled' and o.ordernumber in
(select od.ordernumber from orderdetails od where od.priceeach>50));

select ordernumber, amount from orders o 
join payments p on o.customerNumber = p.customerNumber
where p.amount > 60000;

SELECT 
    orderNumber, 
    SUM(priceEach * quantityOrdered) total
FROM
    orderdetails
        INNER JOIN
    orders USING (orderNumber)
GROUP BY orderNumber
HAVING SUM(priceEach * quantityOrdered) > 60000;

select * from customers where exists
(select o.customerNumber from orders o join payments p on o.customerNumber = p.customerNumber where p.amount > 60000);


