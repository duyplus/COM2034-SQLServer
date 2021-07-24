
USE QLDA
GO

--lab3_BAI1
--	Với mỗi đề án, liệt kê tên đề án và tổng số giờ làm việc một tuần của tất cả các nhân viên tham dự đề án đó.
--a	Xuất định dạng “tổng số giờ làm việc” kiểu decimal với 2 số thập phân.
--b	Xuất định dạng “tổng số giờ làm việc” kiểu varchar

--	Với mỗi phòng ban, liệt kê tên phòng ban và lương trung bình của những nhân viên làm việc cho phòng ban đó.
--c	Xuất định dạng “luong trung bình” kiểu decimal với 2 số thập phân, sử dụng dấu phẩy để phân biệt phần nguyên và phần thập phân.
--d	Xuất định dạng “luong trung bình” kiểu varchar. Sử dụng dấu phẩy tách cứ mỗi 3 chữ số trong chuỗi ra, gợi ý dùng thêm các hàm Left, Replace

--lab3_BAI2: (2 điểm)
--Sử dụng các hàm toán học
-- Với mỗi đề án, liệt kê tên đề án và tổng số giờ làm việc một tuần của tất cả các nhân viên tham dự đề án đó.
-- Xuất định dạng “tổng số giờ làm việc” với hàm CEILING
-- Xuất định dạng “tổng số giờ làm việc” với hàm FLOOR
-- Xuất định dạng “tổng số giờ làm việc” làm tròn tới 2 chữ số thập phân
--	Cho biết họ tên nhân viên (HONV, TENLOT, TENNV) có mức lương trên mức lương trung bình (làm tròn đến 2 số thập phân) của phòng "Nghiên cứu"

SELECT 'HÔM NAY LÀ NGÀY : ' + CAST(GETDATE() AS VARCHAR)
PRINT 'HÔM NAY LÀ NGÀY : ' + CAST(GETDATE() AS VARCHAR)

--floor : làm tròn xuống
PRINT(FLOOR(5.2))
PRINT(FLOOR(5.7))

--CEILING : làm tròn lên
PRINT(CEILING(5.7))
PRINT(CEILING(5.3))

-- làm tròn tới bao nhiêu số lẻ
print(round(5.555,2))
print(round(5.554,2))
print(round(5.554,1))

--LAB3_BAI1

--Với mỗi đề án, liệt kê mã đề án và tổng số giờ làm việc đề án đó. 
--a.	Xuất định dạng “tổng số giờ làm việc” kiểu decimal với 2 số thập phân.
--b.	Xuất định dạng “tổng số giờ làm việc” kiểu varchar
USE QLDA
GO

--LAB3_BAI1

--LAB3_BAI1.a
SELECT MADA, CAST(SUM(THOIGIAN) as DECIMAL(6,2)) as N'Thời gian' FROM PHANCONG
GROUP BY MADA

--LAB3_BAI1.b
SELECT MADA, CAST(SUM(THOIGIAN) as VARCHAR(20)) as N'Thời gian' FROM PHANCONG
GROUP BY MADA

--LAB3_BAI1: gộp lại
SELECT MADA,
CAST(SUM(THOIGIAN) as DECIMAL(6,2)) as N'Thời gian - DECIMAL',
CAST(SUM(THOIGIAN) as VARCHAR(20)) as N'Thời gian - VARCHAR'
FROM PHANCONG
GROUP BY MADA

--LAB3_BAI1.C.D
	--Với mỗi phòng ban, liệt kê mã phòng, tên phòng ban và lương trung bình của những nhân viên làm việc cho phòng ban đó.
	--Xuất định dạng “luong trung bình” kiểu varchar với 2 số thập phân, sử dụng dấu phẩy để phân biệt 3 chữ số.
--
--LAB3_BAI1.C
SELECT PHONGBAN.MAPHG, PHONGBAN.TENPHG, AVG(LUONG) as N'Lương TB'
FROM PHONGBAN, NHANVIEN
WHERE PHONGBAN.MAPHG = NHANVIEN.PHG
GROUP BY PHONGBAN.MAPHG, PHONGBAN.TENPHG

--LAB3_BAI1.D : dùng format, convert,...
SELECT PHONGBAN.MAPHG, PHONGBAN.TENPHG,
FORMAT(CONVERT(DECIMAL(10,2), AVG(LUONG)), '#,##0.00' ) as N'Lương TB'
FROM PHONGBAN, NHANVIEN
WHERE PHONGBAN.MAPHG = NHANVIEN.PHG
GROUP BY PHONGBAN.MAPHG, PHONGBAN.TENPHG

-- LAB3_BAI1.E : inner join
SELECT PHONGBAN.MAPHG, PHONGBAN.TENPHG,
FORMAT(CONVERT(DECIMAL(10,2), AVG(LUONG)), '#,##0.00' ) as N'Lương TB'
FROM PHONGBAN
inner join NHANVIEN on NHANVIEN.PHG = PHONGBAN.MAPHG
GROUP BY PHONGBAN.MAPHG, PHONGBAN.TENPHG

--CÓ MÁY OK 
select TENPHG, CONVERT(decimal(10,2), AVG(LUONG)) as N'Lương TB',
left(CONVERT(decimal(10,2), AVG(LUONG)),3) + 
replace(CONVERT(decimal(10,2), AVG(LUONG)),left(CONVERT(decimal(10,2), AVG(LUONG)),3),',')
from PHONGBAN
inner join NHANVIEN on NHANVIEN.PHG = PHONGBAN.MAPHG
group by TENPHG
--lab3_bai2 :

--	Với mỗi đề án, liệt kê mã đề án, tên đề án và tổng số giờ làm việc một tuần của tất cả các nhân viên tham dự đề án đó.
--o	Xuất định dạng “tổng số giờ làm việc” với hàm CEILING
--o	Xuất định dạng “tổng số giờ làm việc” với hàm FLOOR
--o	Xuất định dạng “tổng số giờ làm việc” làm tròn tới 2 chữ số thập phân ROUND


--o	Cho biết họ tên nhân viên (HONV, TENLOT, TENNV) có mức lương trên mức lương trung bình (làm tròn đến 2 số thập phân) của phòng "Nghiên cứu"

--lab3_bai2.A.
SELECT DEAN.MADA, DEAN.TENDEAN, SUM(PHANCONG.THOIGIAN),
		CEILING(SUM(PHANCONG.THOIGIAN)),
		FLOOR(SUM(PHANCONG.THOIGIAN)),
		ROUND(SUM(PHANCONG.THOIGIAN), 2)
FROM DEAN
INNER JOIN CONGVIEC ON DEAN.MADA = CONGVIEC.MADA
INNER JOIN PHANCONG ON CONGVIEC.STT = PHANCONG.STT
GROUP BY DEAN.MADA, DEAN.TENDEAN

--lab3_BAI2.B : cho biết lương trung bình của phòng nghiên cứu 
SELECT ROUND(AVG(LUONG),2) as N'Lương TB' FROM NHANVIEN
INNER JOIN PHONGBAN ON PHONGBAN.MAPHG = NHANVIEN.PHG
WHERE TENPHG like N'Nghiên cứu'

--lab3_BAI2.C : Cho biết họ tên nhân viên (HONV, TENLOT, TENNV) có mức lương trên mức lương trung bình (làm tròn đến 2 số thập phân) của phòng "Nghiên cứu"
SELECT CONCAT(HONV,' ',TENLOT,' ',TENNV) as N'Họ và tên', LUONG as N'Lương TB' FROM NHANVIEN
WHERE LUONG >= (SELECT ROUND(AVG(LUONG),2) FROM NHANVIEN
INNER JOIN PHONGBAN ON PHONGBAN.MAPHG = NHANVIEN.PHG
WHERE TENPHG like N'Nghiên cứu')

--lab3_BAI3.A:
--Danh sách những nhân viên (HONV, TENLOT, TENNV) thỏa các yêu cầu
--o	Dữ liệu cột HONV được viết in hoa toàn bộ
--o	Dữ liệu cột TENLOT được viết chữ thường toàn bộ
select UPPER(HONV), TENLOT, TENNV --chuyển thành chữ HOA
from NHANVIEN
go
--
select HONV, LOWER(TENLOT), TENNV --chuyển thành chữ THƯỜNG
from nhanvien
go
--
SELECT MANV, COUNT(MA_NVIEN) FROM NHANVIEN, THANNHAN
WHERE NHANVIEN.MANV = THANNHAN.MA_NVIEN
GROUP BY MANV
GO

--lab3_BAI3.B :
SELECT MANV, HONV, TENLOT, TENNV, DCHI, COUNT(MA_NVIEN) FROM NHANVIEN, THANNHAN
WHERE NHANVIEN.MANV = THANNHAN.MA_NVIEN
GROUP BY MANV, HONV, TENLOT,TENNV, DCHI
GO
--
SELECT MANV, HONV, TENLOT, TENNV, DCHI, COUNT(MA_NVIEN) FROM NHANVIEN, THANNHAN
WHERE NHANVIEN.MANV = THANNHAN.MA_NVIEN
GROUP BY MANV, HONV, TENLOT,TENNV, DCHI
HAVING COUNT(MA_NVIEN) > 2
GO
--
SELECT MANV, UPPER(HONV) as 'HONV', LOWER(TENLOT) as 'TENLOT', TENNV, DCHI, COUNT(MA_NVIEN) as 'SoLuongNV'
FROM NHANVIEN, THANNHAN
WHERE NHANVIEN.MANV = THANNHAN.MA_NVIEN
GROUP BY MANV, HONV, TENLOT,TENNV, DCHI
HAVING COUNT(MA_NVIEN) > 2
GO

--lab3_BAI3.C :
SELECT MANV,
UPPER(HONV) AS 'HONV',
LOWER(TENLOT) AS 'TENLOT',
LOWER(LEFT(TENNV,1)) + UPPER(SUBSTRING(TENNV,2,1)) + LOWER(SUBSTRING(TENNV,3,LEN(TENNV)-2)) AS 'TENNV',
DCHI, COUNT(MA_NVIEN) FROM NHANVIEN, THANNHAN
WHERE NHANVIEN.MANV = THANNHAN.MA_NVIEN
GROUP BY MANV, HONV, TENLOT,TENNV, DCHI
HAVING COUNT(MA_NVIEN) > 2
GO

--lab3_BAI3.D
--Danh sách những nhân viên (HONV, TENLOT, TENNV) thỏa các yêu cầu
-- Dữ liệu cột HONV được viết in hoa toàn bộ
-- Dữ liệu cột TENLOT được viết chữ thường toàn bộ
SELECT MANV,
SUBSTRING(DCHI,CHARINDEX(' ',DCHI)+ 1, CHARINDEX(',',DCHI) - (CHARINDEX(' ',DCHI) + 1)),
COUNT(MA_NVIEN) FROM NHANVIEN, THANNHAN
WHERE NHANVIEN.MANV = THANNHAN.MA_NVIEN
GROUP BY MANV, DCHI
HAVING COUNT(MA_NVIEN) > 2
GO

--Lab4
-- Cho biết các nhân viên có năm sinh trong khoảng 1960 đến 1965.
SELECT CONCAT(HONV,' ',TENLOT,' ',TENNV) AS 'FULLNAME', CONVERT(date,NGSINH) AS 'NGSINH'
FROM NHANVIEN
WHERE YEAR(NGSINH) >= 1960 AND YEAR(NGSINH) <= 1965

SELECT CONCAT(HONV,' ',TENLOT,' ',TENNV) AS 'FULLNAME', CONVERT(date,NGSINH) AS 'NGSINH'
FROM NHANVIEN
WHERE YEAR(NGSINH) BETWEEN 1960 AND 1965

-- Cho biết tuổi của các nhân viên tính đến thời điểm hiện tại.
SELECT CONCAT(HONV,' ',TENLOT,' ',TENNV) AS 'FULLNAME', YEAR(GETDATE()) - YEAR(NGSINH) AS 'TUOI'
FROM NHANVIEN

-- Dựa vào dữ liệu NGSINH, cho biết nhân viên sinh vào thứ mấy.
SELECT CONCAT(HONV,' ',TENLOT,' ',TENNV) AS 'FULLNAME', YEAR(GETDATE()) - YEAR(NGSINH) AS 'TUOI',
DATENAME(WEEKDAY,NGSINH) AS 'THU'
FROM NHANVIEN

-- Cho biết số lượng nhân viên, tên trưởng phòng, ngày nhận chức trưởng phòng và ngày
--nhận chức trưởng phòng hiển thi theo định dạng dd-mm-yy (ví dụ 25-04-2019)
SELECT TENPHG, TRPHG, B.TENNV, COUNT(A.MANV) AS 'SoLuongNV',
CONVERT(varchar, NG_NHANCHUC, 105) AS 'NgayNhanChuc'
FROM NHANVIEN A
INNER JOIN PHONGBAN ON A.PHG = PHONGBAN.MAPHG
INNER JOIN NHANVIEN B ON B.MANV = PHONGBAN.TRPHG
GROUP BY TENPHG, TRPHG, NG_NHANCHUC, B.TENNV