

--câu 2 : Viết store tính Tổng 2 số 
create proc sp_cau1
@a int,
@b int
as
	print 'kq: ' + cast( (@a + @b) as varchar(15))
go
--Thực thi
exec sp_cau1 7,5
go

--Câu 1 : Viết function cộng 2 số
drop function fn_Tong
go
create function fn_Tong(@a int, @b int)   --Tên Hàm
returns int    --Kết quả trả về là Kiểu int
AS   --TỪ AS xuống là phần xử lý function
BEGIN
	return (@a + @b)
END
go
--Thực thi
print dbo.fn_Tong (5,7)


--drop function fn_tong
create function fn_Tong(@a int,@b int)
returns int      -- Kiểu trả về
AS
BEGIN
	return (@a + @b)
END
-------Thực thi  dbo.TenHam
print dbo.fn_Tong(2,3)

--cách 2
drop function fn_add2num
go
create function fn_add2num(@a int,@b int)
returns int      -- Kiểu trả về, kết quả sẽ trả về là kiểu int
as
BEGIN
	declare @kq as int
	set @kq = (@a + @b)
	return @kq
END
-------Thực thi  dbo.TenHam
print dbo.fn_add2num(2,3)

--Câu 2 : Cho biết tuổi của nhân viên có mã số là 004
select (YEAR(GETDATE()) - YEAR(NGSINH)) as 'Tuoi'
from NHANVIEN 
where MANV='004' 
go

--câu 3 : Nhập vào MaNV cho biết tuổi của nhân viên này
--drop function fn_Tuoi
go
create function fn_Tuoi(@Manv varchar(3))
returns int  --Kết quả trả về kiểu int
AS
BEGIN
	return(select (YEAR(GETDATE()) - YEAR(NGSINH)) as 'Tuoi'
			from NHANVIEN 
			where MANV = @Manv)
END
go
--Thực thi
print dbo.fn_Tuoi('004')

--Câu 3 : Nhập vào MaNV cho biết tuổi của nhân viên này.
--drop create function fn_Tuoi
create function fn_Tuoi(@MaNV varchar(9))
returns int 
AS
BEGIN
return (select (YEAR(GETDATE()) - YEAR(NGSINH)) from nhanvien where Manv=@Manv )
END
--Thực thi
print dbo.fn_Tuoi('004')

--Câu 4 : Nhập vào Manv cho biết số lượng đề án nhân viên này đã tham gia
select PHANCONG.MA_NVIEN, count(*) from PHANCONG
where PHANCONG.MA_NVIEN='004'
group by PHANCONG.MA_NVIEN
go

--drop function fn_cau4
create function fn_cau4(@Manv varchar(3))
returns int
AS
BEGIN
	return(
		select count(*) from PHANCONG
		where PHANCONG.MA_NVIEN =  @Manv)
END
go
--Thực thi
print dbo.fn_cau4('004')

--Câu 5 : Viết function cho câu 4
create function fn_cau5(@Manv as varchar(9))
returns int 
AS
BEGIN
return
	(select count(*) from PHANCONG
	where PHANCONG.MA_NVIEN = @Manv
	group by PHANCONG.MA_NVIEN)
END
--thực thi
print dbo.fn_cau5('004')

--câu 6 : Truyền tham số vào phái nam hoặc nữ, xuất số lượng nhân viên theo phái
--drop function dbo.fn_demsonvtheophai
create function fn_demsonvtheophai(@gioitinh Nvarchar(5))
returns int
as
begin 
	return (select count(*) from NHANVIEN where PHAI = @gioitinh)
end
go
print dbo.fn_demsonvtheophai('Nam')
go
print dbo.fn_demsonvtheophai(N'Nữ')
go

--Câu 6 : Tạo 1 view lấy ra dữ liệu MaPhg, TenPhg, TenNV từ 2 bảng Phong, Nhanvien
--drop view v_cau1
go
create view v_cau1
AS
	select PHONGBAN.MAPHG, PHONGBAN.TENPHG, NHANVIEN.TENNV
	from PHONGBAN inner join NHANVIEN
	ON PHONGBAN.MAPHG = NHANVIEN.PHG
go
--truy vấn view
select * from v_cau1
go

--drop view v_cau6
create view v_cau6
as
	Select PHONGBAN.MAPHG, PHONGBAN.TENPHG, NHANVIEN.TENNV
	From PHONGBAN inner join NHANVIEN
	On PHONGBAN.MAPHG = NHANVIEN.PHG
go
--truy vấn kết quả câu 6
select * from v_cau6
go

--câu 7 : Hiển thị thông tin TenNv, Lương, Tuổi.
--drop view v_cau7
create view v_cau7
as
	select TENNV, LUONG, (YEAR(GETDATE()) - YEAR(NGSINH)) as 'tuoi'
	from NHANVIEN
go
select * from v_cau7
--
create view v_cau7
as
SELECT tennv, luong, (YEAR(GETDATE()) - YEAR(NGSINH)) as 'tuoi'
from NHANVIEN
go
-- truy van view
select * from v_cau7
go





-- Bài 1, Viết các hàm:
-- Nhập vào MaNV cho biết tuổi của nhân viên này.
-- drop function tuoinv
CREATE FUNCTION tuoinv(@manv nvarchar(9))
RETURNS int
BEGIN
	RETURN (SELECT YEAR(GETDATE())-YEAR(NGSINH) FROM NHANVIEN
			WHERE MANV = @manv)
END
go
--Thi hành
PRINT CAST(dbo.tuoinv('001') as nvarchar(20))
go
-------------------------------------------------------
--Nhập vào Manv cho biết số lượng đề án nhân viên này đã tham gia
--drop function fn_cau2
CREATE FUNCTION fn_cau2(@manv nvarchar(9))
RETURNS int
BEGIN
	RETURN (SELECT count(*) FROM PHANCONG
			WHERE MA_NVIEN = @manv
			GROUP BY MA_NVIEN)
END
go
--Thi hành
PRINT dbo.fn_cau2('004')
go
----------------------------------------------------
--Truyền tham số vào phái nam hoặc nữ, xuất số lượng nhân viên theo phái
--drop function fn_cau3
CREATE FUNCTION fn_cau3(@phai nvarchar(3))
RETURNS int
BEGIN
	RETURN(SELECT count(*) FROM NHANVIEN
			WHERE PHAI = @phai
			GROUP BY PHAI)
END
go
--Thi hành
PRINT dbo.fn_cau3(N'Nam')

PRINT dbo.fn_cau3(N'Nữ')
go
--------------------------------------------------------
--Truyền tham số đầu vào là tên phòng, tính mức lương trung bình của phòng đó, 
--Cho biết họ tên nhân viên (HONV, TENLOT, TENNV) có mức lương trên mức lương trung bình của phòng đó
--drop function fn_Cau4
CREATE FUNCTION fn_Cau4 (@phg int)
RETURNS TABLE
as
	RETURN (
	 SELECT HONV,TENLOT,TENNV FROM NHANVIEN
	 WHERE LUONG > (SELECT AVG(LUONG) FROM NHANVIEN)
	 AND PHG = @phg)
go
--Thi hành
SELECT * FROM fn_cau4(5)
go
-------------------------------------------------------
-- Tryền tham số đầu vào là Mã Phòng, cho biết tên phòng ban, 
-- họ tên người trưởng phòng và số lượng đề án mà phòng ban đó chủ trì
-- drop function fn_cau5
CREATE FUNCTION fn_cau5 (@trphg nvarchar(9))
RETURNS TABLE
as
	RETURN (SELECT TENNV,MAPB,TONGDA FROM
				(SELECT PHG as MAPB,count(*) as TONGDA
				FROM PHANCONG, PHONGBAN, NHANVIEN
				WHERE PHANCONG.MA_NVIEN = NHANVIEN.MANV
				AND PHONGBAN.MAPHG=NHANVIEN.PHG
				AND TRPHG = @trphg
				GROUP BY PHG
				) as c, PHONGBAN, NHANVIEN
				WHERE c.MAPB = PHONGBAN.MAPHG
				AND NHANVIEN.PHG = PHONGBAN.MAPHG
				AND MANV = TRPHG
			)
go
--Thi hành
SELECT * FROM fn_cau5('006')
go
-----------------------------------------------
-- Bài 2, Tạo các VIEW
-- Hiển thị thông tin HoNV,TenNV,TenPHG, DiaDiemPhg.
CREATE VIEW vw_thongtin
as
SELECT HONV,TENNV,PHONGBAN.MAPHG
FROM PHONGBAN
INNER JOIN NHANVIEN on NHANVIEN.PHG = PHONGBAN.MAPHG
INNER JOIN DIADIEM_PHG on PHONGBAN.MAPHG = DIADIEM_PHG.MAPHG
go
-- Thi hành
SELECT * FROM vw_thongtin
go
--------------------------------------
--Hiển thị thông tin TenNv, Lương, Tuổi.
CREATE VIEW vw_Bai2cau2
as
SELECT TENNV, LUONG, (YEAR(GETDATE()) - YEAR(ngsinh)) as N'Tuổi' FROM NHANVIEN
go
--Thi hành
SELECT * FROM vw_Bai2cau2
go
------------------------------------
-- Hiển thị  tên phòng ban và họ tên trưởng phòng của phòng ban có đông nhân viên nhất
CREATE VIEW vw_Bai2cau3
as
SELECT TENPHG,HONV,TENNV FROM NHANVIEN
INNER JOIN PHONGBAN on PHG = MAPHG
WHERE TRPHG = MANV
AND maphg in (SELECT top(1) phg FROM NHANVIEN
				GROUP BY PHG
				ORDER BY count(*) DESC)
go
--Thi hành
SELECT * FROM vw_Bai2cau3
