-- tao database 
DROP DATABASE IF EXISTS Testing_System_Assignment_1;
CREATE DATABASE Testing_System_Assignment_1;
USE Testing_System_Assignment_1;

-- tao bang department
CREATE TABLE `Department` (
DepartmentID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
DepartmentName VARCHAR (30) NOT NULL
);

-- insert data cho bang department
insert into `Department` (DepartmentName) values ( 'Support');
insert into `Department` (DepartmentName) values ( 'Services');
insert into `Department` (DepartmentName) values ('Research and Development');
insert into `Department` (DepartmentName) values ('Sale');
insert into `Department` (DepartmentName) values ('Engineering');
insert into `Department` (DepartmentName) values ('Product Management');
insert into `Department` (DepartmentName) values ('Marketing');
insert into `Department` (DepartmentName) values ('Bảo vệ');
insert into `Department` (DepartmentName) values ('Kỹ thuật');
insert into `Department` (DepartmentName) values ('Tài Chính');

-- tao bang position
CREATE TABLE `Position` (
PositionID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
PositionName VARCHAR (30) NOT NULL
);

-- insert data cho bang position
insert into `Position` (PositionName) values ('Nhân Viên');
insert into `Position` (PositionName) values ('Quản Lý');
insert into `Position` (PositionName) values ('Trưởng Phòng');
insert into `Position` (PositionName) values ('Phó Giám Đốc');
insert into `Position` (PositionName) values ('Giám Đốc');
insert into `Position` (PositionName) values ('Thư Ký');
insert into `Position` (PositionName) values ('Developer');

-- tao bang account 
CREATE TABLE `Account` (
AccountID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Email VARCHAR (30) ,
Username VARCHAR (30) NOT NULL,
FullName VARCHAR (30) NOT NULL,
DepartmentID  INT NOT NULL,
PositionID INT NOT NULL,
CreateDate DATE NOT NULL
);

-- insert data cho bang account
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (1, 'ivasyunkin0@globo.com', 'ivasyunkin0', 'Issie Vasyunkin', 1, 1, '2020-07-03');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (2, 'acawthera1@purevolume.com', 'acawthera1', 'Auguste Cawthera', 2, 2, '2020-06-19');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (3, 'cshillinglaw2@homestead.com', 'cshillinglaw2', 'Cort Shillinglaw', 3, 3, '2020-04-15');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (4, 'eyerson3@fda.gov', 'eyerson3', 'Ettore Yerson', 4, 4, '2020-09-21');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (5, 'hupson4@engadget.com', 'hupson4', 'Herta Upson', 5, 5, '2020-03-12');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (6, 'dscurr5@pcworld.com', 'dscurr5', 'Deina Scurr', 6, 6, '2020-07-21');

-- tao bang group
CREATE TABLE `Group` (
GroupID INT AUTO_INCREMENT PRIMARY KEY,
GroupName VARCHAR (30) NOT NULL,
CreatorID INT NOT NULL,
CreateDate DATE
);

-- insert data cho group
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (1, 'Stanton-Ritchie', 1, '2020-07-08');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (2, 'Lockman, Hudson and Wiegand', 2, '2020-11-02');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (3, 'Medhurst-Schimmel', 3, '2020-09-24');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (4, 'Dach LLC', 4, '2020-01-27');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (5, 'Marquardt and Sons', 5, '2020-11-04');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (6, 'Gutkowski Inc', 6, '2020-04-22');

-- tao bang group account
CREATE TABLE `GroupAccount` (
GroupID INT NOT NULL,
AccountID INT NOT NULL,
JoinDate DATE NOT NULL
);

-- insert data cho group account
insert into `GroupAccount` (GroupID, AccountID, JoinDate) values (1, 1, '2020-12-15');
insert into `GroupAccount` (GroupID, AccountID, JoinDate) values (2, 2, '2020-05-26');
insert into `GroupAccount` (GroupID, AccountID, JoinDate) values (3, 3, '2020-04-22');
insert into `GroupAccount` (GroupID, AccountID, JoinDate) values (4, 4, '2020-08-26');
insert into `GroupAccount` (GroupID, AccountID, JoinDate) values (5, 5, '2020-11-15');
insert into `GroupAccount` (GroupID, AccountID, JoinDate) values (6, 6, '2020-11-20');

-- tao bang type question
CREATE TABLE `TypeQuestion` (
TypeID INT AUTO_INCREMENT PRIMARY KEY,
TypeName VARCHAR (30) NOT NULL
);

-- insert data cho type question
insert into `TypeQuestion` (TypeName) values ('Tự Luận');
insert into `TypeQuestion` (TypeName) values ('Trắc Nghiệm');

-- tao bang CategoryQuestion
CREATE TABLE `CategoryQuestion` (
CategoryID INT AUTO_INCREMENT PRIMARY KEY,
CategoryName VARCHAR (30) NOT NULL
);

-- insert data cho CategoryQuestion
insert into `CategoryQuestion` (CategoryID, CategoryName) values (1, 'volutpat quam pede');
insert into `CategoryQuestion` (CategoryID, CategoryName) values (2, 'orci vehicula');
insert into `CategoryQuestion` (CategoryID, CategoryName) values (3, 'nulla');
insert into `CategoryQuestion` (CategoryID, CategoryName) values (4, 'ullamcorper');
insert into `CategoryQuestion` (CategoryID, CategoryName) values (5, 'convallis duis consequat');
insert into `CategoryQuestion` (CategoryID, CategoryName) values (6, 'proin');

-- tao bang question
CREATE TABLE `Question` (
QuestionID INT AUTO_INCREMENT PRIMARY KEY,
Content VARCHAR (50) NOT NULL,
CategoryID INT NOT NULL,
TypeID INT NOT NULL,
CreatorID INT NOT NULL,
CreateDate DATE NOT NULL
);

-- insert data cho question
insert into `Question` (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (1, 'id massa id', 1, 1, 1, '2020-10-22');
insert into `Question` (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (2, 'semper interdum mauris ullamcorper', 2, 2, 2, '2020-11-04');
insert into `Question` (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (3, 'nam tristique tortor', 3, 1, 3, '2020-03-26');
insert into `Question` (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (4, 'eleifend quam a odio', 4, 2, 4, '2020-04-29');
insert into `Question` (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (5, 'ultrices libero non mattis', 5, 1, 5, '2020-07-11');
insert into `Question` (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (6, 'turpis eget elit', 6, 2, 6, '2020-04-25');

-- tao bang answer
CREATE TABLE `Answer` (
AnswerID INT AUTO_INCREMENT PRIMARY KEY,
Content VARCHAR (50) NOT NULL,
QuestionID INT NOT NULL,
isCorrect VARCHAR (10) NOT NULL
);

-- insert data cho answer
insert into `Answer` (AnswerID, Content, QuestionID, isCorrect) values (1, 'nisl nunc nisl', 1, 'Đúng');
insert into `Answer` (AnswerID, Content, QuestionID, isCorrect) values (2, 'in quam fringilla', 2, 'Sai');
insert into `Answer` (AnswerID, Content, QuestionID, isCorrect) values (3, 'sapien varius ut', 3, 'Đúng');
insert into `Answer` (AnswerID, Content, QuestionID, isCorrect) values (4, 'a pede posuere', 4, 'Sai');
insert into `Answer` (AnswerID, Content, QuestionID, isCorrect) values (5, 'id ornare imperdiet sapien urna', 5, 'Đúng');
insert into `Answer` (AnswerID, Content, QuestionID, isCorrect) values (6, 'luctus et ultrices posuere cubilia', 6, 'Sai');
insert into `Answer` (AnswerID, Content, QuestionID, isCorrect) values (7, 'luctus et ultrices posuere cubilia', 1, 'Sai');
insert into `Answer` (AnswerID, Content, QuestionID, isCorrect) values (8, 'luctus et ultrices posuere cubilia', 1, 'Sai');
insert into `Answer` (AnswerID, Content, QuestionID, isCorrect) values (9, 'luctus et ultrices posuere cubilia', 1, 'Sai');
insert into `Answer` (AnswerID, Content, QuestionID, isCorrect) values (10, 'luctus et ultrices posuere cubilia', 1, 'Sai');


-- tao bang exam
CREATE TABLE `Exam` (
ExamID INT AUTO_INCREMENT PRIMARY KEY,
`Code` VARCHAR (10) NOT NULL,
Title VARCHAR (50) NOT NULL,
CategoryID INT NOT NULL,
Duration INT NOT NULL,
CreatorID INT NOT NULL,
CreateDate DATE
);

-- insert data cho exam
insert into `Exam` (ExamID, `Code`, Title, CategoryID, Duration, CreatorID, CreateDate) values (1, '16590-648', 'platea', 1, '120', 1, '2018-04-10');
insert into `Exam` (ExamID, `Code`, Title, CategoryID, Duration, CreatorID, CreateDate) values (2, '52810-102', 'sem mauris', 2, '120', 2, '2020-02-19');
insert into `Exam` (ExamID, `Code`, Title, CategoryID, Duration, CreatorID, CreateDate) values (3, '41250-001', 'erat tortor', 3, '60', 3, '2020-08-27');
insert into `Exam` (ExamID, `Code`, Title, CategoryID, Duration, CreatorID, CreateDate) values (4, '0186-1090', 'vulputate ut ultrices', 4, '100', 4, '2020-04-29');
insert into `Exam` (ExamID, `Code`, Title, CategoryID, Duration, CreatorID, CreateDate) values (5, '65954-553', 'faucibus', 5, '60', 5, '2020-02-04');
insert into `Exam` (ExamID, `Code`, Title, CategoryID, Duration, CreatorID, CreateDate) values (6, '21130-484', 'donec', 6, '90', 6, '2020-02-05');

-- tao bang exam question
CREATE TABLE `ExamQuestion` (
ExamID INT NOT NULL,
QuestionID INT NOT NULL
);

-- insert data cho exam question
insert into `ExamQuestion` (ExamID, QuestionID) values (1, 1);
insert into `ExamQuestion` (ExamID, QuestionID) values (2, 2);
insert into `ExamQuestion` (ExamID, QuestionID) values (3, 3);
insert into `ExamQuestion` (ExamID, QuestionID) values (4, 4);
insert into `ExamQuestion` (ExamID, QuestionID) values (5, 5);
insert into `ExamQuestion` (ExamID, QuestionID) values (6, 6);


















