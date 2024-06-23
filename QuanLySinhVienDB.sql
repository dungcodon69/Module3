-- create database QuanLySinhVien

use quanlysinhvien;
create table class (
	ClassID int not null primary key auto_increment,
    ClassName varchar(60) not null,
    StartDate Datetime not null,
    Status Bit
);

create table student(
	StudentID int not null primary key auto_increment,
    StudentName varchar(30) not null,
    Address varchar(50),
    Phone varchar(20),
    Status Bit,
    ClassID int not null,
    foreign key (ClassID) references class(classID)
);

create table subject(
	SubID int not null primary key auto_increment,
    SubName varchar(30) not null,
    Credit tinyint not null default 1,
    Status Bit default 1,
    check (Credit >= 1)
);

create table mark(
	MarkID int not null primary key auto_increment,
    SubID int not null unique,
    StudentID int not null unique,
    Mark float default 0, check(Mark between 0 and 100 ),
    ExamTimes tinyint default 1,
    foreign key (SubID) references subject(SubID),
    foreign key (StudentID) references student(StudentID)
);

