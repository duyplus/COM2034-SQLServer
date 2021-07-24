

use QLDA
go

--1. Nhập a, b và 1 phép toán. Xuất ra kết quả dựa vào phép toán đó (if

--khai báo biến
declare @a as float
declare @b as float
declare @pheptoan as varchar(1)
--gán giá trị cho biến
set @a = 5
set @b = 2
set @pheptoan = '+'
--thực hiện 
if(@pheptoan = '+')
	print 'kq = ' + cast((@a + @b) as varchar(15))
else if (@pheptoan = '-')
	print 'kq = ' + cast((@a - @b) as varchar(15))
else if (@pheptoan = 'x')
	print 'kq = ' + cast((@a * @b) as varchar(15))
else if (@pheptoan = '/')
	print 'kq = ' + cast((@a / @b) as varchar(15))
else 
	print 'lam gi co phep toan nay.' 

-- giải ......

--Câu 2 : làm lại câu 1 nhưng dùng lệnh case ..... when
--1.khai báo
declare @a as float
declare @b as float
declare @pheptoan as varchar(1)
--2. gán giá trị
set @a = 5
set @b = 2
set @pheptoan = 'x'
--3. xử lý
print 'kq = ' + 
case @pheptoan
	when '+' then cast((@a + @b) as varchar(15))
	when '-' then cast((@a - @b) as varchar(15))
	when 'x' then cast((@a * @b) as varchar(15))
	when '/' then cast((@a / @b) as varchar(15))
	else 
		'lam gi co phep toan nay'
end -- ket thúc case

--giải 

--Câu 3 : Xuất ra danh sách các nhân viên có lương lớn hơn 30000. Nếu không có nhân viên nào thì xuất ra câu 'không nhân viên nào.'

if (select count(*) from nhanvien where luong > 30000) > 0
BEGIN
	SELECT HONV, TENNV, LUONG
	FROM NHANVIEN
	WHERE LUONG > 30000
END
else
	print N'không nhân viên nào.'


--cách 2 : dùng exists

if exists (select * from nhanvien where luong > 30000)
BEGIN
	-- xuất ra
	SELECT HONV, TENNV, LUONG
	FROM NHANVIEN
	WHERE LUONG > 30000
END
else
	print N'không nhân viên nào.'  -- ngược lại thì xuất ra ko co nv nào


--lab4_cau3 : 
--	Viết chương trình xem xét có tăng lương cho nhân viên hay không. Hiển thị cột thứ 1 là TenNV, cột thứ 2 nhận giá trị
--o	“TangLuong” nếu lương hiện tại của nhân viên nhở hơn trung bình lương của nhân viên 
--o	“KhongTangLuong “ nếu lương hiện tại của nhân viên lớn hơn trung bình lương của nhân viên .

--select avg(luong) from NHANVIEN
--CÁCH 1
select TENNV, LUONG, KETQUA = 
	CASE 
		WHEN  LUONG < (select avg(luong) from NHANVIEN) THEN 'TANGLUONG'
		ELSE 'KHONGTANGLUONG'
	END
FROM NHANVIEN
GO
--CÁCH 2
select tennv,luong,ketqua=
			case
				when luong < (select avg(luong) from nhanvien) then N'Tăng Lương'
				when luong >= (select avg(luong) from nhanvien) then N'Không Tăng Lương'
			end
from nhanvien
go


--cách 2



--lab4_cau4
--	Viết chương trình phân loại nhân viên dựa vào mức lương.
--o	Nếu lương nhân viên nhỏ hơn trung bình lương mà nhân viên đó đang làm việc 
-- thì xếp loại “nhanvien”, ngược lại xếp loại “truongphong”



select TENNV, LUONG, CHUCVU = 
	CASE 
		WHEN  LUONG < (select avg(luong) from NHANVIEN) THEN 'NHANVIEN'
		ELSE 'TRUONGPHONG'
	END
FROM NHANVIEN
GO
--CÁCH 2
select tennv,luong,ketqua=
			case
				when luong < (select avg(luong) from nhanvien) then N'NHÂN VIÊN'
				when luong >= (select avg(luong) from nhanvien) then N'TRƯỞNG PHÒNG'
			end
from nhanvien
go


------------------------------------------------------------------------------------------------------------

--câu 5 : Xuất ra 10 câu Chào Anh Em

print 'Chào 500 Anh Em'
print 'Chào 500 Anh Em'
print 'Chào 500 Anh Em'
print 'Chào 500 Anh Em'
print 'Chào 500 Anh Em'
print 'Chào 500 Anh Em'
print 'Chào 500 Anh Em'
print 'Chào 500 Anh Em'
print 'Chào 500 Anh Em'
print 'Chào 500 Anh Em'

--dùng while
DECLARE @i int

set @i = 1      --1. nhớ khởi gán @i = 1 trước vòng lặp nhé

while (@i <= 10)
BEGIN
	print 'Chào 500 Anh Em'
	set @i = @i + 1      --2. nhớ tăng biến @i trong vòng lặp nhé.
END


--Câu 6 : xuất ra từ 1 đến 100 dùng while

DECLARE @i int

set @i = 1      --1. nhớ khởi gán @i = 1 trước vòng lặp nhé

while (@i <= 100)
BEGIN
	print ' ' + @i
	set @i = @i + 1      --2. nhớ tăng biến @i trong vòng lặp nhé.
END


DECLARE @i int
DECLARE @kq varchar(300)
set @i = 1      --1. nhớ khởi gán @i = 1 trước vòng lặp nhé
set @kq = ' '

while (@i <= 100)
BEGIN
	set @kq = @kq + ' ' + cast(@i as varchar(3))
	set @i = @i + 1      --2. nhớ tăng biến @i trong vòng lặp nhé.
END
--3. xuất ngoài vòng lặp nhé
print @kq

--lab4_cau7 : Viết chương trình hiển thị TenNV tùy vào cột phái của nhân viên. Nếu là Nam thì thêm 'Mr.', ngược lại nếu là Nữ thì thêm 'Ms.' trước Tên của nhân viên


select TENNV = case
phai when 'Nam' then 'Mr. '  +  tennv
	else 
		'Ms. '  +  tennv
	end 
from nhanvien
go
------------------------------------------
--cách 2 :
select TENNV = case 
	when phai = 'Nam' then 'Mr.' + tennv
	when phai = N'Nữ' then 'Ms.' + tennv
end
from nhanvien
go




--Lab4 - Bai 1:
--  Bai 1a, Viết chương trình xem xét có tăng lương cho nhân viên hay không. Hiển thị cột thứ 1 là TenNV, cột thứ 2 nhận giá trị
--	“TangLuong” nếu lương hiện tại của nhân viên nhở hơn trung bình lương trong phòng mà nhân viên đó đang làm việc. 
--	“KhongTangLuong” nếu lương hiện tại của nhân viên lớn hơn trung bình lương trong phòng mà nhân viên đó đang làm việc
DECLARE @ThongKe TABLE(PHG int, LuongTB float);
INSERT INTO @ThongKe
	SELECT PHG, AVG(LUONG) AS LuongTB FROM NHANVIEN
	GROUP BY PHG;
SELECT TENNV, TinhTrang = CASE
	WHEN LUONG > LuongTB THEN N'Không Tăng Lương' ELSE N'Tăng Lương' END
FROM NHANVIEN A INNER JOIN @ThongKe B ON B.PHG = A.PHG
GO

-- Bai 1b, Viết chương trình phân loại nhân viên dựa vào mức lương.
-- Nếu lương nhân viên nhỏ hơn trung bình lương trong phòng mà 
-- nhân viên đó đang làm việc thì xếp loại “nhanvien”, ngược lại xếp loại “truongphong”
DECLARE @ThongKe2 TABLE(PHG int, LuongTB float);
INSERT INTO @ThongKe2
	SELECT PHG, AVG(LUONG) AS LuongTB FROM NHANVIEN
	GROUP BY PHG;
SELECT TENNV, LuongTB, ChucVu = CASE 
	WHEN LUONG > LuongTB THEN 'Truong Phong' ELSE 'Nhan Vien' END
FROM NHANVIEN A INNER JOIN @ThongKe2 B ON B.PHG = A.PHG
GO

-- Bai 1c, Viết chương trình hiển thị TenNV như hình bên dưới, tùy vào cột phái của nhân viên
--Cách 1
SELECT KETQUA = CASE
	WHEN PHAI = 'Nam' THEN 'Mr. ' + TENNV
	WHEN PHAI = N'Nữ' THEN 'Ms. ' + TENNV
ELSE 'FreeSex. ' + TENNV
END, PHAI
FROM NHANVIEN
GO
-- Cách 2
SELECT KETQUA = CASE PHAI
	WHEN 'Nam' THEN 'Mr. ' + TENNV
	WHEN N'Nữ' THEN 'Ms. ' + TENNV
ELSE 'FreeSex. ' + TENNV
END, PHAI
FROM NHANVIEN
GO

-- Bai 1d, Viết chương trình tính thuế mà nhân viên phải đóng theo công thức:
-- 0<luong<25000 thì đóng 10% tiền lương
-- 25000<luong<30000 thì đóng 12% tiền lương
-- 30000<luong<40000 thì đóng 15% tiền lương
-- 40000<luong<50000 thì đóng 20% tiền lương
-- Luong>50000 đóng 25% tiền lương
-- Cách 1
SELECT TENNV,LUONG, THUE = CASE
	WHEN LUONG BETWEEN 0 AND 25000 THEN LUONG * 0.1
	WHEN LUONG BETWEEN 25000 AND 30000 THEN LUONG * 0.12
	WHEN LUONG BETWEEN 30000 AND 40000 THEN LUONG * 0.15
	WHEN LUONG BETWEEN 40000 AND 50000 THEN LUONG * 0.2
	ELSE LUONG * 0.25
END
FROM NHANVIEN
GO
--Cách 2
SELECT TENNV,LUONG, THUE = CASE
	WHEN LUONG >= 0 AND LUONG <= 25000 THEN LUONG * 0.1
	WHEN LUONG >= 25000 AND LUONG <= 30000 THEN LUONG * 0.12
	WHEN LUONG >= 30000 AND LUONG <= 40000 THEN LUONG * 0.15
	WHEN LUONG >= 40000 AND LUONG <= 50000 THEN LUONG * 0.2
	ELSE LUONG * 0.25
END
FROM NHANVIEN
GO

--Lab4 - Bai 2:
-- Bai 2a: Cho biết thông tin nhân viên (HONV, TENLOT, TENNV) có MaNV là số chẵn
-- su dung vong lap select * from NHANVIEN

-- Cach 1: dung vong lap
DECLARE @n int,@i int,@maso int
SET @n = (SELECT COUNT(*) FROM NHANVIEN)
SET @i = 1
WHILE (@i <= @n)
BEGIN
	--lấy ra mã số nhân viên thứ @i
	SET @maso = CAST((SELECT MANV FROM NHANVIEN WHERE CAST(MANV as int) = @i) as int)
	--nhân viên thứ i có manv là số chẵn thì xuất ra
	IF(@maso % 2 = 0)
		BEGIN
			SELECT MANV, TENNV FROM NHANVIEN WHERE CAST(MANV as int) = @i
		END
	SET @i = @i + 1
END

-- Cach 2: khong dung vong lap
SELECT MANV, TENLOT, TENNV 
FROM NHANVIEN
WHERE CONVERT(int,MANV) %2 = 0

--Bai 2b:  Cho biết thông tin nhân viên (HONV, TENLOT, TENNV) có MaNV là số chẵn
--nhưng không tính nhân viên có MaNV là 4.
DECLARE @n int,@i int,@maso int
SET @n = (SELECT COUNT(*) FROM NHANVIEN)
SET @i = 1
WHILE (@i <= @n)
BEGIN
	SET @maso = CAST((SELECT MANV from NHANVIEN WHERE CAST(MANV as int) = @i) as int)
	IF(@maso % 2 = 0 and @maso <> 4)
		BEGIN
			SELECT MANV, TENNV from NHANVIEN WHERE CAST(MANV as int) = @i
		END
	SET @i = @i + 1
END

-- Bai 3a, Thực hiện chèn thêm một dòng dữ liệu vào bảng PhongBan theo 2 bước 
--	Nhận thông báo “ thêm dư lieu thành cong” từ khối Try
--	Chèn sai kiểu dữ liệu cột MaPHG để nhận thông báo lỗi “Them dư lieu that bai” từ khối Catch
BEGIN TRY
	INSERT INTO PHONGBAN VALUES('keToan',9,'003','2020-06-02')
	PRINT 'THEM THANH CONG'
END TRY
BEGIN CATCH
	PRINT 'THEM THAT BAI.'
	PRINT 'Error ' + cast( ERROR_NUMBER() as varchar(20)) 
		+ ': ' + ERROR_MESSAGE()
END CATCH
---------------------------
-- cách 2 ngắn gọn
BEGIN TRY
	INSERT PHONGBAN
	VALUES ('keToan',2,'003','2020-06-02')
	 -- Nếu lệnh chèn thực thi thành công in ra dòng bên dưới
	PRINT 'SUCCESS: Record was inserted.'
END TRY
-- Nếu có lỗi xảy ra khi chèn dữ liệu in ra dòng thông báo lỗi cùng với thông tin mã lỗi và thông báo lỗi
BEGIN CATCH
	PRINT 'FAILURE: Record was not inserted.'
	PRINT 'Error ' + CONVERT(varchar, ERROR_NUMBER(), 1) 
		+ ': ' + ERROR_MESSAGE()
END CATCH

-- Bai 3b,	Viết chương trình khai báo biến @chia, thực hiện phép chia @chia cho số 0 và dùng RAISERROR để thông báo lỗi.
BEGIN TRY
	DECLARE @chia int
	SET @chia = 55/0
END TRY
BEGIN CATCH
	PRINT 'Loi chia cho 0'
	DECLARE
		@ErMessage nvarchar(2048),
		@ErSeverty int,
		@ErState int
	SELECT
		@ErMessage = ERROR_MESSAGE(),
		@ErSeverty = ERROR_SEVERITY(),
		@ErState = ERROR_STATE()
		RAISERROR(@ErMessage, @ErSeverty, @ErState)
END CATCH