create table school (
	school_id int,
    school_name varchar(20),
    school_address varchar(20),
    school_grade_level varchar(10),
    year_of_establishment date
);

create table class (
  class_id int primary key,
  class_name varchar(10), 
  class_grade varchar(10),
  school_year date,
  teacher_id int not null,
  school_id int not null
);

create table student (
  student_id int primary key,
  student_name varchar(10),  
  student_bd date,
  student_sex varchar(10),
  student_address varchar(20),
  class_id int not null
);

create table teacher (
  teacher_id int primary key,
  teacher_name varchar(10),  
  teacher_bd date,
  teacher_sex varchar(10),
  teacher_major varchar(10),
  teacher_tel int,
  school_id int not null
);

create table classInfor (
	class_id int,
    teacher_id int
);

alter table classinfor
add primary key(class_id, teacher_id);

alter table school
add primary key(school_id);

alter table class
add constraint fk_teacher_id
foreign key(teacher_id) references teacher(teacher_id);

alter table class
add constraint fk_school_id
foreign key(school_id) references school(school_id);

alter table teacher
add constraint fk_school_id_teacher
foreign key(school_id) references school(school_id);

alter table student
add constraint fk_class_id_
foreign key(class_id) references class(class_id);

insert into school
values (1, "Ly Tu Trong", "Dak Nong", "Cap 1", "2000-04-23"),
	   (2, "Chu Van An", "Dak Nong", "Cap 2", "2002-01-07"),
       (3, "Truong Vinh Ky", "Dak Nong", "Cap 3", "2003-05-14");
       
insert into class
values (1, "5A", "Khoi 5", 2022, 2, 1),
	   (2, "9A2", "Khoi 9", 2024, 1, 2),
       (3, "12A3", "Khoi 12", 2025, 3, 3);
       
insert into teacher
values (1, "Tran Van A", "1999-02-05", "Nam", "Toan", 0987, 1),
	   (2, "Nguyen Thi B", "2001-05-23", "Nu", "Ly", 1234, 2),
       (3, "Ha Hoang C", "2005-11-06", "Nam", "Hoa", 5678, 3);
       
insert into student
values (1, "Nguyen Thanh A", "2018-04-12", "Nam", "Dak Nong", 1),
	   (2, "Le Nu B", "2014-09-28", "Nu", "Dak Nong", 2),
       (3, "Tran Nhat C", "2009-12-09", "Nam", "Dak Nong", 3);
       

insert into classinfor
values (2, 3),
	   (1, 2),
       (3, 1);

alter table student
modify column student_name varchar(30);

alter table teacher
modify column teacher_name varchar(30);

alter table class
modify column school_year int;

insert into student
values (4, "Nguyen Hai Nam", "2018-02-3", "Nam", "Dak Nong", 1),
	   (5, "Hoang Thanh Truc", "2018-05-12", "Nu", "Dak Nong", 1),
       (6, "Phan Huu Tai", "2010-01-17", "Nam", "Dak Nong", 3),
       (7, "Vu Le Thanh", "2017-08-23", "Nam", "Dak Nong", 1),
	   (8, "Le Thi Yen Nhi", "2012-04-25", "Nu", "Dak Nong", 2),
       (9, "Nguyen Dinh Thien", "2011-07-29", "Nam", "Dak Nong", 3);

insert into teacher
values (4, "Ngo Bich Ngoc", "1999-02-05", "Nu", "Toan", 0987, 2),
	   (5, "Nguyen Dang Luu", "2001-05-23", "Nam", "Ly", 1234, 2),
       (6, "Ha Thien Dung", "2005-11-06", "Nam", "Hoa", 5678, 3),
       (7, "Tran Dai Thanh", "2001-05-23", "Nam", "Toan", 1234, 2),
       (8, "Le Tan Phong", "2001-05-23", "Nam", "Toan", 1234, 3);

UPDATE student
SET student_bd = '2017-12-22'
WHERE student_id = 5;

select count(student_id)
from student
where class_id = 1;


select class_id, count(class_id) as so_luong_hoc_sinh
from student
group by class_id order by so_luong_hoc_sinh desc
limit 1;

select class_id, count(class_id) as so_luong_hoc_sinh
from student
group by class_id order by so_luong_hoc_sinh asc
limit 1;

select class_name, student_name from class
inner join student on student.class_id = class.class_id;

select * from teacher
where teacher.teacher_major = "Toan";


select * from school;

select * from class;

select * from teacher;

select * from student;

select * from classinfor;

insert into class
values (6, "6A1", "Khoi 6", 2019, 3, 4),
	   (7, "10A4", "Khoi 10", 2018, 5, 4);
       
insert into classinfor
values (4,3),
	   (4,2),
	   (5,2);


-- 1. Liệt kê tất cả các lớp và số học sinh của mỗi lớp, kể cả lớp chưa có học sinh nào (phải hiện số 0).

SELECT c.class_id, c.class_name, c.class_grade, COUNT(student_id) as SoLuongHocSinh
FROM class c
LEFT JOIN student st ON c.class_id = st.class_id
GROUP BY c.class_id, st.class_id;

-- 2. Liệt kê tất cả các lớp, kèm tên các học sinh nữ trong lớp đó. Lớp không có học sinh nữ vẫn phải hiện ra (cột tên học sinh để trống).alter

SELECT c.class_id, c.class_name, c.class_grade, st.student_name as HocSinhNu
FROM class c
LEFT JOIN student st ON c.class_id = st.class_id
AND st.student_sex LIKE 'Nữ';

-- 3. Liệt kê tên học sinh, tên lớp và tên trường.

SELECT st.student_name, c.class_name, s.school_name
FROM student st
INNER JOIN class c ON st.class_id = c.class_id
INNER JOIN school s ON c.school_id = s.school_id;

-- 4. Đếm số học sinh nam và số học sinh nữ của từng lớp.

SELECT c.class_id, c.class_name, COUNT(CASE WHEN student_sex LIKE 'Nam' THEN 1 END) AS HocSinhNam, COUNT(CASE WHEN student_sex LIKE 'Nữ' THEN 1 END) as HocSinhNu
FROM class c
LEFT JOIN student st ON c.class_id = st.class_id
GROUP BY c.class_id, st.class_id;

-- 5. Tìm các lớp có từ 3 học sinh trở lên.

SELECT c.class_id, c.class_name, COUNT(student_id) AS SoHocSinh
FROM class c
INNER JOIN student st ON c.class_id = st.class_id
GROUP BY c.class_id, st.class_id
HAVING COUNT(student_id) >= 3;

-- 6. Mỗi giáo viên đang dạy bao nhiêu lớp? Sắp xếp giảm dần.

SELECT t.teacher_id, t.teacher_name, COUNT(class_id) AS SoLopDangDay
FROM teacher t
INNER JOIN classinfor ci ON t.teacher_id = ci.teacher_id
GROUP BY t.teacher_id, ci.teacher_id
ORDER BY COUNT(class_id) DESC;

-- 7. Tìm học sinh lớn tuổi nhất

SELECT * FROM student
ORDER BY student_bd ASC
LIMIT 1;

-- 8. Tìm các lớp có sĩ số lớn hơn sĩ số trung bình của tất cả các lớp.

SELECT c.class_id, c.class_name, COUNT(student_id) AS SiSoLop
FROM class c
INNER JOIN student st ON c.class_id = st.class_id
GROUP BY c.class_id, c.class_name
HAVING COUNT(student_id) > (
	  SELECT AVG(SiSo)
	  FROM (
		  SELECT COUNT(*) AS SiSo
          FROM student
          GROUP BY class_id
	  ) AS temp
);

-- 9. Tìm học sinh nhỏ tuổi nhất trong từng lớp.

SELECT c.class_id, c.class_name, st.student_id, st.student_name, TIMESTAMPDIFF(YEAR, st.student_bd, CURDATE()) AS Tuoi
FROM class c
INNER JOIN student st ON c.class_id = st.class_id
INNER JOIN (
    SELECT class_id, MIN(TIMESTAMPDIFF(YEAR, student_bd, CURDATE())) AS min_tuoi
	FROM student
    GROUP BY class_id
) AS temp ON st.class_id = temp.class_id 
AND TIMESTAMPDIFF(YEAR, st.student_bd, CURDATE()) = temp.min_tuoi;

-- 10. Tìm giáo viên không dạy lớp nào

SELECT t.teacher_id, t.teacher_name
FROM teacher t
LEFT JOIN classinfor ci ON t.teacher_id = ci.teacher_id
WHERE ci.class_id IS NULL;

-- 11. Tìm những trường không có học sinh nào

SELECT sc.school_id, sc.school_name
FROM school sc
LEFT JOIN class c ON sc.school_id = c.school_id
LEFT JOIN student st ON c.class_id = st.class_id
GROUP BY sc.school_id, sc.school_name
HAVING COUNT(st.student_id) = 0;

SELECT *
FROM school sc
LEFT JOIN class c ON sc.school_id = c.school_id
LEFT JOIN student st ON c.class_id = st.class_id;


SELECT sc.*, COUNT(st.student_id)
FROM school sc
LEFT JOIN class c ON sc.school_id = c.school_id
LEFT JOIN student st ON c.class_id = st.class_id
GROUP BY sc.school_id;


SELECT sc.*, COUNT(c.class_id)
FROM school sc
LEFT JOIN class c ON sc.school_id = c.school_id
LEFT JOIN student st ON c.class_id = st.class_id
GROUP BY sc.school_id;



-- 12. Xếp hạng các lớp theo sĩ số trong từng trường, sau đó chỉ lấy lớp đông nhất của mỗi trường.

SELECT t1.school_id, t1.class_id, t1.class_name, t1.SiSoLop
FROM (
	  SELECT c.school_id, c.class_id, c.class_name, COUNT(student_id) AS SiSoLop
	  FROM class c
	  INNER JOIN student st ON c.class_id = st.class_id
	  GROUP BY c.school_id, c.class_id, c.class_name
) AS t1
JOIN (
	  SELECT school_id, MAX(SiSoLop) AS MaxSiSo
    FROM (
	  SELECT c.school_id, c.class_id, COUNT(st.student_id) AS SiSoLop
        FROM class c
        LEFT JOIN student st ON c.class_id = st.class_id
        GROUP BY c.school_id, c.class_id
    ) AS temp
    GROUP BY school_id
) AS t2 ON t1.school_id = t2.school_id
		    AND t1.SiSoLop = t2.MaxSiSo;


-- Xóa các dòng phân công "ma" (lớp không tồn tại) 

DELETE FROM classinfor 

WHERE class_id 

NOT IN (SELECT class_id FROM class);  

INSERT INTO school 
	VALUES   (5, 'Nguyen Du', 'Dak Lak', 'Cap 2', '2010-09-05'),
			 (6, 'Le Loi',    'Dak Lak', 'Cap 1', '2015-08-20');   


-- trường không có lớp  

INSERT INTO class 
	VALUES   (8, '6A1', 'Khoi 6', 2025, 3, 4),
             (9, '7A2', 'Khoi 7', 2025, 5, 4);  


-- lớp 7 không có học sinh  

INSERT INTO student 
	VALUES   (10, 'Do Minh Khoa',  '2014-03-15', 'Nam', 'Dak Lak',  6),
             (11, 'Pham Thu Ha',   '2014-11-02', 'Nu',  'Dak Lak',  6),   
             (12, 'Tran Bao Ngoc', '2018-04-12', 'Nu',  'Dak Nong', 1);  

-- trùng ngày sinh với học sinh 1  

INSERT INTO classinfor 
	VALUES (6, 4),
           (6, 5),
           (3, 6);


-- Bài 1. Liệt kê giáo viên kèm cột NhomTuoi: dưới 25 tuổi là 'Tre', từ 25 đến 30 là 'Trung binh', trên 30 là 'Lon'.

SELECT 
    teacher_id,
    teacher_name,
    teacher_bd,
    CASE 
        WHEN TIMESTAMPDIFF(YEAR, teacher_bd, CURDATE()) < 25 THEN 'Tre'
        WHEN TIMESTAMPDIFF(YEAR, teacher_bd, CURDATE()) BETWEEN 25 AND 30 THEN 'Trung binh'
        ELSE 'Lon'
    END AS NhomTuoi
FROM teacher;

-- Bài 2. Với mỗi trường, đếm số giáo viên theo chuyên môn, hiển thị thành 3 cột riêng: SoGVToan, SoGVLy, SoGVHoa. Trường không có giáo viên vẫn hiện số 0.

SELECT 
    s.school_id,
    s.school_name,
    SUM(CASE WHEN t.teacher_major = 'Toan' THEN 1 ELSE 0 END) AS SoGVToan,
    SUM(CASE WHEN t.teacher_major = 'Ly'   THEN 1 ELSE 0 END) AS SoGVLy,
    SUM(CASE WHEN t.teacher_major = 'Hoa'  THEN 1 ELSE 0 END) AS SoGVHoa
FROM school s
LEFT JOIN teacher t ON s.school_id = t.school_id
GROUP BY s.school_id, s.school_name
ORDER BY s.school_id;

SELECT 
    s.school_id,
    s.school_name,
    SUM(CASE WHEN t.teacher_major = 'Toan' THEN 1 ELSE 0 END) AS SoGVToan,
    SUM(CASE WHEN t.teacher_major = 'Ly'   THEN 1 ELSE 0 END) AS SoGVLy,
    SUM(CASE WHEN t.teacher_major = 'Hoa'  THEN 1 ELSE 0 END) AS SoGVHoa
FROM school s
LEFT JOIN teacher t ON s.school_id = t.school_id
GROUP BY s.school_id
ORDER BY s.school_id;

-- Bài 3. Tìm học sinh sinh vào quý 1 (tháng 1, 2, 3).
SELECT *
FROM student
WHERE MONTH(student_bd) IN (1, 2, 3);

-- Bài 4. Tìm học sinh có sinh nhật trong tháng hiện tại.

SELECT *
FROM student
WHERE MONTH(student_bd) = MONTH(CURDATE());

-- Bài 8. Tạo danh sách tất cả mọi người trong hệ thống gồm 3 cột: Ten, NgaySinh, VaiTro ('Hoc sinh' hoặc 'Giao vien'). Sắp xếp theo ngày sinh.  

SELECT student_name AS Ten, student_bd AS NgaySinh, 'Hoc sinh' AS VaiTro
FROM student
UNION ALL
SELECT teacher_name, teacher_bd, 'Giao vien'
FROM teacher
ORDER BY NgaySinh;

-- Bài 9. Liệt kê các địa chỉ xuất hiện trong bảng school và bảng student. Chạy bằng UNION rồi bằng UNION ALL, so sánh số dòng và giải thích vì sao khác nhau.

SELECT school_address AS DiaChi FROM school
UNION
SELECT student_address FROM student;


SELECT school_address AS DiaChi FROM school
UNION ALL
SELECT student_address FROM student;

-- Bài 10. Tìm các trường có ít nhất một giáo viên dạy Toán.  

SELECT s.school_id, s.school_name, SUM(CASE WHEN t.teacher_major = 'Toan' THEN 1 ELSE 0 END) AS GvDayToan
FROM school s
INNER JOIN teacher t ON s.school_id = t.school_id
GROUP BY s.school_id, s.school_name
ORDER BY s.school_id;

SELECT * FROM teacher
INNER JOIN school ON teacher.school_id = school.school_id;

SELECT * FROM teacher
INNER JOIN school ON teacher.school_id = school.school_id
WHERE teacher.teacher_major = 'Toan';

SELECT school.school_id, school.school_name, school_address
FROM teacher
INNER JOIN school ON teacher.school_id = school.school_id
WHERE teacher.teacher_major = 'Toan'
GROUP BY school.school_id;

-- Bài 11. Tìm học sinh sinh trước tất cả học sinh của lớp 5A.

SELECT *
FROM student st
WHERE st.student_bd < (
	SELECT MIN(student_bd)
    FROM student 
    WHERE class_id = 1
);

-- Bài 12. Tìm lớp có nhiều giáo viên dạy nhất (dựa vào classinfor). Nếu có nhiều lớp bằng nhau thì hiện hết.

SELECT c.class_id, c.class_name, COUNT(ci.teacher_id) AS SoGiaoVien
FROM class c
INNER JOIN classinfor ci ON c.class_id = ci.class_id
GROUP BY c.class_id, c.class_name
HAVING COUNT(ci.teacher_id) = (
    SELECT MAX(gv)
    FROM (
        SELECT COUNT(teacher_id) AS gv
        FROM classinfor
        GROUP BY class_id
    ) AS t
);


