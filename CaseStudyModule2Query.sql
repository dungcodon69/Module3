use c0324h1;
SELECT 
    students.id,
    students.name,
    students.gender,
    students.phone,
    students.dob,
    classes.name,
    students.username
FROM
    students
        INNER JOIN
    classes ON students.id_class = classes.id;

select
	students.id,
	students.name,
	students.gender,
	students.phone,
	students.dob,
	classes.name,
	students.username,
    teachers.name
from students 
inner join classes on students.id_class = classes.id
inner join teachers_teach_classes on classes.id = teachers_teach_classes.id_class
inner join teachers on teachers_teach_classes.id_teacher = teachers.id;

select 
	students.id,
    students.name,
    students.gender,
    students.phone,
    students.dob,
    classes.name,
    students.username
from students left join classes on students.id_class = classes.id;

select * from students where name='Tien' OR name='Toan';

select count(*) as `Number of records`, id_class
from students
group by id_class;

select * from students order by name ASC;

