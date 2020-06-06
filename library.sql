 --SELECT QUERY

 --List the books where page count bigger than 200
 Select * from books where pageCount > 200;
 --List the books where pageCount is between 100 and 200	
Select * from books
where pageCount between 100 and 200;
-- List the boys from 11a or 11b
Select * from students
where (class = '11A' or class = '11B')
and gender='M';
--List the book which have biggest page count
	
Select top 1 * from books
order by pageCount desc;

Select * from books where pageCount=
(Select max(pageCount) from books);

--List all students class names,but the same class names are listed ones.
Select distinct class
from students;
--List the class names and student count of each class.
Select class,count(*) as StudentCount 
from students 
group by class;
--List the numbers of boys and girls in each class.
Select class,gender,count(*) as StudentCount 
from students 
group by gender,class
--List only the number of female students in each class.
Select class,gender,count(*) as StudentCount 
from students
 where gender = 'F' 
group by gender,class
-- List the class names and number of students which the number of students more than 30.
Select class,count(*) as StudentCount 
from students 
group by class 
having count(*) >= 30
--List all students name, surname, the name of the taken book,the taken date and the book’s type
Select students.name as studentName,students.surname,books.name as BookName,takenDate,types.name as TypeName 
from students 
join borrows on students.studentId = borrows.studentId 
join books on books.bookId = borrows.bookId 
join types on books.typeId = types.typeId
-- List all students name, surname, the name of the taken book, the taken date, the book’s type and the name and surname of the author
Select students.name as studentName,students.surname,books.name as BookName,takenDate,types.name as TypeName, authors.name as AuthorName,authors.surname as AuthorSurname 
from students 
join borrows on students.studentId = borrows.studentId 
join books on books.bookId = borrows.bookId 
join types on books.typeId = types.typeId 
join authors on authors.authorId = books.authorId

-- List the students name, surname, the name of the taken book and the taken time from 11B class
Select students.name as studentName,students.surname,books.name as BookName,takenDate 
from students 
join borrows on students.studentId = borrows.studentId 
join books on books.bookId = borrows.bookId 
where class='11B'
-- List the name and surname of the students and the number of books they read.
Select name,surname,count(*) BookCount 
from students 
join borrows on students.studentId = borrows.studentId 
group by students.studentId,name,surname
--List the name and surname of the students and the number of books they read sorted by BookCount.
Select name,surname,count(*) BookCount 
from students 
join borrows on students.studentId = borrows.studentId 
group by students.studentId,name,surname
order by BookCount
--Lists students who have not read books.
Select students.* from students 
left join borrows on students.studentId = borrows.studentId 
where borrowId is null
-- List the books, that the student named John has read. The same records are listed ones.
Select distinct books.* from books
join borrows on books.bookId = borrows.bookId
join students on borrows.studentId = students.studentId
where students.name = 'John'
--List the author that has the most books.
Select top 1 Authors.name,surname,count(*) as Quantity
from books
join authors on books.authorId = authors.authorId
group by Authors.name,surname,Authors.authorId
order by Quantity desc
--: List all student’s name,surname and the borrow’s taken date.
Select name,surname,takenDate from students 
join borrows on students.studentId = borrows.studentId
-- List all student’s name,surname,book’s name and the borrow’s taken date.(three table)
Select students.name,surname,books.name,takenDate 
from students 
join borrows on students.studentId = borrows.studentId 
join books on books.bookId = borrows.bookId
--List all student’s name,surname and the borrow’s taken date. Students who do not read books are also listed.
Select name,surname,takenDate 
from students 
left join borrows on students.studentId = borrows.studentId
--SQL SUBQUERY	
Select * from books 
where pageCount=(Select max(pageCount) from books);

Select * from students 
where studentId not in 
(Select studentId from borrows);

Select students.name,students.surname,count(borrows.borrowId) from students 
left join borrows on students.studentId = borrows.studentId 
group by students.studentId,students.name,students.surname
order by count(borrows.borrowId);


--SELECT WITH GROUP BY STATMENT
Select class,count(*) as StudentCount 
from students 
group by class;


Select class,gender,count(*) as StudentCount 
from students 
group by gender,class

--SELECT WITH JOIN
Select students.name as studentName,students.surname,books.name as BookName,takenDate,types.name as TypeName 
from students 
join borrows on students.studentId = borrows.studentId 
join books on books.bookId = borrows.bookId 
join types on books.typeId = types.typeId


Select students.name as studentName,students.surname,books.name as BookName,takenDate,types.name as TypeName, authors.name as AuthorName,authors.surname as AuthorSurname 
from students 
join borrows on students.studentId = borrows.studentId 
join books on books.bookId = borrows.bookId 
join types on books.typeId = types.typeId 
join authors on authors.authorId = books.authorId

Select students.name as studentName,students.surname,books.name as BookName,takenDate 
from students 
join borrows on students.studentId = borrows.studentId 
join books on books.bookId = borrows.bookId 
where class='11B'

--INSERT STATMENT
INSERT [dbo].[authors] ([authorId], [name], [surname]) VALUES (1, N'William Dean', N'Howells')
INSERT [dbo].[authors] ([authorId], [name], [surname]) VALUES (2, N'Frederic', N'Brown')
INSERT [dbo].[authors] ([authorId], [name], [surname]) VALUES (3, N'Jack', N'London')
INSERT [dbo].[authors] ([authorId], [name], [surname]) VALUES (4, N'Albert', N'Blaisdell')
INSERT [dbo].[authors] ([authorId], [name], [surname]) VALUES (5, N'Ellis', N'Butler')




