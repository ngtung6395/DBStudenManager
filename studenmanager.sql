create database sudentManager;
use sudentManager;
create table class(
                      class_id int primary key auto_increment,
                      class_name varchar(60) not null ,
                      stardate datetime not null ,
                      status bit
);
create table student(
                        student_id int primary key auto_increment,
                        student_name varchar(30) not null ,
                        address varchar(50),
                        phone varchar(20),
                        status bit,
                        class_id int not null
);
create table subject(
                        sj_id int primary key auto_increment,
                        sj_name varchar(30) not null ,
                        credit tinyint not null default 1 check ( subject.credit >=1 ),
                        status bit default 1
);
create table mark(
                     mark_id int primary key auto_increment,
                     sj_id int not null unique ,
                     student_id int not null unique ,
                     mark float default 0 check ( mark.mark between 0 and  100)
);
alter table mark add examtimes tinyint default 1;
alter table student add foreign key (class_id) references class(class_id);
alter table mark add foreign key (sj_id) references  subject(sj_id);
alter table mark add foreign key (student_id) references  student(student_id);

