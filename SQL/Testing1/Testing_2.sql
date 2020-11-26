-- creat databse Testing_System_Assigment_1
DROP DATABASE IF EXISTS Testing_System_Assignment_1;
CREATE DATABASE	IF NOT EXISTS	Testing_System_Assignment_1;
USE	Testing_System_Assignment_1;

-- create table Department
DROP TABLE IF EXISTS Department;
CREATE TABLE 	Department (
DepartmentID	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
DepartmentName	VARCHAR(20) NOT NULL CHECK (LENGTH (DepartmentName) >= 4)
);
INSERT INTO Department 
                       ( DepartmentID,	DepartmentName)

VALUES 				   (1,	'Nhân Sự'),
					   (2,	'Kế toán'),
                       (3,	'Marketing'),
                       (4,	'Bảo Vệ'),
                       (5,	'Sale');
                      
	
-- create table Position
DROP TABLE IF EXISTS Position_id;
CREATE TABLE	Position_id (
PositionID	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
PositionName	VARCHAR(20) NOT NULL 
);
INSERT INTO Position_id 
                       ( PositionID,	PositionName)

VALUES 				   (1,	'Nhân viên'),
					   (2,	'Quản Lý'),
                       (3,	'Trưởng Phòng');
                       

-- create table Account
DROP TABLE IF EXISTS Account_id; 
CREATE TABLE	Account_id	(
AccountID	INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Email	VARCHAR(50) CHECK (length(Email) >= 8) ,
Username	CHAR(15) NOT NULL UNIQUE CHECK (length(Username) >= 6),
Fullname	VARCHAR(30) NOT NULL CHECK (length(Fullname) >= 8),
DepartmentID	TINYINT UNSIGNED,
PositionID	TINYINT UNSIGNED, 	
CreateDate	DATE ,
FOREIGN KEY (DepartmentID) REFERENCES Department (DepartmentID),
FOREIGN KEY (PositionID) REFERENCES Position_id (PositionID)
);
INSERT INTO Account_id 
                       ( AccountID,	     Email,	                             Username,	         Fullname,	      DepartmentID,	       PositionID,		CreateDate)

VALUES 				   (     1,	  'alakhdarxala8@hotmail-s.com',	       'trinhdang0912',	   'Đặng Vũ Trình',	        1,	               3,	        '2020-11-09'),
                       (     2,	  't8randows3c@psncl.com',	               'nhatvu1919',	   'Vũ Quang Nhật',	        2,	               2,	        '2020-11-08'),
                       (     3,	  'aoffici@reitralsa.ga',	               'daikhidot',	       'Nguyễn Xuân Đại',	    3,	               1,	        '2020-11-07'),
                       (     4,	  'n6loganlmajnon3@gegearkansas.com',	   'linhdo1111',	   'Đỗ Mai Linh',	        4,	               1,	        '2020-11-06'),
                       (     5,	  'shamza.b@cagi.ru',	                   'khoiboi123',	   'Bùi Đăng Khôi',	        5,	               2,	        '2020-11-05');
					   

-- create table Group
DROP TABLE IF EXISTS Group_id;
CREATE TABLE	Group_id	(
GroupID	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
GroupName	VARCHAR(30) NOT NULL CHECK (length(GroupName) >= 3),
CreatorID	TINYINT UNSIGNED NOT NULL,
CreateDate	DATE
);

INSERT INTO Group_id 
                       ( GroupID, 	GroupName,	    CreatorID,	       CreateDate      ) 

VALUES 				   (     1,	     'Kim',	           '2',	        '2020-11-12'       ),
                       (     2,	     'Mộc',	           '3',	   		'2020-11-14'	   ), 
                       (     3,	     'Thủy',	       '5',	    	'2020-11-12'	   ),  
                       (     4,	     'Hỏa',	           '4',	   		'2020-11-14'       ), 
                       (     5,	     'Thổ',	           '1',	   		'2020-11-15'	   );    



-- create table GroupAccount
DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE	GroupAccount	(
GroupID	TINYINT UNSIGNED PRIMARY KEY,
AccountID	INT UNSIGNED NOT NULL,
JoinDate DATE,
FOREIGN KEY (GroupID) REFERENCES Group_id(GroupID),
FOREIGN KEY (AccountID) REFERENCES Account_id (AccountID)
);

INSERT INTO GroupAccount 
                       ( GroupID, 	AccountID,	    JoinDate) 

VALUES 				   (     1,	     '1',	     '2020-11-16'      ),
                       (     2,	     '2',	     '2020-11-17'	   ), 
                       (     3,	     '3',	     '2020-11-18'	   ),  
                       (     4,	     '4',	     '2020-11-19'      ), 
                       (     5,	     '5',	     '2020-11-20'	   );    



-- create table TypeQuestion
DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE	TypeQuestion (
TypeID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
TypeName VARCHAR(50) NOT NULL
);

INSERT INTO TypeQuestion 
                       ( TypeID, 	      TypeName) 

VALUES 				   (     1,	      'Essay'           ),
                       (     2,	      'Multiple-Choice' ), 
                       (     3,	      'Multiple-Choice' ),  
                       (     4,	      'Essay' ), 
                       (     5,	      'Multiple-Choice' );  


-- create table CategoryQuestion
DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE	CategoryQuestion (
CategoryID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
CategoryName CHAR(20) NOT NULL
);

INSERT INTO CategoryQuestion 
                       ( CategoryID, 	      CategoryName) 

VALUES 				   (     1,	               'Java' ),
                       (     2,	               'NET' ), 
                       (     3,	               'SQL' ),  
                       (     4,	               'Postman' ), 
                       (     5,	               'Ruby' );  

-- create table Question
DROP TABLE IF EXISTS Question;
CREATE TABLE	Question (
QuestionID	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Content	VARCHAR(100) NOT NULL,
CategoryID	TINYINT UNSIGNED NOT NULL,
TypeID	TINYINT UNSIGNED NOT NULL,
CreatorID	TINYINT UNSIGNED NOT NULL,
CreateDate	DATE,
FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion (CategoryID),
FOREIGN KEY (TypeID) REFERENCES TypeQuestion (TypeID)
);

INSERT INTO Question 
                       ( QuestionID,	     Content,	        CategoryID,	         TypeID,	      CreatorID,	       CreateDate)

VALUES 				   (     1,	        'đây là nội dung',	       '2',	              '3',	             1,	               '2020-11-20'),
                       (     2,	        'đây là nội dung',	       '4',	              '4',	             2,	               '2020-11-21'),
                       (     3,	        'đây là nội dung',	       '5',	              '1',	             3,	               '2020-11-21'),
                       (     4,	        'đây là nội dung',	       '3',	              '2',	             4,	               '2020-11-22'),
                       (     5,	        'đây là nội dung',	       '1',	              '5',	             5,	               '2020-11-24');
					   

-- create table Answer
DROP TABLE IF EXISTS Answer;
CREATE TABLE	Answer (
AnswerID	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Content	VARCHAR(300) NOT NULL,
QuestionID	TINYINT UNSIGNED NOT NULL,
isCorrect	ENUM('Đúng''Sai') NOT NULL,
FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID)
);

INSERT INTO Answer 
                       ( AnswerID, 	     Content,	         QuestionID) 

VALUES 				   (     1,	     'đây là nội dung',	        '5'           ),
                       (     2,	     'đây là nội dung',	        '4'	          ), 
                       (     3,	     'đây là nội dung',	        '2'	          ),  
                       (     4,	     'đây là nội dung',	        '3'           ), 
                       (     5,	     'đây là nội dung',	        '1'	          );    



-- create table Exam
DROP TABLE IF EXISTS EXAM;
CREATE TABLE	EXAM (
ExamID	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Code_ CHAR(10) NOT NULL,
Title	VARCHAR(30)NOT NULL ,
CategoryID	TINYINT UNSIGNED UNIQUE KEY NOT NULL,
Duration TIME,
CreatorID TINYINT UNSIGNED NOT NULL,
CreateDate	DATE
);

INSERT INTO EXAM 
                       ( ExamID,	     Code_,	             Title,	             CategoryID,	        Duration,	       CreatorID,		CreateDate)

VALUES 				   (     1,	         'A3',	         'Đây là title',	         '1',	            '01:30:00',	         '5',          '2020-11-22'),
                       (     2,	         'B4',	         'Đây là title',	         '2',	            '01:30:00',	         '4',          '2020-11-22'),
                       (     3,	         'C5',	         'Đây là title',	         '3',	            '01:30:00',	         '2',          '2020-11-22'),
                       (     4,	         'D2',	         'Đây là title',	         '4',	            '01:30:00',	         '3',          '2020-11-22'),
                       (     5,	         'E1',	         'Đây là title',	         '5',	            '01:30:00',	         '1',          '2020-11-22');
					   


-- creat table ExamQuestion
DROP TABLE IF EXISTS ExamQuestions;
CREATE TABLE	ExamQuestions (
ExamID	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
QuestionID	TINYINT UNSIGNED UNIQUE KEY NOT NULL,
FOREIGN KEY (ExamID) REFERENCES EXAM(ExamID),
FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID)
);

INSERT INTO ExamQuestions 
                       ( ExamID, 	      QuestionID) 

VALUES 				   (    1,	            '1' ),
                       (    2,	            '2' ), 
                       (    3,	            '3' ),  
                       (    4,	            '4' ), 
                       (    5,	            '5' );  