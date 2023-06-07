create database QLTHPT2;
\c qlthpt2;
create table Thi_sinh (
	MaDT	int,
	TenHS	varchar(50) NOT NULL,
	NgaySinh char(12) NOT NULL,
	GioiTinh char(4) NOT NULL,
	DiaChi	varchar(50) NOT NULL,
	Ban	char(20) NOT NULL,
	constraint PK_ThiSinh Primary key(MaDT)
	);

create table Mon_Thi (
	MaMT	char(5),
	TenMT	char(15) NOT NULL,
	NgayThi char(12) NOT NULL,
	BuoiThi char(5) NOT NULL,
	KhungGio	char(25) NOT NULL,
	constraint PK_MonThi Primary key(MaMT)
	);

create table De_Thi(
	MaDe	int NOT NULL,
	TenMon char(15) NOT NULL,
	MaMT	char(5) NOT NULL,
	constraint PK_DeThi Primary key(MaDe),
	constraint FK_DTmaMT Foreign key(MaMT) references Mon_Thi(MaMT)
	);

create table Nguyen_vong (
	MaDT	int,
	ThuTuNV	int,
	MaTruong	char(10) NOT NULL,
	MaNganh char(10) NOT NULL,
	ToHopMon char(4) NOT NULL,
	constraint PK_NguyenVong Primary key(ThuTuNV, MaDT)
	);

create table Dia_Diem (
	MaDD	char(4),
	PhongThi	int NOT NULL,
	TenDiaDiem varchar(50) NOT NULL,
	DiaChi varchar(100) NOT NULL,
	constraint PK_DiaDiem Primary key(MaDD)
	);

create table THI(
	MaDT	int	NOT NULL,
	MaMT	char(5) NOT NULL,
	MaDD	char(4) NOT NULL,
	KetQua float not NULL,
	constraint PK_THIKQ Primary key(MaDT,MaMT,MaDD),
	constraint FK_THIKQmaDT Foreign key(MaDT) references Thi_Sinh(MaDT),
	constraint FK_THIKQmaMT Foreign key(MaMT) references Mon_Thi(MaMT),
	constraint FK_THIKQmaDD Foreign key(MaDD) references Dia_Diem(MaDD)
	);

create table Giam_Thi (
	MaGT	char(5),
	TenGT	varchar(50) NOT NULL,
	NgaySinh char(12) NOT NULL,
	GioiTinh char(4) NOT NULL,
	DiaChi	varchar(50) NOT NULL,
	MaDD	char(4) NOT NULL,
	constraint PK_GiamThi Primary key(MaGT),
	constraint FK_GTmaDD Foreign key(MaDD) references Dia_Diem(MaDD)
	);

\encoding 'UTF8'
INSERT INTO Thi_sinh VALUES (1, N'Nguyễn Văn A', '01/01/2006', 'Nam', N'123 Nguyễn Trãi, Hà Nội', N'Khoa học tự nhiên');
INSERT INTO Thi_sinh VALUES (2, N'Trần Thị B', '02/02/2006', N'Nữ', N'456 Ba Đình, Hà Nội', N'Khoa học tự nhiên');
INSERT INTO Thi_sinh VALUES (3, N'Phạm Văn C', '03/03/2006', 'Nam', N'789 Trần Hưng Đạo, Hà Nội', N'Khoa học xã hội');
INSERT INTO Thi_sinh VALUES (4, N'Lê Thị D', '04/04/2006', N'Nữ', N'101 Bà Triệu, Hà Nội', N'Khoa học xã hội');
INSERT INTO Thi_sinh VALUES (5, N'Võ Văn E', '05/05/2006', 'Nam', N'77 Đê La Thành, Hà Nội', N'Khoa học tự nhiên');
INSERT INTO Thi_sinh VALUES (6, N'Ngô Thị F', '06/06/2006', N'Nữ', N'46 Trần Quốc Việt, Hà Nội', N'Khoa học xã hội');
INSERT INTO Thi_sinh VALUES (7, N'Đặng Văn G', '07/07/2006', 'Nam', N'131 Phạm Văn Đồng, Hà Nội', N'Khoa học tự nhiên');
INSERT INTO Thi_sinh VALUES (8, N'Hoàng Thị H', '08/08/2006', N'Nữ', N'76 Kim Mã, Hà Nội', N'Khoa học xã hội');
INSERT INTO Thi_sinh VALUES (9, N'Bùi Văn I', '09/09/2006', 'Nam', N'33 Hoàng Minh Thảo, Hà Nội', N'Khoa học tự nhiên');
INSERT INTO Thi_sinh VALUES (10, N'Tống Thị K', '10/10/2006', N'Nữ', N'81 Thụy Khuê, Hà Nội', N'Khoa học tự nhiên');

INSERT INTO Mon_Thi VALUES ('MT01', N'Ngữ văn', '28/06/2023', N'Sáng', N'07 giờ 30 – 09 giờ 30');
INSERT INTO Mon_Thi VALUES ('MT02', N'Toán', '28/06/2023',N'Chiều', N'14 giờ 20 – 15 giờ 20');
INSERT INTO Mon_Thi VALUES ('MT03', N'Vật lí', '29/06/2023', N'Sáng', N'07 giờ 30 – 08 giờ 20');
INSERT INTO Mon_Thi VALUES ('MT04', N'Hóa học', '29/06/2023', N'Sáng', N'08 giờ 30 – 09 giờ 20');
INSERT INTO Mon_Thi VALUES ('MT05', N'Sinh học', '29/06/2023', N'Sáng', N'09 giờ 30 – 09 giờ 20');
INSERT INTO Mon_Thi VALUES ('MT06', N'Lịch sử', '29/06/2023', N'Sáng', N'07 giờ 30 – 08 giờ 20');
INSERT INTO Mon_Thi VALUES ('MT07', N'Địa lí', '29/06/2023', N'Sáng', N'08 giờ 30 – 09 giờ 20');
INSERT INTO Mon_Thi VALUES ('MT08', N'GDCD', '29/06/2023', N'Sáng', N'09 giờ 30 – 09 giờ 20');
INSERT INTO Mon_Thi VALUES ('MT09', N'Ngoại ngữ', '29/06/2023', N'Chiều', N'14 giờ 20 – 15 giờ 20');

INSERT INTO De_Thi VALUES (101, N'Ngữ văn', 'MT01');
INSERT INTO De_Thi VALUES (102, N'Ngữ văn', 'MT01');
INSERT INTO De_Thi VALUES (201, N'Toán', 'MT02');
INSERT INTO De_Thi VALUES (202, N'Toán', 'MT02');
INSERT INTO De_Thi VALUES (301, N'Vật lí', 'MT03');
INSERT INTO De_Thi VALUES (302, N'Vật lí', 'MT03');
INSERT INTO De_Thi VALUES (401, N'Hóa học', 'MT04');
INSERT INTO De_Thi VALUES (402, N'Hóa học', 'MT04');
INSERT INTO De_Thi VALUES (501, N'Sinh học', 'MT05');
INSERT INTO De_Thi VALUES (502, N'Sinh học', 'MT05');
INSERT INTO De_Thi VALUES (601, N'Lịch sử', 'MT06');
INSERT INTO De_Thi VALUES (602, N'Lịch sử', 'MT06');
INSERT INTO De_Thi VALUES (701, N'Địa lí', 'MT07');
INSERT INTO De_Thi VALUES (702, N'Địa lí', 'MT07');
INSERT INTO De_Thi VALUES (801, N'GDCD', 'MT08');
INSERT INTO De_Thi VALUES (802, N'GDCD', 'MT08');
INSERT INTO De_Thi VALUES (901, N'Ngoại ngữ', 'MT09');
INSERT INTO De_Thi VALUES (902, N'Ngoại ngữ', 'MT09');

INSERT INTO Nguyen_vong VALUES (1, 1, 'BKA', 'IT-E6', 'A00');
INSERT INTO Nguyen_vong VALUES (2, 1, 'KHA', 'EBBA', 'A01');
INSERT INTO Nguyen_vong VALUES (2, 2, 'BKA', 'IT-E10', 'A01');
INSERT INTO Nguyen_vong VALUES (2, 3, 'KHA', 'EBBA', 'A01');
INSERT INTO Nguyen_vong VALUES (3, 1, 'KHA', '7340122', 'D07');
INSERT INTO Nguyen_vong VALUES (3, 2, 'BKA', 'IT-E6', 'D08');
INSERT INTO Nguyen_vong VALUES (4, 1, 'NTH', 'NTH07', 'D06');
INSERT INTO Nguyen_vong VALUES (4, 2, 'KHA', '7340122', 'D09');
INSERT INTO Nguyen_vong VALUES (5, 1, 'KHA', '7340302', 'A01');
INSERT INTO Nguyen_vong VALUES (5, 2, 'KHA', '7340122', 'A01');
INSERT INTO Nguyen_vong VALUES (5, 3, 'NTH', 'NTH07', 'A01');
INSERT INTO Nguyen_vong VALUES (6, 1, 'BKA', 'EBBA', 'D07');
INSERT INTO Nguyen_vong VALUES (7, 1, 'BKA', 'IT-E10', 'A00');
INSERT INTO Nguyen_vong VALUES (7, 2, 'BKA', 'IT-E7', 'A00');
INSERT INTO Nguyen_vong VALUES (8, 1, 'KHA', '7340302', 'D08');
INSERT INTO Nguyen_vong VALUES (10, 1, 'BKA', 'IT-E10', 'A00');
INSERT INTO Nguyen_vong VALUES (10, 2, 'KHA', '7810201', 'A00');

INSERT INTO Dia_diem VALUES ('D01', 101, N'THPT Nguyễn Trãi - Ba Đình', N'Số 50 phố Nam Cao, phường Giảng Võ, quận Ba Đình, TP Hà Nội');
INSERT INTO Dia_diem VALUES ('D02', 102, N'THPT Nguyễn Trãi - Ba Đình', N'Số 50 phố Nam Cao, phường Giảng Võ, quận Ba Đình, TP Hà Nội');
INSERT INTO Dia_diem VALUES ('D03', 101, N'THPT Phan Đình Phùng', N'Số 30, phố Phan Đình Phùng, phường Quán Thánh, quận Ba Đình, TP Hà Nội');
INSERT INTO Dia_diem VALUES ('D04', 102, N'THPT Phan Đình Phùng', N'Số 30, phố Phan Đình Phùng, phường Quán Thánh, quận Ba Đình, TP Hà Nội');
INSERT INTO Dia_diem VALUES ('D05', 101, N'THPT Chu Văn An', N'Số 10 Thụy Khuê, phường Thụy Khuê, quận Tây Hồ, TP Hà Nội');

INSERT INTO THI VALUES (1, 'MT01', 'D01', 5.93);
INSERT INTO THI VALUES (1, 'MT02', 'D01', 3.93);
INSERT INTO THI VALUES (1, 'MT03', 'D02', 9.24);
INSERT INTO THI VALUES (1, 'MT04', 'D02', 7.02);
INSERT INTO THI VALUES (1, 'MT05', 'D02', 7.19);
INSERT INTO THI VALUES (1, 'MT09', 'D04', 7.93);
INSERT INTO THI VALUES (2, 'MT01', 'D04', 7.75);
INSERT INTO THI VALUES (2, 'MT02', 'D03', 9.64);
INSERT INTO THI VALUES (2, 'MT03', 'D03', 8.46);
INSERT INTO THI VALUES (2, 'MT04', 'D03', 8.09);
INSERT INTO THI VALUES (2, 'MT05', 'D03', 3.06);
INSERT INTO THI VALUES (2, 'MT09', 'D01', 9.54);
INSERT INTO THI VALUES (3, 'MT01', 'D03', 5.26);
INSERT INTO THI VALUES (3, 'MT02', 'D04', 9.6);
INSERT INTO THI VALUES (3, 'MT06', 'D04', 8.3);
INSERT INTO THI VALUES (3, 'MT07', 'D04', 9.61);
INSERT INTO THI VALUES (3, 'MT08', 'D04', 6.11);
INSERT INTO THI VALUES (3, 'MT09', 'D05', 8.95);
INSERT INTO THI VALUES (4, 'MT01', 'D01', 4.87);
INSERT INTO THI VALUES (4, 'MT02', 'D05', 5.48);
INSERT INTO THI VALUES (4, 'MT06', 'D05', 9.51);
INSERT INTO THI VALUES (4, 'MT07', 'D05', 9.85);
INSERT INTO THI VALUES (4, 'MT08', 'D05', 3.51);
INSERT INTO THI VALUES (4, 'MT09', 'D01', 8.26);
INSERT INTO THI VALUES (5, 'MT01', 'D04', 9.64);
INSERT INTO THI VALUES (5, 'MT02', 'D04', 9.34);
INSERT INTO THI VALUES (5, 'MT03', 'D01', 7.93);
INSERT INTO THI VALUES (5, 'MT04', 'D01', 8.91);
INSERT INTO THI VALUES (5, 'MT05', 'D01', 3.14);
INSERT INTO THI VALUES (5, 'MT09', 'D04', 8.84);
INSERT INTO THI VALUES (6, 'MT01', 'D02', 8.49);
INSERT INTO THI VALUES (6, 'MT02', 'D05', 3.22);
INSERT INTO THI VALUES (6, 'MT06', 'D04', 5.1);
INSERT INTO THI VALUES (6, 'MT07', 'D04', 8.3);
INSERT INTO THI VALUES (6, 'MT08', 'D04', 6.53);
INSERT INTO THI VALUES (6, 'MT09', 'D02', 3.89);
INSERT INTO THI VALUES (7, 'MT01', 'D03', 8.18);
INSERT INTO THI VALUES (7, 'MT02', 'D02', 8.02);
INSERT INTO THI VALUES (7, 'MT03', 'D02', 3.22);
INSERT INTO THI VALUES (7, 'MT04', 'D02', 4.14);
INSERT INTO THI VALUES (7, 'MT05', 'D02', 4);
INSERT INTO THI VALUES (7, 'MT09', 'D03', 9.95);
INSERT INTO THI VALUES (8, 'MT01', 'D02', 9.08);
INSERT INTO THI VALUES (8, 'MT02', 'D02', 9.06);
INSERT INTO THI VALUES (8, 'MT06', 'D05', 6.9);
INSERT INTO THI VALUES (8, 'MT07', 'D05', 7.77);
INSERT INTO THI VALUES (8, 'MT08', 'D05', 3.96);
INSERT INTO THI VALUES (8, 'MT09', 'D05', 5.86);
INSERT INTO THI VALUES (9, 'MT01', 'D01', 8.73);
INSERT INTO THI VALUES (9, 'MT02', 'D05', 5.38);
INSERT INTO THI VALUES (9, 'MT03', 'D01', 4.89);
INSERT INTO THI VALUES (9, 'MT04', 'D01', 9.29);
INSERT INTO THI VALUES (9, 'MT05', 'D01', 4.98);
INSERT INTO THI VALUES (9, 'MT09', 'D02', 8.98);
INSERT INTO THI VALUES (10, 'MT01', 'D05', 4.39);
INSERT INTO THI VALUES (10, 'MT02', 'D05', 3.24);
INSERT INTO THI VALUES (10, 'MT03', 'D03', 6.8);
INSERT INTO THI VALUES (10, 'MT04', 'D03', 5.3);
INSERT INTO THI VALUES (10, 'MT05', 'D03', 0.45);
INSERT INTO THI VALUES (10, 'MT09', 'D03', 4.1);


INSERT INTO Giam_Thi VALUES ('GT01', 'Nguyễn Ngọc Quân', '01/01/1987', 'Nam', '123 Nguyễn Trãi, Hà Nội', 'D01');
INSERT INTO Giam_Thi VALUES ('GT02', 'Phạm Tùng Anh', '01/01/1989', 'Nam', '456 Ba Đình, Hà Nội', 'D01');
INSERT INTO Giam_Thi VALUES ('GT03', 'Mai Ngọc Hà', '08/08/1991', 'Nữ', '789 Trần Hưng Đạo, Hà Nội', 'D02');
INSERT INTO Giam_Thi VALUES ('GT04', 'Ngô Bảo Anh', '05/05/1994', 'Nữ', '101 Bà Triệu, Hà Nội', 'D02');
INSERT INTO Giam_Thi VALUES ('GT05', 'Trần Thanh Hà', '01/01/1988', 'Nữ', '77 Đê La Thành, Hà Nội', 'D03');
INSERT INTO Giam_Thi VALUES ('GT06', 'Nguyễn Hương Tràm', '08/08/1989', 'Nữ', '46 Trần Quốc Việt, Hà Nội', 'D03');
INSERT INTO Giam_Thi VALUES ('GT07', 'Lê Thị Mai Linh', '01/01/1990', 'Nữ', '131 Phạm Văn Đồng, Hà Nội', 'D04');
INSERT INTO Giam_Thi VALUES ('GT08', 'Võ Hoàng Nam', '05/05/1993', 'Nam', '76 Kim Mã, Hà Nội', 'D04');
INSERT INTO Giam_Thi VALUES ('GT09', 'Đặng Đức Huy', '05/05/1995', 'Nam', '33 Hoàng Minh Thảo, Hà Nội', 'D05');
INSERT INTO Giam_Thi VALUES ('GT10', 'Bùi Ngọc Sơn', '08/08/1990', 'Nam', '81 Thụy Khuê, Hà Nội', 'D05');

