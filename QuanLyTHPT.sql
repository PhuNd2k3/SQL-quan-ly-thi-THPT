create database QuanLyThiTHPT
go

use QuanLyThiTHPT
go

----------------------------

create table ThiSinh(
	MaDT nchar(15) primary key,
	TenHS nvarchar(50),
	Truong nvarchar(100),
	NgaySinh date,
	GioiTinh nchar(5),
	DiaChi nvarchar(100),
);

create table NguyenVong(
	MaDT nchar(15) foreign key references ThiSinh(MaDT),
	ThuTuNV int,
	MaTruong nchar(10),
	MaNganh nchar(50),
	ToHopMon nchar(10),
	constraint NguyenVong_PK primary key (MaDT, ThuTuNV),
);

create table MonThi(
	MaMT char(10) primary key,
	TenMonThi nchar(30),
	NgayThi date,
	BuoiThi nvarchar(10),
	KhungGio nvarchar(30),
);

create table DiaDiem(
	MaDD nchar(10) primary key,
	PhongThi nvarchar(10),
	TenDiaDiem nvarchar(30),
	KhuVuc nchar(30),
);

create table DeThi(
	MaDe nchar(10) primary key,
	MaMT char(10) foreign key references MonThi (MaMT),
);

create table GiamThi(
	MaGT nchar(10),
	TenGT nvarchar(50),
	NgaySinh date,
	GioiTinh nchar(5),
	DiaChi nvarchar(100),
	MaDD nchar(10) foreign key references DiaDiem (MaDD),
);

create table Thi(
	MaLT nchar(10) foreign key references ToChuc (MaLT),
	MaDT nchar(15) foreign key references ThiSinh (MaDT),
);

create table ToChuc(
	MaLT nchar(10) primary key,
	MaDD nchar(10) foreign key references DiaDiem (MaDD),
	MaMT char(10) foreign key references MonThi (MaMT),
);

create table KetQua(
	MaDT nchar(15) foreign key references ThiSinh (MaDT),
	MaMT char(10) foreign key references MonThi (MaMT),
	KetQua float,
);
go

insert into ThiSinh
values
(N'001', N'Phàn Phù Lìn', N'THPT Yên Phong Số 1', '2013-11-15', N'LGBT', N'Ahihi');

INSERT INTO MonThi 
VALUES
(N'MT01', N'Ngữ văn',	N'2023-08-26',	N'Sáng',	N'07 giờ 30 – 09 giờ 30'),
(N'MT02', N'Toán',		N'2023-08-26',	N'Chiều',	N'14 giờ 20 – 15 giờ 20'),
(N'MT03', N'Vật lí',	N'2023-08-26',	N'Sáng',	N'07 giờ 30 – 08 giờ 20'),
(N'MT04', N'Hóa học',	N'2023-08-26',	N'Sáng',	N'08 giờ 30 – 09 giờ 20'),
(N'MT05', N'Sinh học',	N'2023-08-26',	N'Sáng',	N'09 giờ 30 – 09 giờ 20'),
(N'MT06', N'Lịch sử',	N'2023-08-26',	N'Sáng',	N'07 giờ 30 – 08 giờ 20'),
(N'MT07', N'Địa lí',	N'2023-08-26',	N'Sáng',	N'08 giờ 30 – 09 giờ 20'),
(N'MT08', N'GDCD',		N'2023-08-26',	N'Sáng',	N'09 giờ 30 – 09 giờ 20'),
(N'MT09', N'Ngoại ngữ', N'2023-08-26',	N'Chiều',	N'14 giờ 20 – 15 giờ 20');

INSERT INTO DeThi 
VALUES
(N'101', N'MT01'),
(N'102', N'MT01'),
(N'201', N'MT02'),
(N'202', N'MT02'),
(N'301', N'MT03'),
(N'302', N'MT03'),
(N'401', N'MT04'),
(N'402', N'MT04'),
(N'501', N'MT05'),
(N'502', N'MT05'),
(N'601', N'MT06'),
(N'602', N'MT06'),
(N'701', N'MT07'),
(N'702', N'MT07'),
(N'801', N'MT08'),
(N'802', N'MT08'),
(N'901', N'MT09'),
(N'902', N'MT09');

INSERT INTO DiaDiem
VALUES
(N'D01', N'101', N'THPT Nguyễn Trãi - Ba Đình',		N'TP Hà Nội'),
(N'D02', N'102', N'THPT Nguyễn Trãi - Ba Đình',		N'TP Hà Nội'),
(N'D03', N'101', N'THPT Phan Đình Phùng',			N'TP Hà Nội'),
(N'D04', N'102', N'THPT Phan Đình Phùng',		N'TP Hà Nội'),
(N'D05', N'101', N'THPT Chu Văn An',			N'TP Hà Nội');

insert into ToChuc
values
(N'LT01',N'D01',N'MT01'),
(N'LT02',N'D02',N'MT02'),
(N'LT03',N'D02',N'MT03');

insert into ToChuc
values
(N'LT04', N'D03', N'MT04'),
(N'LT05', N'D03', N'MT05'),
(N'LT06', N'D04', N'MT06'),
(N'LT07', N'D03', N'MT07'),
(N'LT08', N'D03', N'MT08'),
(N'LT09', N'D05', N'MT09'),
(N'LT10', N'D05', N'MT04');

insert into Thi
values
(N'LT01', N'001'),
(N'LT02', N'001'),
(N'LT03', N'001');

INSERT INTO Thi
values
(N'LT04', N'1'),
(N'LT05', N'1'),
(N'LT06', N'1'),
(N'LT07', N'1'),
(N'LT02', N'2'),
(N'LT04', N'2'),
(N'LT05', N'3'),
(N'LT06', N'3'),
(N'LT09', N'5'),
(N'LT10', N'4'),
(N'LT02', N'6'),
(N'LT02', N'8'),
(N'LT02', N'9'),
(N'LT02', N'7'),
(N'LT10', N'10'),
(N'LT01', N'7');

INSERT INTO GiamThi VALUES
(N'GT01', N'Nguyễn Ngọc Quân',	'1987-01-01', N'Nam',	N'123 Nguyễn Trãi, Hà Nội', N'D01'),
(N'GT02', N'Phạm Tùng Anh',		'1987-01-01', N'Nam',	N'456 Ba Đình, Hà Nội', N'D01'),
(N'GT03', N'Mai Ngọc Hà',		'1987-01-01', N'Nữ',	N'789 Trần Hưng Đạo, Hà Nội', N'D02'),
(N'GT04', N'Ngô Bảo Anh',		'1987-01-01', N'Nữ',	N'101 Bà Triệu, Hà Nội', N'D02'),
(N'GT05', N'Trần Thanh Hà',		'1987-01-01', N'Nữ',	N'77 Đê La Thành, Hà Nội', N'D03'),
(N'GT06', N'Nguyễn Hương Tràm',	'1987-01-01', N'Nữ',	N'46 Trần Quốc Việt, Hà Nội', N'D03'),
(N'GT07', N'Lê Thị Mai Linh',	'1987-01-01', N'Nữ',	N'131 Phạm Văn Đồng, Hà Nội', N'D04'),
(N'GT08', N'Võ Hoàng Nam',		'1987-01-01', N'Nam',	N'76 Kim Mã, Hà Nội', N'D04'),
(N'GT09', N'Đặng Đức Huy',		'1987-01-01', N'Nam',	N'33 Hoàng Minh Thảo, Hà Nội', N'D05'),
(N'GT10', N'Bùi Ngọc Sơn',		'1987-01-01', N'Nam',	N'81 Thụy Khuê, Hà Nội', N'D05');

INSERT INTO ThiSinh VALUES
(N'5',	N'Võ Văn E',		N'THPT Chuyên Khoa học tự nhiên',	'2006-05-05',	N'Nam',		N'77 Đê La Thành, Hà Nội'),
(N'1',	N'Nguyễn Văn A',	N'THPT Chuyên Khoa học tự nhiên',	'2006-01-01',	N'Nam',		N'123 Nguyễn Trãi, Hà Nội'),
(N'2',	N'Trần Thị B',		N'THPT Chuyên Khoa học tự nhiên',	'2006-01-01',	N'Nữ',		N'456 Ba Đình, Hà Nội'),
(N'3',	N'Phạm Văn C',		N'THPT Chuyên Khoa học tự nhiên',	'2006-01-01',	N'Nam',		N'789 Trần Hưng Đạo, Hà Nội'),
(N'4',	N'Lê Thị D',		N'THPT Chuyên Khoa học tự nhiên',	'2006-01-01',	N'Nữ',		N'101 Bà Triệu, Hà Nội'),
(N'6',	N'Ngô Thị F',		N'THPT Chuyên Khoa học tự nhiên',	'2006-01-01',	N'Nữ',		N'46 Trần Quốc Việt, Hà Nội'),
(N'7',	N'Đặng Văn G',		N'THPT Chuyên Khoa học tự nhiên',	'2006-01-01',	N'Nam',		N'131 Phạm Văn Đồng, Hà Nội'),
(N'8',	N'Hoàng Thị H',		N'THPT Chuyên Khoa học tự nhiên',	'2006-01-01',	N'Nữ',		N'76 Kim Mã, Hà Nội'),
(N'9',	N'Bùi Văn I',		N'THPT Chuyên Khoa học tự nhiên',	'2006-01-01',	N'Nam',		N'33 Hoàng Minh Thảo, Hà Nội'),
(N'10', N'Tống Thị K',		N'THPT Chuyên Khoa học tự nhiên',	'2006-01-01',	N'Nữ',		N'81 Thụy Khuê, Hà Nội');

INSERT INTO NguyenVong
VALUES
(N'1', 1,	N'BKA',		N'IT-E6',		N'A00'),
(N'1', 1,	N'KHA',		N'EBBA',		N'A01'),
(N'2', 2,	N'BKA',		N'IT-E10',		N'A01'),
(N'2', 3,	N'KHA',		N'EBBA',		N'A01'),
(N'3', 1,	N'KHA',		N'7340122',		N'D07'),
(N'3', 2,	N'BKA',		N'IT-E6',		N'D08'),
(N'4', 1,	N'NTH',		N'NTH07',		N'D06'),
(N'4', 2,	N'KHA',		N'7340122',		N'D09'),
(N'5', 1,	N'KHA',		N'7340302',		N'A01'),
(N'5', 2,	N'KHA',		N'7340122',		N'A01'),
(N'5', 3,	N'NTH',		N'NTH07',		N'A01'),
(N'6', 1,	N'BKA',		N'EBBA',		N'D07'),
(N'7', 1,	N'BKA',		N'IT-E10',		N'A00'),
(N'7', 2,	N'BKA',		N'IT-E7',		N'A00'),
(N'8', 1,	N'KHA',		N'7340302',		N'D08'),
(N'10', 1,	N'BKA',		N'IT-E10',		N'A00'),
(N'10', 2,	N'KHA',		N'7810201',		N'A00');

insert into KetQua
values
(N'1', 'MT01',	5.93),
(N'1', 'MT02',  3.93),
(N'1', 'MT03',  9.24),
(N'1', 'MT04',	7.02),
(N'1', 'MT05',	7.19),
(N'1', 'MT09',  7.93),
(N'2', 'MT01',	7.75),
(N'2', 'MT02',	9.64),
(N'2', 'MT03',	8.46),
(N'2', 'MT04',	8.09),
(N'2', 'MT05',	3.06),
(N'2', 'MT09',	9.54),
(N'3', 'MT01',	5.26),
(N'3', 'MT02',	9.6),
(N'3', 'MT06',	8.3),
(N'3', 'MT07',	9.61),
(N'3', 'MT08',	6.11),
(N'3', 'MT09',	8.95),
(N'4', 'MT01',	4.87),
(N'4', 'MT02',	5.48),
(N'4', 'MT06',	9.51),
(N'4', 'MT07',	9.85),
(N'4', 'MT08',	3.51),
(N'4', 'MT09',	8.26),
(N'5', 'MT01',	9.64),
(N'5', 'MT02',	9.34),
(N'5', 'MT03',	7.93),
(N'5', 'MT04',	8.91),
(N'5', 'MT05',	3.14),
(N'5', 'MT09',	8.84),
(N'6', 'MT01',	8.49),
(N'6', 'MT02',	3.22),
(N'6', 'MT06',	5.1),
(N'6', 'MT07',	8.3),
(N'6', 'MT08',  6.53),
(N'6', 'MT09',  3.89),
(N'7', 'MT01',	8.18),
(N'7', 'MT02',  8.02),
(N'7', 'MT03',  3.22),
(N'7', 'MT04',	4.14),
(N'7', 'MT05',	4),
(N'7', 'MT09',	9.95),
(N'8', 'MT01',	9.08),
(N'8', 'MT02',	9.06),
(N'8', 'MT06',	6.9),
(N'8', 'MT07',	7.77),
(N'8', 'MT08',	3.96),
(N'8', 'MT09',	5.86),
(N'9', 'MT01',	8.73),
(N'9', 'MT02',	5.38),
(N'9', 'MT03',  4.89),
(N'9', 'MT04',  9.29),
(N'9', 'MT05',  4.98),
(N'9', 'MT09',	8.98),
(N'10', 'MT01', 4.39),
(N'10', 'MT02', 3.24),
(N'10', 'MT03', 6.8),
(N'10', 'MT04', 5.3),
(N'10', 'MT05', 0.45),
(N'10', 'MT09', 4.1);

sp_rename "ToChuc", "LopThi";

select TS.TenHS, MT.TenMonThi, DD.TenDiaDiem, DD.PhongThi, MT.NgayThi, MT.KhungGio
from ThiSinh as TS inner join Thi as T on TS.MaDT = T.MaDT
		inner join LopThi as TC on T.MaLT = TC.MaLT
		inner join MonThi as MT on TC.MaMT = MT.MaMT
		inner join DiaDiem as DD on TC.MaDD = DD.MaDD
where TS.MaDT = N'1';

select * from ThiSinh;
select * from Thi;
select * from LopThi;
select * from MonThi;
select * from DiaDiem;
select * from KetQua;

select truong, count(*)
from thisinh
group by Truong

select TenHS, TenMonThi, KetQua
from ThiSinh as TS join KetQua as KQ on TS.MaDT = KQ.MaDT
					join MonThi as MT on KQ.MaMT = MT.MaMT
where TS.MaDT = '2';

select distinct ThiSinh.MaDT, TenHS
from ThiSinh inner join NguyenVong
on ThiSinh.MaDT = NguyenVong.MaDT
where NguyenVong.ToHopMon = N'A01';

select TS.MaDT, round(sum(KetQua),2) as N'Điểm thi khối A1'
from ThiSinh as TS join KetQua as KQ on TS.MaDT = KQ.MaDT
where MaMT in (N'MT02', N'MT03', N'MT09')
group by TS.MaDT
order by round(sum(KetQua),2) desc;

select top(1) TS.MaDT, round(sum(KetQua),2) as N'Thủ Khoa khối A1'
from ThiSinh as TS join KetQua as KQ on TS.MaDT = KQ.MaDT
where MaMT in (N'MT02', N'MT03', N'MT09')
group by TS.MaDT
order by round(sum(KetQua),2) desc;

select distinct MaDT, TenHS
from ThiSinh
where ThiSinh.MaDT not in
						(select distinct MaDT from KetQua
						where KetQua <1)