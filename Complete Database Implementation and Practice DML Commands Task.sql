create database database_implementation;
use database_implementation;


-- creat tables:

create table employee (
  ssn int primary key,
  name nvarchar(20),
  position nvarchar(20),
  department nvarchar(20)
);

create table department (
  dname nvarchar(20) not null,
  dnum int primary key identity(1,1),
  mgr_ssn int,
  mgr_hiring_date date not null,
  foreign key (mgr_ssn) references employee(ssn)
);

create table dept_location (
  dnum int,
  dlocation nvarchar(20),
  primary key (dnum, dlocation),
  foreign key (dnum) references department(dnum)
);

create table project (
  pname nvarchar(20) not null,
  pnumber int primary key identity(1,1),
  plocation nvarchar(20) not null,
  dnum int,
  foreign key (dnum) references department(dnum)
);

create table works_on (
  essn int,
  pno int,
  whs int not null,
  primary key (essn, pno),
  foreign key (essn) references employee(ssn),
  foreign key (pno) references project(pnumber)
);

create table dependent_employee (
  dname nvarchar(20) not null,
  dssn int,
  bdate date,
  gender bit default 0,
  primary key (dname, dssn),
  foreign key (dssn) references employee(ssn)
);

-- inserting data

insert into employee (ssn, name, position, department) values
(101, 'ali balushi', 'manager', 'it'),
(102, 'mona harthy', 'hr officer', 'hr'),
(103, 'salim kindi', 'developer', 'it'),
(104, 'amal zadjali', 'recruiter', 'hr'),
(105, 'hamed maawali', 'analyst', 'it');

insert into department (dname, mgr_ssn, mgr_hiring_date) values
('it', 101, '2019-03-01'),
('hr', 102, '2020-01-15');

insert into dept_location (dnum, dlocation) values
(1, 'muscat'),
(1, 'sohar'),
(2, 'salalah'),
(2, 'ibri'),
(1, 'nizwa');

insert into project (pname, plocation, dnum) values
('mobile app', 'muscat', 1),
('website ux', 'sohar', 1),
('onboarding', 'salalah', 2),
('payroll', 'ibri', 2),
('cyber sec', 'nizwa', 1);

insert into works_on (essn, pno, whs) values
(101, 1, 25),
(103, 2, 30),
(105, 5, 20),
(102, 3, 15),
(104, 4, 18);

insert into dependent_employee (dname, dssn, bdate, gender) values
('sara', 101, '2010-05-01', 0),
('omar', 102, '2012-09-10', 1),
('fatma', 103, '2014-06-21', 0),
('nasser', 104, '2016-12-03', 1),
('maha', 105, '2013-02-18', 0);


-- select:
select * from employee;
select * from department;
select * from project;
select * from works_on;
select * from dependent_employee;


-- update:
update works_on set whs = 40;

-- delete
delete from works_on;