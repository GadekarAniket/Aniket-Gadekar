create database HPIcompany;
use HPIcompany;
create table Department
(
   DEPTCODE   INT(10) primary key,
   DeptName   CHAR(30),
   LOCATION   VARCHAR(33)
   );
use HPIcompany;
CREATE TABLE Employee
(
   EmpCode      INT(4),
   EmpFName     VARCHAR(15),
   EmpLName     VARCHAR(15),
   Job          VARCHAR(45),
   Manager      CHAR(4),
   HireDate     DATE,
   Salary       INT(6),
   Commission   INT(6),
   DEPTCODE     INT(2),
   constraint EmpPK Primary key (EmpCode),
   constraint EmpFK foreign key (DEPTCODE) references Department (DEPTCODE)
);
INSERT INTO Department VALUES 
(10, 'FINANCE', 'EDINBURGH'),
(20,'SOFTWARE','PADDINGTON'),
(30, 'SALES', 'MAIDSTONE'),
(40,'MARKETING', 'DARLINGTON'),
(50,'ADMIN', 'BIRMINGHAM');
select * from Department;

INSERT INTO Employee VALUES 
(9369, 'TONY', 'STARK', 'SOFTWARE ENGINEER', 7902, '1980-12-17', 2800,0,20),
(9499, 'TIM', 'ADOLF', 'SALESMAN', 7698, '1981-02-20', 1600, 300,30),    
(9566, 'KIM', 'JARVIS', 'MANAGER', 7839, '1981-04-02', 3570,0,20),
(9654, 'SAM', 'MILES', 'SALESMAN', 7698, '1981-09-28', 1250, 1400, 30),
(9782, 'KEVIN', 'HILL', 'MANAGER', 7839, '1981-06-09', 2940,0,10),
(9788, 'CONNIE', 'SMITH', 'ANALYST', 7566, '1982-12-09', 3000,0,20),
(9839, 'ALFRED', 'KINSLEY', 'PRESIDENT', 7566, '1981-11-17', 5000,0, 10),
(9844, 'PAUL', 'TIMOTHY', 'SALESMAN', 7698, '1981-09-08', 1500,0,30),
(9876, 'JOHN', 'ASGHAR', 'SOFTWARE ENGINEER', 7788, '1983-01-12',3100,0,20),
(9900, 'ROSE', 'SUMMERS', 'TECHNICAL LEAD', 7698, '1981-12-03', 2950,0, 20),
(9902, 'ANDREW', 'FAULKNER', 'ANAYLYST', 7566, '1981-12-03', 3000,0, 10),
(9934, 'KAREN', 'MATTHEWS', 'SOFTWARE ENGINEER', 7782, '1982-01-23', 3300,0,20),
(9591, 'WENDY', 'SHAWN', 'SALESMAN', 7698, '1981-02-22', 500,0,30),
(9698, 'BELLA', 'SWAN', 'MANAGER', 7839, '1981-05-01', 3420, 0,30),
(9777, 'MADII', 'HIMBURY', 'ANALYST', 7839, '1981-05-01', 2000, 200, NULL),
(9860, 'ATHENA', 'WILSON', 'ANALYST', 7839, '1992-06-21', 7000, 100, 50),
(9861, 'JENNIFER', 'HUETTE', 'ANALYST', 7839, '1996-07-01', 5000, 100, 50);
select * from Employee;
update Employee set DEPTCODE = 40 where EmpCode =9777;
select * from Employee where EmpCode =9788;
select EmpCode, concat(EmpFName,' ', EmpLName) as 'NAME', salary*12 as 'Annual Income' from Employee where EmpLName like 'Sm%';
select * from Department;
select a.DEPTCODE, avg(a.Salary) as Deptsalary, b.DeptName from Employee a, Department b where a.DEPTCODE= b.DEPTCODE group by DEPTCODE order by avg(Salary) desc;
select EmpCode, EmpLName from employee where EmpLName in (select EmpLName from employee where EmpLName like 'S%');
select EmpCode, EmpLName from employee where EmpLName in ('SMITH','STARK');
select a.EmpCode, a.EmpFName, a.EmpLName, a.Salary, b.DEPTCODE, b.DeptName 
from Employee a, Department b 
where a.DEPTCODE=b.DEPTCODE and b.DeptName ='SOFTWARE' order by salary limit 2;
select count(*) from Employee;
UPDATE Employee set Salary = Salary +( Salary*0.13) where Deptcode = (select Deptcode from Department where DeptName = 'SOFTWARE');
select * from employee;
select MIN(Salary) from Employee;
select MAX(Salary) from Employee;
select avg(Salary) from Employee;
select sum(Salary) From Employee;
select aggregate(Salary) from Employee;
select ascii(EmpFName) as NAMESS from Employee;
SELECT CHAR_LENGTH(EmpFName) AS LengthOfString from Employee;
SELECT CHARACTER_LENGTH('EmpFName') AS LengthOfString;
SELECT concat(EmpFName,' ', EmpLName) as 'NAME' from Employee;
SELECT concat_ws(EmpFName,' ', EmpLName) as 'NAME' from Employee order by NAME;	
SELECT LENGTH(EmpFName) AS LengthOfName
FROM Employee;
SELECT LCASE(EmpFName) AS LowercaseCustomerName
FROM Employee;
SELECT LOCATE("a", EmpFName) AS Newname
FROM Employee;
select REPLACE("Tony","Tony","Aniket") AS Renamess
from Employee;
select EmpCode, concat_ws(EmpFName,' ', EmpLName) as 'NAME', Salary from Employee
where Salary between 2000 and 4000 or Salary> 5000;
select * from Employee;
select * from Employee where YEAR(HireDate)=1981;
select * from Employee 
where HireDate >= '1981-01-01' and HireDate <= '1981-12-31';
use HPIcompany;
CREATE table Department_Backup as (select * from Department);
CREATE table Employee_Backup as (select * from Employee);
select * from Department_Backup;
SET SQL_Safe_updates = 0;
Delete from Department_Backup where DEPTCODE = 50;
Delete from Employee where DEPTCODE = 50;
ALTER TABLE Employee DROP column Commission;
truncate table Employee_backup;
Select * from Employee_backup;
DROP TABLE Department_Backup;
