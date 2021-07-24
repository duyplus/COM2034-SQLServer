
USE QLDA
GO

--1.
CREATE PROC sp_Chao
as
BEGIN
	PRINT N'Chào 500 anh em!'
END
-- thực thi
EXEC sp_Chao
GO
-- Lab5 - Bai 1
--Bai 1a: In ra dòng ‘Xin chào’ + @ten với @ten là tham số đầu vào là tên Tiếng Việt có dấu của bạn.
CREATE PROC sp_bai1a
@ten nvarchar(50)
as
BEGIN
	PRINT N'Xin chào ' + @ten
END
GO
-- thực thi
EXEC sp_bai1a N'Hoàng Duy'
GO

--Bai 1b: Nhập vào 2 số @s1,@s2. In ra câu ‘Tổng là : @tg’ với @tg=@s1+@s2.
CREATE PROC sp_bai1b
@a int, @b int
as
BEGIN
	DECLARE @tong int
	SET @tong = @a + @b
	PRINT N'Kết quả là: '+ CAST(@tong as varchar(10))
END
GO
-- thực thi
EXEC sp_bai1b 5,7
GO

--Bai 1c: Nhập vào số nguyên @n. In ra tổng các số chẵn từ 1 đến @n.
CREATE PROC sp_bai1c
@n int
as
BEGIN
	DECLARE @i int, @tong int
	SET @i = 1
	SET @tong = 0
	WHILE(@i <= @n)
	BEGIN
		IF(@i % 2 = 0)
			SET @tong = @tong + @i
		SET @i = @i + 1
	END
	PRINT N'Kết quả là: '+ CAST(@tong as varchar(10))
END
GO
-- thực thi
EXEC sp_bai1c 6
GO

--Bai 1d: Nhập vào 2 số. In ra ước chung lớn nhất của chúng theo gợi ý dưới đây:
--b1. Không mất tính tổng quát giả sử a <= A
--b2. Nếu A chia hết cho a thì : (a,A) = a ngược lại : (a,A) = (A%a,a) hoặc (a,A) = (a,A-a)
--b3. Lặp lại b1,b2 cho đến khi điều kiện trong b2 được thỏa
CREATE PROC sp_bai1d
@a int, @b int
as
BEGIN
	WHILE(@a <> @b)
	BEGIN
		IF(@a > @b)
			SET @a = @a - @b
		ELSE
			SET @b = @b - @a
	END
	PRINT N'Ước chung lớn nhất là: '+ CAST(@a as varchar(10))
END
GO
-- thực thi
EXEC sp_bai1d 18,12
GO

--Lab 5 - Bai 2
--Bai 2a: Nhập vào @Manv, xuất thông tin các nhân viên theo @Manv.
CREATE PROC sp_bai2a
@manv nvarchar(50)
as
BEGIN
	SELECT * FROM NHANVIEN
	WHERE MANV = @manv
END
GO
-- thực thi
EXEC sp_bai2a '001'
EXEC sp_bai2a '003'
GO

--Bai 2b: Nhập vào @MaDa (mã đề án), cho biết số lượng nhân viên tham gia đề án đó
CREATE PROC sp_bai2b
@MaDa int
as
BEGIN
	SELECT MADA, COUNT(*) as 'So Luong NV' FROM PHANCONG
	GROUP BY MADA
	HAVING MADA = @MaDa
END
GO
-- thực thi
EXEC sp_bai2b 10
GO

--Bai 2c: Nhập vào @MaDa và @Ddiem_DA (địa điểm đề án), cho biết số lượng nhân viên tham gia đề án có mã đề án là @MaDa và địa điểm đề án là @Ddiem_DA
CREATE PROC sp_bai2c
@MaDA int,
@DDiem_DA nvarchar(20)
as
BEGIN
	SELECT PHANCONG.MADA, COUNT(*) as 'So Luong NV' FROM PHANCONG
	INNER JOIN DEAN ON DEAN.MADA = PHANCONG.MADA
	WHERE DDIEM_DA = @DDiem_DA
	AND DEAN.MADA = @MaDA
	GROUP BY PHANCONG.MADA
END
GO
-- thực thi
EXEC sp_bai2c 3,N'TP HCM'
GO

--Bai 2d: Nhập vào @Trphg (mã trưởng phòng), xuất thông tin các nhân viên có trưởng phòng là @Trphg và các nhân viên này không có thân nhân.
CREATE PROC sp_bai2d
@Trphg nvarchar(10)
as
BEGIN
	SELECT * FROM NHANVIEN
	WHERE MA_NQL = @Trphg
	AND MANV not in (SELECT DISTINCT MA_NVIEN FROM THANNHAN)
END
GO
-- thực thi
EXEC sp_bai2d '001'
EXEC sp_bai2d '005'
GO

--Bai 2e: Nhập vào @Manv và @Mapb, kiểm tra nhân viên có mã @Manv có thuộc phòng ban có mã @Mapb hay không
-- Cách 1
CREATE PROC sp_bai2e
@MaNV nvarchar(10),
@MaPB int
as
BEGIN
	IF EXISTS (SELECT * FROM NHANVIEN
				WHERE PHG = @MaPB AND MANV = @MaNV)
		PRINT N'Có thuộc'
	ELSE
		PRINT N'Không thuộc'
END
-- Cách 2
CREATE PROC sp_bai2e
@MaNV nvarchar(10),
@MaPB int
as
BEGIN
	IF EXISTS (SELECT * FROM NHANVIEN
				WHERE PHG = @MaPB AND MANV = @MaNV)
		PRINT CAST(@MaNV as varchar(10)) + N' Có thuộc phòng ' + CAST(@MaPB as varchar(10))
	ELSE
		PRINT CAST(@MaNV as varchar(10)) + N' Không thuộc phòng ' + CAST(@MaPB as varchar(10))
END
GO
-- thực thi
EXEC sp_bai2e '001',4
EXEC sp_bai2e '001',5
GO

-- Lab 5 - Bai 3
--Bai 3a: Thêm phòng ban có tên CNTT vào csdl QLDA, các giá trị được thêm vào dưới dạng tham số đầu vào, kiếm tra nếu trùng Maphg thì thông báo thêm thất bại.
CREATE PROC sp_bai3a
@TenPHG nvarchar(15),
@MaPHG int,
@TrPHG nvarchar(15),
@Ng_NhanChuc date
as
BEGIN
	IF EXISTS (SELECT * FROM PHONGBAN WHERE MAPHG = @MaPHG)
		PRINT N'Đã tồn tại, không thêm vào được!'
	ELSE
		INSERT INTO PHONGBAN
		VALUES(@TenPHG,@MaPHG,@TrPHG,@Ng_NhanChuc)
END
GO
-- thực thi
EXEC sp_bai3a 'Hanh Chinh',12,'007','2020-05-05'
GO

--Bai 3b: Cập nhật phòng ban có tên CNTT thành phòng IT.
CREATE PROC sp_bai3b
@TenPB nvarchar(10)
as
BEGIN
	UPDATE PHONGBAN SET TENPHG = @TenPB
	WHERE TENPHG = N'Công Nghệ Thông Tin'
END
GO
-- thực thi
EXEC sp_bai3b 'IT'
GO

--Bai 3c: Thêm một nhân viên vào bảng NhanVien, tất cả giá trị đều truyền dưới dạng tham số đầu vào với điều kiện:
--Nhân viên này trực thuộc phòng IT
--Nhận @luong làm tham số đầu vào cho cột Luong, nếu @luong<25000 thì nhân viên này do nhân viên có mã 009 quản lý, ngươc lại do nhân viên có mã 005 quản lý
--Nếu là nhân viên nam thi nhân viên phải nằm trong độ tuổi 18-65, nếu là nhân viên nữ thì độ tuổi phải từ 18-60.
