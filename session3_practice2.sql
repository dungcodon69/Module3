select * from student;

select * from student where status=1;

select * from subject where credit < 10;

select *
from student inner join class on student.ClassID = class.ClassID
where student.classid = 1;

select * from mark inner join student on student.StudentID = mark.StudentID
where SubID = 1;