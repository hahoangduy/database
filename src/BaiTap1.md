Các thực thể và Thuộc tính thô (Chưa có khóa)
TRƯỜNG (School): Mã trường, Tên trường, Địa chỉ, Cấp học (Cấp 1, 2, 3), Năm thành lập.

GIÁO VIÊN (Teacher): Mã giáo viên, Họ và tên, Ngày sinh, Giới tính, (Môn giảng dạy, môn lý, toán, gvcn), Số điện thoại.

LỚP HỌC (Class): Mã lớp, Tên lớp (VD: 10A1, 11B2), Khối (10, 11, 12), Năm học.

HỌC SINH (Student): Mã học sinh, Họ và tên, Ngày sinh, Giới tính, Địa chỉ.

2. Mối quan hệ (Quy tắc nghiệp vụ)
   Trường & Lớp học: Một Trường có rất nhiều Lớp học. Nhưng mỗi Lớp học chỉ thuộc về đúng một Trường.

Trường & Giáo viên: Một Trường có nhiều Giáo viên công tác. Mỗi Giáo viên chỉ làm việc toàn thời gian tại một Trường duy nhất.

Lớp học & Học sinh: Mỗi Lớp học có nhiều Học sinh. Trong một năm học, mỗi Học sinh chỉ được học ở đúng một Lớp học.

Giáo viên & Lớp học (Chủ nhiệm): Mỗi Lớp học có duy nhất 1 Giáo viên chủ nhiệm. 
Một Giáo viên có thể chủ nhiệm nhiều Lớp (ví dụ năm nay chủ nhiệm 10A1, năm sau chủ nhiệm 11A1).

Giáo viên & Lớp học (Giảng dạy bộ môn): Đây là phần thú vị nhất! Một Giáo viên có thể dạy bộ môn cho nhiều Lớp. 
Ngược lại, một Lớp sẽ được dạy bởi nhiều Giáo viên khác nhau.

🎯 Nhiệm vụ của bạn:
Dựa vào dữ kiện trên, bạn hãy viết ra thiết kế của bạn. Bạn không cần viết code CREATE TABLE vội (nếu muốn viết cũng được), 
chỉ cần liệt kê theo format giống như sau để mình xem tư duy đặt Khóa của bạn đã chuẩn chưa:

Ví dụ định dạng bạn có thể trả lời:

Table: Truong

id (PK, INT)

name (VARCHAR)

...

Table: ...


Bài làm:
<img width="1285" height="767" alt="Screenshot 2026-09-09 101118" src="https://github.com/user-attachments/assets/a6b78f76-18f6-4970-8471-2d7c428d68ab" />

Lên trang web dbdiagram.io
paste code:

Table school {

id integer [primary key]

name varchar

address varchar

grade_level varchar

year_of_establishment date

}

Table class {

id integer [primary key]

name varchar

grade varchar

school_year date

teacher_id integer [not null]

school_id integer [not null]

}

Table teacher {

id integer [primary key]

name varchar

bd date

sex varchar

major varchar

tel integer

school_id integer

}

Table student {

id integer [primary key]

name varchar

bd date

sex varchar

address varchar

class_id integer

}

Table classInfor {

class_id integer [primary key]

teacher_id integer [primary key]

}

Ref school_class: class.school_id ?> school.id

Ref school_teacher: teacher.school_id ?> school.id

Ref class_student: student.class_id ?> class.id

Ref class_teacher: class.teacher_id ?> teacher.id

Ref: class.id <? classInfor.class_id

Ref: teacher.id <? classInfor.teacher_id



CODE:

create database mySchool;



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

values 
(1, "Ly Tu Trong", "Dak Nong", "Cap 1", "2000-04-23"),

(2, "Chu Van An", "Dak Nong", "Cap 2", "2002-01-07"),

(3, "Truong Vinh Ky", "Dak Nong", "Cap 3", "2003-05-14")



insert into class

values
(1, "5A", "Khoi 5", "2022", 2, 1),

(2, "9A2", "Khoi 9", "2024", 1, 2),

(3, "12A3", "Khoi 12", "2025", 3, 3);



insert into teacher

values 
(1, "Tran Van A", "1999-02-05", "Nam", "Toan", 0987, 1),

(2, "Nguyen Thi B", "2001-05-23", "Nu", "Ly", 1234, 2),

(3, "Ha Hoang C", "2005-11-06", "Nam", "Hoa", 5678, 3);



insert into student

values 
(1, "Nguyen Thanh A", "2018-04-12", "Nam", "Dak Nong", 1),
      
(2, "Le Nu B", "2014-09-28", "Nu", "Dak Nong", 2),

(3, "Tran Nhat C", "2009-12-09", "Nam", "Dak Nong", 3);



insert into classinfor

values 
(2, 3),

(1, 2),

(3, 1);

insert into student

values 
(4, "Nguyen Hai Nam", "2018-02-3", "Nam", "Dak Nong", 1),

(5, "Hoang Thanh Truc", "2018-05-12", "Nu", "Dak Nong", 1),

(6, "Phan Huu Tai", "2010-01-17", "Nam", "Dak Nong", 3),

(7, "Vu Le Thanh", "2017-08-23", "Nam", "Dak Nong", 1),

(8, "Le Thi Yen Nhi", "2012-04-25", "Nu", "Dak Nong", 2),

(9, "Nguyen Dinh Thien", "2011-07-29", "Nam", "Dak Nong", 3);



select * from school;

select * from class;

select * from teacher;

select * from student;

select * from classinfor;
