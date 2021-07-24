
use masv_hoten_NHATRO
go

select *
from TAIKHOAN
go

--1. insert 
insert into TAIKHOAN values ('teo','123',20)
--2.
select *
from LOAINHA
go
insert into LOAINHA values('','mo ta 1')
go
-----
select *
from LOAINHA
from 
---câu 1 . Viết 1 trigger loại insert tên là trigger_LoaiNha không cho phép thêm TenLoaiNha rỗng

create trigger trigger_LoaiNha ON LOAINHA
for INSERT 
AS
if (select TenLoaiNha from inserted) = ''
BEGIN
	print 'Khong duoc them TenLoaiNha rong.'
	rollback transaction --trở lại lúc ban đầu chưa được insert
END
go
--Khi thêm vào bảng LOAINHA thì trigger trigger_LoaiNha tự động được thi hành
insert into LOAINHA values('','mo ta 2')
go
--câu 2 : Viết 1 trigger loại insert tên là trigger_TaiKhoan không cho phép thêm Tuoi nhỏ hơn 18 tuổi
create trigger trigger_TaiKhoan ON TaiKhoan
for INSERT 
AS
if (select Tuoi from inserted) < 18
BEGIN
	print N'Tuổi phải lớn hơn 18.'
	rollback transaction --trở lại lúc ban đầu chưa được insert
END
go
insert into TaiKhoan values ('Ti','123',17)
--câu 3 : Viết 1 trigger loại update tên là trigger_TaiKhoan_update không cho phép Sửa Tuoi nhỏ hơn 18 tuổi
drop trigger trigger_TaiKhoan_update
go
create trigger trigger_TaiKhoan_update ON TaiKhoan
for UPDATE 
AS
if (select Tuoi from inserted) < 18
BEGIN
	print N'Tuổi mới cập nhật phải lớn hơn 18.'
	rollback transaction --trở lại lúc ban đầu chưa được UPDATE
END
go
Select * from taikhoan
go
-------
update TaiKhoan
set tuoi = 17
where TenNguoiDung = 'phuc'
---
--câu 4 : Viết 1 trigger loại update tên là trigger_TaiKhoan_delete không cho phép tài khoản tên là 'phuc'
drop trigger trigger_TaiKhoan_update
go
create trigger trigger_TaiKhoan_delete ON TaiKhoan
for DELETE 
AS
if (select TenNguoiDung from deleted) = 'phuc'
BEGIN
	print N'không cho phép tài khoản là phuc.'
	rollback transaction --trở lại lúc ban đầu chưa được UPDATE
END
go
delete from TaiKhoan
where TenNguoiDung = 'phuc'
go
Select * from taikhoan
go



--sửa thêm giai đoạn 2
-- Câu a ASM GĐ 2
--Tìm kiếm nhà the quận
--drop proc sp_quan
create proc sp_quan @Quan nvarchar(50)
as
begin
	select 
	dientich as N'Diện tích',
	giaphong as N'Giá Phòng',
	ThongTinNhaTro,
	convert(varchar,ngaydang,105) as N'Ngày Đăng Tin',
	case gioitinh
	when 1 then 'A.' +TenNguoiDung
	when 0 then 'C.' +TenNguoiDung
	end as N'Tên Người dùng',
	dienthoai as N'số điện thoại liên hệ',
	NGUOIDUNG.DiaChi as N'Địa chỉ liên hệNHATRO'
	from  NHATRO inner join DanhGia 
	on NHATRO.MaNhaTro= DanhGia.MaNhaTro
	inner join NGUOIDUNG
	on NGUOIDUNG.MaNguoiDung =DanhGia.MaNguoiDung
	where NHATRO.Quan = @Quan
end
go
Exec sp_quan N'Quận 1'
go
--Câu b
--Viết một hàm tham sosos đâu vào tương ứng với tất cả cát cộc của bảng
--Người dùng.Hàm này trả về mã người dùng(giá trị của cột khóa chinh của bảng NguoiDung) thỏa mãn các giá trị được truyền vào thma số
create function sp_caub
(@tennguoidung nvarchar(50),@gioitinh bit,
@dienthoai nvarchar(50),@diachi nvarchar(50),
@quan nvarchar(50),@email char(50))
returns int
begin
	return(select manguoidung from NGUOIDUNG
			where TenNguoiDung=@tennguoidung and gioitinh=@gioitinh 
			and dienthoai=@dienthoai and Diachi=@diachi
			and quan=@quan and email=@email)
end
go
--Câu c
--Viết một hàm có thma số đầu vào là mã nhà trọ(cột khóa chinh của bảng NHATRO).Hàm này trả về tống số like và dislike của nhà trọ này.
create function sp_cauc (@manhatro int)
returns @table table
(
	sodislike varchar,
	solike varchar
)
begin
	insert into @table
	values((select count(*) from DanhGia where manhatro=@manhatro and danhgia=0),(select count(*) from DanhGia where manhatro =@manhatro and danhgia=1))
	return;
end

-- Cau d: tạo 1 view thông tin top 10 hà trọ có số người dùng like nhiều nhất gồm các thông tin sau:
create view view_nguoidung
as
select 
TenNguoiDung,
DienTich,
GiaPhong, ThongTinDanhGia,
NgayDang,
DienThoai,Email
from DanhGia, NGUOIDUNG, NHATRO
where DanhGia.MaNguoiDung = NGUOIDUNG.MaNguoiDung
	and DanhGia.MaNhaTro = NHATRO.MaNhaTro
	and NHATRO.MaNhaTro in
	(select top5 from (select top 5 manhatro as top5
	, count(*) as abc from
	DanhGia where DanhGia = 1
	group by MaNhaTro order by abc desc) as temp)
go



