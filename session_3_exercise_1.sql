use quanlysinhvien;

select * from student where StudentName like 'h%';

select * from class where month(startDate) = 12;

select * from subject where Credit between 3 and 5;

SET SQL_SAFE_UPDATES = 0;
update student set student.ClassID = 2 where StudentName = 'Hung';
SET SQL_SAFE_UPDATES = 1;

select student.StudentName, subject.SubName, mark.Mark 
from student 
join mark on student.StudentID = mark.StudentID
join subject on mark.SubID = subject.SubID