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
    LEFT JOIN `Account` t2 ON t1.AccountID = t2.AccountID 
    GROUP BY t1.GroupID;
END $$
DELIMITER ;

call account_group ();

-- Question 3: Tạo store để thống kê mỗi type question có bao nhiêu question được tạo trong tháng hiện tại 
DROP PROCEDURE IF EXISTS Cau_Hoi_Trong_Thang;
DELIMITER $$
CREATE PROCEDURE Cau_Hoi_Trong_Thang ()
BEGIN
	SELECT	t1.TypeID, t1.TypeName, COUNT(t2.QuestionID) AS So_Q
    FROM `TypeQuestion` t1
    JOIN `Question`     t2 ON t1.TypeID = t2.TypeID
    WHERE	MONTH(t2.CreateDate) = MONTH(NOW())
		AND YEAR(t2.CreateDate) = YEAR(NOW())
    GROUP BY	t1.TypeID
    ;
END $$
DELIMITER ;

CALL Cau_Hoi_Trong_Thang();

-- Question 4: Tạo store để trả ra id của type question có nhiều câu hỏi nhất
DROP PROCEDURE IF EXISTS TypeID_MaxQ;
DELIMITER $$

CREATE PROCEDURE TypeID_MaxQ()
BEGIN
	SELECT t1.TypeID , count(t2.TypeID)
	FROM `TypeQuestion` t1
    JOIN `Question` t2 ON t1.TypeID = t2.TypeID
    GROUP BY t2.TypeID
    HAVING count(t2.TypeID) = (	SELECT MAX(NumberOfQuestion)
										FROM (	SELECT COUNT(t2.TypeID) AS NumberOfQuestion
												FROM 	`Question`
                                                GROUP BY t2.TypeID) );
END $$

DELIMITER ;

-- Question 5: Sử dụng store ở question 4 để tìm ra tên của type question
DROP PROCEDURE IF EXISTS Question5;
DELIMITER $$

CREATE PROCEDURE Question5()
BEGIN
	SELECT typequestion.TypeID ,typequestion.TypeName , count(question.TypeID)
	FROM question
    JOIN typequestion ON question.TypeID = typequestion.TypeID
    GROUP BY typequestion.TypeID
    HAVING count(question.TypeID) = (	SELECT MAX(Number_Of_Question)
										FROM (	SELECT count(question.TypeID) AS Number_Of_Question
												FROM 	question
                                                GROUP BY question.TypeID) e1 );
END $$

-- Question 6: Viết 1 store cho phép người dùng nhập vào 1 chuỗi và trả về group có tên chứa chuỗi của người dùng nhập vào hoặc trả về user có username chứa chuỗi của người dùng nhập vào
DROP PROCEDURE IF EXISTS Question6;
DELIMITER $$
CREATE PROCEDURE Question6( IN Nhap Varchar(30), IN Group_OR_User ENUM('group','user'))
Begin
	IF Group_OR_User = 'group'
	THEN	 SELECT GroupName 
			 FROM `group`
             Where	GroupName Like concat('%' , Nhap ,'%');
	Else
			SELECT AccountID, Email, Username, Fullname
            From `account`	
            Where Username like concat('%' , Nhap ,'%');
	END IF;
    END$$
    
DELIMITER ;


-- Question 7: Viết 1 store cho phép người dùng nhập vào thông tin fullName, email và trong store sẽ tự động gán: 
-- username sẽ giống email nhưng bỏ phần @..mail đi 
-- positionID: sẽ có default là developer 
-- departmentID: sẽ được cho vào 1 phòng chờ 
-- 	Sau đó in ra kết quả tạo thành công 

DROP PROCEDURE IF EXISTS insert_account;
DELIMITER $$
CREATE PROCEDURE insert_account(IN in_full_name VARCHAR(255), IN in_email VARCHAR(100))
BEGIN
	DECLARE v_department_id INT(10) DEFAULT 0;
    DECLARE v_position_id INT(10) DEFAULT 0;
    
    SELECT department_id INTO v_department_id
    FROM departments 
    WHERE department_name = 'Waiting Room';
       
	SELECT position_id INTO v_position_id
    FROM positions 
    WHERE position_name = 'Developer';
    
    INSERT INTO accounts 
	(email, 		user_name, 								full_name, 		department_id, 		position_id) VALUES
    (in_email, 		SUBSTRING_INDEX(in_email, '@', 1), 		in_full_name, 	v_department_id, 	v_position_id);
    
    IF ROW_COUNT() > 0 THEN
		SELECT 'You created record successfully!';
    ELSE 
		SELECT 'You did not create record successfully!';
	END IF;
END$$
DELIMITER ;

    









