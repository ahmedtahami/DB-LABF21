show databases;
use classicmodels;

select employees.firstName, employees.lastName, offices.city
from employees
inner join offices on employees.officeCode = offices.officeCode;

select customers.customerNumber, customers.customerName, payments.amount
from payments
inner join customers on payments.customerNumber = customers.customerNumber
where payments.amount > 25000;

select customers.customerNumber, products.productName, orderdetails.quantityOrdered
from customers
inner join orders on customers.customerNumber = orders.customerNumber
inner join orderdetails on orders.orderNumber = orderdetails.orderNumber
inner join products on orderdetails.productCode = products.productCode
where orderdetails.quantityOrdered > 30;

select customers.customerName
from orders
inner join customers on orders.customerNumber = customers.customerNumber
where orders.status = 'Shipped';

select customers.customerName
from payments
inner join customers on payments.customerNumber = customers.customerNumber
where payments.amount > 80000;

select employees.*
from employees
inner join offices on employees.officeCode = offices.officeCode
where offices.city = 'Sydney';


select customers.customerName, orders.orderDate
from orders
inner join customers on orders.customerNumber = customers.customerNumber
where orders.orderNumber between 10101 and 10110;
