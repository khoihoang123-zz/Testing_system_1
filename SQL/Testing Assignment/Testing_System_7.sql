-- Question 1: Tạo trigger không cho phép người dùng nhập vào Group có ngày tạo trước 1 năm trước 
DROP TRIGGER IF EXISTS 	trig_no_group_1_year;

DELIMITER //
	CREATE TRIGGER trig_no_group_1_year
    BEFORE INSERT ON `Group`
    FOR EACH ROW
    BEGIN
		IF	(NEW.CreateDate < DATE_SUB(CURRENT_DATE(), INTERVAL 1 YEAR)) THEN 
        SIGNAL SQLSTATE '12345'
        SET MESSAGE_TEXT = 'Cannot add group created for one year or previous';
        END IF;
    END//
DELIMITER ;

-- Question 3: Cấu hình 1 group có nhiều nhất là 5 user
DROP TRIGGER IF EXISTS Question3;
DELIMITER $$

Create trigger Question3 Before INSERT 
ON groupaccount
For each row

Begin
	
    IF New.GroupID in ( select GroupID
						From
						(	select GroupID, count(AccountID) 
							From groupaccount 
							GROUP BY GroupID
							Having count(AccountID)=5) t1 )
    Then	
    signal sqlstate '45000'
    Set message_text = 'Max five acc in each group';
    END IF;
End$$

 DELIMITER ;




