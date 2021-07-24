USE master
GO
CREATE DATABASE PS18293_NguyenHoangDuy_QLSV
GO
USE PS18293_NguyenHoangDuy_QLSV
GO
CREATE TABLE MONHOC(
	MaMH VARCHAR(7) PRIMARY KEY,
	TenMH NVARCHAR(50),
	SoTC int
)
GO
CREATE TABLE SINHVIEN(
	MaSV VARCHAR(7) PRIMARY key,
	HoSV NVARCHAR(50),
	TenSV NVARCHAR(20),
	NgaySinh date
)
GO
CREATE TABLE KETQUA(
	PRIMARY KEY(MaSV,MaMH),
	MaSV VARCHAR(7) REFERENCES SINHVIEN(MaSV),
	MaMH VARCHAR(7) REFERENCES MONHOC(MaMH),
	DiemThi FLOAT(2)
)
GO
INSERT INTO MONHOC
VALUES('COM1024',N'Tin học văn phòng',5),
('COM2012',N'Cơ sở dữ liệu',7),
('MOB1013',N'Lập trình Java 1',3)
GO
INSERT INTO SINHVIEN
VALUES('PS02942',N'Lê Thảo',N'Nguyên','2000-08-15'),
('PS04510',N'Nguyễn Hải',N'Yến','2002-10-20'),
('PS10106',N'Trần Từ',N'Hải','1996-01-09'),
('PS10250',N'Nguyễn',N'Bảo','1998-01-07')
GO
INSERT INTO KETQUA
VALUES('PS02942','COM1024',8.5),
('PS02942','COM2012',7),
('PS02942','MOB1013',9),
('PS10106','COM1024',6),
('PS10106','COM2012',3.5)


-- 1. VIẾT 3 STORE PROC THÊM VÀO 3 BẢNG
-- DROP PROC sp_MonHoc_insert
CREATE PROC sp_MonHoc_insert
	@MaMH varchar(7),
	@TenMH nvarchar(50),
	@SoTC int
AS
BEGIN
	INSERT INTO MONHOC VALUES(@MaMH,@TenMH,@SoTC)
END
go
-- thi hành
EXEC sp_MonHoc_insert COM01,N'Môn Test',3

---------
-- DROP PROC sp_SinhVien_insert
CREATE PROC sp_SinhVien_insert
	@MaMH varchar(7),
	@TenMH nvarchar(50),
	@SoTC int
AS
BEGIN
	INSERT INTO MONHOC VALUES(@MaMH,@TenMH,@SoTC)
END
go
-- thi hành
EXEC sp_SinhVien_insert COM01,N'Môn Test',3

--------
-- DROP PROC sp_KetQua_insert
CREATE PROC sp_KetQua_insert
	@MaMH varchar(7),
	@TenMH nvarchar(50),
	@SoTC int
AS
BEGIN
	INSERT INTO MONHOC VALUES(@MaMH,@TenMH,@SoTC)
END
go
-- thi hành
EXEC sp_KetQua_insert 'COM01',N'Môn Test',3

-- 2. VIẾT 3 STORE PROC CẬP NHẬT MÔN HỌC
CREATE PROC sp_MonHoc_update
	@SoTC int
AS
BEGIN
	UPDATE MONHOC
	SET SoTC = @SoTC
END
-- thi hành
exec sp_MonHoc_update 3

-- 3. VIẾT STORE PROC THÊM MÔN HỌC
SELECT * from monhoc
CREATE PROC sp_MonHoc_Them
	@MaMH varchar(7),
	@TenMH nvarchar(50),
	@SoTC int
AS
BEGIN
	INSERT INTO MONHOC VALUES (@MaMH,@TenMH,@SoTC);
END
-- thi hành
EXEC sp_MonHoc_Them 'PRO1013',N'Dự án 1',2

-- 4. VIẾT STORE PROC Liệt kê các môn học mà Mã MH bắt đầu là COM gồm: Mã MH, TenMH, DiemTB 
--Sắp xếp theo DiemTB giảm dần.

SELECT MonHoc.MaMH, TenMh, AVG(KetQua.DiemThi) as DiemTB
FROM MonHoc, KetQua
WHERE MonHoc.MaMH = KetQua.MaMH
And monhoc.MaMH like '%COM%'
Group by MonHoc.MaMH, TenMh
ORDER BY DiemTB DESC

--5. VIẾT STORE PROC Hiển thị danh sách sinh viên chưa thi môn nào gồm: Mã SV, Họ và Tên, Ngày sinh.
select masv from ketqua

SELECT sinhvien.MaSV, HoSV, NgaySinh
from SinhVien 
WHERE SinhVien.MaSV not in ( select masv from ketqua)

--6. VIẾT STORE PROC Danh sách sinh viên có điểm TB các môn nhỏ hơn 5 điểm.
SELECT MaSV, avg(DiemThi) AS 'Điểm tb'
FROM KetQua
GROUP BY MaSV
HAVING avg(DiemThi) <= 5;

--7. VIẾT STORE PROC sinh vien thi 2 lần trở lên (tuc la masv xuat hien trong bang ket qua tu 2 lan tro len)
SELECT sinhvien.MaSV, hosv, tensv, count(ketqua.maMH) 
FROM sinhvien,KetQua
WHERE sinhvien.masv = ketqua.masv
GROUP BY sinhvien.MaSV, hosv, tensv
HAVING count(maMH) >= 2;