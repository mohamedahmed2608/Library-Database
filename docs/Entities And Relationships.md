# 📍This is the file containing the Entities and Relationships extracted from the Requirements Document (RD).

 1. **Employees:**

|    Attributs    | DataType |     Constrains      | Constrains |
| :-------------: | :------: | :-----------------: | :--------: |
|     Emp_ID      |   int    |     Primary Key     |  Identity  |
|      Fname      | Varchar  |      Not Null       |     -      |
|      LName      | Varchar  |          -          |     -      |
|      Email      | varchar  |       Unique        |     -      |
|     Salary      |   int    | CHECK (Salary >= 0) |     -      |
|   DateOfBirth   |   Date   |      Not Null       |     -      |
|     Bounse      |   int    |      Default 0      |     -      |
|     Address     | Varchar  |          -          |     -      |
|   PhoneNumber   | varchar  |       Unique        |     -      |

	Relationshiops:

| Relashionship |         Between<br>         |        Description        |  Degree   | Cardinality                    | Participation                         |
| :-----------: | :-------------------------: | :-----------------------: | :-------: | :----------------------------- | :------------------------------------ |
|   Supervise   | Employee And Emp_Supervisor | Employee has a supervisor | Recursive | Supervisor One   Employee Many | Supervisor partial Employee Mandatory |

2. **Floors**:

|   Attributs    | Datatype | Constrains  | Constrains |
| :------------: | :------: | :---------: | :--------: |
|  Floor_Number  |   int    | Primary Key |     -      |
| NumberOfBlocks |   int    |      -      |     -      |
	Relationshiops:

| Relashionship |       Between        |                                          Description                                          |  Attributs  | Datatype | Degree | Cardinality                 | Participation                       |
| :-----------: | :------------------: | :-------------------------------------------------------------------------------------------: | :---------: | :------: | :----: | :-------------------------- | :---------------------------------- |
|    Manage     | Floor  and Employees | There is always one employee assigned to manage that Floor and each manager has a hiring Date | Hiring-Date |   Date   | Binary | Employee One   Floor    One | Employee  Partial   Floor Mandatory |
|   Works_On    | Floor And Employees  |                 Floor has many employees and employees work on Only One floor                 |      -      |    -     | Binary | Employee Many Floor   One   | Employee Mandatory  Floor   Partial |
3. Users:

| Attributs | Datatype | Constrains  |
| :-------: | :------: | :---------: |
|    SSN    |   int    | Primary Key |
|   Name    | Varchar  |  Not Null   |
|   Email   | Varchar  |   Unique    |
|  Phones   | Varchar  |   Unique    |
	Relationshiops:

| Relashionship |      Between      |                                             Description                                              | Degree | Cardinality                         | Participation                                |
| :-----------: | :---------------: | :--------------------------------------------------------------------------------------------------: | :----: | :---------------------------------- | :------------------------------------------- |
|    Record     | Employee And User | The data of the user will be Recorded by one employee And the Employee Can record More than one User | Binary | Employee One        User       Many | Employee Partial        User       Mandatory |

4. Books:

| Attributs | Datatype | Constrains  | Constrains |
| :-------: | :------: | :---------: | :--------: |
|  Book_ID  |   Int    | Primary Key |  Identity  |
|   Title   | Varchar  |   Unique    |     -      |
	Relationshiops:

| Relashionship |          Between           |                                      Description                                      |           Attributs            | Datatype                 | Degree  | Cardinality                               |  Participation  |
| :-----------: | :------------------------: | :-----------------------------------------------------------------------------------: | :----------------------------: | :----------------------- | :-----: | :---------------------------------------- | :-------------: |
|    Borrow     | Employee And User And Book | The Employee has to record all required data each time the User Borrow a certain book | Date_Borrowed Due_Date   Amout | Date      Date       int | Ternary | Employee Many  User    Many   Books  Many | Partial for All |

5. Author:

|  Attributs  | Datatype | Constrains  |
| :---------: | :------: | :---------: |
|  Author_ID  |   int    | Primary Key |
| Auther_Name | Varchar  |   NotNull   |

	Relationshiops:

| Relashionship |     Between     |                                   Description                                   | Degree | Cardinality                    | Participation                          |
| :-----------: | :-------------: | :-----------------------------------------------------------------------------: | :----: | :----------------------------- | :------------------------------------- |
|      Own      | Book And Author | Each Book May have one or more authors , Each author May own one or more books. | Binary | Books    Many   Author    Many | Books   Mandatory  Author      Partial |


6. Publishers:

|   Attributs    | Datatype | Constrains  |
| :------------: | :------: | :---------: |
|  Publisher_ID  |   int    | Primary Key |
| Publisher_Name | Varchar  |   NotNull   |
	Relationshiops:

| Relashionship |      Between       |                               Description                               | Degree | Cardinality                       | Participation                             |
| :-----------: | :----------------: | :---------------------------------------------------------------------: | ------ | --------------------------------- | ----------------------------------------- |
|    Publish    | Book And Publisher | Each Book Has one Publisher , and each Publisher May publish many Books | Binary | Books     Many   Publisher    One | Books   Mandatory  Publisher      Partial |
7. Category:

|  Attributs  | Datatype | Constrains  |
| :---------: | :------: | :---------: |
| Category_ID |   int    | Primary Key |
|  Cat_Name   | Varchar  |   NotNull   |
	Relationshiops:

| Relashionship |      Between      |                                  Description                                  | Degree | Cardinality                         | Participation                            |
| :-----------: | :---------------: | :---------------------------------------------------------------------------: | ------ | :---------------------------------- | :--------------------------------------- |
|  Classified   | Book And Category | Each book is Classified under one Category. Each category may have many books | Binary | Books      Many   Category      One | Books   Mandatory  Category      Partial |

8. Shelfs:

| Attributs | Datatype | Constrains  |
| :-------: | :------: | :---------: |
|   Code    |   int    | Primary Key |
	Relationshiops:

| Relashionship |     Between     |                                      Description                                       | Degree | Cardinality                               | Participation                                |
| :-----------: | :-------------: | :------------------------------------------------------------------------------------: | ------ | :---------------------------------------- | :------------------------------------------- |
|   Assigned    | Book And Shelf  | Each book is assigned to a certain Shelf , and the shelf may contain one or more books | Binary | Books     Many      Shelf         One     | Books   Mandatory  Shelf         Partial     |
|    Located    | Shelf And Floor |    Each Shelf is located on a specific floor , and the floor contains many shelfs.     | Binary | Shelf      Many          Floor        One | Shelf      Mandatory   Floor         Partial |
