
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


--lab3_BAI3.D
--Danh sách những nhân viên (HONV, TENLOT, TENNV) thỏa các yêu cầu
--o	Dữ liệu cột HONV được viết in hoa toàn bộ
--o	Dữ liệu cột TENLOT được viết chữ thường toàn bộ

select HONV, TENLOT, upper(TENNV) --chuyển thành chữ HOA
from nhanvien
go
--
select HONV, TENLOT, lower(TENNV) --chuyển thành chữ THƯỜNG
from nhanvien
go






