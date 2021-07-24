




-- chọn csdl 
use QLDA
go


--1.	Tìm các nhân viên làm việc ở phòng số 4

select *
from NHANVIEN
where PHG = 4

--2.	Tìm các nhân viên có mức lương trên 30000


select *
from NHANVIEN
where LUONG > 30000








--3.	Tìm các nhân viên có mức lương trên 25,000 ở phòng 4 hoặc các nhân viên có mức lương trên 30,000 ở phòng 5

select *
from NHANVIEN
where (LUONG > 25000 and PHG = 4)
or (LUONG > 30000 and PHG = 5)
go



--4.	Cho biết họ tên đầy đủ của các nhân viên ở TP HCM

select HONV, TENLOT, TENNV, DCHI
from NHANVIEN
where DCHI like '%Tp HCM%'
go




--5.	Cho biết họ tên đầy đủ của các nhân viên có họ bắt đầu bằng ký tự 'N'

select concat(HONV,' ',TENLOT,' ', TENNV) as hoten
from NHANVIEN
where HONV like 'N%'
go




--6.	Cho biết ngày sinh và địa chỉ của nhân viên Dinh Ba Tien.
select NGSINH, DCHI, concat(HONV,' ',TENLOT,' ', TENNV) as hoten
from NHANVIEN
where concat(HONV,'',TENLOT,'', TENNV) like N'%Đinh Bá Tiên%'



select CONCAT(HONV,' ',TENLOT,' ',TENNV)as hoten 
from NHANVIEN
where HONV like 'N%'
go