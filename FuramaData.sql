-- CREATE DATABASE FurumaResort;
USE FurumaResort;

CREATE TABLE vitri(
	IDViTri int not null primary key auto_increment,
    TenViTri varchar(45)
);

CREATE TABLE trinhdo(
	IDTrinhDo int not null primary key auto_increment,
    TrinhDo varchar(45)
);

CREATE TABLE bophan(
	IDBoPhan int not null primary key auto_increment,
    TenBoPhan varchar(45)
);

CREATE TABLE loaikhach(
	IDLoaiKhach int not null primary key auto_increment,
    TenLoaiKhach varchar(45)
);

CREATE TABLE kieuthue(
	IDKieuThue int not null primary key auto_increment,
    TenKieuThue varchar(45),
    Gia int
);

CREATE TABLE loaidichvu(
	IDLoaiDichVu int not null primary key auto_increment,
    TenLoaiDichVu varchar(45)
);

CREATE TABLE dichvudikem(
	IDDichVuDiKem int not null primary key auto_increment,
    TenDichVuDiKem varchar(45),
    Gia int,
    DonVi int,
    TrangThaiKhaDung varchar(45)
);

CREATE TABLE nhanvien(
	IDNhanVien int not null primary key auto_increment,
    HoTen varchar(45),
    IDViTri int,
    IDTrinhDo int,
    IDBoPhan int,
    NgaySinh Date,
    SoCMND varchar(45),
    Luong double,
    SDT varchar(45),
    Email varchar(45),
    DiaChi varchar(45),
    foreign key (IDViTri) references vitri(IDViTri),
    foreign key (IDTrinhDo) references trinhdo(IDTrinhDo),
    foreign key (IDBoPhan) references bophan(IDBoPhan)
);

CREATE TABLE khachhang(
	IDKhachHang int not null primary key auto_increment,
    IDLoaiKhach int,
    HoTen varchar(45),
    NgaySinh Date,
    SoCMND varchar(45),
    SDT varchar(45),
    Email varchar(45),
    DiaChi varchar(45),
    foreign key (IDLoaiKhach) references loaikhach(IDLoaiKhach)
);

CREATE TABLE dichvu(
	IDDichVu int not null primary key auto_increment,
    TenDichVu varchar(45),
    DienTich int,
    SoTang int,
    SoNguoiToiDa int,
    ChiPhiThue double,
    IDKieuThue int,
    IDLoaiDichVu int,
    TrangThai int,
    foreign key (IDKieuThue) references kieuthue(IDKieuThue),
    foreign key (IDLoaiDichVu) references loaidichvu(IDLoaiDichVu)
);

CREATE TABLE hopdong(
	IDHopDong int not null primary key auto_increment,
    IDNhanVien int,
    IDKhachHang int,
    IDDichVu int,
    NgayLamHopDong date,
    NgayKetThuc date,
    TienDatCoc double,
    TongTien double,
    foreign key (IDNhanVien) references nhanvien(IDNhanVien),
    foreign key (IDDichVu) references dichvu(IDDichVu),
    foreign key (IDKhachHang) references khachhang(IDKhachHang)
);

CREATE TABLE hopdongchitiet(
	IDHopDongChiTiet int not null primary key auto_increment,
    IDHopDong int,
    IDDichVuDiKem int,
    SoLuong int,
    foreign key (IDHopDong) references hopdong(IDHopDong),
    foreign key (IDDichVuDiKem) references dichvudikem(IDDichVuDiKem)
);


insert into vitri(TenViTri) values ('Lễ Tân'),('Phục Vụ'),('Chuyên Viên'),('Giám Sát'),('Quản Lý'),('Giám Đốc');
insert into trinhdo(TrinhDo) values ('Trung Cấp'),('Cao Đẳng'),('Đại Học'),('Sau Đại Học');
insert into bophan(TenBoPhan) values ('Sale – Marketing'),('Hành Chính'),('Phục vụ'),('Quản lý');
insert into loaikhach(TenLoaiKhach) values ('Diamond'),('Platinium'),('Gold'),('Silver'),('Member');
insert into kieuthue(TenKieuThue,Gia) values ("Theo Năm",1),("Theo Tháng",2),("Theo Ngày",3),("Theo Giờ",4);
insert into loaidichvu(TenLoaiDichVu) values ("Dich vu 1");
insert into dichvudikem(TenDichVuDiKem,Gia,DonVi,TrangThaiKhaDung) values ("Massage",1,1,1),("Karaoke",1,1,1),("Thức ăn",1,1,1),("Nước uống",1,1,1),("Thuê xe",1,1,1);
insert into nhanvien(HoTen,IDViTri,IDTrinhDo,IDBoPhan,NgaySinh,SoCMND,Luong,SDT,Email,DiaChi)
values ("Nguyễn Anh Dũng",1,1,1,'2001-12-09',022201000291,5000000,0705555555,'dungna.qn@gmail.com','Ha Noi'),
("Nguyễn Anh Dũng",1,1,1,'2001-12-09',022201000291,5000000,0705555555,'dungna.qn@gmail.com','Ha Noi'),
("Nguyễn Anh Dũng",1,1,1,'2001-12-09',022201000291,5000000,0705555555,'dungna.qn@gmail.com','Ha Noi'),
("Nguyễn Anh Dũng",1,1,1,'2001-12-09',022201000291,5000000,0705555555,'dungna.qn@gmail.com','Ha Noi');
insert into khachhang(IDLoaiKhach,HoTen,NgaySinh,SoCMND,SDT,Email,DiaChi) values 
(1,"Đoàn Văn Hậu",'1999-3-29','123456789','12413434','hau@gmail.com','Hà Nội'),
(2,"Doãn Chí Bình",'1981-5-27','123456789','12413434','binh@gmail.com','Đà Nẵng'),
(3,"Phạm Thế Hùng",'1994-12-1','123456789','12413434','hung@gmail.com','Quảng Trị'),
(4,"Ngô Đình Nam",'1999-10-17','123456789','12413434','nam@gmail.com','Hà Nam');
insert into hopdong(IDNhanVien,IDKhachHang,IDDichVu,NgayLamHopDong,NgayKetThuc,TienDatCoc,TongTien) values
(1,1,1,'2019-3-1','2019-3-2',1000000,3000000),
(2,2,2,'2019-3-1','2019-3-2',1000000,3000000),
(3,3,3,'2019-3-1','2019-3-2',1000000,3000000);
insert into dichvu(TenDichVu,DienTich,SoTang,SoNguoiToiDa,ChiPhiThue,IDKieuThue,IDLoaiDichVu,TrangThai) values
('Villa',100,2,5,5000000,1,1,1),
('House',50,1,4,4000000,1,1,1),
('Phòng',30,1,3,3000000,1,1,1);
insert hopdongchitiet(IDHopDong,IDDichVuDiKem,SoLuong) values 
(1,1,2),
(2,2,3),
(3,3,4);
