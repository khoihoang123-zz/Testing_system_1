-- Exercise 1: 
-- Question 1: Tạo table với các ràng buộc và kiểu dữ liệu 
-- Question 2: Thêm ít nhất 10 bản ghi vào table Question 

DROP DATABASE IF EXISTS ExtraAssginment;
CREATE DATABASE ExtraAssginment ;
USE ExtraAssginment;

-- Tao bang `Department`
CREATE TABLE `Department` 
(
DepartmentNumber SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
DepartmentName VARCHAR (20) NOT NULL
);

-- insert data `Department`
insert into `Department` (DepartmentNumber, DepartmentName) values (1, 'Sales');
insert into `Department` (DepartmentNumber, DepartmentName) values (2, 'Business Development');
insert into `Department` (DepartmentNumber, DepartmentName) values (3, 'Services');
insert into `Department` (DepartmentNumber, DepartmentName) values (4, 'Human Resources');
insert into `Department` (DepartmentNumber, DepartmentName) values (5, 'Security');
insert into `Department` (DepartmentNumber, DepartmentName) values (6, 'Support');
insert into `Department` (DepartmentNumber, DepartmentName) values (7, 'Marketing');
insert into `Department` (DepartmentNumber, DepartmentName) values (8, 'Product Management');
insert into `Department` (DepartmentNumber, DepartmentName) values (9, 'Training');
insert into `Department` (DepartmentNumber, DepartmentName) values (10, 'Engineering');

-- Tao bang `Employee`
CREATE TABLE `Employee` 
(
EmployeeNumber INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
EmployeeName VARCHAR(30),
DepartmentNumber SMALLINT UNSIGNED NOT NULL,
FOREIGN KEY (DepartmentNumber) REFERENCES `Department`(DepartmentNumber)
);

-- insert data `Employee`
insert into `Employee` (EmployeeNumber, EmployeeName, DepartmentNumber) values (1, 'Kaitlin Qualtrough', 1);
insert into `Employee` (EmployeeNumber, EmployeeName, DepartmentNumber) values (2, 'Jim Janjusevic', 4);
insert into `Employee` (EmployeeNumber, EmployeeName, DepartmentNumber) values (3, 'Sibyl Ludye', 9);
insert into `Employee` (EmployeeNumber, EmployeeName, DepartmentNumber) values (4, 'Roseanna Banthorpe', 2);
insert into `Employee` (EmployeeNumber, EmployeeName, DepartmentNumber) values (5, 'Lilian Boltwood', 7);
insert into `Employee` (EmployeeNumber, EmployeeName, DepartmentNumber) values (6, 'Roxane Pluck', 7);
insert into `Employee` (EmployeeNumber, EmployeeName, DepartmentNumber) values (7, 'Orella Thinn', 8);
insert into `Employee` (EmployeeNumber, EmployeeName, DepartmentNumber) values (8, 'Galvin Skrine', 9);
insert into `Employee` (EmployeeNumber, EmployeeName, DepartmentNumber) values (9, 'Maighdiln Massei', 9);
insert into `Employee` (EmployeeNumber, EmployeeName, DepartmentNumber) values (10, 'Sidonia Crooke', 2);

-- Tao bang `EmployeeSkillTable`
CREATE TABLE `EmployeeSkillTable`
(
EmployeeNumber INT UNSIGNED NOT NULL, 
SkillCode VARCHAR (20),
DateRegistered DATE,
FOREIGN KEY (EmployeeNumber) REFERENCES `Employee`(EmployeeNumber)
);

-- insert data `EmployeeSkillTable`
insert into `EmployeeSkillTable` (EmployeeNumber, SkillCode, DateRegistered) values (8, 'SRM 5.0', '2020-11-27');
insert into `EmployeeSkillTable` (EmployeeNumber, SkillCode, DateRegistered) values (8, 'BJJ', '2020-07-20');
insert into `EmployeeSkillTable` (EmployeeNumber, SkillCode, DateRegistered) values (5, 'Java', '2020-04-17');
insert into `EmployeeSkillTable` (EmployeeNumber, SkillCode, DateRegistered) values (7, 'Heavy Equipment', '2020-01-30');
insert into `EmployeeSkillTable` (EmployeeNumber, SkillCode, DateRegistered) values (7, 'Device Drivers', '2020-03-29');
insert into `EmployeeSkillTable` (EmployeeNumber, SkillCode, DateRegistered) values (8, 'Be Your Own Boss', '2020-04-08');
insert into `EmployeeSkillTable` (EmployeeNumber, SkillCode, DateRegistered) values (10, 'Short Stories', '2020-07-05');
insert into `EmployeeSkillTable` (EmployeeNumber, SkillCode, DateRegistered) values (2, 'Vectorworks', '2020-07-11');
insert into `EmployeeSkillTable` (EmployeeNumber, SkillCode, DateRegistered) values (9, 'BTL Activations', '2020-12-18');
insert into `EmployeeSkillTable` (EmployeeNumber, SkillCode, DateRegistered) values (6, 'JUnit', '2020-02-10');

--  Viết lệnh để lấy ra danh sách nhân viên (name) có skill Java 
SELECT t1.EmployeeName,t2.SkillCode
FROM `Employee` t1
JOIN `EmployeeSkillTable` t2 ON t1.EmployeeNumber = t2.EmployeeNumber
WHERE t2.SkillCode = 'Java';

-- Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên
SELECT t1.DepartmentName,COUNT(t2.DepartmentNumber) AS SONHANVIEN
FROM `Department` t1 
JOIN `Employee` t2 ON t1.DepartmentNumber = t2.DepartmentNumber
GROUP BY t2.DepartmentNumber HAVING SONHANVIEN > 3;

--  Viết lệnh để lấy ra danh sách nhân viên của mỗi văn phòng ban
SELECT t1.DepartmentName,t2.EmployeeName
FROM `Department` t1 
LEFT JOIN `Employee` t2 ON t1.DepartmentNumber = t2.DepartmentNumber;

--  Viết lệnh để lấy ra danh sách nhân viên có > 1 skills.   
SELECT  t1.EmployeeNumber,t1.EmployeeName,COUNT(t2.SkillCode) AS SOSKILL 
FROM `Employee` t1
JOIN `EmployeeSkillTable` t2 ON t1.EmployeeNumber = t2.EmployeeNumber
GROUP BY EmployeeNumber HAVING SOSKILL > 1;















