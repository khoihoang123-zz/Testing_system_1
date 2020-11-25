-- creat databse Testing_System_Assigment_1
DROP DATABASE IF EXISTS Testing_System_Assignment_1;
CREATE DATABASE	IF NOT EXISTS	Testing_System_Assignment_1;
USE	Testing_System_Assignment_1;

-- create table Department
DROP TABLE IF EXISTS Department;
CREATE TABLE 	Department (
DepartmentID	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
DepartmentName	VARCHAR(20) NOT NULL CHECK (LENGTH (DepartmentName) >= 6)
);

-- create table Position
DROP TABLE IF EXISTS Position_;
CREATE TABLE	Position_ (
PositionID	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
PositionName	VARCHAR(20) NOT NULL CHECK (length(PositionName) >= 6)
);

-- create table Account
DROP TABLE IF EXISTS Account_; 
CREATE TABLE	Account_	(
AccountID	INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Email	VARCHAR(30) CHECK (length(Email) >= 8) ,
Username	CHAR(15) NOT NULL UNIQUE CHECK (length(Username) >= 6),
Fullname	VARCHAR(30) NOT NULL CHECK (length(Fullname) >= 8),
DepartmentID	TINYINT UNSIGNED,
PositionID	TINYINT UNSIGNED,
CreateDate	DATETIME DEFAULT NOW(),
FOREIGN KEY (DepartmentID) REFERENCES Department (DepartmentID),
FOREIGN KEY (PositionID) REFERENCES Position_ (PositionID)
);

-- create table Group
DROP TABLE IF EXISTS Group_;
CREATE TABLE	Group_	(
GroupID	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
GroupName	VARCHAR(30) NOT NULL CHECK (length(GroupName) >= 8),
CreatorID	TINYINT UNSIGNED NOT NULL,
CreateDate	DATETIME DEFAULT NOW()
);

-- create table GroupAccount
DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE	GroupAccount	(
GroupID	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
AccountID	INT UNSIGNED UNIQUE NOT NULL,
JoinDate DATETIME DEFAULT NOW(),
FOREIGN KEY (GroupID) REFERENCES Group_(GroupID),
FOREIGN KEY (AccountID) REFERENCES Account_  (AccountID)
);

-- create table TypeQuestion
DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE	TypeQuestion (
TypeID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
TypeName VARCHAR(50) NOT NULL
);

-- create table CategoryQuestion
DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE	CategoryQuestion (
CategoryID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
CategoryName CHAR(20) NOT NULL
);

-- create table Question
DROP TABLE IF EXISTS Question;
CREATE TABLE	Question (
QuestionID	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Content	VARCHAR(100) NOT NULL,
CategoryID	TINYINT UNSIGNED UNIQUE NOT NULL,
TypeID	TINYINT UNSIGNED NOT NULL,
CreatorID	TINYINT UNSIGNED NOT NULL,
CreateDate	DATETIME,
FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID)
);

-- create table Answer
DROP TABLE IF EXISTS Answer;
CREATE TABLE	Answer (
AnswerID	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Content	VARCHAR(300) NOT NULL,
QuestionID	TINYINT UNSIGNED UNIQUE KEY NOT NULL,
isCorrect	ENUM('Đúng''Sai') NOT NULL,
FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID)
);

-- create table Exam
DROP TABLE IF EXISTS EXAM;
CREATE TABLE	EXAM (
ExamID	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Code_ CHAR(10) NOT NULL,
Title	VARCHAR(30)NOT NULL ,
CategoryID	TINYINT UNSIGNED UNIQUE KEY NOT NULL,
Duration CHAR(10) NOT NULL,
CreatorID TINYINT UNSIGNED NOT NULL,
CreateDate	DATETIME DEFAULT NOW()
);

-- creat table ExamQuestion
DROP TABLE IF EXISTS ExamQuestions;
CREATE TABLE	ExamQuestions (
ExamID	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
QuestionID	TINYINT UNSIGNED UNIQUE KEY NOT NULL,
FOREIGN KEY (ExamID) REFERENCES EXAM(ExamID)
);