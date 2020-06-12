# SQLBasics
--- Creating A Database---

Create Database SampleGitHub

--- Creating a table inside above database and creating columns--

create table Customer
( CustomerName varchar(20),
   CustomerSurname varchar (20),
   Age int
 )


 ---Inserting values inside a table--

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



