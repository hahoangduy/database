# CƠ SỞ DỮ LIỆU


## Thao tác cơ bản với DATABASE


### Khởi tạo:

#### CREATE DATABASE name_database; (Viết thường hoặc viết in hoa đều được)


### Set default cho database:

#### USE name_database;


### Xóa database:

#### DROP DATABASE name_database;


### Bật, tắt mode read-only: Chỉ định database chỉ được phép đọc, không thể thực hiện các chức năng khác.

#### ALTER DATABASE name_database READ ONLY = 1;

#### ALTER DATABASE name_database READ ONLY = 0;


## Thao tác cơ bản với TABLE


### Khởi tạo:

#### CREATE TABLE name_table(

... (Các trường tương ứng với các cột trong bảng + khai báo kèm kiểu dữ liệu)

VD: table_id nvarchar(10),
    table_date date
)

- Các kiểu dữ liệu trong SQL: https://fptshop.com.vn/tin-tuc/danh-gia/-cac-kieu-du-lieu-trong-sql-168413


### Xem thông tin bảng

#### SELECT * FROM table_name;


### Đổi tên TABLE:

#### RENAME TABLE old_table_name TO new_table_name;


### Xóa TABLE:

#### DROP TABLE table_name;


### Thêm cột mới:

#### ALTER TABLE table_name

#### ADD column_name "nvarchar(10);" -> kiểu dữ liệu


### Đổi tên cột:

#### ALTER TABLE table_name

#### RENAME COLUMN old_column_name TO new_column_name;


### Đổi kiểu dữ liệu cho cột:

#### ALTER TABLE table_name

#### MODIFY COLUMN column_name "nvarchar(100)";


### Thay đổi vị trí cột:

#### ALTER TABLE table_name                  |  #### ALTER TABLE table_name

#### MODIFY COLUMN column_name nvarchar(100) |  #### MODIFY COLUMN column_name nvarchar(100)

#### AFTER column_name;                      |  #### FIRST;


### Xóa cột:

#### ALTER TABLE table_name

#### DROP COLUMN column_name;


### Chèn bản ghi vào bảng:

#### Cách 1:

#### INSERT INTO table_name

#### VALUES() -> Khai báo các giá trị tương ứng với kiểu dữ liệu của từng cột trong bảng vào trong dấu ngoặc nhọn.


#### Cách 2:

#### INSERT INTO employees

#### VALUES (2, "Squidward", "Tentacles", 15.00, "2023-01-03"), 

####        (3, "Spongebob", "Squarepants", 12.50, "2023-01-04"), 

####        (4, "Patrick", "Star", 12.50, "2023-01-05"), 

####        (5, "Sandy", "Cheeks", 17.25, "2023-01-06");


#### Cách 3:

#### INSERT INTO employees (employee_id, first_name, last_name)

#### VALUES (6, "Sheldon", "Plankton");


### Chọn cột theo chỉ định

#### SELECT column_name FROM table_name;


#### SELECT * FROM table_name

#### WHERE column_name = ...;


### Cập nhật và xóa bản ghi trong bảng:

1. Cập nhật:

   #### UPDATE table_name

   #### SET column_name = ...;


   #### UPDATE table_name

   #### SET column_name = ...

   #### WHERE column_name = ...;


   #### UPDATE table_name

   #### SET column_name = ...,

   ####     column_name = ...,

   ####     column_name = ...;

   #### WHERE column_name = ...;


3. Xóa:

   #### DELETE FROM table_name;


   #### DELETE FROM table_name

   #### WHERE column_name = ...;


### JOINS:

1. INNER JOIN

   #### SELECT column_name from table_name1

   #### INNER JOIN table_name2 ON table2.fk = table1.pk;

2. LEFT JOIN

   #### SELECT column_name from table_name1

   #### LEFT JOIN table_name2 ON table2.fk = table1.pk;

3. RIGHT JOIN

   #### SELECT column_name from table_name1

   #### RIGHT JOIN table_name2 ON table2.fk = table1.pk;


### ORDER BY, LIMIT:

1. ORDER BY

   - ASC: A -> Z
     
     SELECT * FROM table_name

     ORDER BY column_name ASC;

   - DESC: Z -> A

     SELECT * FROM table_name

     ORDER BY column_name DESC;

2. LIMIT

   - Dùng để giới hạn bản ghi muốn lấy.
  

### UNION:

- Các số cột phải bằng nhau.


#### SELECT * FROM table_name1

#### UNION

#### SELECT * FROM table_name2;


### VIEW:

#### CREATE VIEW create_column_name AS

#### SELECT column_name FROM table_name;


#### SELECT * FROM create_column_name;


## NORMAL FORM

### 1NF:

- Mọi ô dữ liệu trong bảng chỉ chứa 1 giá trị đơn duy nhất (giá trị nguyên tử) và không có nhóm dữ liệu lặp lại.

### 2NF:

- Tất cả các trường(cột) nằm trong bảng phải dựa vào khóa chính.

### 3NF:

- Đảm bảo tính độc lập, ngoại trừ khóa chính, mỗi trường trong bảng không có bất kỳ sự phụ thuộc nào và nó luôn luôn độc lập.
