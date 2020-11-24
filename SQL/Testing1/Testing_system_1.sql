DROP DATABASE IF EXISTS	Testing_System_Assignment_1;
CREATE DATABASE Testing_System_Assignment_1;
USE	Testing_System_Assignment_1;
CREATE TABLE	Department (
DepartmentID	INT,
DepartmentName	VARCHAR(20)
);
CREATE TABLE	Position (
PositionID	INT,
PositionName	VARCHAR(20)
);
CREATE TABLE	Account_	(
AccountID	INT,
Email	VARCHAR(50),
Username	VARCHAR(30),
Fullname	VARCHAR(30),
DepartmentID	INT,
PositionID	VARCHAR(10),
CreateDate	INT
);
CREATE TABLE	Group_	(
GroupID	INT,
GroupName	VARCHAR(20),
CreatorID	INT,
CreateDate	DATE
);
CREATE TABLE	GroupAccount	(
GroupID	INT,
AccountID	INT,
JoinDate DATE);
CREATE TABLE	TypeQuestion (
TypeID INT,
TypeName VARCHAR(50)
);
CREATE TABLE	CategoryQuestion (
CategoryID INT,
CategoryName VARCHAR(50)
);
CREATE TABLE	Question (
QuestionID	INT,
Content	VARCHAR(50),
CategoryID	INT,
TypeID	INT,
CreatorID	INT,
CreateDate	DATE 
);
CREATE TABLE	Answer (
AnswerID	INT,
Content	VARCHAR(50),
QuestionID	INT,
isCorrect	VARCHAR(10)
);
CREATE TABLE	EXAM (
ExamID	INT,
Code_ INT,
Title	VARCHAR(20),
CategoryID	INT,
Duration VARCHAR(20),
CreatorID INT,
CreateDate	DATE 
);
CREATE TABLE	ExamQuestions (
ExamID	INT,
QuestionID	INT 
);
















