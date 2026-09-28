Create Database LibraryNew

Use LibraryNew

Create Table Employees
(
ID int Primary Key Identity,
Fname varchar(20) Not Null,
Lname varchar(20),
Email varchar(50) Unique,
Salary int check(Salary >= 0),
DateOfBirth Date Not Null check(DateOfBirth < GetDate()),
Bounse int Default 0,
[Address] varchar(50) Not Null,
Floor_Number int,
Super_ID int References Employees(ID)
)


Create Table Floors
(
ID int Primary Key Identity,
NumberOfBlocks int,
Manager_ID int References Employees(ID),
Hiring_Date Date,
)

Alter Table Employees
Add Foreign Key (Floor_Number) References Floors(ID)


Create Table Users
(
SSN int Primary key,
[Name] varchar(20) Not Null,
Email varchar(50) Unique,
Emp_ID int References Employees(ID)
)

Create Table User_Phone
(
SSN int,
Phone varchar(11)
Primary Key (SSN , Phone)
Foreign Key (SSN) References Users(SSN)
)

Create Table Books
(
ID int Primary Key Identity,
Title varchar(20) Unique Not Null,
Shelf_Code int,
Publisher_ID int ,
Category_ID int
)


Create Table Borrow
(
Emp_ID int References Employees(ID), 
Book_ID int References Books(ID),
User_SSN int References Users(SSN),
Date_Borrowed Date,
Amount int,
Due_Date Date,
Primary Key(Emp_ID , Book_ID , User_SSN)
)

Create Table Authers
(
ID int Primary Key,
[Name] varchar(20) Not Null
)

Create Table Book_Auther
(
Book_ID int References Books(ID),
Auther_ID int References Authers(ID),
Primary Key (Book_ID , Auther_ID)
)

Create Table Publishers
(
ID int Primary Key,
[Name] varchar(20) Not Null
)

Alter Table Books
Add Foreign Key (Publisher_ID) References Publishers(ID)


Create Table Category
(
ID int Primary Key,
[Name] varchar(20) Not Null
)

Alter Table Books
Add Foreign Key (Category_ID) References Category(ID)

Create Table Shelf
(
Code int Primary Key,
Floor_Number int References Floors(ID)
)

Alter Table Books
Add Foreign Key (Shelf_Code) References Shelf(Code)