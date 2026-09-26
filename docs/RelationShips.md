1. Employees:

| Relashionship |         Between<br>         |        Description        |
| :-----------: | :-------------------------: | :-----------------------: |
|   SuperVise   | Employee And Emp_Supervisor | Employee has a supervisor |




2. Floors:

| Relashionship |       Between        |                                          Description                                          |  Attributs  | Datatype |
| :-----------: | :------------------: | :-------------------------------------------------------------------------------------------: | :---------: | :------: |
|    Manage     | Floor  and Employees | There is always one employee assigned to manage that Floor and each manager has a hiring Date | Hiring-Date |   Date   |
|   Works_On    | Floor And Employees  |                 Floor has many employees and employees work on Only One floor                 |      -      |    -     |

3. Users:

| Relashionship |      Between      |                                             Description                                              |
| :-----------: | :---------------: | :--------------------------------------------------------------------------------------------------: |
|    Record     | Employee And User | The data of the user will be Recorded by one employee And the Employee Can record More than one User |

4. Books:

| Relashionship |          Between           |                                      Description                                      |               Attributs               |       Datatype       |
| :-----------: | :------------------------: | :-----------------------------------------------------------------------------------: | :-----------------------------------: | :------------------: |
|    Borrow     | Employee And User And Book | The Employee has to record all required data each time the User Borrow a certain book | Date_Borrowed Due_Date   AmoutOfMoney | Date  Date       int |

5. Author:

| Relashionship |     Between     |                                   Description                                   |
| :-----------: | :-------------: | :-----------------------------------------------------------------------------: |
|      Own      | Book And Author | Each Book May have one or more authors , Each author May own one or more books. |

6. Publisher:


| Relashionship |      Between       |                               Description                               |
| :-----------: | :----------------: | :---------------------------------------------------------------------: |
|    Publish    | Book And Publisher | Each Book Has one Publisher , and each Publisher May publish many Books |
7. Category:

| Relashionship |      Between      |                                  Description                                  |
| :-----------: | :---------------: | :---------------------------------------------------------------------------: |
|  Classified   | Book And Category | Each book is Classified under one Category. Each category may have many books |

8. Shelfs:

| Relashionship |     Between     |                                      Description                                       |
| :-----------: | :-------------: | :------------------------------------------------------------------------------------: |
|   Assigned    | Book And Shelf  | Each book is assigned to a certain Shelf , and the shelf may contain one or more books |
|    Located    | Shelf And Floor |    Each Shelf is located on a specific floor , and the floor contains many shelfs.     |

