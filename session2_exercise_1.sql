-- CREATE DATABASE quanlyvattu;
use quanlyvattu;

CREATE TABLE vattu(maVT int not null primary key, tenVT varchar(200));

CREATE TABLE nhacc(maNCC int not null primary key, tenNCC varchar(200), diachi varchar(200), phone varchar(200));

CREATE TABLE dondh(soDH int primary key not null, ngayDH Datetime, maNCC int, foreign key (maNCC) references nhacc(maNCC));

CREATE TABLE phieunhap(soPN int not null primary key, ngaynhap Datetime);

CREATE TABLE phieuxuat(soPX int not null primary key, ngayXuat Datetime);

CREATE TABLE dondh_vattu(soDH int, maVT int, primary key(soDH,maVT), foreign key(soDH) references dondh(soDH),foreign key(maVT) references vattu(maVT));

CREATE TABLE phieunhap_vattu(maVT int, soPN int, dgNhap int, slNhap int, primary key(maVT,soPN), foreign key(maVT) references vattu(maVT), foreign key(soPN) references phieunhap(soPN));

CREATE TABLE phieuxuat_vattu(maVT int, soPX int, dgXuat int, slXuat int, primary key (maVT,soPX), foreign key(maVT) references vattu(maVT), foreign key(soPX) references phieuxuat(soPX));

