create database QUANLYDIEMTHI;
use QUANLYDIEMTHI;
create table Hocsinh(
MaHS int primary key,
TenHS varchar(50),
NgaySinh date,
Lop varchar(20),
GioiTinh varchar(20)
);
insert into Hocsinh(MaHS,TenHS,NgaySinh,Lop,GioiTinh)
value(1,'minh son','1998-07-05','10','nam');
create table MonHoc(
MaMH varchar(20) primary key,
TenMH varchar(50),
MaGV varchar(20) 
);
create table BangDiem(
MaHS int,
MaMH varchar(20),
DiemThi int,
NgayKiemTra date,
foreign key (MaHS) references Hocsinh(MaHS),  
foreign key (MaMH) references MonHoc(MaMH)
);
create table Giaovien(
MaGV varchar(20) primary key,
TenGV varchar(20),
sdt varchar(10)
);
alter table MonHoc add constraint fk_MaGV foreign key (MaGV) references Giaovien(MaGV)
