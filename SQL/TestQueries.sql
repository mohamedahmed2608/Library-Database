Use Library
--1.Write a query that displays Full name of an employee who has more than 3 letters in his/her First Name.{1 Point}
Select CONCAT_WS(' ' , E.Fname , E.Lname) [FullName]
from Employee E
Where E.Fname Like '____%'
--2.Write a query to display the total number of Programming books available in the library with alias name �NO OF PROGRAMMING BOOKS� {1 Point}
Select COUNT(B.Id) [NO OF PROGRAMMING]
from Book B join Category C
On B.Cat_id = C.Id
Where C.Cat_name = 'Programming'
--3.Write a query to display the number of books published by (HarperCollins) with the alias name 'NO_OF_BOOKS'. {1 Point}
Select Count(B.Id) [NO_OF_BOOKS]
from Book B Join Publisher P
On B.Publisher_id = P.Id
Where P.Name = 'HarperCollins'
--4. Write a query to display the User SSN and name, date of borrowing and due date of the User whose due date is before July 2022.
Select U.SSN , U.User_Name , B.Borrow_date , B.Due_date 
from Users U Join Borrowing B
On U.SSN = B.User_ssn
Where B.Due_date < '2022-07-1'
--5.Write a query to display book title, author name and display in the following format,[Book Title] is written by [Author Name]. {2 Points}
Select CONCAT_WS (' ' , B.Title  , 'is written by' , A.Name)
from Book B Join Book_Author BA
On B.Id = BA.Book_id
Join Author A
On A.Id = BA.Author_id
--6.Write a query to display the name of users who have letter 'A' in their names. {1 Point}
Select U.User_Name
from Users U
Where U.User_Name like '%A%'
--7.Write a query that display user SSN who makes the most borrowing{2 Points}
Select  B.User_ssn ,ROW_NUMBER() Over(Partition by B.User_ssn Order By B.User_ssn) [Rank] 
from Borrowing B

Select * 
from Borrowing

Select Top 1 User_ssn
from (Select B.User_ssn ,ROW_NUMBER() Over(Partition by B.User_ssn Order By B.User_ssn) [Rank]
		from Borrowing B) [Table] 
Order by Rank Desc
--8.Write a query that displays the total amount of money that each user paid for borrowing books. {2 Points}
Select B.User_ssn , Sum(B.Amount) [Amount]
from Borrowing B
Group By B.User_ssn 
--9.write a query that displays the category which has the book that has the minimum amount of money for borrowing. {2 Points}
Select Top 1 C.Cat_name , B.Title , BO.Amount
from Category C Join Book B
On C.Id = B.Cat_id
Join Borrowing BO
On BO.Book_id = B.Id
Group by C.Cat_name , B.Title , BO.Amount
Order By BO.Amount
--10.write a query that displays the email of an employee if it's not found, display address if it's not found, display date of birthday.{1 Point}
Select IsNull(E.Email , IsNull(E.Address , E.DOB))
from Employee E

Select Coalesce(E.Email , E.Address ,Convert(Varchar(20), E.DOB))
From Employee E
--11.Write a query to list the category and number of books in each category with the alias name 'Count Of Books'. {1 Point}
Select C.Cat_name  , COUNT(B.Id)
from Book B Join Category C
On B.Cat_id = C.Id
Group by C.Cat_name
--12.Write a query that display books id which is not found in floor num = 1 and shelf-code = A1.{2 Points}
Select B.Id
from Book B Join Shelf S
On B.Shelf_code = S.Code
JOin Floor F
On F.Number = S.Floor_num
Where F.Number <> 1 and S.Code <> 'A1'
--13.Write a query that displays the floor number , Number of Blocks and number of employees working on that floor.{2 Points}
Select F.Number , F.Num_blocks , COUNT(E.Id) [Number of Employees]
from Employee E Join Floor F
On E.Floor_no = F.Number
Group by F.Number , F.Num_blocks
--14.Display Book Title and User Name to designate Borrowing that occurred within the period �3/1/2022� and �10/1/2022�.{2 Points}
Select B.Title , U.User_Name
from Book B Join Borrowing BO
On B.Id = BO.Book_id
jOIN Users U
On U.SSN = BO.User_ssn
Where BO.Borrow_date Between '3/1/2022' and '10/1/2022'
--15.Display Employee Full Name and Name Of his/her Supervisor as Supervisor Name.{2 Points}
Select	CONCAT_WS(' ' , E.Fname , E.Lname) , S.Fname [Supervisor Name]
from Employee E Join Employee S
On S.Id = E.Super_id
--16.Select Employee name and his/her salary but if there is no salary display Employee bonus. {2 Points}
Select E.Fname , IsNull(E.Salary , E.Bouns) [Employee Salary/Employee bonus]
from Employee E
--17.Display max and min salary for Employees {2 Points}
Select MAX(E.Salary) [Max Salary], MIN(E.Salary) [Min Salary]
from Employee E
--18.Write a function that take Number and display if it is even or odd {2 Points}
Go
Create or Alter Function GetEvenOdd (@Num int)
Returns Varchar(4)
With Encryption 
As
Begin
Declare @Status varchar(4)
If @Num % 2 != 0
Set @Status = 'Odd'
Else
Set @Status = 'Even'
Return @Status
End
Go
Select dbo.GetEvenOdd(4)
--19.write a function that take category name and display Title of books in that category {2 Points}
Go
Create or Alter Function GetBookNameByCategory (@Category varchar(50))
Returns Table
With Encryption
Return 
(
Select B.Title
from Book B Join Category C
On B.Cat_id = C.Id
Where C.Cat_name = @Category
)
Go

Select *  
from GetBookNameByCategory('programming')
--20. write a function that takes the phone of the user and displays Book Title , user-name, amount of money and due-date. {2 Points}
Go
Create or Alter Function GetBorrowByPhone (@Phone Varchar(11))
Returns Table
With Encryption
Return 
(
Select BO.Title , U.User_Name , B.Amount , B.Due_date
from User_phones UP Join Users U
On U.SSN = UP.User_ssn
Join Borrowing B
On B.User_ssn = U.SSN
Join Book BO
On BO.Id = B.Book_id
Where UP.Phone_num = @Phone
)
Go

Select *
from GetBorrowByPhone('0123654122')
--21.Write a function that take user name and check if it's duplicated return Message in the following format 
--([User Name] is Repeated [Count] times) if it's not duplicated display msg with this format [user name] 
--is not duplicated,if it's not Found Return [User Name] is Not Found {2 Points}
Go
Create Or Alter Function CheckUserName(@UserName Varchar(50))
Returns Varchar(100)
As
Begin
    Declare @Count Int
    Declare @Message Varchar(100)

    Select @Count = Count(*)
    From Users
    Where User_Name = @UserName

    If @Count = 0
        Set @Message = @UserName + ' is Not Found'
    Else If @Count = 1
        Set @Message = @UserName + ' is not duplicated'
    Else
        Set @Message = '(' + @UserName + ' is Repeated ' 
                     + Cast(@Count As Varchar(10)) + ' times)'

    Return @Message
End
Go

Select dbo.CheckUserName('Ahmed')

--22.Create a scalar function that takes date and Format to return Date With That Format. {2 Points}
Go
Create or Alter Function FormatDate (@Date Date , @Format Varchar(10))
Returns varchar(10)
With Encryption
As
Begin
Declare @Resulte varchar(10)
Set @Resulte = Format(@Date , @Format)
Return @Resulte
End
Go

Select dbo.FormatDate(GETDATE() , 'hh')
--23.Create a stored procedure to show the number of books per Category.{2 Points}
Go
Create or Alter Proc SP_GetBooksPerCategory @CategoryName Varchar(20) 
With Encryption
As
Begin
Select C.Cat_name  ,COUNT(B.Id) [NumberOfBooks]
from Book B Join Category C
On B.Cat_id = C.Id
Where @CategoryName = C.Cat_name
Group By C.Cat_name
End
Go

Exec SP_GetBooksPerCategory 'Mathematics'
--24.Create a stored procedure that will be used in case there is an old manager who has left the floor
--and a new one becomes his replacement. The procedure should take 3 parameters 
--(old Emp.id, new Emp.id and the floor number) and it will be used to update the floor table. {3 Points}
Go
Create or Alter Proc SP_UpdateFloorManager @OldEmpID int , @NewEmpID int , @FloorNumber int
With Encryption
As
Begin
Update Floor 
Set MG_ID = @NewEmpID
WHere MG_ID = @OldEmpID and Number = @FloorNumber
End
Go

Exec SP_UpdateFloorManager 21,1024,8
--25.Create a view AlexAndCairoEmp that displays Employee data for users who live in Alex or Cairo. {2 Points}
Go
Create or ALter View V_AlexAndCairoEmp
With Encryption 
As
Select E.*
from Employee E
Where E.Address in ('Alex' , 'Cairo') with check option
Go

Select *
from V_AlexAndCairoEmp

--26.create a view "V2" That displays number of books per shelf {2 Points}
Go
Create or ALter View V2
With Encryption
As
Select S.Code , COUNT(B.Id) [NumberOfBooks]
from Book B Join Shelf S
On B.Shelf_code = S.Code
Group By S.Code
Go

Select *
from V2
--27.create a view "V3" That display the shelf code that have maximum number of books using the previous view "V2" {2 Points}
Go
Create or Alter View V3
With Encryption
As
Select Max(NumberOfBooks) [MaxNumberOfBooks]
from V2
Go

Select *
from V3

--28.Create a table named �ReturnedBooks� With the Following Structure :  
Create Table ReturnedBook
(
UserSSN int,
BookID int ,
DueDate Date,
Fees int,
ReturnDate Date
)
--then create A trigger that instead of inserting the data of returned book checks 
--if the return date is the due date or not if not so the user must pay a fee and 
--it will be 20% of the amount that was paid before. {3 Points}
Go
Create or Alter Trigger insteadofinsertingreturnedbook
On ReturnedBooks
With Encryption
Instead of Insert
As
	declare @amount int
	declare @user_id int
	declare @book_id int
	declare @returned_date date
	declare @due_date date

	select @user_id=i.UserSSN,@book_id=BookID , @returned_date = ReturnDate , @due_date = DueDate
	from inserted i

	select @amount = Amount
	from Borrowing
	where User_ssn=@user_id and Book_id = @book_id

	if(@returned_date != @due_date)
	begin
		update ReturnedBooks
		set fees = @amount * 0.20
		where UserSSN = @user_id and BookID = @book_id
	end
--29.In the Floor table insert new Floor With Number of blocks 2 , employee with SSN = 20 as a manager
--for this Floor,The start date for this manager is Now. 
--Do what is required if you know that :
--Mr.Omar Amr(SSN=5) moved to be the manager of the new Floor (id = 7), 
--and they give Mr. Ali Mohamed(his SSN =12) His position . {3 Points}
Insert into Floor 
Values (7 , 2 , 20 , GETDATE())

update Floor
set MG_ID = 5
where Number = 7
update Floor
set MG_ID = 12
where Number = 2
--30.Create view name (v_2006_check) that will display Manager id, Floor Number where he/she works 
--, Number of Blocks and the Hiring Date which must be from the first of March and the end of 
--May 2022.this view will be used to insert data so make sure that the coming new data must 
--match the condition then try to insert this 2 rows and Mention What will happen {3 Point}
Go
Create or Alter View v_2006_check
With Encryption , SchemaBinding
As
Select F.MG_ID , F.Number , F.Num_blocks , F.Hiring_Date
from dbo.Floor F
Where F.Hiring_Date Between '2022-03-1' and '2022-05-31' with check option
Go

insert into v_2006_check
values(2,6,2,7-8-2023),(4,7,1,4-8-2022)

--Operand type clash: int is incompatible with date

--31.Create a trigger to prevent anyone from Modifying or Delete or Insert in the Employee table 
--( Display a message for user to tell him that he can't take any action with this Table) {3 Point}
-- Trigger to prevent INSERT, UPDATE, DELETE actions on the Employee table
Go
Create or ALter Trigger PreventEmployeeActions
On Employee
With Encryption
Instead of Insert , Update , Delete
As
Begin
Print 'can''t take any action with this Table'
End
Go
--32.Testing Referential Integrity , Mention What Will Happen When:
--A.Add a new User Phone Number with User_SSN = 50 in User_Phones Table {1 Point}
Insert into User_phones
Values (50 , '01147431639')
--The INSERT statement conflicted with the FOREIGN KEY constraint "FK_User_phones_User". The conflict occurred in database "Library", table "dbo.Users", column 'SSN'.
Insert into User_phones
Values (50 )
--Column name or number of supplied values does not match table definition.
--B.Modify the employee id 20 in the employee table to 21 {1 Point}
Update Employee
Set Id = 21
Where Id = 20
--Cannot update identity column 'Id'.
--C.Delete the employee with id 1 {1 Point}
Delete Employee
Where Id = 1
--The DELETE statement conflicted with the REFERENCE constraint "FK_Borrowing_Employee". The conflict occurred in database "Library", table "dbo.Borrowing", column 'Emp_id'.
--D.Delete the employee with id 12 {1 Point}
Delete Employee
Where Id = 12
--The DELETE statement conflicted with the REFERENCE constraint "FK_User_Employee". The conflict occurred in database "Library", table "dbo.Users", column 'Emp_id'.
--E.Create an index on column (Salary) that allows you to cluster the data in table Employee. {1 Point}
Go
Create  Clustered Index IX_Salary
On Employee (Salary)
Go
--Cannot create more than one clustered index on table 'Employee'. Drop the existing clustered index 'PK_Employee' before creating another.
--33.Try to Create Login With Your Name And give yourself access Only to Employee and Floor tables 
--then allow this login to select and insert data into tables and deny Delete and update 
--(Don't Forget To take screenshot to every step) {5 Points}
Go
Create Login MohamedLogin
With Password = 'Mohamed500600'

Create User MohamedUser
For Login MohamedLogin

Grant Insert
On Employee
To MohamedUser


Grant Select
On Employee
To MohamedUser


Deny Delete
On Employee
To MohamedUser

Deny Update
On Employee
To MohamedUser