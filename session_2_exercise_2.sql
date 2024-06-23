-- CREATE DATABASE quanlybanhang;

CREATE TABLE Customer(
	cID int not null primary key auto_increment,
    cName varchar(255),
    cAge varchar(255)
);

use quanlybanhang;
CREATE TABLE Orders(
	oID int not null primary key auto_increment,
    cID int,
    oDate Date,
    oTotalPrice int,
    foreign key (cID) references Customer(cID)
);

CREATE TABLE Product (
	pID int not null primary key auto_increment,
    pName varchar(255),
    pPrice int
);

CREATE TABLE OrderDetail(
	oID int,
    pID int,
    odQty int,
    primary key (oID,pID),
    foreign key (oID) references Orders(oID),
    foreign key (pID) references Product(pID)
);

insert into customer values (1,'Minh Quan',10);
insert into customer values (2,'Ngoc Oanh',20);
insert into customer values (3,'Hong Ha',50);

insert into orders values (1,1,'2006/3/21',null);
insert into orders values (2,2,'2006/3/23',null);
insert into orders values (3,1,'2006/3/16',null);

insert into product values (1,'May Giat',3);
insert into product values (2,'Tu Lanh',5);
insert into product values (3,'Dieu Hoa',7);
insert into product values (4,'Quat',1);
insert into product values (5,'Bep Dien',2);

insert into orderdetail values (1,1,3);
insert into orderdetail values (1,3,7);
insert into orderdetail values (1,4,2);
insert into orderdetail values (2,1,1);
insert into orderdetail values (3,1,8);
insert into orderdetail values (2,5,4);
insert into orderdetail values (2,3,3);



