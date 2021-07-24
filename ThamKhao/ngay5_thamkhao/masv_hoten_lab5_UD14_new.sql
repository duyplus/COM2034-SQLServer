

--1.
create proc sp_chao
as
BEGIN
	print 'Chào 500 anh em'
END 
go
--2. gọi thi hành proc
exec sp_chao

-- Bai 1a, In ra dòng ‘Xin chào’ + @ten với @ten là tham số đầu vào là tên Tiếng Việt có dấu của bạn.
--1. tạo
create proc sp_bai1a
--khai báo tham số
@ten nvarchar(50)
as
BEGIN
	PRINT 'Chào : ' + @ten
END
go
-- thực thi và nhớ truyền tham số vào
exec sp_bai1a 'Ngoc Trinh'
--Bai 1b, Nhập vào 2 số @s1,@s2. In ra câu ‘Tổng là : @tg’ với @tg=@s1+@s2.
drop proc sp_bai1b
go
create proc sp_bai1b
--1. Khai báo tham số
@a int,
@b int
as
BEGIN
	--2. khai báo biến tong
	declare @kq int
	--3. tính toán
	set @kq = @a + @b;
	--4. xuất kq
	print 'ket qua la :  ' + cast(@kq as varchar(10))
END
go
--thực thi
exec sp_bai1b 5, 7
go

-- Bai 1c, Truyền vào số nguyên @n. In ra tổng các số chẵn từ 1 đến @n.
-- drop proc sp_TongChan
drop proc sp_bai1c
go
create proc sp_bai1c
@n int
as
BEGIN
	--1. Khai báo
	declare @i int
	declare @tong int
	--2. khởi gán ... nhớ trước vòng lặp nhé
	set @i=1
	set @tong = 0
	--3. dùng vòng lặp chạy từ 1 đến n
	while (@i<=@n)
	BEGIN
		if(@i % 2 = 0)
			set @tong = @tong + @i -- 4. cộng dồn vào biến tổng
		--5. nhớ tăng biến i lên 1 trong vòng lặp nhé
		set @i = @i + 1
	END
	--6. xuất @tong ngoài vòng lặp nhé
	print 'tong so chan la : '+ cast(@tong as varchar(10))
END
go
-- thi hành proc  
exec sp_bai1c 6  --- 2 + 4 + 6 

-- Bai 1d, 	Nhập vào 2 số. In ra ước chung lớn nhất của chúng 
create proc sp_bai1d
@a int,
@b int
AS
BEGIN
	while (@a <> @b)
	begin
		if (@a > @b)
			set @a = @a - @b
		else
			set @b = @b - @a
	end
	--xuất kq
	print 'USCLN là : '+ cast(@a as varchar(10))
END
go
--gọi thủ tục
exec sp_bai1d 18,12

-- Bai 2a, truyền vào @Manv, xuất thông tin các nhân viên theo @Manv.
drop proc sp_bai2a
go
create proc sp_bai2a
@manv nvarchar(9)
AS
BEGIN
	SELECT *
	FROM NHANVIEN
	WHERE MANV = @manv
END
go
--gọi thi hành 
exec sp_bai2a '002'

-- Bai 2b, Nhập vào @MaDa (mã đề án), cho biết số lượng nhân viên tham gia đề án đó
-- select * from Phancong

	--select MADA, count(*) as 'So luon nhan vien tham gia du an' 
	--from PHANCONG
	--group by MADA
--
create proc sp_bai2b 
@MaDa int
as
Begin
	select MADA, count(*) as 'So luon nhan vien tham gia du an' 
	from PHANCONG
	group by MADA
	having MADA = @MaDa
end

--thi hành
exec sp_bai2b 10








--------------------------------lab5 phần 2----------------------------









-- Bai 2,c Nhập vào @MaDa và @Ddiem_DA (địa điểm đề án), cho biết số lượng nhân viên 
-- tham gia đề án có mã đề án là @MaDa và địa điểm đề án là @Ddiem_DA

--cách 1
create proc Bai2c 
@MaDa int, 
@Ddiem_DA nvarchar(15)
as
begin
	select PHANCONG.MADA, count(*) as 'so luong nhan vien'
	from DEAN, PHANCONG
	where DEAN.MADA = PHANCONG.MADA and
		  DDIEM_DA = @Ddiem_DA	and
		  DEAN.MADA = @MaDa	
	group by PHANCONG.MADA
end

exec Bai2c 20, 'TP HCM'

--cách 2
create proc Bai2c 
@MaDa int, 
@Ddiem_DA nvarchar(15)
as
begin
	select PHANCONG.MADA, count(*) as 'so luong nhan vien'
	from DEAN inner join PHANCONG
	on DEAN.MADA = PHANCONG.MADA 
	where DDIEM_DA = @Ddiem_DA	
		  and DEAN.MADA = @MaDa			  
	group by PHANCONG.MADA
end

exec Bai2c 20, 'TP HCM'

--	Nhập vào @Trphg (mã trưởng phòng), xuất thông tin các nhân viên có trưởng phòng là @Trphg và các nhân viên này không có thân nhân.

-- Bai 2d, Nhập vào @Trphg (mã trưởng phòng), xuất thông tin các nhân viên
-- có trưởng phòng là @Trphg và các nhân viên này không có thân nhân.


-- select * from THANNHAN
--liệt kê bảng thân nhân
select * from thannhan
go
-- liệt kê ma_nvien các nhân viên có thân nhân (có trong bảng thân nhân)
select  MA_NVIEN
from THANNHAN, NHANVIEN
where THANNHAN.MA_NVIEN = NHANVIEN.MANV
-- liệt kê ma_nvien các nhân viên có thân nhân -- dùng distinct bỏ đi mã trùng
select distinct  MA_NVIEN
from THANNHAN, NHANVIEN
where THANNHAN.MA_NVIEN = NHANVIEN.MANV


--


-- select * from THANNHAN
drop proc sp_Bai2d
go
create proc sp_Bai2d 
--1. khai báo tham số
@Trphg nvarchar(9)
as
begin 
select *
from NHANVIEN
where MA_NQL = @Trphg 
and NHANVIEN.MANV not in (
select distinct  MA_NVIEN
from THANNHAN
)
end






drop proc Bai2d
go
--Bai2d
create proc Bai2d 
@Trphg nvarchar(9)
as
begin 
	select *
	from NHANVIEN
	where MA_NQL = @Trphg and
	 NHANVIEN.MANV not in ( select distinct MA_NVIEN
							from THANNHAN, NHANVIEN
							where THANNHAN.MA_NVIEN = NHANVIEN.MANV)
end
------------------------------------------
exec Bai2d '001'

exec Bai2d '002'
------------------------------------------



--create proc Bai2d 
--@Trphg nvarchar(9)
--as
--begin 
--	select *
--	from NHANVIEN
--	where MA_NQL = @Trphg and
--	 NHANVIEN.MANV not in (select MA_NVIEN
--						   from THANNHAN
--						   where THANNHAN.MA_NVIEN = NHANVIEN.MANV)
--end

--exec Bai2d '001'

--exec Bai2d '002'

--	Nhập vào @Manv và @Mapb, kiểm tra nhân viên có mã @Manv có thuộc phòng ban có mã @Mapb hay không

-- Bai 2e, Nhập vào @Manv và @Mapb, kiểm tra nhân viên có mã @Manv 
-- có thuộc phòng ban có mã @Mapb hay không
create procedure Bai2e 
@Manv nvarchar(9), 
@Mapb int
as
begin
	if exists (select * from nhanvien where phg= @Mapb and manv = @Manv)
	print N'Có thuộc'
	else
	print N'Không Thuộc'
end

Exec Bai2e '001',5

--cách 2

create procedure Bai2e 
@Manv nvarchar(9), 
@Mapb int
as
begin
	if exists (select * from nhanvien where phg= @Mapb and manv = @Manv)
	print cast(@Manv as varchar(10)) + N' có thuộc phòng '
		 + cast(@Mapb as varchar(10))
	else
	print cast(@Manv as varchar(10)) + N' không thuộc phòng '
		 + cast(@Mapb as varchar(10))
end

Exec Bai2e '001',5
Exec Bai2e '001',1
Exec Bai2e '001',2
Exec Bai2e '001',3
Exec Bai2e '001',4 -- thuoc phong so 4

--Bài 3: (3 điểm)
--Sử dụng cơ sở dữ liệu QLDA, Viết các Proc
--	Thêm phòng ban có tên CNTT vào csdl QLDA, các giá trị được thêm vào dưới dạng tham số đầu vào, kiếm tra nếu trùng Maphg thì thông báo thêm thất bại.


-- Bai 3a, Thêm phòng ban có tên CNTT vào csdl QLDA, các giá trị được thêm vào 
-- dưới dạng tham số đầu vào, kiếm tra nếu trùng Maphg thì thông báo thêm thất bại.

CREATE PROC sp_InsertPhongBan 
	--1. khai báo các tham số truyền vào
    @TenPHG nvarchar(15),
	@MaPHG int, 
	@TRPHG nvarchar(9), 
	@NG_NHANCHUC date
AS
BEGIN
	--2. nếu có trong bảng phòng ban rồi thì thông báo đã tồn tại
	IF EXISTS(SELECT * FROM PHONGBAN WHERE MAPHG = @MaPHG)
		print 'Da ton tai, khong them vao duoc';
	ELSE --3. ngược lại nếu chưa có thì thêm vào bảng phòng ban
		INSERT INTO PHONGBAN
		VALUES(@TenPHG, @MaPHG,@TRPHG,@NG_NHANCHUC)
END

EXEC sp_InsertPhongBan 'Hanh Chinh',2,'007','2020-06-04'

--	Cập nhật phòng ban có tên CNTT thành phòng IT.

-- Bai 3b, Cập nhật phòng ban có tên CNTT thành phòng IT.
create procedure sp_phongbandoiten @tenphg nvarchar(30)
as
begin
	update phongban set tenphg = @tenphg
	where tenphg = N'Công Nghệ Thông Tin'
end
Exec sp_phongbandoiten 'IT'
go

	Thêm một nhân viên vào bảng NhanVien, tất cả giá trị đều truyền dưới dạng tham số đầu vào với điều kiện:
o	 nhân viên này trực thuộc phòng IT
o	Nhận @luong làm tham số đầu vào cho cột Luong, nếu @luong<25000 thì nhân viên này do nhân viên có mã 009 quản lý, ngươc lại do nhân viên có mã 005 quản lý
o	Nếu là nhân viên nam thi nhân viên phải nằm trong độ tuổi 18-65, nếu là nhân viên nữ thì độ tuổi phải từ 18-60.

-- Bai 3c, Thêm một nhân viên vào bảng NhanVien, tất cả giá trị đều truyền dưới dạng tham số đầu vào với điều kiện:
--	nhân viên này trực thuộc phòng IT
--	Nhận @luong làm tham số đầu vào cho cột Luong, nếu @luong<25000 thì nhân viên này do nhân viên có mã 009 quản lý, 
--       ngươc lại do nhân viên có mã 005 quản lý
--	Nếu là nhân viên nam thi nhân viên phải nằm trong độ tuổi 18-65, nếu là nhân viên nữ thì độ tuổi phải từ 18-60.
create procedure sp_InsertNhanVien
@honv nvarchar(15),@tenlotnv nvarchar(15), @tennv nvarchar(15),@manv nvarchar(9),
@ngsinh date,@dchi nvarchar(30), @phai nvarchar(3),@luong float, @ma_nql nvarchar(9), @phg int
AS
BEGIN
	if (@phg = (select maphg from phongban where tenphg ='IT'))
	BEGIN
		IF(@luong < 25000)
		begin
			set @ma_nql = '009'
			insert into nhanvien
			values(@honv,@tenlotnv,@tennv,@manv,@ngsinh,@dchi,@phai,@luong,@ma_nql,@phg)
		end
		ELSE
		begin
			set @ma_nql = '005'
			insert into nhanvien
			values(@honv,@tenlotnv,@tennv,@manv,@ngsinh,@dchi,@phai,@luong,@ma_nql,@phg)
		end
		IF (@phai = 'Nam')
		begin
			if(datediff(yy,@ngsinh,getdate()) between 18 and 65)
			begin
				insert into nhanvien
				values(@honv,@tenlotnv,@tennv,@manv,@ngsinh,@dchi,@phai,@luong,@ma_nql,@phg)
			end
			else
			print N'Không thỏa'
		end
		ELSE
		begin
			if(datediff(yy,@ngsinh,getdate()) between 18 and 60)
			begin
				insert into nhanvien
				values(@honv,@tenlotnv,@tennv,@manv,@ngsinh,@dchi,@phai,@luong,@ma_nql,@phg)
			end
			else
			print N'Không Thỏa'
		end
	END
	else
	print N'NHAN VIEN PHONG IT MOI THEM DUOC'
END
Exec sp_InsertNhanVien N'Nguyễn',N'Văn',N'Tèo','010','1975-04-30','30 Lê Văn Sỹ','Nam',25000,1,6

