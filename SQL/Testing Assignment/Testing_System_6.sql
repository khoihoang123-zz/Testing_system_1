-- Question 1: Tạo store để người dùng nhập vào tên phòng ban và in ra tất cả các account thuộc phòng ban đó 
DELIMITER $$
DROP PROCEDURE IF EXISTS account_department;
CREATE PROCEDURE account_department (IN in_DepartmentName VARCHAR(30) )
BEGIN
 SELECT t2.AccountID,t2.UserName,t2.Email
 FROM `Department` t1
 JOIN `Account` t2 ON t1.DepartmentID = t2.DepartmentID
 WHERE DepartmentName = in_DepartmentName;
 END $$
 DELIMITER ;
 
call account_department('Sale');

-- Question 2: Tạo store để in ra số lượng account trong mỗi group 
DELIMITER $$
DROP PROCEDURE IF EXISTS account_group;
CREATE PROCEDURE account_group ()
BEGIN
	SELECT t1.GroupID,COUNT(t2.AccountID) AS 'So thanh vien'
    FROM `GroupAccount` t1
    JOIN `Account` t2 ON t1.AccountID = t2.AccountID 
    GROUP BY t1.GroupID;
END $$
DELIMITER ;

call account_group ();

-- Question 3: Tạo store để thống kê mỗi type question có bao nhiêu question được tạo trong tháng hiện tại 
DELIMITER $$
DROP PROCEDURE IF EXISTS typequestion_question;
CREATE PROCEDURE typequestion_question ()
BEGIN
	SELECT t1.TypeName,COUNT(t2.TypeID) AS 'so question',t2.CreateDate
    FROM `TypeQuestion` t1
    JOIN `Question` t2 ON t1.TypeID = t2.TypeID
    GROUP BY t1.TypeID
    WHERE CreateDate = in_CreateDate;
END $$
DELIMITER ;

-- Question 4: Tạo store để trả ra id của type question có nhiều câu hỏi nhất 
DELIMITER $$
DROP PROCEDURE IF EXISTS maxqoftypequestion;
CREATE PROCEDURE maxqoftypequestion ()
BEGIN
	SELECT t1.TypeID,COUNT(t2.TypeID) AS 'so question'
    FROM `TypeQuestion` t1
    JOIN `Question` t2 ON t1.TypeID = t2.TypeID
    GROUP BY t1.TypeID HAVING COUNT(t2.TypeID) = (SELECT MAX(countt2) FROM (SELECT COUNT(t2.TypeID) AS countt2
												FROM `TypeQuestion` t1
                                                JOIN `Question` t2 ON t1.TypeID = t2.TypeID 
                                                GROUP BY t2.TypeID ) AS MaxCountt2);
END $$
DELIMITER ;

call maxqoftypequestion ();

-- Question 5: Sử dụng store ở question 4 để tìm ra tên của type question 
DELIMITER $$
DROP PROCEDURE IF EXISTS maxqoftypequestion;
CREATE PROCEDURE maxqoftypequestion ()
BEGIN
	SELECT t1.TypeID,t1.TypeName,COUNT(t2.TypeID) AS 'so question'
    FROM `TypeQuestion` t1
    JOIN `Question` t2 ON t1.TypeID = t2.TypeID
    GROUP BY t1.TypeID HAVING COUNT(t2.TypeID) = (SELECT MAX(countt2) FROM (SELECT COUNT(t2.TypeID) AS countt2
												FROM `TypeQuestion` t1
                                                JOIN `Question` t2 ON t1.TypeID = t2.TypeID 
                                                GROUP BY t2.TypeID ) AS MaxCountt2);
END $$
DELIMITER ;

call maxqoftypequestion();

-- Question 6: Viết 1 store cho phép người dùng nhập vào 1 chuỗi và trả về group có tên chứa chuỗi của người dùng nhập vào hoặc trả về user có username chứa chuỗi của người dùng nhập vào 
DELIMITER $$
DROP PROCEDURE IF EXISTS GroupName;
CREATE PROCEDURE GroupName(IN in_FullName VARCHAR (30),OUT out_FullName VARCHAR(30))
BEGIN
	SELECT FullName,Username
    FROM `Account`
    WHERE FullName LIKE (





    









