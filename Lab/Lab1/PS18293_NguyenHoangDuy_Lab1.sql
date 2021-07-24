-- 1. Tìm các nhân viên làm việc ở phòng số 4
SELECT * FROM NHANVIEN
WHERE PHG = 4;
go
-- 2. Tìm các nhân viên có mức lương trên 30000
SELECT * FROM NHANVIEN
WHERE LUONG >= 30000;
go
-- 3. Tìm các nhân viên có mức lương trên 25,000 ở phòng 4 hoặc các nhân viên có mức lương trên 30,000 ở phòng 5
SELECT * FROM NHANVIEN
WHERE (LUONG >= 25000 and PHG = 4) or (LUONG >= 30000 and PHG = 5);
go
-- 4. Cho biết họ tên đầy đủ của các nhân viên ở TP HCM
SELECT CONCAT(HONV,' ',TENLOT,' ',TENNV) as HoVaTen, DCHI FROM NHANVIEN
WHERE DCHI like '%HCM%';
go
-- 5. Cho biết họ tên đầy đủ của các nhân viên có họ bắt đầu bằng ký tự
SELECT CONCAT(HONV,' ',TENLOT,' ',TENNV) as HoVaTen FROM NHANVIEN
WHERE HONV like 'N%';
go
-- 6. Cho biết ngày sinh và địa chỉ của nhân viên Dinh Ba Tien.
SELECT CONCAT(HONV,' ',TENLOT,' ',TENNV) as HoVaTen, NGSINH, DCHI FROM NHANVIEN
WHERE CONCAT(HONV,'',TENLOT,'',TENNV) like N'%Đinh Bá Tiên%';