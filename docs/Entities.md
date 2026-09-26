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
| Emo_Supervissor |   int    |          -          |     -      |

2. **Floors**:

|   Attributs    | Datatype | Constrains  | Constrains |
| :------------: | :------: | :---------: | :--------: |
|  Floor_Number  |   int    | Primary Key |     -      |
| NumberOfBlocks |   int    |      -      |     -      |

3. Users:

| Attributs | Datatype | Constrains  |
| :-------: | :------: | :---------: |
|    SSN    |   int    | Primary Key |
|   Name    | Varchar  |  Not Null   |
|   Email   | Varchar  |   Unique    |
|  Phones   | Varchar  |   Unique    |

4. Books:

| Attributs | Datatype | Constrains  | Constrains |
| :-------: | :------: | :---------: | :--------: |
|    ID     |   Int    | Primary Key |  Identity  |
|   Title   | Varchar  |   Unique    |     -      |

5. Author:

|  Attributs  | Datatype | Constrains  |
| :---------: | :------: | :---------: |
|     ID      |   int    | Primary Key |
| Auther_Name | Varchar  |   NotNull   |



6. Publishers:

|   Attributs    | Datatype | Constrains  |
| :------------: | :------: | :---------: |
|       ID       |   int    | Primary Key |
| Publisher_Name | Varchar  |   NotNull   |

7. Category:

| Attributs | Datatype | Constrains  |
| :-------: | :------: | :---------: |
|    ID     |   int    | Primary Key |
| Cat_Name  | Varchar  |   NotNull   |

8. Shelfs:

| Attributs | Datatype | Constrains  |
| :-------: | :------: | :---------: |
|   Code    |   int    | Primary Key |
