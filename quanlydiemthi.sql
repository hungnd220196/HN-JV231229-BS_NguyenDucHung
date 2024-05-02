#b1

create database QUANLYDIEMTHI;
use QUANLYDIEMTHI;

create table student
(
    studentId   varchar(4) primary key,
    studentName varchar(100) not null,
    birthday    date         not null,
    gender      bit(1)       not null,
    address     text         not null,
    phoneNumber varchar(45) unique
);
create table subject
(
    subjectId   varchar(4) primary key,
    subjectName varchar(45) not null,
    priority    int(11)     not null
);

create table mark
(
    subjectId varchar(4) not null,
    foreign key (subjectId) references subject (subjectId),
    studentId varchar(4) not null,
    foreign key (studentId) references student (studentId),
    point     double     not null
);

#b2

#1. Thêm dữ liệu
insert into student(studentId, studentName, birthday, gender, address, phoneNumber)
values ('S001', 'Nguyễn Thế Anh', '1999-01-11', 1, 'Hà Nội', '984678082'),
       ('S002', 'Đặng Bảo Trâm', '1998-12-22', 0, 'Lào Cai', '904982654'),
       ('S003', 'Trần Hà Phương', '2000-05-05', 0, 'Nghệ An', '947645363'),
       ('S004', 'Đỗ Tiến Mạnh', '1999-03-26', 1, 'Hà Nội', '983665353'),
       ('S005', 'Phạm Duy Nhất', '1998-10-04', 1, 'Tuyên Quang', '987242678'),
       ('S006', 'Mai Văn Thái', '2002-06-22', 1, 'Nam Định', '982654268'),
       ('S007', 'Giang Gia Hân', '1996-11-10', 0, 'Phú Thọ', '982364753'),
       ('S008', 'Nguyễn Ngọc Bảo My', '1999-01-22', 0, 'Hà Nam', '927867453'),
       ('S009', 'Nguyễn Tiến Đạt', '1998-08-07', 1, 'Tuyên Quang', '989274673'),
       ('S010', 'Nguyễn Thiều Quang', '2000-09-18', 1, 'Hà Nội', '984378291');


insert into subject(subjectId, subjectName, priority)
values ('MH01', 'Toán', 2),
       ('MH02', 'Vật Lý', 2),
       ('MH03', 'Hoá Học', 1),
       ('MH04', 'Ngữ Văn', 1),
       ('MH05', 'Tiếng Anh', 2);

insert into MARK(studentId, subjectId, point)
values ('S001', 'MH01', 8.5),
       ('S001', 'MH02', 7),
       ('S001', 'MH03', 9),
       ('S001', 'MH04', 9),
       ('S001', 'MH05', 5),
       ('S002', 'MH01', 9),
       ('S002', 'MH02', 8),
       ('S002', 'MH03', 6.5),
       ('S002', 'MH04', 8),
       ('S002', 'MH05', 6),
       ('S003', 'MH01', 7.5),
       ('S003', 'MH02', 6.5),
       ('S003', 'MH03', 8),
       ('S003', 'MH04', 7),
       ('S003', 'MH05', 7),
       ('S004', 'MH01', 6),
       ('S004', 'MH02', 7),
       ('S004', 'MH03', 5),
       ('S004', 'MH04', 6.5),
       ('S004', 'MH05', 8),
       ('S005', 'MH01', 5.5),
       ('S005', 'MH02', 8),
       ('S005', 'MH03', 7.5),
       ('S005', 'MH04', 8.5),
       ('S005', 'MH05', 9),
       ('S006', 'MH01', 8),
       ('S006', 'MH02', 10),
       ('S006', 'MH03', 9),
       ('S006', 'MH04', 7.5),
       ('S006', 'MH05', 6.5),
       ('S007', 'MH01', 9.5),
       ('S007', 'MH02', 9),
       ('S007', 'MH03', 6),
       ('S007', 'MH04', 9),
       ('S007', 'MH05', 4),
       ('S008', 'MH01', 10),
       ('S008', 'MH02', 8.5),
       ('S008', 'MH03', 8.5),
       ('S008', 'MH04', 6),
       ('S008', 'MH05', 9.5),
       ('S009', 'MH01', 7.5),
       ('S009', 'MH02', 7),
       ('S009', 'MH03', 9),
       ('S009', 'MH04', 5),
       ('S009', 'MH05', 10),
       ('S010', 'MH01', 6.5),
       ('S010', 'MH02', 8),
       ('S010', 'MH03', 5.5),
       ('S010', 'MH04', 4),
       ('S010', 'MH05', 7);

#2. Cập nhật dữ liệu

update student
set studentName = 'Đỗ Đức Mạnh'
where studentId = 'S004';

update subject
set subjectName = 'Ngoại Ngữ',
    priority    = 1
where subjectId = 'MH05';

update mark
set point = case
                when subjectId = 'MH01' then 8.5
                when subjectId = 'MH02' then 7
                when subjectId = 'MH03' then 5.5
                when subjectId = 'MH04' then 6
                when subjectId = 'MH05' then 9
    end
where studentId = 'S009';

#3. xóa dữ liệu

delete
from mark
where studentId = 'S010';
delete
from student
where studentId = 'S010';

#bai 3
#1 lấy tất cả thông tin của sinh viên trong bảng student

select *
from student;

# 2. Hiển thị tên và mã môn học của những môn có hệ số bằng 1. [4 điểm]
select subjectName, subjectId
from subject
where priority = 1;

# 3. Hiển thị thông tin học sinh bào gồm: mã học sinh, tên học sinh, tuổi (bằng năm hiện tại trừ
# năm sinh) , giới tính (hiển thị nam hoặc nữ) và quê quán của tất cả học sinh. [4 điểm]

select studentId,
       studentName,
       year(curdate()) - year(birthday)                               as age,
       case when gender = 1 then 'Nam' when gender = 0 then ' nữ' end as gender,
       address
from student;

# 4. Hiển thị thông tin bao gồm: tên học sinh, tên môn học , điểm thi của tất cả học sinh của môn
# Toán và sắp xếp theo điểm giảm dần. [4 điểm]

select student.studentName, subject.subjectName, mark.point
from mark
         inner join student on mark.studentId = student.studentId
         inner join subject on mark.subjectId = subject.subjectId
where subject.subjectName = 'Toán'
order by mark.point desc;


# 5. Thống kê số lượng học sinh theo giới tính ở trong bảng (Gồm 2 cột: giới tính và số lượng).
# [4 điểm]
select IF(gender = true, 'Nam', 'Nữ') as Gender,
       count(*)                       as TotalCount
from student
group by gender;


# 6. Tính tổng điểm và điểm trung bình của các môn học theo từng học sinh (yêu cầu sử dụng hàm
# để tính toán) , bảng gồm mã học sinh, tên hoc sinh, tổng điểm và điểm trung bình. [5 điểm]
select mark.studentId,
       studentName,
       sum(point) as TotalPoint,
       avg(point) as AveragePoint
from mark
         inner join student on mark.studentId = student.studentId
group by studentId, studentName;

# Bài 4: Tạo View, Index, Procedure [20 điểm]:

# 1. Tạo VIEW có tên STUDENT_VIEW lấy thông tin sinh viên bao gồm : mã học sinh, tên học
# sinh, giới tính , quê quán . [3 điểm]

create view STUDENT_VIEW as
select studentid, studentname, gender, address
from student;


# 2. Tạo VIEW có tên AVERAGE_MARK_VIEW lấy thông tin gồm:mã học sinh, tên học sinh,
# điểm trung bình các môn học . [3 điểm]

create view AVERAGE_MARK_VIEW as
select mark.studentId, studentName, avg(point) as averagePoint
from mark
         join student on mark.studentId = student.studentId
group by studentId, studentName;

# 3. Đánh Index cho trường `phoneNumber` của bảng STUDENT. [2 điểm]
create index phoneNumber on Student (phoneNumber);
# 4. Tạo các PROCEDURE sau:
# - Tạo PROC_INSERTSTUDENT dùng để thêm mới 1 học sinh bao gồm tất cả
# thông tin học sinh đó. [3 điểm]
DELIMITER //
CREATE PROCEDURE PROC_INSERTSTUDENT(
    IN p_studentId varchar(4),
    IN p_studentName varchar(100),
    IN p_birthday date,
    IN p_gender bit(1),
    IN p_address text,
    IN p_phoneNumber varchar(45)
)
BEGIN
    INSERT INTO student(studentId, studentName, birthday, gender, address, phoneNumber)
    VALUES (p_studentId, p_studentName, p_birthday, p_gender, p_address, p_phoneNumber);
END //
DELIMITER ;

    
# - Tạo PROC_UPDATESUBJECT dùng để cập nhật tên môn học theo mã môn học.
# [3 điểm]

DELIMITER //
CREATE PROCEDURE PROC_UPDATESUBJECT(
    IN p_subjectId varchar(4),
    IN p_subjectName varchar(45)
)
BEGIN
    UPDATE subject
    SET subjectName = p_subjectName
    WHERE subjectId = p_subjectId;
END //
DELIMITER ;

# - Tạo PROC_DELETEMARK dùng để xoá toàn bộ điểm các môn học theo mã học
# sinh. [3 điểm]
DELIMITER //
CREATE PROCEDURE PROC_DELETEMARK(
    IN p_studentId varchar(4)
)
BEGIN
    DELETE FROM mark
    WHERE studentId = p_studentId;
END //
DELIMITER ;

