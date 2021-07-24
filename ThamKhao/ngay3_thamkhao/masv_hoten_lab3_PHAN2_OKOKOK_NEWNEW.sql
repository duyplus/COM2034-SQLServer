
use QLDA
go

--lab3_BAI1
--	Với mỗi đề án, liệt kê tên đề án và tổng số giờ làm việc một tuần của tất cả các nhân viên tham dự đề án đó. 
--o	Xuất định dạng “tổng số giờ làm việc” kiểu decimal với 2 số thập phân.
--o	Xuất định dạng “tổng số giờ làm việc” kiểu varchar



--	Với mỗi phòng ban, liệt kê tên phòng ban và lương trung bình của những nhân viên làm việc cho phòng ban đó.
--o	Xuất định dạng “luong trung bình” kiểu decimal với 2 số thập phân, sử dụng dấu phẩy để phân biệt phần nguyên và phần thập phân.
--o	Xuất định dạng “luong trung bình” kiểu varchar. Sử dụng dấu phẩy tách cứ mỗi 3 chữ số trong chuỗi ra, gợi ý dùng thêm các hàm Left, Replace
--lab3_BAI2: (2 điểm)
--Sử dụng các hàm toán học
--	Với mỗi đề án, liệt kê tên đề án và tổng số giờ làm việc một tuần của tất cả các nhân viên tham dự đề án đó.
--o	Xuất định dạng “tổng số giờ làm việc” với hàm CEILING
--o	Xuất định dạng “tổng số giờ làm việc” với hàm FLOOR
--o	Xuất định dạng “tổng số giờ làm việc” làm tròn tới 2 chữ số thập phân
--	Cho biết họ tên nhân viên (HONV, TENLOT, TENNV) có mức lương trên mức lương trung bình (làm tròn đến 2 số thập phân) của phòng "Nghiên cứu"



--Sử dụng các hàm xử lý chuỗi
--	Danh sách những nhân viên (HONV, TENLOT, TENNV, DCHI) có trên 2 thân nhân, thỏa các yêu cầu
--o	Dữ liệu cột HONV được viết in hoa toàn bộ
--o	Dữ liệu cột TENLOT được viết chữ thường toàn bộ
--o	Dữ liệu chột TENNV có ký tự thứ 2 được viết in hoa, các ký tự còn lại viết thường( ví dụ: kHanh)
--o	Dữ liệu cột DCHI chỉ hiển thị phần tên đường, không hiển thị các thông tin khác như số nhà hay thành phố.
--	Cho biết tên phòng ban và họ tên trưởng phòng của phòng ban có đông nhân viên nhất, hiển thị thêm một cột thay thế tên trưởng phòng bằng tên “Fpoly”
--Bài 4: (2 điểm)
--Sử dụng các hàm ngày tháng năm
--	Cho biết các nhân viên có năm sinh trong khoảng 1960 đến 1965.
--	Cho biết tuổi của các nhân viên tính đến thời điểm hiện tại.
--	Dựa vào dữ liệu NGSINH, cho biết nhân viên sinh vào thứ mấy.
--	Cho biết số lượng nhân viên, tên trưởng phòng, ngày nhận chức trưởng phòng và ngày nhận chức trưởng phòng hiển thi theo định dạng dd-mm-yy (ví dụ 25-04-2019)





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
SELECT MADA, CAST(SUM(THOIGIAN) AS decimal(9,2)) AS 'tổng số giờ làm việc'
FROM PHANCONG
GROUP BY MADA

--LAB3_BAI1.b
SELECT MADA, CAST(SUM(THOIGIAN) AS VARCHAR(10)) AS 'tổng số giờ làm việc'
FROM PHANCONG
GROUP BY MADA

--LAB3_BAI1: gộp lại
SELECT MADA, CAST(SUM(THOIGIAN) AS decimal(9,2)) AS 'tổng số giờ làm việc - DECIMAL',
		     CAST(SUM(THOIGIAN) AS VARCHAR(10)) AS 'tổng số giờ làm việc - VARCHAR'
FROM PHANCONG
GROUP BY MADA


--LAB3_BAI1.C.D
	--Với mỗi phòng ban, liệt kê mã phòng, tên phòng ban và lương trung bình của những nhân viên làm việc cho phòng ban đó.
	--Xuất định dạng “luong trung bình” kiểu varchar với 2 số thập phân, sử dụng dấu phẩy để phân biệt 3 chữ số.

--
--LAB3_BAI1.C
SELECT PHONGBAN.MAPHG, PHONGBAN.TENPHG, AVG(LUONG) AS 'lương trung bình'
FROM PHONGBAN, NHANVIEN
WHERE PHONGBAN.MAPHG = NHANVIEN.PHG
GROUP BY PHONGBAN.MAPHG, PHONGBAN.TENPHG

--LAB3_BAI1.D : dùng format, convert,...
SELECT PHONGBAN.MAPHG, PHONGBAN.TENPHG,FORMAT( CONVERT(decimal(10,2),AVG(LUONG)), '#,##0.00')    AS 'lương trung bình'
FROM PHONGBAN, NHANVIEN
WHERE PHONGBAN.MAPHG = NHANVIEN.PHG
GROUP BY PHONGBAN.MAPHG, PHONGBAN.TENPHG

-- LAB3_BAI1.E : inner join

SELECT PHONGBAN.MAPHG, PHONGBAN.TENPHG,FORMAT( CONVERT(decimal(10,2),AVG(LUONG)), '#,##0.00')    AS 'lương trung bình'
FROM PHONGBAN INNER JOIN NHANVIEN
ON PHONGBAN.MAPHG = NHANVIEN.PHG
GROUP BY PHONGBAN.MAPHG, PHONGBAN.TENPHG

--CÓ MÁY OK 

select phongban.MAPHG, phongban.TENPHG,convert(varchar,avg(luong),103) --103 cứ 3 số thêm dấu phẩy
from nhanvien, phongban
where nhanvien.phg = phongban.MAPHG
group by phongban.MAPHG, phongban.TENPHG
go

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
	   ROUND(SUM(PHANCONG.THOIGIAN),2)
FROM DEAN, CONGVIEC, PHANCONG
WHERE DEAN.MADA = CONGVIEC.MADA
AND CONGVIEC.STT = PHANCONG.STT
GROUP BY DEAN.MADA, DEAN.TENDEAN




--lab3_BAI2.B : cho biết lương trung bình của phòng nghiên cứu 

SELECT round(AVG(LUONG),2)
FROM PHONGBAN, NHANVIEN
WHERE PHONGBAN.MAPHG = NHANVIEN.PHG
AND PHONGBAN.TENPHG = N'Nghiên cứu'

--lab3_BAI2.C : Cho biết họ tên nhân viên (HONV, TENLOT, TENNV) có mức lương trên mức lương trung bình (làm tròn đến 2 số thập phân) của phòng "Nghiên cứu"
SELECT HONV, TENLOT, TENNV, LUONG
FROM NHANVIEN
WHERE LUONG > (
				SELECT round(AVG(LUONG),2)
				FROM PHONGBAN, NHANVIEN
				WHERE PHONGBAN.MAPHG = NHANVIEN.PHG
				AND PHONGBAN.TENPHG = N'Nghiên cứu'
			)
GO




--lab3_BAI3.A:
--Danh sách những nhân viên (HONV, TENLOT, TENNV) thỏa các yêu cầu
--o	Dữ liệu cột HONV được viết in hoa toàn bộ
--o	Dữ liệu cột TENLOT được viết chữ thường toàn bộ


--lab3_BAI3.B : cho biết lương trung bình của phòng nghiên cứu 


--lab3_BAI3.C : Cho biết họ tên nhân viên (HONV, TENLOT, TENNV) có mức lương trên mức lương trung bình (làm tròn đến 2 số thập phân) của phòng "Nghiên cứu"


--VÍ DỤ ĐƠN GIẢN

--Danh sách những nhân viên (HONV, TENLOT, TENNV) thỏa các yêu cầu
--o	Dữ liệu cột HONV được viết in hoa toàn bộ
--o	Dữ liệu cột TENLOT được viết chữ thường toàn bộ

--1. hàm upper: thành chữ hoa 
select upper('pham ngoc trinh')

-- hàm lower: thành chữ thường
select lower('PHAM NGOC TRINH')
--2. XUAT HONV, TENLOT, TENNV 
select HONV, TENLOT, upper(TENNV) --chuyển thành chữ HOA
from nhanvien
go
--
select HONV, TENLOT, lower(TENNV) --chuyển thành chữ THƯỜNG
from nhanvien
go





SELECT LEFT('CAO PHUC THINH', 3) -->>> CAO

SELECT RIGHT('CAO HOANG PHUC', 4) --->>> PHUC

--TÌM VỊ TRÍ ĐẦU TIÊN CỦA CHUỖI CON TRONG CHUỖI MẸ

SELECT CHARINDEX(' ','CAO HOANG PHUC') --->>> 4  

SELECT CHARINDEX(' ','222 Nguyễn Văn Cừ, Tp HCM')---> 4



SELECT CHARINDEX(',','222 Nguyễn Văn Cừ, Tp HCM')--->>> dau phẩy vị trí 18


SELECT SUBSTRING('222 Nguyễn Văn Cừ, Tp HCM',CHARINDEX(' ','222 Nguyễn Văn Cừ, Tp HCM')+ 1,
CHARINDEX(',','222 Nguyễn Văn Cừ, Tp HCM') - (CHARINDEX(' ','222 Nguyễn Văn Cừ, Tp HCM')+ 1) )

-- 

SELECT SUBSTRING('CAO HOANG PHUC',1,3) --->>> CAO

SELECT SUBSTRING('CAO HOANG PHUC',5,5) --->> HOANG

SELECT LEN('CAO HOANG PHUC') --->> CHIỀU DÀI CHUỖI 14

SELECT SUBSTRING('CAO HOANG PHUC',LEN('CAO HOANG PHUC')- 3,4)--->>PHUC






-- Bai 3a:	Danh sách những nhân viên (HONV, TENLOT, TENNV, DCHI) có trên 2 thân nhân, thỏa các yêu cầu
--	3a.Dữ liệu cột HONV được viết in hoa toàn bộ
--	3b.Dữ liệu cột TENLOT được viết chữ thường toàn bộ
--	3c.Dữ liệu chột TENNV có ký tự thứ 2 được viết in hoa, các ký tự còn lại viết thường( ví dụ: kHanh)
--	3d.Dữ liệu cột DCHI chỉ hiển thị phần tên đường, không hiển thị các thông tin khác như số nhà hay thành phố.


-- 
SELECT MANV, COUNT(MA_NVIEN)
FROM NHANVIEN, THANNHAN
WHERE NHANVIEN.MANV = THANNHAN.MA_NVIEN
GROUP BY MANV
GO
--
SELECT MANV, HONV, TENLOT, TENNV, DCHI, COUNT(MA_NVIEN)
FROM NHANVIEN, THANNHAN
WHERE NHANVIEN.MANV = THANNHAN.MA_NVIEN
GROUP BY MANV, HONV, TENLOT, TENNV, DCHI
GO

--Danh sách những nhân viên (HONV, TENLOT, TENNV, DCHI) có trên 2 thân nhân,
SELECT MANV, HONV, TENLOT, TENNV, DCHI, COUNT(MA_NVIEN)
FROM NHANVIEN, THANNHAN
WHERE NHANVIEN.MANV = THANNHAN.MA_NVIEN
GROUP BY MANV, HONV, TENLOT, TENNV, DCHI
HAVING COUNT(MA_NVIEN)> 2
GO
--3a. Dữ liệu cột HONV được viết in hoa toàn bộ
SELECT MANV, UPPER(HONV) AS 'HONV', TENLOT, TENNV, DCHI, COUNT(MA_NVIEN)
FROM NHANVIEN, THANNHAN
WHERE NHANVIEN.MANV = THANNHAN.MA_NVIEN
GROUP BY MANV, HONV, TENLOT, TENNV, DCHI
HAVING COUNT(MA_NVIEN)> 2
GO
--3b.Dữ liệu cột TENLOT được viết chữ thường toàn bộ
SELECT MANV, UPPER(HONV) AS 'HONV', LOWER(TENLOT) AS 'TENLOT', TENNV, DCHI, COUNT(MA_NVIEN)
FROM NHANVIEN, THANNHAN
WHERE NHANVIEN.MANV = THANNHAN.MA_NVIEN
GROUP BY MANV, HONV, TENLOT, TENNV, DCHI
HAVING COUNT(MA_NVIEN)> 2
GO
--	3c.Dữ liệu chột TENNV có ký tự thứ 2 được viết in hoa, các ký tự còn lại viết thường( ví dụ: kHanh)

SELECT MANV, UPPER(HONV) AS 'HONV', LOWER(TENLOT) AS 'TENLOT',
LOWER(LEFT(TENNV,1)) + UPPER(SUBSTRING(TENNV,2,1)) +   LOWER(SUBSTRING(TENNV,3,LEN(TENNV) - 2)) AS 'TENNV'
, DCHI, COUNT(MA_NVIEN)
FROM NHANVIEN, THANNHAN
WHERE NHANVIEN.MANV = THANNHAN.MA_NVIEN
GROUP BY MANV, HONV, TENLOT, TENNV, DCHI
HAVING COUNT(MA_NVIEN)> 2
GO
--

/*

SELECT TENNV, LOWER(LEFT(TENNV,1))
FROM NHANVIEN
--
SELECT TENNV, UPPER(SUBSTRING(TENNV,2,1))
FROM NHANVIEN
--
SELECT TENNV, LOWER(LEFT(TENNV,1)) + UPPER(SUBSTRING(TENNV,2,1)) +   LOWER(SUBSTRING(TENNV,3,LEN(TENNV) - 2)) AS 'TENNV'
FROM NHANVIEN

*/

--	3d.Dữ liệu cột DCHI chỉ hiển thị phần tên đường, không hiển thị các thông tin khác như số nhà hay thành phố.

/*
SELECT CHARINDEX(' ','222 Nguyễn Văn Cừ, Tp HCM')---> 4

SELECT CHARINDEX(',','222 Nguyễn Văn Cừ, Tp HCM')--->>> dau phẩy vị trí 18

SELECT SUBSTRING('222 Nguyễn Văn Cừ, Tp HCM',CHARINDEX(' ','222 Nguyễn Văn Cừ, Tp HCM')+ 1,
CHARINDEX(',','222 Nguyễn Văn Cừ, Tp HCM') - (CHARINDEX(' ','222 Nguyễn Văn Cừ, Tp HCM')) )
*/

SELECT MANV, UPPER(HONV) AS 'HONV', LOWER(TENLOT) AS 'TENLOT',
LOWER(LEFT(TENNV,1)) + UPPER(SUBSTRING(TENNV,2,1)) +   LOWER(SUBSTRING(TENNV,3,LEN(TENNV) - 2)) AS 'TENNV'
, SUBSTRING(DCHI,CHARINDEX(' ',DCHI)+ 1,
CHARINDEX(',',DCHI) - (CHARINDEX(' ',DCHI) + 1) ), 

COUNT(MA_NVIEN)
FROM NHANVIEN, THANNHAN
WHERE NHANVIEN.MANV = THANNHAN.MA_NVIEN
GROUP BY MANV, HONV, TENLOT, TENNV, DCHI
HAVING COUNT(MA_NVIEN)> 2

--
/*
SELECT MANV, 
 SUBSTRING(DCHI,CHARINDEX(' ',DCHI)+ 1,
CHARINDEX(',',DCHI) - (CHARINDEX(' ',DCHI) + 1) ) AS 'DCHI', 

COUNT(MA_NVIEN)
FROM NHANVIEN, THANNHAN
WHERE NHANVIEN.MANV = THANNHAN.MA_NVIEN
GROUP BY MANV,  DCHI
HAVING COUNT(MA_NVIEN)> 2
GO
*/





--3
SELECT MA_NVIEN, HONV, TENLOT, COUNT(THANNHAN.MA_NVIEN)
FROM NHANVIEN, THANNHAN
WHERE NHANVIEN.MANV = THANNHAN.MA_NVIEN
GROUP BY MA_NVIEN, HONV, TENLOT

--3a.
SELECT MA_NVIEN, upper(HONV) as 'HO', TENLOT, DCHI,  COUNT(THANNHAN.MA_NVIEN)
FROM NHANVIEN, THANNHAN
WHERE NHANVIEN.MANV = THANNHAN.MA_NVIEN
GROUP BY MA_NVIEN, HONV, TENLOT, DCHI
HAVING COUNT(THANNHAN.MA_NVIEN) > 2
--3b
SELECT MA_NVIEN, upper(HONV) as 'HO',lower(TENLOT) as 'TENLOT', DCHI,  COUNT(THANNHAN.MA_NVIEN)
FROM NHANVIEN, THANNHAN
WHERE NHANVIEN.MANV = THANNHAN.MA_NVIEN
GROUP BY MA_NVIEN, HONV, TENLOT, DCHI
HAVING COUNT(THANNHAN.MA_NVIEN) > 2
---







--	3c.Dữ liệu chột TENNV có ký tự thứ 2 được viết in hoa, các ký tự còn lại viết thường( ví dụ: kHanh)

--3.C Dữ liệu chột TENNV có ký tự thứ 2 được viết in hoa, các ký tự còn lại viết thường( ví dụ: kHanh)
select MA_NVIEN, lower(left(TENNV,1)) + upper(substring(TENNV,2,1)) + LOWER(substring(TENNV,3,LEN(TENNV)-2)) as 'TENNV',
	   count(MA_NVIEN)
from THANNHAN, NHANVIEN
where THANNHAN.MA_NVIEN = NHANVIEN.MANV
group by MA_NVIEN, TENNV
having count(MA_NVIEN)>2


--	3d.Dữ liệu cột DCHI chỉ hiển thị phần tên đường, không hiển thị các thông tin khác như số nhà hay thành phố.


SELECT CHARINDEX(' ','222 Nguyễn Văn Cừ, Tp HCM')---->>> 4

SELECT CHARINDEX(',','222 Nguyễn Văn Cừ, Tp HCM') ---->>>18.......18-5= 13


select MA_NVIEN, DCHI, SUBSTRING(DCHI,  CHARINDEX(' ',DCHI)+ 1 ,   CHARINDEX(',',DCHI) - CHARINDEX(' ',DCHI) ),
	   count(MA_NVIEN)
from THANNHAN, NHANVIEN
where THANNHAN.MA_NVIEN = NHANVIEN.MANV
group by MA_NVIEN, DCHI
having count(MA_NVIEN)>2




SELECT MA_NVIEN,NHANVIEN.TENLOT, LOWER(LEFT(NHANVIEN.TENNV,1))
FROM NHANVIEN, THANNHAN
WHERE NHANVIEN.MANV = THANNHAN.MA_NVIEN
GROUP BY MA_NVIEN,NHANVIEN.TENLOT,  LOWER(LEFT(NHANVIEN.TENNV,1))
HAVING COUNT(THANNHAN.MA_NVIEN) > 2




select MA_NVIEN, upper(HONV) as 'Họ',
	   count(MA_NVIEN)
from THANNHAN, NHANVIEN
where THANNHAN.MA_NVIEN = NHANVIEN.MANV
group by MA_NVIEN, HONV
having count(MA_NVIEN)>2


select MA_NVIEN, lower(TENLOT) as 'Tên Lót',
	   count(MA_NVIEN)
from THANNHAN, NHANVIEN
where THANNHAN.MA_NVIEN = NHANVIEN.MANV
group by MA_NVIEN,  TENLOT
having count(MA_NVIEN)>2

--pHuc
--
select len('PHUC')

-- LAY KI TU DAU CHU THUONG : lower(left(TENNV,1))
-- LAY KI TU THU 2 THANH CHU HOA upper(substring(TENNV,2,1))


--3.C Dữ liệu chột TENNV có ký tự thứ 2 được viết in hoa, các ký tự còn lại viết thường( ví dụ: kHanh)
select MA_NVIEN, lower(left(TENNV,1)) + upper(substring(TENNV,2,1)) + LOWER(substring(TENNV,3,LEN(TENNV)-2)) as 'tÊn NV',
	   count(MA_NVIEN)
from THANNHAN, NHANVIEN
where THANNHAN.MA_NVIEN = NHANVIEN.MANV
group by MA_NVIEN, TENNV
having count(MA_NVIEN)>2


SELECT CHARINDEX(' ','CAO HOANG PHUC') -->> 4..... CHU H THI VI TRI THU 5

SELECT N'222 Nguyễn Văn Cừ, Tp HCM'

SELECT CHARINDEX(' ','222 Nguyễn Văn Cừ, Tp HCM') ---->>> N LA VI TRI 4 + 1

SELECT CHARINDEX(',','222 Nguyễn Văn Cừ, Tp HCM') ---->>> 18------------->18 - 5 = 13 = Nguyễn Văn Cừ



select MA_NVIEN, DCHI,
       substring(DCHI,CHARINDEX(' ',DCHI)+1, CHARINDEX(',',DCHI) - CHARINDEX(' ',DCHI)+1) as 'Tên đường',
	   count(MA_NVIEN)
from THANNHAN, NHANVIEN
where THANNHAN.MA_NVIEN = NHANVIEN.MANV
group by MA_NVIEN, DCHI
having count(MA_NVIEN)>2


select MA_NVIEN, upper(HONV) as 'Họ', lower(TENLOT) as 'Tên Lót', TENNV,
       lower(left(TENNV,1)) + upper(substring(TENNV,2,1)) + substring(TENNV,3,LEN(TENNV)-2) as 'tÊn NV',
       substring(DCHI,CHARINDEX(' ',DCHI)+1, CHARINDEX(',',DCHI) - CHARINDEX(' ',DCHI)+1) as 'Tên đường',
	   count(MA_NVIEN)
from THANNHAN, NHANVIEN
where THANNHAN.MA_NVIEN = NHANVIEN.MANV
group by MA_NVIEN, HONV, TENLOT, TENNV, DCHI
having count(MA_NVIEN)>2


select MA_NVIEN, upper(HONV) as 'Họ', lower(TENLOT) as 'Tên Lót', TENNV,
       lower(left(TENNV,1)) + upper(substring(TENNV,2,1)) + substring(TENNV,3,LEN(TENNV)-2) as 'tÊn NV',
       substring(DCHI,CHARINDEX(' ',DCHI)+1, CHARINDEX(',',DCHI) - CHARINDEX(' ',DCHI)+1) as 'Tên đường',
	   count(MA_NVIEN)
from THANNHAN, NHANVIEN
where THANNHAN.MA_NVIEN = NHANVIEN.MANV
group by MA_NVIEN, HONV, TENLOT, TENNV, DCHI
having count(MA_NVIEN)>2





/*


Bài 3: (2 điểm)
Sử dụng các hàm xử lý chuỗi
	Danh sách những nhân viên (HONV, TENLOT, TENNV, DCHI) có trên 2 thân nhân, thỏa các yêu cầu
o	Dữ liệu cột HONV được viết in hoa toàn bộ
o	Dữ liệu cột TENLOT được viết chữ thường toàn bộ
o	Dữ liệu chột TENNV có ký tự thứ 2 được viết in hoa, các ký tự còn lại viết thường( ví dụ: kHanh)
o	Dữ liệu cột DCHI chỉ hiển thị phần tên đường, không hiển thị các thông tin khác như số nhà hay thành phố.
	Cho biết tên phòng ban và họ tên trưởng phòng của phòng ban có đông nhân viên nhất, hiển thị thêm một cột thay thế tên trưởng phòng bằng tên “Fpoly”
Bài 4: (2 điểm)
Sử dụng các hàm ngày tháng năm
	Cho biết các nhân viên có năm sinh trong khoảng 1960 đến 1965.
	Cho biết tuổi của các nhân viên tính đến thời điểm hiện tại.
	Dựa vào dữ liệu NGSINH, cho biết nhân viên sinh vào thứ mấy.
	Cho biết số lượng nhân viên, tên trưởng phòng, ngày nhận chức trưởng phòng và ngày nhận chức trưởng phòng hiển thi theo định dạng dd-mm-yy (ví dụ 25-04-2019)



*/

-- 4.A Cho biết các nhân viên có năm sinh trong khoảng 1960 đến 1965.

SELECT HONV, TENNV ,NGSINH,  convert(date,NGSINH) as 'Ng Sinh'
FROM NHANVIEN
WHERE YEAR(NGSINH) BETWEEN 1960 AND 1965

--CÁCH 2
SELECT HONV, TENNV ,NGSINH,  convert(date,NGSINH) as 'Ng Sinh'
FROM NHANVIEN
WHERE YEAR(NGSINH) >=  1960
AND YEAR(NGSINH) <=  1965

--4B. Cho biết tuổi của các nhân viên tính đến thời điểm hiện tại.
SELECT HONV, TENNV , YEAR(GETDATE()) - YEAR(NGSINH) AS 'TUOI'
FROM NHANVIEN


SELECT HONV, TENNV , YEAR(GETDATE()) - YEAR(NGSINH) AS  'TUOI'
FROM NHANVIEN

--4C. Dựa vào dữ liệu NGSINH, cho biết nhân viên sinh vào thứ mấy.

--SELECT DATENAME(WEEKDAY,'1967-02-01')

SELECT HONV, TENNV ,NGSINH,  convert(date,NGSINH) as 'Ng Sinh',
		DATENAME(WEEKDAY, NGSINH)
FROM NHANVIEN

--4D 	Cho biết số lượng nhân viên, tên trưởng phòng, ngày nhận chức trưởng phòng và ngày nhận chức trưởng phòng hiển thi theo định dạng dd-mm-yy (ví dụ 25-04-2019)



SELECT TENPHG, TRPHG, NG_NHANCHUC, B.TENNV, COUNT(A.MANV) AS 'SoLuongNV',
CONVERT(varchar, NG_NHANCHUC, 105) AS 'NgayNhanChuc'
FROM NHANVIEN A
INNER JOIN PHONGBAN ON A.PHG = PHONGBAN.MAPHG
INNER JOIN NHANVIEN B ON B.MANV = PHONGBAN.TRPHG
GROUP BY TENPHG, TRPHG, NG_NHANCHUC, B.TENNV




-- Bai 4:
-- 	Cho biết các nhân viên có năm sinh trong khoảng 1960 đến 1965.
select MANV, TENNV, convert(date,NGSINH) as 'Ng Sinh'
from NHANVIEN
where year(NGSINH) between 1960 and 1965

-- 	Cho biết tuổi của các nhân viên tính đến thời điểm hiện tại
select MANV, TenNV, YEAR(getdate()) - YEAR(NGSINH) as 'Tuoi'
from NhanVien;

-- Dựa vào dữ liệu NGSINH, cho biết nhân viên sinh vào thứ mấy.
select MANV, TENNV, convert(date,NGSINH) as 'Ng Sinh', 
       DATENAME(weekday, NGSINH) as 'WEEKDAY'
from NHANVIEN

-- Cho biết số lượng nhân viên, tên trưởng phòng và ngày nhận chức trưởng phòng hiển thi theo định dạng dd-mm-yy (ví dụ 25-04-2019)
 


SELECT TENPHG, TRPHG, NG_NHANCHUC, B.TENNV, COUNT(A.MANV) AS 'SoLuongNV',
CONVERT(varchar, NG_NHANCHUC, 105) AS 'NgayNhanChuc'
FROM NHANVIEN A
INNER JOIN PHONGBAN ON A.PHG = PHONGBAN.MAPHG
INNER JOIN NHANVIEN B ON B.MANV = PHONGBAN.TRPHG
GROUP BY TENPHG, TRPHG, NG_NHANCHUC, B.TENNV






