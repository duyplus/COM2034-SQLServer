USE master
GO
CREATE DATABASE QLSV
GO
USE QLSV
GO
-- Tạo bảng khoá học
CREATE TABLE KHOA(
	MaKhoa VARCHAR(10) PRIMARY KEY,
	TenKhoa NVARCHAR(50) NULL,
	SoCBGD NVARCHAR(20) NULL
)
GO
-- Tạo bảng lớp
CREATE TABLE LOP(
	MaLop NVARCHAR(10) PRIMARY KEY,
	TenLop NVARCHAR(50) NULL,
	SiSo int NULL,
	MaKhoa VARCHAR(10) REFERENCES KHOAHOC(MaKhoa)
)
GO
-- Tạo bảng sinh viên
CREATE TABLE SINHVIEN(
	MaSV VARCHAR(10) PRIMARY KEY,
	HoTen NVARCHAR(50) NULL,
	Nu BIT NULL,
	NgaySinh date NULL,
	MaLop NVARCHAR(10) REFERENCES LOP(MaLop),
	Tinh NVARCHAR(20) NULL,
	HocBong FLOAT(2) NULL
)
GO
-- Tạo bảng môn học
CREATE TABLE MONHOC(
	MaMH VARCHAR(10) PRIMARY KEY NOT NULL,
	TenMH NVARCHAR(50) NULL,
	SoTiet VARCHAR(5) NULL
)
GO
-- Tạo bảng kết quả
CREATE TABLE KETQUA(
	PRIMARY KEY(MaSV,MaMH),
	MaSV VARCHAR(10) REFERENCES SINHVIEN(MaSV),
	MaMH VARCHAR(10) REFERENCES MONHOC(MaMH),
	DiemThi FLOAT(2)
)
GO
--- TRUY VẤN DỮ LIỆU
--a. Lập danh sách sinh viên gồm MASV, HOTEN, HOCBONG.
SELECT MaSV, Hoten, HocBong
FROM SinhVien

--b. Lập danh sách sinh viên nữ khoa ‘CNTT’. Danh sách cần MASV, HOTEN, HOCBONG.
SELECT MaSV, HoTen, HocBong FROM LOP
INNER JOIN SinhVien ON LOP.MaLop=SINHVIEN.MaLop
WHERE MaKhoa ='CNTT1'

--c. Lập bảng điểm cho tất cả sinh viên khoa "CNTT", bảng điểm gồm các cột MASV, HOTEN, TENMH, DIEMTHI
SELECT SINHVIEN.MaSV, HoTen, TenMH, DiemThi FROM KHOA
INNER JOIN LOP ON LOP.Makhoa = KHOA.MaKhoa
INNER JOIN SINHVIEN ON LOP.MaLop = SINHVIEN.MaLop
INNER JOIN KETQUA ON SINHVIEN.MaSV = KETQUA.MaSV
INNER JOIN MONHOC ON MONHOC.MaMH = KETQUA.MaMH
WHERE KHOA.MaKhoa like '%CNTT%'

--d. Lập phiếu điểm cho sinh viên có MASV="99001".
SELECT SINHVIEN.MaSV, HoTen, Nu, NgaySinh, MaLop, Tinh, HocBong, DiemThi FROM SinhVien
INNER JOIN KETQUA ON SINHVIEN.MaSV = KETQUA.MaSV
WHERE SINHVIEN.MaSV = '99001'

--e. Lập danh sách sinh viên gồm MASV,HOTEN,TENLOP, TENKHOA.
SELECT MaSV, HoTen, TenLop, TenKhoa FROM KHOA
INNER JOIN LOP ON LOP.Makhoa = KHOA.MaKhoa
INNER JOIN SINHVIEN ON LOP.MaLop = SINHVIEN.MaLop

--f. Lập bảng điểm môn học có mã môn học là CSDL cho tất cả sinh viên có mã lớp là "CDTH2B"
SELECT MaSV, HoTen, HocBong, TenLop FROM LOP
INNER JOIN SINHVIEN ON LOP.MaLop = SINHVIEN.MaLop
WHERE LOP.MaLop ='CDTH2B'

--g. Lập danh sách sinh viên của lớp có mã lớp là "DHTH2B" và có điểm thi môn học lớn hơn hay bằng 8.
SELECT SINHVIEN.MaLop, HoTen, DiemThi FROM SINHVIEN
INNER JOIN KETQUA ON SINHVIEN.MaSV = KETQUA.MaSV
WHERE SINHVIEN.MaLop = 'DHTH2B' AND DiemThi>=8

--h. Lập số lượng SV đăng ký thi theo từng môn học. Kết quả gồm: MaMH, Tổng số SV.
SELECT MONHOC.MaMH, COUNT(SINHVIEN.MaSV) as N'Số SV' FROM MONHOC
INNER JOIN KETQUA ON KETQUA.MaMH = MONHOC.MaMH
INNER JOIN SINHVIEN ON SINHVIEN.MaSV = KETQUA.MaSV
GROUP BY MONHOC.MaMH

--i. Thống kê số lượng SV nữ của mỗi lớp và tổng tiền học bổng họ nhận được.
SELECT LOP.MaLop, COUNT(SINHVIEN.MaSV) as N'Số SV', SINHVIEN.HocBong FROM LOP
INNER JOIN SINHVIEN ON SINHVIEN.MaLop = LOP.MaLop
WHERE SINHVIEN.Nu = 1
GROUP BY LOP.MaLop, SINHVIEN.HocBong

--j. Cho biết Mã số sinh viên đã đăng ký thi tất cả các môn học.
