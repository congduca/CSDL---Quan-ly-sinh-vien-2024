-- Tạo bảng
CREATE TABLE Chuong_trinh_dao_tao
(
  Ma_chuong_trinh_dao_tao Nvarchar(10) NOT NULL,
  Ten_chuong_trinh_dao_tao Nvarchar(70) NOT NULL,
  So_tin_chi_can_de_tot_nghiep INT  NULL,
  Nam_bat_dau INT  NULL,
  PRIMARY KEY (Ma_chuong_trinh_dao_tao)
);

CREATE TABLE Sinh_vien
(
  Ma_sinh_vien Nvarchar(10) NOT NULL,
  Ho Nvarchar(10)  NOT NULL,
  Dem Nvarchar(20) NOT NULL,
  Ten Nvarchar(10) NOT NULL,
  Ngay_sinh Datetime  NULL,
  Nam_nhap_hoc INT NULL,
  Gioi_tinh Nvarchar(10)  NULL,
  Ma_chuong_trinh_dao_tao Nvarchar(10)  NULL,
  PRIMARY KEY (Ma_sinh_vien),
  FOREIGN KEY (Ma_chuong_trinh_dao_tao) REFERENCES Chuong_trinh_dao_tao(Ma_chuong_trinh_dao_tao)
);

CREATE TABLE Giang_vien
(
  Ma_giang_vien Nvarchar(10) NOT NULL,
  Ho_va_ten Nvarchar(50) NOT NULL,
  Ngay_thang_nam_sinh Datetime  NULL,
  Hoc_vi Nvarchar(20)  NULL,
  Thoi_gian_bat_dau_cong_tac Int  NULL,
  PRIMARY KEY (Ma_giang_vien)
);

CREATE TABLE Hoc_phan
(
  Ma_hoc_phan Nvarchar(10) NOT NULL,
  Ten_hoc_phan Nvarchar(50) NOT NULL,
  So_tin_chi INT  NULL,
  Loai Nvarchar(10)  NULL,
  Ty_le_diem_qua_trinh Int  NULL,
  Ty_le_diem_qua_thi Int  NULL,
  PRIMARY KEY (Ma_hoc_phan)
);

CREATE TABLE Lop_hoc_phan
(
  Nam_hoc Nvarchar(15) NULL,
  Dot_hoc Nvarchar(30)  NULL,
  Ma_lop_hoc_phan Nvarchar(10) NOT NULL,
  So_luong_sinh_vien INT  NULL,
  Ten_lop_hoc_phan Nvarchar(50) NOT NULL,
  Ma_hoc_phan Nvarchar(10)  NULL,
  Ma_giang_vien Nvarchar(10)  NULL,
  PRIMARY KEY (Ma_lop_hoc_phan),
  FOREIGN KEY (Ma_hoc_phan) REFERENCES Hoc_phan(Ma_hoc_phan),
  FOREIGN KEY (Ma_giang_vien) REFERENCES Giang_vien(Ma_giang_vien)
);

CREATE TABLE Bao_gom
(
  Thuoc_hoc_ky Nvarchar(10)  NULL,
  Ma_hoc_phan Nvarchar(10) NOT NULL,
  Ma_chuong_trinh_dao_tao Nvarchar(10) NOT NULL,
  PRIMARY KEY (Ma_hoc_phan, Ma_chuong_trinh_dao_tao),
  FOREIGN KEY (Ma_hoc_phan) REFERENCES Hoc_phan(Ma_hoc_phan),
  FOREIGN KEY (Ma_chuong_trinh_dao_tao) REFERENCES Chuong_trinh_dao_tao(Ma_chuong_trinh_dao_tao)
);

  CREATE TABLE Hoc
(
  Diem_qua_trinh FLOAT  NULL,
  Diem_thi FLOAT  NULL,
  Ma_lop_hoc_phan Nvarchar(10) NOT NULL,
  Ma_sinh_vien Nvarchar(10) NOT NULL,
  PRIMARY KEY (Ma_lop_hoc_phan, Ma_sinh_vien),
  FOREIGN KEY (Ma_lop_hoc_phan) REFERENCES Lop_hoc_phan(Ma_lop_hoc_phan),
  FOREIGN KEY (Ma_sinh_vien) REFERENCES Sinh_vien(Ma_sinh_vien)
);

-- Insert
USE QUANLYSINHVIEN

INSERT INTO Chuong_trinh_dao_tao (Ma_chuong_trinh_dao_tao, Ten_chuong_trinh_dao_tao, So_tin_chi_can_de_tot_nghiep, Nam_bat_dau) 
VALUES 
(N'7580206QT', N'Chương trình chất lượng cao Cầu đường bộ Việt-Pháp', 183, '2021'),
(N'7480201QT', N'Chương trình chất lượng cao Công nghệ thông tin Việt-Anh', 183, '2022'),
(N'7520103QT', N'Chương trình chất lượng cao Cơ khí ô tô Việt-Anh', 183, '2021'),
(N'7340301QT', N'Chương trình chất lượng cao Kế toán tổng hợp Việt-Anh', 140, '2022'),
(N'7340101QT', N'Chương trình chất lượng cao Quản trị kinh doanh Việt-Anh', 140, '2022'),
(N'7580201QT', N'Kỹ thuật xây dựng công trình giao thông', 183, '2021'),
(N'7480205', N' Công nghệ thông tin ', 183, '2022'),
(N'7580204QT',N'Chương trình chất lượng cao Cầu đường bộ Việt-Anh', 183, '2022'),
(N'7340302', N'Quản trị kinh doanh', 140, '2022'),
(N'7340102QT', N'Chương trình chất lượng cao Quản trị kinh doanh Việt-Anh', 140, '2022');

INSERT INTO Sinh_vien (Ma_sinh_vien, Ho, Dem, Ten, Ngay_sinh, Nam_nhap_hoc, Gioi_tinh, Ma_chuong_trinh_dao_tao) 
VALUES 
(N'212503530', N'Bùi', N'Xuân', N'Hoàng', '2003-02-15', 2021, N'Nam', N'7580206QT'),
(N'222601090', N'Trịnh', N'Công', N'Đức', '2004-12-01', 2022, N'Nam', N'7480201QT'),
(N'212534103', N'Trần', N'Công', N'Minh', '2003-11-20', 2021, N'Nam', N'7520103QT'),
(N'212534028', N'Phạm', N'Hồng', N'Nhung', '2003-08-05', 2021, N'Nữ', N'7340301QT'),
(N'232731150', N'Hoàng', N'Lan', N'Anh', '2005-12-04', 2023, N'Nữ', N'7340101QT'),
(N'212531062', N'Nguyễn', N'Hà', N'An', '2003-04-16', 2021, N'Nam', N'7580201QT'),
(N'222631063', N'Hà', N'Việt', N'Hoàng', '2004-5-06', 2022, N'Nam', N'7480205'),
(N'212531073', N'Lê', N'Trọng', N'Chính', '2003-10-25', 2021, N'Nam', N'7580204QT'),
(N'212531158', N'Nguyễn', N'Quốc', N'Việt', '2003-03-08', 2021, N'Nam', N'7340302'),
(N'232731147', N'Trần', N'Trường', N'Thức', '2005-09-06', 2023, N'Nam', N'7340102QT');

INSERT INTO Giang_vien (Ma_giang_vien, Ho_va_ten, Ngay_thang_nam_sinh, Hoc_vi, Thoi_gian_bat_dau_cong_tac) 
VALUES 
(N'GV002', N'Phạm Huy Khang', '1965-09-02', N'Tiến sĩ', '1990'),
(N'GV235', N'Hoàng Văn Thông', '1979-07-18', N'Tiến sĩ', '2004'),
(N'GV369', N'Vũ Tuấn Đạt', '1975-11-11', N'Tiến sĩ', '2000'),
(N'GV159', N'Lê Thị Hà', '1978-09-12', N'Thạc sĩ', '2003'),
(N'GV689', N'Nguyễn Hồng Thái', '1966-12-11', N'Tiến sĩ', '1990'),
(N'GV008', N'Nguyễn Sỹ Vũ', '1970-10-15', N'Tiến sĩ', '1998'),
(N'GV158', N'Nguyễn Đông Thiện', '1996-02-14', N'Thạc sĩ', '2022'),
(N'GV248', N'Nguyễn An Thạch', '1975-08-03', N'Tiến sĩ', '2008'),
(N'GV147', N'Nguyễn Mai Thanh', '1980-12-09', N'Tiến sĩ', '2014'),
(N'GV112', N'Bùi Xuân Sơn', '1968-04-01', N'Tiến sĩ', '2000');

INSERT INTO Hoc_phan (Ma_hoc_phan, Ten_hoc_phan, So_tin_chi, Loai, Ty_le_diem_qua_trinh,Ty_le_diem_qua_thi) 
VALUES 
(N'BS05012', N'Vẽ kĩ thuật F1', 2, N'Bắt buộc', 4,6),
(N'IT11093', N'Cấu trúc dữ liệu và giải thuật', 3, N'Bắt buộc', 5,5),
(N'ME04013', N'Chi tiết máy', 3, N'Bắt buộc', 4,6),
(N'TE10223', N'Khoa học quản lý', 3, N'Tự chọn', 4,6),
(N'PS00013', N'Lập kế hoạch kinh doanh', 2, N'Bắt buộc', 5,5),
(N'BS03012', N'Cơ học cơ sở', 2, N'Bắt buộc', 4,6),
(N'IT11053', N'Toán rời rạc', 3, N'Bắt buộc', 4,6),
(N'CA02013', N'Vật liệu xây dựng', 3, N'Bắt buộc', 5,5),
(N'TE00051', N'Marketing căn bản', 2, N'Bắt buộc', 4,6),
(N'BS00032', N'Giải tích', 2, N'Bắt buộc', 4,6);

INSERT INTO Lop_hoc_phan (Nam_hoc, Dot_hoc, Ma_lop_hoc_phan, So_luong_sinh_vien, Ten_lop_hoc_phan, Ma_hoc_phan, Ma_giang_vien) 
VALUES 
('2022-2023', N'2022_2023_1 Đợt học 1', N'QT34', 45, N'Vẽ kĩ thuật F1', N'BS05012', N'GV002'),
('2023-2024', N'2023_2024_1 Đợt học 1', N'QT08', 50, N'Cấu trúc dữ liệu và giải thuật', N'IT11093', N'GV235'),
('2022-2023', N'2022_2023_1 Đợt học 1', N'QT10', 40, N'Chi tiết máy', N'ME04013', N'GV369'),
('2022-2023', N'2022_2023_1 Đợt học 1', N'QT15', 15, N'Khoa học quản lý', N'TE10223', N'GV158'),
('2023-2024', N'2023_2024_1 Đợt học 1', N'QT02', 35, N'Lập kế hoạch kinh doanh', N'PS00013', N'GV689'),
('2022-2023', N'2022_2023_1 Đợt học 1', N'QT16', 45, N'Cơ học cơ sở', N'BS03012', N'GV008'),
('2023-2024', N'2023_2024_1 Đợt học 1', N'QT28', 50, N'Toán rời rạc', N'IT11053', N'GV159'),
('2022-2023', N'2022_2023_1 Đợt học 1', N'QT22', 40, N'Vật liệu xây dựng', N'CA02013', N'GV248'),
('2022-2023', N'2022_2023_1 Đợt học 1', N'QT19', 40, N'Marketing căn bản', N'TE00051', N'GV147'),
('2023-2024', N'2023_2024_1 Đợt học 1', N'QT05', 35, N'Giải tích', N'BS00032', N'GV112');

INSERT INTO Bao_gom (Thuoc_hoc_ky, Ma_hoc_phan, Ma_chuong_trinh_dao_tao) 
VALUES 
(N'Học kỳ 3', N'BS05012', N'7580206QT'),
(N'Học kỳ 3', N'IT11093', N'7480201QT'),
(N'Học kỳ 3', N'ME04013', N'7520103QT'),
(N'Học kỳ 4', N'TE10223', N'7340301QT'),
(N'Học kỳ 1', N'PS00013', N'7340101QT'),
(N'Học kỳ 3', N'BS03012', N'7580201QT'),
(N'Học kỳ 3', N'IT11053', N'7480205'),
(N'Học kỳ 3', N'CA02013', N'7580204QT'),
(N'Học kỳ 4', N'TE00051', N'7340302'),
(N'Học kỳ 1', N'BS00032', N'7340102QT');

INSERT INTO Hoc (Diem_qua_trinh, Diem_thi, Ma_lop_hoc_phan, Ma_sinh_vien) 
VALUES 
(7.5, 8.0, N'QT34', N'212503530'),
(9.0, 9.5, N'QT08', N'222601090'),
(3.0, 3.5, N'QT10', N'212534103'),
(9.0, 9.0, N'QT15', N'212534028'),
(8.5, 9.0, N'QT02', N'232731150'),
(1.0, 0.5, N'QT16', N'212531062'),
(7.0, 7.5, N'QT28', N'222631063'),
(3.0, 4.0, N'QT22', N'212531073'),
(8.5, 9.0, N'QT19', N'212531158'),
(8.0, 7.5, N'QT05', N'232731147');

-- Câu hỏi truy vấn
USE QUANLYSINHVIEN

--1 Cho biết danh sách các học phần mà sinh viên Trần Trường Thức đăng ký học kỳ 1 
SELECT DISTINCT hp.*  
FROM Hoc_phan hp  
JOIN Bao_gom bg ON hp.Ma_hoc_phan = bg.Ma_hoc_phan  
JOIN Chuong_trinh_dao_tao ctdt ON bg.Ma_chuong_trinh_dao_tao = ctdt.Ma_chuong_trinh_dao_tao  
JOIN Lop_hoc_phan lhp ON hp.Ma_hoc_phan = lhp.Ma_hoc_phan  
JOIN Hoc h ON lhp.Ma_lop_hoc_phan = h.Ma_lop_hoc_phan  
JOIN Sinh_vien sv ON h.Ma_sinh_vien = sv.Ma_sinh_vien  
WHERE bg.Thuoc_hoc_ky = N'Học kỳ 1'  
AND sv.Ho = N'Trần' AND sv.Dem = N'Trường' AND sv.Ten = N'Thức';



--2.Sinh viên nào có điểm thi cấu truc dữ liệu và giải thuật cao nhất trong học kì 3?
USE QUANLYSINHVIEN
WITH SV AS (
    SELECT *
    FROM Sinh_vien
),
H AS (
    SELECT *
    FROM Hoc
),
LHP AS (
    SELECT *
    FROM Lop_hoc_phan
),
BG AS (
    SELECT *
    FROM Bao_gom
),
q1 AS (
    SELECT BG.Ma_hoc_phan, H.Ma_sinh_vien, H.Diem_thi
    FROM BG
    JOIN LHP ON BG.Ma_hoc_phan = LHP.Ma_hoc_phan
    JOIN H ON LHP.Ma_lop_hoc_phan = H.Ma_lop_hoc_phan
    WHERE BG.Thuoc_hoc_ky = N'Học kỳ 3'
),
q2 AS (
    SELECT Ma_sinh_vien AS Ma_sinh_vien_max, MAX(Diem_thi) AS Max_Diem_thi
    FROM q1
    GROUP BY Ma_sinh_vien
),
q3 AS (
    SELECT q2.Ma_sinh_vien_max, SV.*
    FROM q2
    JOIN SV ON q2.Ma_sinh_vien_max = SV.Ma_sinh_vien
)
SELECT q3.Ma_sinh_vien_max, q3.Ho, q3.Dem, q3.Ten, q3.Ngay_sinh, q3.Nam_nhap_hoc, q3.Gioi_tinh
FROM q3
JOIN Hoc h ON q3.Ma_sinh_vien_max = h.Ma_sinh_vien
JOIN Lop_hoc_phan lhp ON h.Ma_lop_hoc_phan = lhp.Ma_lop_hoc_phan
JOIN Hoc_phan hp ON lhp.Ma_hoc_phan = hp.Ma_hoc_phan
WHERE hp.Ten_hoc_phan = N'Cấu trúc dữ liệu và giải thuật';





--3.Hãy cho biết tổng số tín chỉ mà sinh viên Lê Trọng Chính đã đăng ký trong học kì 3?
USE QUANLYSINHVIEN
SELECT SUM(hp.So_tin_chi) AS Tong_so_tin_chi
FROM Sinh_vien SV
JOIN Hoc H ON SV.Ma_sinh_vien = H.Ma_sinh_vien
JOIN Lop_hoc_phan LHP ON H.Ma_lop_hoc_phan = LHP.Ma_lop_hoc_phan
JOIN Hoc_phan HP ON LHP.Ma_hoc_phan = HP.Ma_hoc_phan
JOIN Bao_gom ON HP.Ma_hoc_phan = Bao_gom.Ma_hoc_phan
WHERE SV.Ho = N'Lê' AND SV.Dem = N'Trọng' AND SV.Ten = N'Chính' AND Bao_gom.Thuoc_hoc_ky = N'Học kỳ 3'
GROUP BY SV.Ma_sinh_vien;


--4.Tìm tên của sinh viên có điểm tổng kết của lớp học phần QT19 lớn hơn 8
USE QUANLYSINHVIEN
SELECT sv.Ho, sv.Dem, sv.Ten
FROM Sinh_vien sv
JOIN Hoc h ON sv.Ma_sinh_vien = h.Ma_sinh_vien
JOIN Lop_hoc_phan lhp ON h.Ma_lop_hoc_phan = lhp.Ma_lop_hoc_phan
JOIN Bao_gom bg ON lhp.Ma_hoc_phan = bg.Ma_hoc_phan
WHERE lhp.Ma_lop_hoc_phan = 'QT19'
AND h.Diem_thi > 8;



--5.Khen thưởng cho những sinh viên có tổng kết học kì 3 > 9 và cảnh báo học tập những sinh viên dưới 3
USE QUANLYSINHVIEN
SELECT SV.*
FROM Sinh_vien SV
JOIN (
    SELECT
        H.Ma_sinh_vien,
        (H.Diem_thi * HP.Ty_le_diem_qua_thi + H.Diem_qua_trinh * HP.Ty_le_diem_qua_trinh) / 10 AS Diem
    FROM Hoc H
    JOIN Lop_hoc_phan LHP ON H.Ma_lop_hoc_phan = LHP.Ma_lop_hoc_phan
    JOIN Bao_gom BG ON LHP.Ma_hoc_phan = BG.Ma_hoc_phan
    JOIN Hoc_phan HP ON BG.Ma_hoc_phan = HP.Ma_hoc_phan
) AS T
ON SV.Ma_sinh_vien = T.Ma_sinh_vien;

-- Khen thưởng cho những sinh viên có điểm > 9
SELECT SV.*
FROM Sinh_vien SV
JOIN (
    SELECT
        H.Ma_sinh_vien,
        (H.Diem_thi * HP.Ty_le_diem_qua_thi + H.Diem_qua_trinh * HP.Ty_le_diem_qua_trinh) / 10 AS Diem
    FROM Hoc H
    JOIN Lop_hoc_phan LHP ON H.Ma_lop_hoc_phan = LHP.Ma_lop_hoc_phan
    JOIN Bao_gom BG ON LHP.Ma_hoc_phan = BG.Ma_hoc_phan
    JOIN Hoc_phan HP ON BG.Ma_hoc_phan = HP.Ma_hoc_phan
) AS T
ON SV.Ma_sinh_vien = T.Ma_sinh_vien
WHERE T.Diem > 9;

-- Cảnh báo cho những sinh viên có điểm < 3
SELECT SV.*
FROM Sinh_vien SV
JOIN (
    SELECT
        H.Ma_sinh_vien,
        (H.Diem_thi * HP.Ty_le_diem_qua_thi + H.Diem_qua_trinh * HP.Ty_le_diem_qua_trinh) / 10 AS Diem
    FROM Hoc H
    JOIN Lop_hoc_phan LHP ON H.Ma_lop_hoc_phan = LHP.Ma_lop_hoc_phan
    JOIN Bao_gom BG ON LHP.Ma_hoc_phan = BG.Ma_hoc_phan
    JOIN Hoc_phan HP ON BG.Ma_hoc_phan = HP.Ma_hoc_phan
) AS T
ON SV.Ma_sinh_vien = T.Ma_sinh_vien
WHERE T.Diem < 3;




--6.Tìm tên, học vị của các giảng viên dạy môn N'Marketing căn bản'  trong học kỳ 4 và có sinh viên có điểm tổng kết  lớn hơn 8.
USE QUANLYSINHVIEN
SELECT gv.Ho_va_ten AS Ten_giang_vien, gv.Hoc_vi
FROM Giang_vien gv
JOIN Lop_hoc_phan lhp ON gv.Ma_giang_vien = lhp.Ma_giang_vien
JOIN Bao_gom bg ON lhp.Ma_hoc_phan = bg.Ma_hoc_phan
JOIN Hoc_phan hp ON lhp.Ma_hoc_phan = hp.Ma_hoc_phan
JOIN Hoc h ON lhp.Ma_lop_hoc_phan = h.Ma_lop_hoc_phan
JOIN Sinh_vien sv ON h.Ma_sinh_vien = sv.Ma_sinh_vien
WHERE hp.Ten_hoc_phan = N'Marketing căn bản'
AND bg.Thuoc_hoc_ky = N'Học kỳ 4'
AND ((h.Diem_qua_trinh * hp.Ty_le_diem_qua_trinh) + (h.Diem_thi * hp.Ty_le_diem_qua_thi)) / (hp.Ty_le_diem_qua_trinh + hp.Ty_le_diem_qua_thi) > 8;







-- 7.Liệt kê tất cả các học phần mà giảng viên có mã 001 giảng dạy trong 3 học kì gần nhất và số lượng sinh viên đã học cho mỗi học phần đó.
USE QUANLYSINHVIEN
SELECT hp.Ma_hoc_phan, hp.Ten_hoc_phan, lhp.So_luong_sinh_vien
FROM Hoc_phan hp
JOIN Lop_hoc_phan lhp ON hp.Ma_hoc_phan = lhp.Ma_hoc_phan
JOIN Giang_vien gv ON lhp.Ma_giang_vien = gv.Ma_giang_vien
JOIN Bao_gom bg ON hp.Ma_hoc_phan = bg.Ma_hoc_phan
WHERE gv.Ma_giang_vien = N'GV235'
AND bg.Thuoc_hoc_ky IN (N'Học kỳ 1', N'Học kỳ 2', N'Học kỳ 3');


--8.Liệt kê tất cả các lớp học phần mà có  sinh viên có điểm quá trình học phần dưới 5 
USE QUANLYSINHVIEN
SELECT DISTINCT lhp.Ma_lop_hoc_phan, lhp.Ten_lop_hoc_phan
FROM Lop_hoc_phan lhp
JOIN Hoc h ON lhp.Ma_lop_hoc_phan = h.Ma_lop_hoc_phan
WHERE EXISTS (
    SELECT 1
    FROM Hoc
    WHERE Ma_lop_hoc_phan = lhp.Ma_lop_hoc_phan AND Diem_qua_trinh < 5
);

--9.Lớp học phần chi tiết máy QT10 có bao nhiêu sinh viên do ai giảng dạy và giảng dạy vào học kì nào ?
USE QUANLYSINHVIEN
SELECT lhp.Ma_lop_hoc_phan, lhp.Ten_lop_hoc_phan, lhp.So_luong_sinh_vien, gv.Ho_va_ten AS Ten_giang_vien, lhp.Nam_hoc, lhp.Dot_hoc
FROM Lop_hoc_phan lhp
JOIN Giang_vien gv ON lhp.Ma_giang_vien = gv.Ma_giang_vien
WHERE lhp.Ma_lop_hoc_phan = 'QT10';



--10.Cho biết học vị của giảng viên giảng dạy môn vẽ kĩ thuật F1?
USE QUANLYSINHVIEN
SELECT gv.Hoc_vi
FROM Giang_vien gv
JOIN Lop_hoc_phan lhp ON gv.Ma_giang_vien = lhp.Ma_giang_vien
JOIN Hoc_phan hp ON lhp.Ma_hoc_phan = hp.Ma_hoc_phan
WHERE hp.Ten_hoc_phan = N'Vẽ kĩ thuật F1';



--11.Hãy tìm số lượng sinh viên  môn lập kế hoạch kinh doanh năm '2023-2024' Đợt học 1 có điểm Thi từ 7 đến 9
USE QUANLYSINHVIEN
SELECT COUNT(DISTINCT sv.Ma_sinh_vien) AS So_luong_sinh_vien
FROM Sinh_vien sv
JOIN Hoc h ON sv.Ma_sinh_vien = h.Ma_sinh_vien
JOIN Lop_hoc_phan lhp ON h.Ma_lop_hoc_phan = lhp.Ma_lop_hoc_phan
JOIN Hoc_phan hp ON lhp.Ma_hoc_phan = hp.Ma_hoc_phan
WHERE hp.Ten_hoc_phan = N'Lập kế hoạch kinh doanh'
AND lhp.Nam_hoc = '2023-2024'
AND lhp.Dot_hoc = N'1'
AND h.Diem_thi BETWEEN 7 AND 9;





--12.Thông tin của sinh viên có tên Bùi Xuân Hoàng 
USE QUANLYSINHVIEN
SELECT *
FROM Sinh_vien
WHERE Ho = N'Bùi' AND Dem = N'Xuân' AND Ten = N'Hoàng';




--13.Cho biết thông tin giảng viên  giảng dạy các môn học thuộc chương trình đào tạo N'Chương trình chất lượng cao Cơ khí ô tô Việt-Anh'
USE QUANLYSINHVIEN
SELECT DISTINCT gv.*
FROM Lop_hoc_phan lhp
JOIN Bao_gom bg ON lhp.Ma_hoc_phan = bg.Ma_hoc_phan
JOIN Chuong_trinh_dao_tao ctdt ON bg.Ma_chuong_trinh_dao_tao = ctdt.Ma_chuong_trinh_dao_tao
JOIN Giang_vien gv ON lhp.Ma_giang_vien = gv.Ma_giang_vien
WHERE ctdt.Ten_chuong_trinh_dao_tao = N'Chương trình chất lượng cao Cơ khí ô tô Việt-Anh';





--14.Liệt kê tất cả các lớp học phần có số lượng sinh viên lớn hơn 30
USE QUANLYSINHVIEN
SELECT *
FROM Lop_hoc_phan
WHERE So_luong_sinh_vien > 30;






--15. Hãy tìm sinh viên môn lập kế hoạch kinh doanh năm 2022_2023 Đợt học 1 có điểm thi từ 8 trở lên
USE QUANLYSINHVIEN
SELECT sv.Ma_sinh_vien, sv.Ho, sv.Dem, sv.Ten
FROM Sinh_vien sv
JOIN Hoc h ON sv.Ma_sinh_vien = h.Ma_sinh_vien
JOIN Lop_hoc_phan lhp ON h.Ma_lop_hoc_phan = lhp.Ma_lop_hoc_phan
JOIN Hoc_phan hp ON lhp.Ma_hoc_phan = hp.Ma_hoc_phan
WHERE hp.Ten_hoc_phan =  N'Lập kế hoạch kinh doanh'
AND lhp.Nam_hoc = '2023-2024'
AND lhp.Dot_hoc = N'2023_2024_1 Đợt học 1'
AND h.Diem_thi >= 8;



-- thong tin sinh vien dang hoc mon "Cấu trúc dữ liệu và giải thuật" co do tuoi tu 20 den 25
SELECT 
    SV.Ma_sinh_vien, 
    SV.Ho, 
    SV.Dem, 
    SV.Ten, 
    SV.Ngay_sinh, 
    SV.Nam_nhap_hoc, 
    SV.Gioi_tinh,
    HP.Ten_hoc_phan
FROM 
    Sinh_vien SV
INNER JOIN 
    Hoc H ON SV.Ma_sinh_vien = H.Ma_sinh_vien
INNER JOIN 
    Lop_hoc_phan LHP ON H.Ma_lop_hoc_phan = LHP.Ma_lop_hoc_phan
INNER JOIN 
    Hoc_phan HP ON LHP.Ma_hoc_phan = HP.Ma_hoc_phan
WHERE 
    HP.Ten_hoc_phan = N'Cấu trúc dữ liệu và giải thuật'
AND 
    DATEDIFF(YEAR, SV.Ngay_sinh, GETDATE()) BETWEEN 20 AND 25;


-- Dua ra sinh vien co diem tong cao nhat 
WITH DiemTong AS (
    SELECT
        SV.Ma_sinh_vien,
        SV.Ho,
        SV.Dem,
        SV.Ten,
        SUM((H.Diem_qua_trinh * HP.Ty_le_diem_qua_trinh + H.Diem_thi * HP.Ty_le_diem_qua_thi) / 10.0) AS TongDiem
    FROM Sinh_vien SV
    JOIN Hoc H ON SV.Ma_sinh_vien = H.Ma_sinh_vien
    JOIN Lop_hoc_phan LHP ON H.Ma_lop_hoc_phan = LHP.Ma_lop_hoc_phan
    JOIN Hoc_phan HP ON LHP.Ma_hoc_phan = HP.Ma_hoc_phan
    GROUP BY SV.Ma_sinh_vien, SV.Ho, SV.Dem, SV.Ten
)
SELECT TOP 1 *
FROM DiemTong
ORDER BY TongDiem DESC;
