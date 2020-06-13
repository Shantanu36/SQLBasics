--- Creating A Database

Create Database SampleGitHub

--- Creating a table inside above database and creating columns

create table Customer
( CustomerName varchar(20),
   CustomerSurname varchar (20),
   Age int
 )


 ---Inserting values inside a table

 insert into Customer (CustomerName,CustomerSurname,Age)
 VALUES ( 'shantanu','jadhav',30);
 insert into Customer (CustomerName,CustomerSurname,Age)
 VALUES ( 'swapnil','bagul',28);
 insert into Customer (CustomerName,CustomerSurname,Age)
 VALUES ( 'kruz','aher',31);
insert into Customer (CustomerName,CustomerSurname,Age)
 VALUES ( 'Amol','Harde',31);
insert into Customer (CustomerName,CustomerSurname,Age)
 VALUES ( 'pratik','phadtare',25)


 select * from Customer /* Displays complete Customer table */
 
 select CustomerName,Age from Customer /* Displays only perticular columns from the table*/



 --- Using where clause to display perticular rows
 


 select * from customer
 where CustomerName='Amol'

 --- Using AND/OR Operator along with where clause

 select * from customer
 where CustomerName='shantanu'      /* AND OPERATOR */
 and age=30

 select * from customer
 where CustomerName ='swapnil'      /* OR OPERATOR */
 or age ='31'

 ---Using LIKE  OPERATOR
  select * from customer             /*  LIKE OPERATOR */
 where  CustomerSurname like 'a%'    /* selects Customers with surname starting with 'a' */
 
 ---Using Like and '-' operators
 select * from Customer
 where  CustomerSurname like '_a%'       /* selects surnames having 2nd character as 'a' */


 ---Using UPDATE commands for  Updating rows and changing values in columns 

 Update Customer
 set age=31
 where CustomerName = 'shantanu'

 ---Deleting complete data from the table 

 Delete Customer 

 ---Deleting a particular row/rows from the table
 Delete from Customer
 where CustomerName= 'shantanu'

 ---Deleting whole table
  Drop table Customer

  --Altering table/ adding  one or more new columns wo the table

  Alter table Customer
  add City varchar (20)

  select * from Customer

  UPDATE customer SET City = 'Mumbai' where CustomerName='shantanu'

  /* places city as 'Mumbai' in the all the null values inside city column */

  UPDATE customer SET City = 'nashik' where CustomerName='swapnil'
  
  UPDATE customer SET City = 'Mumbai' where CustomerName='kruz'
  
  UPDATE customer SET City = 'nagpur' where CustomerName='amol'
  
  UPDATE customer SET City = 'thane' where CustomerName='pratik'

  select * from Customer

  /*Adding Primary Key to the current table*/


  Alter table customer
  add CustomerID int primary key identity (1,1)


  -- Creating PRODUCT and ORDERS table


 CREATE TABLE PRODUCT
 (
 ProductID int primary key identity (1,1),
 productname varchar (20),
 productprice int
 )

 insert into PRODUCT (productname,productprice)
 values ('bat',30);
  insert into PRODUCT (productname,productprice)
 values ('ball',10);
  insert into PRODUCT (productname,productprice)
 values ('stumps',3300);
  insert into PRODUCT (productname,productprice)
 values ('gloves',80);
  insert into PRODUCT (productname,productprice)
 values ('shoes',400)
                                 
								 
select * from PRODUCT



create table orders 
( 
OrderID int primary key identity (1,1),
OrderDate datetime,
C_ID int,
P_ID int
)


select * from orders
select * from PRODUCT
select * from customer


---creating relationship between all 3 tables above i.e. Creating Foreign Key
  
  alter table orders
  add foreign key (C_ID) references customer (CustomerID) 
  /* Creates Foreign key in the orders table with reference to Customer table primary key*/

  alter table orders
  add foreign key (P_ID) references PRODUCT (ProductID)
  /* Creates Foreign key in the orders table with reference to Product table primary key*/

  insert into orders (OrderDate,C_ID,P_ID)
  values (GetDate(),2,3);
  insert into orders (OrderDate,C_ID,P_ID)
  values (GetDate(),1,4);
insert into orders (OrderDate,C_ID,P_ID)
  values (GetDate(),3,2);
  insert into orders (OrderDate,C_ID,P_ID)
  values (GetDate(),5,4);
  insert into orders (OrderDate,C_ID,P_ID)
  values (GetDate(),5,1)





---Creating JOINS between above 3 tables

select * from orders
inner join PRODUCT on orders.P_ID=PRODUCT.ProductID
INNER JOIN customer on orders.C_ID=customer.customerID



-- writing same above code using alias and selecting particular columns


select O.orderDate,C.CustomerName,P.productname,P.productprice
from orders as O inner join PRODUCT as P on O.P_ID=P.ProductID
INNER JOIN customer AS C on O.C_ID=C.customerID




--Trying out above table with few aggregate functions  and group by

select C.CustomerName,sum(P.productprice)as total /* Using aggregate function 'SUM','AVG' */
from orders as O inner join PRODUCT as P on O.P_ID=P.ProductID
INNER JOIN customer AS C on O.C_ID=C.customerID
GROUP BY CustomerName

select P.productname,AVG(P.productprice)as total /* Using aggregate function 'SUM','AVG' */
from orders as O inner join PRODUCT as P on O.P_ID=P.ProductID
INNER JOIN customer AS C on O.C_ID=C.customerID
GROUP BY productname






