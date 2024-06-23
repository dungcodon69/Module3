-- 2 -- 
use furumaresort;
SELECT * from nhanvien where HoTen LIKE 'h%' OR Hoten LIKE 't%' OR Hoten LIKE 'k%';

-- 3 --
SELECT IDKhachHang,HoTen,NgaySinh,DiaChi,(year(CURRENT_TIMESTAMP) - year(NgaySinh)) as Tuoi 
from khachhang where (year(CURRENT_TIMESTAMP) - year(NgaySinh)) between 18 and 50 and DiaChi in ('Đà Nẵng','Quảng Trị');

-- 4 --
select k.IDKhachHang, HoTen, TenLoaiKhach, count(h.IDKhachHang) as SoHopDong from khachhang k 
inner join loaikhach l on k.IDLoaiKhach = l.IDLoaiKhach
inner join hopdong h on h.IDKhachHang = k.IDKhachHang
group by h.IDKhachHang
having TenLoaiKhach = 'Diamond';

-- 5 --
select k.IDKhachHang, HoTen, TenLoaiKhach, h.IDHopDong, TenDichVu, NgayLamHopDong, NgayKetThuc, ChiPhiThue + (SoLuong * dvdk.Gia) as TongTien
from khachhang k
inner join loaikhach l on k.IDLoaiKhach = l.IDLoaiKhach
left join hopdong h on k.IDKhachHang = h.IDKhachHang
left join dichvu d on h.IDDichVu = d.IDDichVu
left join hopdongchitiet ct on h.IDHopDong = ct.IDHopDong
left join dichvudikem dvdk on ct.IDDichVuDiKem = dvdk.IDDichVuDiKem;

-- 6 --
select dv.IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu from dichvu dv
inner join loaidichvu ldv on dv.IDLoaiDichVu = ldv.IDLoaiDichVu 
where dv.IDDichVu not in (SELECT IDDichVu from hopdong where year(NgayLamHopDong) = 2019 AND month(NgayLamHopDong) in (1,2,3));

-- 7 --
select IDDichVu, TenDichVu, DienTich, SoNguoiToiDa,ChiPhiThue,TenLoaiDichVu from dichvu dv
inner join loaidichvu ldv on dv.IDLoaiDichVu = ldv.IDLoaiDichVu
where dv.IDDichVu in (SELECT IDDichVu from hopdong where year(NgayLamHopDong) = 2018) and  
dv.IDDichVu not in (SELECT IDDichVu from hopdong where year(NgayLamHopDong) = 2019);

-- 8 --
-- Cach 1 --
select distinct HoTen from khachhang;
-- Cach 2 -- 
select HoTen from khachhang group by HoTen;
-- Cach 3 --
select HoTen from khachhang union select HoTen from khachhang;

-- 9 -- 
select month(NgayLamHopDong) as month,count(IDHopDong) as KhachDatPhong from hopdong
where year(NgayLamHopDong) = 2019
group by month;

-- 10 --
select hopdong.IDHopDong, NgayLamHopDong, NgayKetThuc, TienDatCoc, count(IDHopDongChiTiet) as SoLuongDichVuDiKem
from hopdong inner join hopdongchitiet on hopdong.IDHopDong = hopdongchitiet.IDHopDong
group by hopdong.IDHopDong;

-- 11 --
select dvdk.IDDichVuDiKem, TenDichVuDiKem from dichvudikem dvdk
inner join hopdongchitiet hdct on hdct.IDDichVuDiKem = dvdk.IDDichVuDiKem
inner join hopdong hd on hdct.IDHopDong = hd.IDHopDong
inner join khachhang kh on hd.IDKhachHang = kh.IDKhachHang
inner join loaikhach lk on kh.IDLoaiKhach = lk.IDLoaiKhach
where lk.TenLoaiKhach = 'Diamond' AND kh.DiaChi in ('Vinh','Quảng Ngãi');

-- 12 --
select hd.IDHopDong, nv.HoTen, kh.HoTen, kh.SDT, dv.TenDichVu, count(IDHopDongChiTiet) as SoLuongDichVuDiKem, TienDatCoc
from hopdong hd inner join khachhang kh on kh.IDKhachHang = hd.IDKhachHang
inner join dichvu dv on dv.IDDichVu = hd.IDDichVu
inner join hopdongchitiet hdct on hd.IDHopDong = hdct.IDHopDong
inner join nhanvien nv on hd.IDNhanVien = nv.IDNhanVien
where (year(NgayLamHopDong) = 2019 and month(NgayLamHopDong) in (10,11,12)) and (year(NgayLamHopDong) = 2019 and month(NgayLamHopDong) not in (1,2,3,4,5,6))
group by hd.IDHopDong;

-- 13 --
select dvdk.TenDichVuDiKem, count(hdct.IDDichVuDiKem) as TongSo from dichvudikem dvdk inner join hopdongchitiet hdct on dvdk.IDDichVuDiKem = hdct.IDDichVuDiKem
group by dvdk.IDDichVuDiKem;

-- 14 --
select hd.IDHopDong, dv.TenDichVu, dvdk.TenDichVuDiKem, count(hdct.IDDichVuDiKem) as SoLanSuDung 
from hopdong hd inner join dichvu dv on hd.IDDichVu = dv.IDDichVu
inner join hopdongchitiet hdct on hd.IDHopDong = hdct.IDHopDong
inner join dichvudikem dvdk on hdct.IDDichVuDiKem = dvdk.IDDichVuDiKem
group by hd.IDHopDong, dv.TenDichVu, dvdk.TenDichVuDiKem
having SoLanSuDung = 1;

-- 15 --
select nv.IDNhanVien, HoTen, TrinhDo, TenBoPhan,SDT,DiaChi, count(IDHopDong)as SoHopDong from nhanvien nv
inner join trinhdo td on nv.IDTrinhDo = td.IDTrinhDo
inner join bophan bp on nv.IDBoPhan = bp.IDBoPhan
inner join hopdong hd on nv.IDNhanVien = hd.IDNhanVien
where year(NgayLamHopDong) between 2018 and 2019
group by IDNhanVien 
having SoHopDong < 3;

-- 16 --
delete from nhanvien where IDNhanVien not in (SELECT IDNhanVien from hopdong where year(NgayLamHopDong) between 2017 and 2019);

-- 17 --
UPDATE khachhang
SET IDLoaiKhach = 1
WHERE IDKhachHang IN (
    SELECT kh.IDKhachHang
    FROM khachhang kh
    INNER JOIN hopdong hd ON kh.IDKhachHang = hd.IDKhachHang
    WHERE YEAR(hd.NgayLamHopDong) = 2019
    GROUP BY kh.IDKhachHang
    HAVING SUM(hd.TongTien) > 10000000
) AND IDLoaiKhach = 2;

-- 18 --
DELETE FROM khachhang
WHERE IDKhachHang IN (
    SELECT kh.IDKhachHang
    FROM khachhang kh
    INNER JOIN hopdong hd ON kh.IDKhachHang = hd.IDKhachHang
    WHERE YEAR(hd.NgayLamHopDong) < 2016
);

-- 19 --
UPDATE dichvudikem
SET Gia = Gia * 2
WHERE IDDichVuDiKem IN (
    SELECT hdct.IDDichVuDiKem
    FROM hopdong hd
    INNER JOIN hopdongchitiet hdct ON hd.IDHopDong = hdct.IDHopDong
    WHERE YEAR(hd.NgayLamHopDong) = 2019
    GROUP BY hdct.IDDichVuDiKem
    HAVING COUNT(*) > 10
);

-- 20 --
SELECT IDNhanVien AS ID, HoTen, Email, SDT, NgaySinh, DiaChi
FROM nhanvien
UNION
SELECT IDKhachHang AS ID, HoTen, Email, SDT, NgaySinh, DiaChi
FROM khachhang;



