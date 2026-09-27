# 📚 Library Database System

A relational **Library Database System** designed using **Entity-Relationship Modeling (ERD)** and **Relational Schema Mapping**, and implemented using **Microsoft SQL Server .

The system manages library employees, users, books, authors, publishers, categories, shelves, floors, and book borrowing operations.

---

## 🎯 Project Overview

The goal of this project is to design and implement a database that represents the main activities of a library, while applying relational database concepts such as:

* Entity-Relationship Modeling
* Relational Schema Mapping
* Primary Keys & Foreign Keys
* One-to-One / One-to-Many Relationships
* Many-to-Many Relationships
* Recursive Relationships
* Ternary Relationships
* Data Integrity Constraints
* SQL Server 

---

## 📌 Project Scope

This project focuses on the **database design and SQL implementation** of a Library Management System.

It does not include an application/UI layer. The main objective is to demonstrate database design, relational modeling, SQL Server

---
## 📁 Project Structure

```text
Library-Database-System/
│
├── README.md
│
├── docs/
|   └── Requirements.pdf
│
├── ERD/
│   └── ERD.png
│
├── Schema/
│   └── Schema.png
│
└── sql/
    ├── 01-Database.sql
    ├── 02-Tables.sql
    ├── 03-Constraints.sql
    ├── 04-Data.sql
    └── 05-Queries.sql
```
## 📊 ERD

The Entity-Relationship Diagram represents the entities, attributes, relationships, and cardinalities of the system.

---

## 🏗️ Main Entities

The database contains the following main entities:

* **Employee**
* **Floor**
* **User**
* **Book**
* **Author**
* **Publisher**
* **Category**
* **Shelf**

---
## 🗂️ Relational Schema

The ERD was mapped into a relational database schema using primary keys and foreign keys to maintain relationships and data integrity.

---
## 🔗 Main Relationships

### Employee

* An employee can supervise multiple employees.
* Each employee has a supervisor.
* Employees work on a specific floor.
* Employees can record multiple users.
* An employee can manage a floor.

### Floor

* Each floor is managed by an employee.
* A floor contains multiple employees.
* A floor contains multiple shelves.

### User

* Each user is recorded by an employee.
* An employee can record multiple users.
* Users can borrow books.

### Book

Each book:

* Belongs to one publisher.
* Belongs to one category.
* Is assigned to one shelf.
* Can have multiple authors.
* Can be borrowed by users.

### Author

* An author can be associated with multiple books.
* A book can have multiple authors.

### Publisher

* A publisher can publish multiple books.
* Each book has one publisher.

### Category

* A category can contain multiple books.
* Each book belongs to one category.

### Shelf

* A shelf can contain multiple books.
* Each shelf is located on one floor.

---

## 🛠️ Technologies

* **Draw.io**
* **Microsoft SQL Server**

---

## 👨‍💻 Author

**Mohamed Ahmed**

Information Technology Graduate | ASP.Net Backend Developer

* LinkedIn: [Mohamed Ahmed](https://www.linkedin.com/in/mohamedahmed2608/)

```
```
