-- create database quanlydiemthi

use quanlydiemthi;
create table hocsinh(
	MaHS varchar(20) primary key,
    TenHS varchar(50),
    NgaySinh Datetime,
    Lop varchar(20),
    GT varchar(20)
);

create table giaovien(
	MaGV varchar(20) primary key,
    TenGV varchar(50),
    SDT varchar(10)
);

create table monhoc(
	MaMH varchar(20) primary key,
    TenMH varchar(50),
    MaGV varchar(20),
    foreign key (MaGV) references giaovien(MaGV)
);

create table bangdiem(
	MaHS varchar(20),
    MaMH varchar(50),
    DiemThi int,
    NgayKT DateTime,
    primary key (MaHS,MaMH),
    foreign key (MaHS) references hocsinh(MaHS),
    foreign key (MaMH) references monhoc(MaMH)
);


