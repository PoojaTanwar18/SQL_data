select lower('MiNnIe');
select lower('minnie');
select upper('itvedant');
select upper('itVedant');
select concat('hello',' world');
select replace('Welcome to Itvedant thane', 'thane', 'Mumbai');
select replace('Welcome to Itvedant thane', 'e', 'i');
select length('hello world');
select length(trim('      abc      '));
select length(trim('      abc   abc      '));
select trim('      abc     ');
select length(rtrim('      abc     '));
select substr('My name is Minnie',12);
-- math
select abs(-11);
select abs(-1.11);
select ceil(12.1);
select ceil(12.0);
select round(12.1);
select round(12.4);
select round(12.5);
select truncate(12.111111,1);
select truncate(12.111111,3);
select mod(10,4);
select floor(10/4);

show databases;
use class;
create table user(uid int, uname varchar(20), primary key(uid));
create table order12(oid int primary key, prod_name varchar(20), uid int , foreign key(uid) references user(uid));
desc user;
desc order12;
insert into user values(1, 'abc'),(2,'xyz'),(3,'mmmm');
select * from user;
insert into order12 values(1, 'Shirt',1);
select * from order12;
insert into order12 values(2, 'books',1);
insert into order12 values(3, 'notebooks',3);
select user.uname, order12.prod_name from order12 inner join user on user.uid = order12.uid;
select uname, prod_name from order12 inner join user on user.uid = order12.uid;

insert into order12 values(101, 'apple', null),(102,'Mango',null),(103,'Cherry',null);
select * from order12 inner join user on user.uid = order12.uid;

select * from order12 where uid is null;
select * from order12 where uid is not null;

show databases;
use class;
create table student_data(
id int primary key,
department char(10) not null,
student_name varchar(20) not null,
student_marks int ,
paid_fees float ,
attendance int not null
);

desc student_data;
select * from student_data;
insert into student_data values
(101 ,'FS' ,'minnie', 99.9, 100000, 99),
(200 ,'DSAws' ,'Smile',89.3, 50000, 78),
(11 ,'FS' ,'Hello', 79.9, 100000, 89),
(121 ,'DSE' ,'Tanwar',99.3, 50000, 68),
(111 ,'FS' ,'Pooja', 79.9, 100000, 99),
(54 ,'DSE' ,'Luca',59.3, 25000, 56),
(145 ,'FS' ,'frozen', 89.9, 100000, 69),
(175 ,'FSaws' ,'megha',88.3, 15000, 78),
(176 ,'FS' ,'drBanner', 70.9, 45000, 79),
(189 ,'DSE' ,'ironmen',77.3, 50000, 78)
;
insert into student_data values(102 ,'FS' ,'christ', 35.9, 25000, 79),
(201 ,'DSAws' ,'Smiley',49.3, 75000, 68),
(211 ,'FS' ,'Kitty', 58.7, 100000, 69);
select * from student_data;
select id, department, student_name, student_marks,
case
when student_marks>=30 and student_marks<=60 then 'C Grade'
when student_marks>60 and student_marks<80 then 'B Grade'
when student_marks>=80 and student_marks<=100 then 'A Grade'
end as result from student_data;
-- for arranging it into desc order
select id, department, student_name, student_marks,
case
when student_marks>=30 and student_marks<=60 then 'C Grade'
when student_marks>60 and student_marks<80 then 'B Grade'
when student_marks>=80 and student_marks<=100 then 'A Grade'
end as result from student_data order by student_marks desc;

use class;
create table college(
cid int primary key,
cname varchar(30) not null,
location varchar(10) not null
);
desc college;

create table stu(
sid int primary key,
sname varchar(20) ,
sage int ,
scity varchar(10) ,
cid int, 
foreign key(cid) references college(cid)
);
desc stu;
insert into college values(1, 'star','Thane'),(2, 'Moon', 'Wagle'),(3, 'Universe','Dadar'),(4, 'Heaven','CSMT');
select * from college;
insert into stu values
(1, 'a',18, 'Thane',2),(2, 'b',19, 'Ahemdabad',3),(3, 'c',17, 'Dadar',1),
(4, 'd',18, 'Hisar',4),(5, 'e',16, 'Diha',2),(6, 'f',17, 'Bhandup',3),
(7, 'g',18, 'Thane',2),(8, 'h',19, 'Airoli',null),(9, 'i',17, 'Dadar',null),
(10, 'j',16, 'Hisar',null),(11, 'k',18, 'Diha',null),(12, 'l',20,'Bhandup',4);
select * from stu;

select * from stu inner join college on stu.cid=college.cid;
select * from college inner join stu on stu.cid=college.cid;


select stu.sname, stu.scity as student_address, college.cname as college_name,
college.location as college_address from college inner join stu on stu.cid=college.cid;

insert into college  values(13,'LPU','Punjab');

select * from stu natural join college;