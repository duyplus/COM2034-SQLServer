

--bài 1: chào 500 anh em
print N'Chào 500 anh em'

--bai 2: cộng hai số
DECLARE @a int, @b int, @sum int
SET @a = 25
SET @b = 10
SET @sum = (@a + @b)
print N'Kết quả là: '+ convert(varchar(20),@sum)
-- select @sum as N'Tổng'

--bai 3: diện tích + chu vi
DECLARE @a int, @b int, @P int, @S int
SET @a = 15
SET @b = 5
SET @P = 2*(@a + @b)
SET @S = @a * @b
print N'Chu vi là: '+ convert(varchar(20),@P)
print N'Diện tích là: '+ convert(varchar(20),@S)
-- select @P as 'Chu vi', @S as N'Diện tích'

--TRUY VẤN

--1a lương cao nhất của nhân viên
SELECT MAX(LUONG) as N'Lương cao nhất' FROM NHANVIEN
--Hoặc
DECLARE @Max_Luong float
SET @Max_Luong = (SELECT MAX(LUONG) FROM NHANVIEN)
print N'Lương cao nhất là: '+ convert(varchar(20),@Max_Luong)
--SELECT @Max_Luong as N'Lương cao nhất'

-- 1.	Cho biêt nhân viên có lương cao nhất
SELECT CONCAT(HONV,' ',TENLOT,' ',TENNV) as N'Họ và tên',LUONG FROM NHANVIEN
where LUONG = (SELECT MAX(LUONG) FROM NHANVIEN)

--2a. lương  lương trung bình của phòng "Nghiên cứu”
-- Cách 1
SELECT AVG(LUONG) as N'Lương TB' FROM NHANVIEN,PHONGBAN
where NHANVIEN.PHG = PHONGBAN.MAPHG
AND PHONGBAN.TENPHG like N'Nghiên cứu'
-- Cách 2
SELECT AVG(LUONG) as N'Lương TB' FROM NHANVIEN
INNER JOIN PHONGBAN
on NHANVIEN.PHG = PHONGBAN.MAPHG
where PHONGBAN.TENPHG like N'Nghiên cứu'

--2b Cho biết họ tên nhân viên (HONV, TENLOT, TENNV)
SELECT CONCAT(HONV,' ',TENLOT,' ',TENNV) as N'Họ và tên' FROM NHANVIEN

-- 2.Cho biết họ tên nhân viên (HONV, TENLOT, TENNV) 
-- có mức lương trên mức lương trung bình của phòng "Nghiên cứu”
SELECT CONCAT(HONV,' ',TENLOT,' ',TENNV) as N'Họ và tên',LUONG FROM NHANVIEN
where LUONG > (SELECT AVG(LUONG) as N'Lương TB' FROM NHANVIEN
INNER JOIN PHONGBAN
on NHANVIEN.PHG = PHONGBAN.MAPHG
where PHONGBAN.TENPHG like N'Nghiên cứu')

--3a liệt kê lương trung bình của các phòng ban
SELECT PHG, AVG(LUONG) as N'Lương TB' FROM NHANVIEN
GROUP BY PHG

--3b liệt kê phòng ban có lương trung bình > 31000
SELECT PHG, AVG(LUONG) as N'Lương TB' FROM NHANVIEN
GROUP BY PHG
HAVING AVG(LUONG) > 31000

--3c. đếm số lượng nhân viên của các phòng ban
SELECT PHG, COUNT(*) as N'Số lượng' FROM NHANVIEN
INNER JOIN PHONGBAN
on NHANVIEN.PHG = PHONGBAN.MAPHG
GROUP BY PHG

 -- 3.Với các phòng ban có mức lương trung bình trên 30,000, liệt kê tên phòng ban và 
 -- số lượng nhân viên của phòng ban đó.
SELECT COUNT(*) as 'Số nhân viên' ,TENPHG FROM NHANVIEN
INNER JOIN PHONGBAN on PHONGBAN.MAPHG=NHANVIEN.PHG
where PHG in (SELECT PHG FROM NHANVIEN 
GROUP BY PHG 
HAVING AVG(LUONG) > 31000)
GROUP BY TENPHG

-- 4.Với mỗi phòng ban, cho biết tên phòng ban và số lượng đề án mà phòng ban đó chủ trì
SELECT TENPHG, COUNT(MADA) as N'Số đề án',MAPHG FROM DEAN
INNER JOIN PHONGBAN
on PHONGBAN.MAPHG = DEAN.PHONG
GROUP BY TENPHG,MAPHG