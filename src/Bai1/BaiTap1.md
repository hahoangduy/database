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

- In danh sách lớp và tên học sinh của lớp đó
- In danh sách những giáo viên dạy toán

Ví dụ định dạng bạn có thể trả lời:

Table: Truong

id (PK, INT)

name (VARCHAR)

...

Table: ...


Bài làm:
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


1. Liệt kê tất cả các lớp và số học sinh của mỗi lớp, kể cả lớp chưa có học sinh nào (phải hiện số 0).

2. Liệt kê tất cả các lớp, kèm tên các học sinh nữ trong lớp đó. Lớp không có học sinh nữ vẫn phải hiện ra (cột tên học sinh để trống).

3. Liệt kê tên học sinh, tên lớp và tên trường.

4. Đếm số học sinh nam và số học sinh nữ của từng lớp.

5. Tìm các lớp có từ 10 học sinh trở lên.

6. Mỗi giáo viên đang dạy bao nhiêu lớp? Sắp xếp giảm dần.

7. Tìm học sinh lớn tuổi nhất

8. Tìm các lớp có sĩ số lớn hơn sĩ số trung bình của tất cả các lớp.

9. Tìm học sinh nhỏ tuổi nhất trong từng lớp.

10. Tìm giáo viên không dạy lớp nào

11. Tìm những trường không có học sinh nào

12. Xếp hạng các lớp theo sĩ số trong từng trường, sau đó chỉ lấy lớp đông nhất của mỗi trường.
