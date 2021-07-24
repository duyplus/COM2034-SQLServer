

use QLDA
go



--1. Nhập a, b và 1 phép toán. Xuất ra kết quả dựa vào phép toán đó (if)

--khai báo
declare @a float
declare @b float
declare @pheptoan varchar(1)
--gán giá trị
set @a = 5
set @b = 2
set @pheptoan = '/'
-- xử lý
if(@pheptoan = '+')
	print 'kq = ' + cast((@a + @b) as varchar(10))
else if(@pheptoan = '-')
	print 'kq = ' + cast((@a - @b) as varchar(10))
else if(@pheptoan = 'x')
	print 'kq = ' + cast((@a * @b) as varchar(10))
else if(@pheptoan = '/')
	print 'kq = ' + cast((@a / @b) as varchar(10))
else
	print 'khong co phep toan nay.'






-- giải ......



--Câu 2 : làm lại câu 1 nhưng dùng lệnh case ..... when
--khai báo
declare @a float
declare @b float
declare @pheptoan varchar(1)
--gán giá trị
set @a = 5
set @b = 2
set @pheptoan = 'x'

print 'kq = '+ 
case
	when @pheptoan = '+' then cast((@a + @b) as varchar(10))
	when @pheptoan = '-' then cast((@a - @b) as varchar(10))
	when @pheptoan = 'x' then cast((@a * @b) as varchar(10))
	when @pheptoan = '/' then cast((@a / @b) as varchar(10))
	else
		'khong co phep toan nay'
end -- ket thuc case

--câu 3 : Xuất ra 10 câu Chào Anh Em

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
declare @i int
--1. khởi gán
set @i = 1 --1. nhớ khởi gán biến i trước vòng lặp nhé

while (@i <= 10)
BEGIN
	print 'Chào 500 Anh Em'
	set @i = @i + 1  --2. nhớ tăng biến i lên 1 trong vòng lặp
END

--


--  Bai 1a, Viết chương trình xem xét có tăng lương cho nhân viên hay không. Hiển thị cột thứ 1 là TenNV, cột thứ 2 nhận giá trị
--	“TangLuong” nếu lương hiện tại của nhân viên nhỏ hơn trung bình lương trong phòng mà nhân viên đó đang làm việc. 
--	“KhongTangLuong “ nếu lương hiện tại của nhân viên lớn hơn trung bình lương trong phòng mà nhân viên đó đang làm việc.
--CHẠY NHỚ QUÉT 3 DÒNG 1,2,3 DƯỚI 
--1. khai báo 1 biến kiểu bảng @LuongTBPB có 2 cột
declare @LuongTBPB Table (PHG int, LuongTB float)
--2. thêm vào bảng tạm @LuongTBPB
INSERT INTO @LuongTBPB
select PHG, AVG(Luong) 
from NHANVIEN
group by PHG
-- 
--
--3
select TENNV, ketqua =  case
				when LUONG < LuongTB then 'Tang luong'
				when LUONG >= LuongTB then 'khong tang luong'			
			end
from @LuongTBPB as a, NHANVIEN b
where b.PHG = a.PHG
--
-- Bai 1b, Viết chương trình phân loại nhân viên dựa vào mức lương.
-- Nếu lương nhân viên nhỏ hơn trung bình lương trong phòng mà 
-- nhân viên đó đang làm việc thì xếp loại “nhanvien”, ngược lại xếp loại “truongphong”
--cách 1
--khai bao bang tạm và thêm dữ liệu vào bảng tạm
declare @LuongTBPB2 Table (PHG int, LuongTB float)
INSERT INTO @LuongTBPB2
select PHG, AVG(Luong) 
from NHANVIEN
group by PHG

select TENNV, LUONG, LUONGTB, IIF(LUONG < LuongTB,'Nhan Vien','Truong phong') as 'Chuc vu'				
from @LuongTBPB2 as a, NHANVIEN b
where a.PHG = b.PHG

--cách 2

-- khai báo 1 biến kiểu bảng @LuongTBPB có 2 cột
declare @LuongTBPB Table (PHG int, LuongTB float)
-- thêm vào bảng tạm @LuongTBPB
INSERT INTO @LuongTBPB
select PHG, AVG(Luong) 
from NHANVIEN
group by PHG
-- 
select TENNV,luong, chucVu =  case
				when LUONG < LuongTB then 'NhanVien'
				when LUONG >= LuongTB then 'TruongPhong'			
			end
from @LuongTBPB as a, NHANVIEN b
where b.PHG = a.PHG


--Bai 1c, Viết chương trình hiển thị TenNV như hình bên dưới, tùy vào cột phái của nhân viên
--CÁCH 1
select KETQUA = case 
					when PHAI = 'Nam' then 'Mr. '+ TENNV
					when PHAI = N'Nữ' then 'Ms. '+ TENNV
				else 
					N'FREE.SEX ' + TENNV 
			 end, PHAI
from NHANVIEN
--CÁCH 2
select KETQUA = case PHAI
					when 'Nam' then 'Mr. '+ TENNV
					when N'Nữ' then 'Ms. '+ TENNV
				else 
					'FREE.SEX ' + TENNV 
			 end, PHAI
from NHANVIEN

--bai1d.	Viết chương trình tính thuế mà nhân viên phải đóng theo công thức:
--o	0<luong<=25000 thì đóng 10% tiền lương
--o	25000<luong<=30000 thì đóng 12% tiền lương
--o	30000<luong<=40000 thì đóng 15% tiền lương
--o	40000<luong<=50000 thì đóng 20% tiền lương
--o	Luong>50000 đóng 25% tiền lương
--cách 1
SELECT TENNV, LUONG, THUE  = 
					 CASE
						when luong between 0 and 25000 then 0.1*luong	
						when luong between 25001 and 30000 then 0.12*luong	
						when luong between 30001 and 40000 then 0.15*luong	
						when luong between 40001 and 50000 then 0.2*luong	
						else  0.25*luong	
					 END
FROM NHANVIEN

--cách 2
SELECT TENNV, LUONG, THUE  = luong
					 CASE
						when luong >= 0 and luong <= 25000 then 0.1*luong	
						when luong >= 25001 and luong <= 30000 then 0.12*luong	
						when luong >= 30001 and luong <= 40000 then 0.15*luong	
						when luong >= 40001 and luong <= 50000 then 0.2*luong	
						else  0.25*luong	
					 END
FROM NHANVIEN

--cách 3
SELECT TENNV, LUONG, THUE  = 
					 CASE
						when luong  <= 25000 then 0.1*luong	
						when luong  <= 30000 then 0.12*luong	
						when luong  <= 40000 then 0.15*luong	
						when luong  <= 50000 then 0.2*luong	
						else  0.25*luong	
					 END
FROM NHANVIEN

--cách 4
SELECT TENNV, LUONG, THUE  = luong*
					 CASE
						when luong  <= 25000 then 0.1
						when luong  <= 30000 then 0.12	
						when luong  <= 40000 then 0.15	
						when luong  <= 50000 then 0.2
						else  0.25*luong	
					 END
FROM NHANVIEN



---------------------------------------------------------------------------------------------


--bài 2a:  Cho biết thông tin nhân viên (HONV, TENLOT, TENNV) có MaNV là số chẵn.



use QLDA
go
--khai báo biến...............dùng để lặp 
declare @n int  -- đếm tổng nhân viên
declare @i int -- chỉ số dùng trong vòng lặp
declare @maso int
--xác định số nhân viên
set @n = (select count(*) from NHANVIEN)
--lặp
set @i = 1
while (@i <= @n)
begin
	--lấy ra mã số nhân viên thứ @i
	set @maso =cast( (select manv from nhanvien where cast(manv as int) = @i)  as int)

	--nhân viên thứ i có manv là số chẵn thì xuất ra
	if( @maso % 2 = 0 )
	begin
		select manv, tennv  from nhanvien where cast(manv as int) = @i
	end
	set @i = @i + 1
end

--bài 2b:  Cho biết thông tin nhân viên (HONV, TENLOT, TENNV) có MaNV là số chẵn nhưng không tính nhân viên có MaNV là 4.

use QLDA
go
--khai báo biến...............dùng để lặp 
declare @n int  -- đếm tổng nhân viên
declare @i int -- chỉ số dùng trong vòng lặp
declare @maso int
--xác định số nhân viên
set @n = (select count(*) from NHANVIEN)
--lặp
set @i = 1
while (@i <= @n)
begin
	--lấy ra mã số nhân viên thứ @i
	set @maso =cast( (select manv from nhanvien where cast(manv as int) = @i)  as int)

	--nhân viên thứ i có manv là số chẵn thì xuất ra
	if( @maso % 2 = 0  and @maso <> 4 )
	begin
		select manv, tennv  from nhanvien where cast(manv as int) = @i
	end
	set @i = @i + 1
end

--bài 3a.
--	Thực hiện chèn thêm một dòng dữ liệu vào bảng PhongBan theo 2 bước

--o	Nhận thông báo “ thêm dư lieu thành cong” từ khối Try
--o	Chèn sai kiểu dữ liệu cột MaPHG để nhận thông báo lỗi “Them dư lieu that bai” từ khối Catch

BEGIN TRY
	INSERT INTO PHONGBAN VALUES('keToan',9,'003','2020-06-02')
	PRINT 'THEM THANH CONG'
END TRY
BEGIN CATCH
	--PRINT 'THEM THAT BAI.'
	--IF(ERROR_NUMBER() = 2627)
	--	PRINT 'TRUNG KHOA CHINH'
	--ELSE IF ( ERROR_NUMBER()  = 547)
	--	PRINT 'LOI KHOA NGOAI'
	--ELSE
	--	PRINT 'MA LOI : '+ CAST(ERROR_NUMBER() AS VARCHAR(10))  + ERROR_MESSAGE
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
------------------
-- Bai 3b,	Viết chương trình khai báo biến @chia, thực hiện phép chia @chia cho số 0 và dùng RAISERROR để thông báo lỗi.
Begin try
	declare @chia int
	set @chia = 55/0
end try
begin catch
	print 'loi chia cho 0'
	raiserror('loi chia het cho khong nhe',15,1) 
	--cấp độ lỗi và trạng thái -- Msg 50000, Level 15, State 1, Line 310
end catch
