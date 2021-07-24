
use masv_hoten_NHATRO2
go

create table TAIKHOAN
(
	TENNGUOIDUNG VARCHAR(10) Primary key,
	MATKHAU VARCHAR(10),
	TUOI INT
)
GO

select *
from TaiKhoan
go

--1. insert 
insert into TaiKhoan values ('teo','123',20)
insert into TaiKhoan values ('phuc','123',20)
insert into TaiKhoan values ('ti','123',20)
--

--câu 1 : Viết 1 trigger loại insert tên là sp_cau1 không cho phép thêm Tuoi nhỏ hơn 18 tuổi
create trigger sp_cau1  --1. tên trigger
ON TaiKhoan --2. trên bảng tài khoản 
for INSERT  --3. loại insert.....tự động gọi khi insert vào bảng TAIKHOAN
AS
if (select Tuoi from inserted) < 18
BEGIN
	print N'Tuổi phải lớn hơn 18.'
	rollback transaction --trở lại lúc ban đầu chưa được insert
END
go
--thêm
insert into TaiKhoan values ('chipheo','123',15)

--câu 2 : Viết 1 trigger loại insert tên là sp_cau2 không cho phép thêm MẬT KHẨU RỖNG
create trigger sp_cau2  --1. tên trigger
ON TaiKhoan --2. trên bảng tài khoản 
for INSERT  --3. loại insert.....tự động gọi khi insert vào bảng TAIKHOAN
AS
if (select MATKHAU from inserted) = '' 
BEGIN
	print N'MẬT KHẨU KHÔNG ĐƯỢC RỖNG.'
	rollback transaction --trở lại lúc ban đầu chưa được insert ...HỦY KO THÊM
END
go
--thêm VÀO BẢNG TAIKHOAN THÌ CÁC TRIGGER PHÍA TRÊN TỰ ĐỘNG ĐƯỢC THI HÀNH
insert into TaiKhoan values ('chipheo2','',19)




select *
from  LOAINHA
go
insert into  LOAINHA values('','mo ta 1')
go
-----
select *
from  LOAINHA
from 




---câu 3 . Viết 1 trigger loại insert tên là trigger_LoaiNha không cho phép thêm TenLoaiNha rỗng

create trigger trigger_LoaiNha 
ON  LOAINHA --TRÊN BẢNG LOAINHA
for INSERT  --LOẠI INSERT
AS
if (select TenLoaiNha from inserted) = ''
BEGIN
	print 'Khong duoc them TenLoaiNha rong.'
	rollback transaction --trở lại lúc ban đầu chưa được insert
END
go
--Khi thêm vào bảng  LOAINHA thì trigger trigger_LoaiNha tự động được thi hành
insert into  LOAINHA values('','mo ta 2')
go


--câu 4 : Viết 1 trigger loại update tên là trigger_TaiKhoan_update không cho phép Sửa Tuoi nhỏ hơn 18 tuổi
drop trigger trigger_TaiKhoan_update
go
create trigger trigger_TaiKhoan_update --1. TÊN TRIGGER
 ON TaiKhoan --2. TRÊN BẢNG TAIKHOAN
for UPDATE   --3. LOẠI UPDATE
AS
if (select Tuoi from inserted) < 18
BEGIN
	print N'Tuổi mới cập nhật phải lớn hơn 18.'
	rollback transaction --trở lại lúc ban đầu chưa được UPDATE...HỦY UPDATE
END
go
Select * from taikhoan
go
-------KHI UPDATE BẢNG TAIKHOAN THÌ TỰ ĐỘNG KÍCH HOẠT/ GỌI / THI HÀNH TRIGGER LOẠI UPDATE
update TaiKhoan
set tuoi = 17
where TenNguoiDung = 'phuc'
---
--câu 5 : Viết 1 trigger loại DELETE tên là trigger_TaiKhoan_delete không cho phép tài khoản tên là 'phuc'
drop trigger trigger_TaiKhoan_update
go
create trigger trigger_TaiKhoan_delete --1. TÊN TRIGGER
 ON TaiKhoan  --2. TRÊN BẢNG TAIKHOAN
for DELETE    --3. LOẠI DELETE
AS
if (select TenNguoiDung from deleted) = 'phuc'
BEGIN
	print N'không cho phép XÓA tài khoản là phuc.'
	rollback transaction --trở lại lúc ban đầu chưa được UPDATE
END
go
delete from TaiKhoan
where TenNguoiDung = 'phuc'
go
Select * from taikhoan
go











use QLDA
go

--Bai1
--Cau 1
--Ràng buộc khi thêm mới nhân viên thì mức lương phải lớn hơn 15000, 
--nếu vi phạm thì xuất thông báo “luong phải >15000’
drop trigger sp1_cau1
go
create trigger sp1_cau1 --1. TÊN TRIGGER sp1_cau1
on nhanvien --2. TRÊN BẢNG NHANVIEN
for insert --3. LOẠI INSERT
as
if (select luong from inserted) < 15000
begin
	print N'Lương phải lớn hơn 15000'
	rollback transaction
end
SELECT * FROM NHANVIEN
-- Check thử
insert into nhanvien
	values(N'Nguyễn',N'Văn',N'Tèo','014','2020-03-11',N'45 Lê Văn Sỹ,TP HCM','Nam',17000,'001',4)
go

--Câu 2
--Ràng buộc khi thêm mới nhân viên thì độ tuổi phải nằm trong khoảng 18 <= tuổi <=65.
--

drop trigger sp1_cau2

create trigger sp1_cau2 
on nhanvien 
for insert 
as
if((select year(getdate())-year(ngsinh) from inserted) not between 18 and 65)
begin
	print N'Tuổi phải nằm trong khoảng 18<65'
	rollback transaction
end
go
insert into nhanvien
	values(N'Nguyễn',N'Văn',N'Tèo','021','2010-03-11',N'45 Lê Văn Sỹ,TP HCM','Nam',12000,1,4)
go

-- Câu 3
--Ràng buộc khi cập nhật nhân viên thì không được cập nhật những nhân viên ở TP HCM
-- drop trigger sp1_cau3
create trigger sp1_cau3 
on nhanvien 
for update 
as
if (select dchi from inserted)  like '%HCM%'
begin
	print N'Không được cập nhật những nhân viên ở HCM'
	rollback transaction
end
go
select * from nhanvien
go
-- Tes
update nhanvien set luong = 20000 where manv = '003'
go
-- update nhanvien set luong = 20000 where dchi like '%HCM%'

--Bai 2
--Cau 1
--Hiển thị tổng số lượng nhân viên nữ, tổng số lượng nhân viên nam 
--mỗi khi có hành động thêm mới nhân viên
-- drop trigger sp2_cau1
create trigger sp2_cau1 on nhanvien 
after insert as
begin
	declare @a char;
	declare @b char;
	select @a =count(*) from nhanvien where phai = 'Nam' group by phai
	select @b =count(*) from nhanvien where phai = N'Nữ' group by phai
	print N'Sô lượng nhân viên nam sau khi thêm là ' + @a
	print N'Sô lượng nhân viên nữ sau khi thêm là ' + @b
end
-- test chương trình
insert into nhanvien
	values(N'Nguyễn',N'Văn',N'Tèo','015','1960-03-11',N'45 Lê Văn Sỹ,TP HCM',N'Nữ',12000,1,4)
go

--Câu 2
--Hiển thị tổng số lượng nhân viên nữ, 
--tổng số lượng nhân viên nam mỗi khi có hành động cập nhật phần giới tính nhân viên
-- drop trigger sp2_cau2
create trigger sp2_cau2 on nhanvien 
after update as
begin
	declare @a char;
	declare @b char;
	select @a =count(*) from nhanvien where phai = 'Nam' group by phai
	select @b =count(*) from nhanvien where phai = N'Nữ' group by phai
	print N'Sô lượng nhân viên nam sau khi thêm là ' + @a
	print N'Sô lượng nhân viên nữ sau khi thêm là ' + @b
end

--Chạy thử trương chình
update nhanvien set phai = N'Nữ' where manv = '003'
go

--Câu 3
--Hiển thị tổng số lượng đề án mà mỗi nhân viên đã làm khi có hành động xóa trên bảng DEAN
-- drop trigger sp2_cau3
create trigger sp2_cau3 on dean 
after delete as
begin
	select phancong.ma_nvien,count(*) from dean
	inner join congviec on dean.mada=congviec.mada
	inner join phancong on congviec.mada = phancong.mada and congviec.stt = phancong.stt
	group by phancong.ma_nvien
end

--thực thi lệnh
delete from dean where phong = 5
go
--Bài 3
--Câu 1
--Xóa các thân nhân trong bảng thân nhân có liên quan 
--khi thực hiện hành động xóa nhân viên trong bảng nhân viên
--drop trigger sp3_cau1
create trigger sp3_cau1 on nhanvien
instead of delete as 
begin
	delete from thannhan where ma_nvien in
	(select manv from deleted)
	print N'ok'
end

delete from nhanvien where manv = '001'
go

-- Bai 3
-- Cau 2
-- Khi thêm một nhân viên mới thì tự động phân công cho nhân viên làm đề án có MADA là 1.
--drop trigger sp3_cau2
create trigger sp3_cau2 on nhanvien
instead of insert as
begin
	insert into phancong(mada,ma_nvien,stt)
		values(1,(select manv from inserted),2)
	select * from phancong
end

insert into nhanvien
	values(N'Nguyễn',N'Văn',N'Tèo','200','1960-03-11',N'45 Lê Văn Sỹ,TP HCM',N'Nữ',12000,1,4)
