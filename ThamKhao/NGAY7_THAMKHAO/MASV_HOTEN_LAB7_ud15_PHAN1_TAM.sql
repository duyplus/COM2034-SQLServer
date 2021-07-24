
--câu 2 : Viết store tính Tổng 2 số 
DROP PROC sp_cau1
GO
--TẠO PROC sp_cau1
create proc sp_cau1
@a int,
@b int
as
BEGIN
	print 'kq  :  ' + cast( (@a + @b) as varchar(15))
END
go
--Thực thi
exec sp_cau1     7,5
go
--CÁCH 2 DÙNG HÀM

--Câu 1 : Viết function cộng 2 số
--drop function fn_Tong
--go
--TẠO HÀM TÊN LÀ 
create function fn_cau1(@a int, @b int)   --1.Tên Hàm
returns int    --2. Kết quả trả về của hàm là Kiểu int
AS   --3. TỪ AS xuống là phần xử lý function
BEGIN
	return (@a + @b) --4. nhớ trong hàm có return kết quả
END
go
--Thực thi ...gọi hàm nhớ dbo.tenham (tham so)
print dbo.fn_cau1 (5,7) 
--Câu 2 : Cho biết tuổi của nhân viên có mã số là 004
select (year(GETDATE()) - year(ngsinh)) as 'Tuoi'
from nhanvien 
where Manv='004' 
go
create function f_cau2(@manv varchar(15)) --1.tên hàm ( tên thso)
returns int --2.hàm trả về kiểu int
as
BEGIN
	RETURN 
	(select (year(GETDATE()) - year(ngsinh)) 
	 from nhanvien 
	 where Manv=@manv)
END
--THỰC THI HÀM.....dbo.tenham
PRINT dbo.f_cau2('004')
--Câu 4 : Nhập vào Manv cho biết số lượng đề án nhân viên này đã tham gia
select phancong.ma_nvien, count(*)
from phancong
where phancong.ma_nvien='001'
group by phancong.ma_nvien
go
create function f_cau4(@manv as varchar(15)) --1. tên hàm
returns int --2. kiểu trả về là int
as
BEGIN
	RETURN
	(
		select count(*)
		from phancong
		where phancong.ma_nvien=@manv
		group by phancong.ma_nvien	
	)
END
--GỌI HÀM
PRINT dbo.f_cau4('001')
PRINT dbo.f_cau4('004')
----câu 5 : Truyền tham số vào phái nam hoặc nữ, xuất số lượng nhân viên theo phái
create function f_cau5(@phai as nvarchar(15)) --1. tên hàm
returns int --2. kiểu trả về là int
as
BEGIN
	RETURN
	(
		select count(*)
		from NHANVIEN
		where phai=@phai
	)
END
--thi hành
print dbo.f_cau5('Nam')
print dbo.f_cau5(N'Nữ')

--Câu 6 : Tạo 1 view lấy ra dữ liệu MaPhg, TenPhg, TenNV từ 2 bảng Phong, Nhanvien
drop view v_cau1
go
create view view_cau1
AS
	select phongban.MAPHG, phongban.TENPHG, nhanvien.tennv
	from phongban inner join nhanvien
	ON phongban.MAPHG = nhanvien.phg
go

alter view view_cau1
AS
	select phongban.MAPHG, phongban.TENPHG, nhanvien.tennv
	from phongban, nhanvien
	where phongban.MAPHG = nhanvien.phg
go
--truy vấn
select * from view_cau1
----câu 7 :TẠO 1 VIEW TÊN LÀ V_CAU7... Hiển thị thông tin TenNv, Lương, Tuổi.
create view v_cau7 --1. tên view
as
	SELECT TENNV, LUONG, (YEAR(GETDATE()) - YEAR(NGSINH)) AS 'TUOI'
	FROM NHANVIEN


--TRUY VẤN LẠI VIEW
SELECT * FROM V_CAU7



