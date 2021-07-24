
--1. CHỌN CSDL MASTER
USE MASTER
GO
--xóa
drop database masv_hoten_qlsv
go
--2. Tạo csld 
create database masv_hoten_qlsv
go
--3. CHỌN CSDL masv_hoten_qlsv
use masv_hoten_qlsv
go

--4. xóa bảng 
drop table SINHVIEN
go
drop table LOPHOC
go
--5. TẠO BẢNG LOPHOC
create table LOPHOC
(
	MaLop char(7) primary key,
	TenLop nvarchar(50) not null
)
go
--6. Tạo bảng SINHVIEN
create table SINHVIEN
(
	MaSV char(7) primary key,
	HoTen nvarchar(50) not null,
	DiaChi nvarchar(50) not null,
	GioiTinh bit,
	MaLop char(7) references LOPHOC(MaLop)
)
go
--6. TẠO BẢNG MONHOC
create table MONHOC
(
	MaMH char(7) primary key,
	TenMH nvarchar(50) not null
)
go
--7. TẠO BẢNG DIEM
create table DIEM
(
	MaSV char(7) references SINHVIEN(MaSV),
	MaMH char(7) references MONHOC(MaMH),
	Diem int,
	primary key(MaSV,MaMH)	
)
go

--8
insert into LOPHOC values ('UD16314', N'Công Nghệ Phần Mềm UD16314 ')
go

select *
from LOPHOC
GO









use master
go

drop database MASV_HOTEN_QLDA
go

create database MASV_HOTEN_QLDA
go
use MASV_HOTEN_QLDA
GO


create table phongban
(
TENPHG nvarchar(30),
MAPHG int primary key,
TRPHG nvarchar(9),
NG_NHANCHUC date
)

create table nhanvien
(
honv nvarchar(15),
tenlot nvarchar(15),
tennv nvarchar(15),
manv nvarchar(9) primary key,
ngsinh	date,
dchi nvarchar(30),
phai nvarchar(3),
luong money,
ma_nql int,
phg int,
constraint fk_nv_pb foreign key (phg) references phongban (maphg),
--constraint fk_nv_tp foreign key (ma_nql) references phongban (maphg)
)

create table diadiem_phg
(
maphg int,
diadiem nvarchar(9),
primary key (maphg,diadiem),
constraint fk_dd_pb foreign key (maphg) references phongban(maphg)
)

create table thannhan
(
ma_nvien nvarchar(9),
tentn nvarchar(15),
phai nvarchar(3),
ngsinh date,
quanhe nvarchar(15),
primary key (ma_nvien,tentn),
constraint fk_tn_nv foreign key (ma_nvien) references nhanvien(manv)
)

create table dean
(
tenda nvarchar(15),
mada int primary key,
ddiem_da nvarchar(15),
phong int,
constraint fk_dean_pb foreign key (phong) references phongban(maphg)
)

create table congviec
(
mada int,
stt int,
ten_cong_viec nvarchar(50),
primary key (mada,stt),
constraint fk_cv_dean foreign key (mada) references dean(mada)
)

create table phancong
(
ma_nvien nvarchar(9),
mada int,
stt int,
thoigian float,
primary key(ma_nvien,mada,stt),
constraint fk_pc_cv1 foreign key(mada,stt) references congviec (mada,stt),
constraint fk_pc_nv foreign key (ma_nvien) references nhanvien(manv)
)

--phong ban
insert into phongban values(N'Nghiên cứu',5,'005','1978/05/22')
insert into phongban values(N'Điều hành',4,'008','1985/01/01')
insert into phongban values(N'Quản lý',1,'006','1971/06/19')

--nhanvien
insert into nhanvien values(N'Đinh',N'Bá',N'Tiên','009','1960/02/11',N'119 Cống Quỳnh,TP HCM',N'Nam',30000,'005',5)
insert into nhanvien values(N'Nguyễn',N'Thanh',N'Tùng','005','1962/08/20',N'222 Nguyễn Văn Cừ,TP HCM',N'Nam',40000,'006',5)
insert into nhanvien values(N'Bùi',N'Ngọc',N'Hằng','007','1954/03/11',N'332 Nguyễn Thái Học,TP HCM',N'Nam',25000,'001',4)
insert into nhanvien values(N'Lê',N'Quỳnh',N'Như','001','1967/02/01',N'291 Hồ Văn Huê,TP HCM',N'Nữ',43000,'006',4)
insert into nhanvien values(N'Nguyễn',N'Mạnh',N'Hùng','004','1967/03/04',N'95 Bà Rịa,Vũng Tàu',N'Nam',38000,'005',5)
insert into nhanvien values(N'Trần',N'Thanh',N'Tâm','003','1957/05/04',N'34 Mai Thị Lư,TP HCM',N'Nam',25000,'005',5)
insert into nhanvien values(N'Trần',N'Hồng',N'Quang','008','1967/09/01',N'80 Lê Hồng Phong,TP HCM',N'Nam',25000,'001',4)
insert into nhanvien values(N'Phạm',N'Văn',N'Vinh','006','1965/01/01',N'45 Trưng Vương,Hà Nội',N'Nữ',55000,'',1)

--thannhan
insert into thannhan values('005',N'Trinh',N'Nữ','1976/04/05',N'Con Gái')
insert into thannhan values('005',N'Khang',N'Nam','1973/10/25',N'Con Trai')
insert into thannhan values('005',N'Phương',N'Nữ','1948/05/3',N'Vợ chồng')
insert into thannhan values('001',N'Minh',N'Nam','1932/02/29',N'Vợ chồng')
insert into thannhan values('009',N'Tiến',N'Nam','1978/01/01',N'Con trai')
insert into thannhan values('009',N'Châu',N'Nữ','1978/12/30',N'Con gái')
insert into thannhan values('009',N'Phương',N'Nữ','1957/05/05',N'Vợ chồng')

--diadiem_phongban
insert into diadiem_phg values(1,N'TPHCM')
insert into diadiem_phg values(4,N'Hà Nội')
insert into diadiem_phg values(5,N'TAU')
insert into diadiem_phg values(5,N'Nha Trang')
insert into diadiem_phg values(5,N'TP HCM')

--dean
insert into dean values(N'Sản Phẩm X',1,'Vũng Tàu',5)
insert into dean values(N'Sản Phẩm Y',2,'Nha Trang',5)
insert into dean values(N'Sản Phẩm Z',3,'TP HCM',5)
insert into dean values(N'Tin học hóa',10,'Hà Nội',4)
insert into dean values(N'Cáp Quang',20,'TP HCM',1)
insert into dean values(N'Đào tạo',30,'Hà Nội',4)

--congviec
insert into congviec values(1,1,N'Thiết kế sản phẩm X')
insert into congviec values(1,2,N'Thử nghiệm sản phẩm X')
insert into congviec values(2,1,N'Sản xuất sản phẩm Y')
insert into congviec values(2,2,N'Quảng cáo sản phẩm Y')
insert into congviec values(3,1,N'Khuyến mãi sản phẩm Z')
insert into congviec values(10,1,N'Tin học hóa phòng nhân sự')
insert into congviec values(10,2,N'Tin học hóa phòng kinh doanh')
insert into congviec values(20,1,N'Lắp đặt cáp quang')
insert into congviec values(30,1,N'Đào tạo nhân viên Marketing')
insert into congviec values(30,2,N'Đào tạo chuyên viên thiết kế')

--phancong
insert into phancong values('009',1,1,32)
insert into phancong values('009',2,2,8)
insert into phancong values('004',3,1,40)
insert into phancong values('003',1,2,20.0)
insert into phancong values('003',2,1,20.0)
insert into phancong values('008',10,1,35)
insert into phancong values('008',30,2,5)
insert into phancong values('001',30,1,20)
insert into phancong values('001',20,1,15)
insert into phancong values('006',20,1,30)
insert into phancong values('005',3,1,10)
insert into phancong values('005',10,2,10)
insert into phancong values('005',20,1,10)
insert into phancong values('007',30,2,30)
insert into phancong values('007',10,2,10)
GO






--bài 1: chào 500 anh em
print 'chào 500 anh em'
--bai 2: cộng hai số
-- khai báo biến
declare @a int
declare @b int
declare @kq int
-- gán giá trị cho biến
set @a =  10
set @b = 5
-- tính toán
set @kq = @a + @b
-- xuất ra
print 'ket qua la : ' + convert(varchar(20),@kq)



--bai 3: diện tích + chu vi
-- khai báo biến
declare @a int
declare @b int
declare @dt int
declare @cv int
-- gán giá trị cho biến
set @a =  10
set @b = 5
-- tính toán
set @dt = @a * @b
set @cv = (@a + @b)*2
-- xuất ra
print N'diện tích la : ' + convert(varchar(20),@dt)
print N'chu vi la : ' + convert(varchar(20),@cv)

--TRUY VẤN

--1a xuất ra lương cao nhất của nhân viên
SELECT MAX(LUONG) FROM NHANVIEN
--CÁCH 2
--KHAI BÁO
DECLARE @LUONGCAONHAT FLOAT
-- GÁN VÀO BIẾN
SET @LUONGCAONHAT = (SELECT MAX(LUONG) FROM NHANVIEN)
-- XUẤT RA 
print N'Lương cao nhất là : ' + convert(varchar(20),@LUONGCAONHAT)

-- 1.	Cho biêt nhân viên có lương cao nhất
SELECT HONV, TENLOT, TENNV, LUONG
FROM NHANVIEN
WHERE LUONG = (SELECT MAX(LUONG) FROM NHANVIEN)
GO


--2a. XUẤT  lương trung bình của phòng "Nghiên cứu”
--CÁCH 1
SELECT AVG(LUONG)
FROM NHANVIEN, PHONGBAN
WHERE NHANVIEN.phg = PHONGBAN.MAPHG
AND TENPHG = N'Nghiên cứu'
--CÁCH 2
SELECT AVG(LUONG)
FROM NHANVIEN INNER JOIN PHONGBAN
ON NHANVIEN.phg = PHONGBAN.MAPHG
WHERE TENPHG = N'Nghiên cứu'

--2b Cho biết họ tên nhân viên (HONV, TENLOT, TENNV)
SELECT HONV, TENLOT, TENNV
FROM NHANVIEN
GO

-- 2.Cho biết họ tên nhân viên (HONV, TENLOT, TENNV) 
-- có mức lương trên mức lương trung bình của phòng "Nghiên cứu”
SELECT HONV, TENLOT, TENNV, LUONG
FROM NHANVIEN
WHERE LUONG > (
				SELECT AVG(LUONG)
				FROM NHANVIEN INNER JOIN PHONGBAN
				ON NHANVIEN.phg = PHONGBAN.MAPHG
				WHERE TENPHG = N'Nghiên cứu'
			  )

-- tham khảo




--3a liệt kê lương trung bình của các phòng ban
	SELECT PHG,AVG(LUONG)
	FROM NHANVIEN
	GROUP BY PHG


--3b liệt kê phòng ban có lương trung bình > 31000
	SELECT PHG,AVG(LUONG)
	FROM NHANVIEN
	GROUP BY PHG
	HAVING AVG(LUONG) > 31000


--3c. đếm số lượng nhân viên của các phòng ban
	SELECT PHG,COUNT(*) AS 'SO LUONG NHÂN VIÊN'
	FROM NHANVIEN
	GROUP BY PHG
	GO




 -- 3.Với các phòng ban có mức lương trung bình trên 31,000, liệt kê tên phòng ban và 
 -- số lượng nhân viên của phòng ban đó.
 select PHG,TENPHG,count(*) as 'số nhân viên' 
 from nhanvien inner join phongban 
 on phongban.MAPHG=nhanvien.phg
 where phg in 
			 (
			 select phg from nhanvien 
			 group by phg 
			 having avg(luong) > 31000
			 )
 group by PHG,TENPHG

-- 4.Với mỗi phòng ban, cho biết tên phòng ban và số lượng đề án mà phòng ban đó chủ trì
select count(*) as ' số lượng đề án',tenphg,MAPHG
from dean inner join phongban 
on phongban.MAPHG=dean.phong
group by tenphg,MAPHG


















--bài 1: chào 500 anh em
print 'chào 500 anh em'

--bai 2: cộng hai số
--khai báo biến
declare @a int
declare @b int
declare @kq int
--gán giá trị vào biến
set @a = 5
set @b = 10
set @kq = @a + @b
--xuất kết quả ra
print 'ket qua la : ' + convert(varchar(20),@kq)

--bai 3: diện tích + chu vi
--khai báo biến
declare @a int
declare @b int
declare @dt int
declare @cv int
--gán giá trị vào biến
set @a = 5
set @b = 10
-- tính toán
set @dt = @a * @b
set @cv = (@a + @b) * 2
--xuất kết quả ra
print 'dt la : ' + convert(varchar(20),@dt)
print 'chu vi la : ' + convert(varchar(20),@cv)


--TRUY VẤN

--1a xuất ra lương cao nhất của nhân viên
--cách 1
select max(LUONG) FROM NHANVIEN
--cách 2
-- KHAI BÁO 
DECLARE @luongcaonhat float
set @luongcaonhat = (select max(LUONG) FROM NHANVIEN)
print N'LƯƠNG CAO NHẤT LÀ : ' + convert(varchar(20),@luongcaonhat) 

-- 1.	Cho biêt nhân viên có lương cao nhất
SELECT HONV, TENLOT, TENNV
FROM NHANVIEN
WHERE LUONG = (
				select max(LUONG)
				FROM NHANVIEN
			  )
GO
--2a. XUẤT  lương trung bình của phòng "Nghiên cứu”
--CÁCH 1
SELECT AVG(LUONG)
FROM NHANVIEN, PHONGBAN
WHERE NHANVIEN.phg = PHONGBAN.MAPHG
AND TENPHG = N'Nghiên cứu'
go
--cách 2
SELECT AVG(LUONG)
FROM NHANVIEN INNER JOIN PHONGBAN
ON NHANVIEN.phg = PHONGBAN.MAPHG
WHERE TENPHG = N'Nghiên cứu'


--2b Cho biết họ tên nhân viên (HONV, TENLOT, TENNV, PHG)
SELECT HONV, TENLOT, TENNV, PHG
FROM NHANVIEN

-- 2.Cho biết họ tên nhân viên (HONV, TENLOT, TENNV) 
-- có mức lương trên mức lương trung bình của phòng "Nghiên cứu”
SELECT HONV, TENLOT, TENNV, LUONG, PHG
FROM NHANVIEN
WHERE LUONG > (
				SELECT AVG(LUONG)
				FROM NHANVIEN INNER JOIN PHONGBAN
				ON NHANVIEN.phg = PHONGBAN.MAPHG
				WHERE TENPHG = N'Nghiên cứu'
			  )
GO
--
--3a liệt kê lương trung bình của các phòng ban
SELECT PHG, AVG(LUONG)
FROM NHANVIEN
GROUP BY PHG
--3b liệt kê phòng ban có lương trung bình > 31000
SELECT PHG, AVG(LUONG)
FROM NHANVIEN
GROUP BY PHG
HAVING AVG(LUONG) > 31000


--3c. đếm số lượng nhân viên của các phòng ban
--CÁCH 1
SELECT PHG, COUNT(*) AS 'SO LUONG NHAN VIEN'
FROM NHANVIEN
GROUP BY PHG
--CÁCH 2
SELECT PHG,TENPHG, COUNT(*) AS 'SO LUONG NHAN VIEN'
FROM NHANVIEN INNER JOIN PHONGBAN
ON NHANVIEN.PHG = PHONGBAN.MAPHG
GROUP BY PHG,TENPHG

 -- 3.Với các phòng ban có mức lương trung bình trên 30,000, liệt kê tên phòng ban và 
 -- số lượng nhân viên của phòng ban đó.
 select PHG,TENPHG, count(*) as 'số nhân viên' 
 from nhanvien inner join phongban on phongban.MAPHG=nhanvien.phg
 where phg in 
			 (
			 select phg from nhanvien 
			 group by phg 
			 having avg(luong) > 31000
			 )
 group by PHG,TENPHG

-- 4.Với mỗi phòng ban, cho biết tên phòng ban và số lượng đề án mà phòng ban đó chủ trì
select count(*) as ' số lượng đề án',tenphg,MAPHG
from dean inner join phongban 
on phongban.MAPHG=dean.phong
group by tenphg,MAPHG








--bài 1: chào 500 anh em

--bai 2: cộng hai số
--bai 3: diện tích + chu vi
declare @a int
declare @b int
declare @dt int
declare @cv int
set @a= 5
set @b= 6
set @dt = @a * @b
set @cv = (@a + @b)*2
print N'Diện tích là ' + cast(@dt as varchar(10))
print N'Chu vi là ' +cast(@cv as varchar(10))

--TRUY VẤN
--1a lương cao nhất của nhân viên
select max(luong) from nhanvien
--1b xuất thông tin nhân viên
select * from nhanvien
go
-- 1.	Cho biêt nhân viên có lương cao nhất
select * from nhanvien
where luong = (select max(luong) from nhanvien)
--2a. lương  lương trung bình của phòng "Nghiên cứu”
select avg(luong) 
from nhanvien, phongban 
where nhanvien.phg = phongban.MAPHG
and tenphg = N'Nghiên cứu'
go
--2b Cho biết họ tên nhân viên (HONV, TENLOT, TENNV)
select honv,tenlot,tennv,phg
from nhanvien A 
go

-- 2.Cho biết họ tên nhân viên (HONV, TENLOT, TENNV) 
-- có mức lương trên mức lương trung bình của phòng "Nghiên cứu”
select honv,tenlot,tennv,phg, luong
from nhanvien A 
inner join phongban B 
on A.PHG=B.MAPHG
where A.luong > (

				select avg(luong) 
				from nhanvien, phongban 
				where nhanvien.phg = phongban.MAPHG
				and tenphg = N'Nghiên cứu'

				)
go

-- tham khảo

select honv,tenlot,tennv,phg 
from nhanvien A 
inner join phongban B 
on A.PHG=B.MAPHG
where A.luong > (select avg(luong) from nhanvien) and tenphg = N'Nghiên cứu'


--3a liệt kê lương trung bình của các phòng ban

select phg, avg(luong)
from nhanvien 
group by phg 

--3b liệt kê phòng ban có lương trung bình > 31000

select phg , avg(luong)
from nhanvien 
group by phg 
having avg(luong) > 31000

--3c. đếm số lượng nhân viên của các phòng ban

select count(*) as 'số nhân viên' ,TENPHG
 from nhanvien inner join phongban
 on phongban.MAPHG=nhanvien.phg
 group by TENPHG

 -- 3.Với các phòng ban có mức lương trung bình trên 30,000, liệt kê tên phòng ban và 
 -- số lượng nhân viên của phòng ban đó.
 select count(*) as 'số nhân viên' ,TENPHG
 from nhanvien inner join phongban on phongban.MAPHG=nhanvien.phg
 where phg in 
			 (
			 select phg from nhanvien 
			 group by phg 
			 having avg(luong) > 31000
			 )
 group by TENPHG

-- 4.Với mỗi phòng ban, cho biết tên phòng ban và số lượng đề án mà phòng ban đó chủ trì
select count(*) as ' số lượng đề án',tenphg,MAPHG
from dean inner join phongban 
on phongban.MAPHG=dean.phong
group by tenphg,MAPHG