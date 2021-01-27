-- Exercise 1: Join 
-- Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ
SELECT t1.FullName,t2.DepartmentName
FROM `Account` t1
JOIN `Department` t2 ON t1.DepartmentID = t2.DepartmentID;

-- Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010
SELECT * FROM `Account`
WHERE CreateDate > '2010-12-20';

-- Viết lệnh để lấy ra tất cả các developer  
SELECT t1.AccountID,t1.FullName,t2.PositionName 
FROM `Account` t1
JOIN `Position` t2 ON t1.PositionID = t2.PositionID
WHERE PositionName = 'Developer';

-- Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên 
SELECT t1.DepartmentName,COUNT(t2.DepartmentID) AS SO_NHAN_VIEN
FROM `Department` t1
JOIN `Account` t2 ON t1.DepartmentID = t2.DepartmentID
GROUP BY t1.DepartmentName HAVING COUNT(t2.DepartmentID) > 3;

--  Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất (***)
SELECT t1.QuestionID,t1.Content,COUNT(t2.QuestionID) AS SO_LAN_SU_DUNG
FROM `Question` t1
JOIN `ExamQuestion` t2 ON t1.QuestionID = t2.QuestionID 
GROUP BY t1.QuestionID HAVING COUNT(t2.QuestionID) = (SELECT MAX(countt1) FROM (SELECT COUNT(t2.QuestionID) AS countt1
												FROM `Question` t1
                                                JOIN `ExamQuestion` t2 ON t1.QuestionID = t2.QuestionID
                                                GROUP BY t2.QuestionID ) AS MaxCountt1);



-- Thông kê mỗi category Question được sử dụng trong bao nhiêu Question
SELECT t1.CategoryID,t1.CategoryName,COUNT(t2.CategoryID) AS SO_Question
FROM `CategoryQuestion` t1
LEFT JOIN `Question` t2 ON t1.CategoryID = t2.CategoryID
GROUP BY t1.CategoryID 
ORDER BY t2.CategoryID;

-- Thông kê mỗi Question được sử dụng trong bao nhiêu Exam
SELECT t1.QuestionID,t1.Content,COUNT(t2.QuestionID) AS SO_EXAM
FROM `Question` t1
LEFT JOIN `Examquestion` t2 ON t1.QuestionID = t2.QuestionID
GROUP BY t1.QuestionID 
ORDER BY t1.QuestionID;

-- Lấy ra Question có nhiều câu trả lời nhất (***)
SELECT t1.QuestionID,t1.Content,COUNT(t2.QuestionID) AS SO_CAU_TRA_LOI
FROM `Question` t1
JOIN `Answer` t2 on t1.QuestionID = t2.QuestionID 
GROUP BY t2.QuestionID HAVING COUNT(t2.QuestionID) = (SELECT MAX(Countt1)
													FROM (SELECT COUNT(t2.QuestionID) AS Countt1
													FROM `Question` t1
                                                    RIGHT JOIN `Answer` t2 ON t1.QuestionID = t2.QuestionID
                                                    GROUP BY t2.QuestionID) AS MaxCountt1);


-- Thống kê số lượng account trong mỗi group 
SELECT t1.GroupID,t1.GroupName,COUNT(t2.AccountID) AS SO_LUONG
FROM `Group` t1
JOIN `GroupAccount` t2 on t1.GroupID = t2.GroupID
GROUP BY t1.GroupID 
ORDER BY t1.GroupID ASC;

-- Tìm chức vụ có ít người nhất (***)
SELECT t1.PositionName,COUNT(t2.PositionID) AS SO_NHAN_VIEN
FROM `Position` t1
JOIN `Account` t2 ON t1.PositionID = t2.PositionID
GROUP BY t1.PositionName HAVING COUNT(t2.PositionID) = (SELECT MIN(countt1) FROM (SELECT COUNT(t2.PositionID) AS countt1
														FROM `Position` t1
                                                        JOIN `Account` t2 ON t1.PositionID = t2.PositionID 
                                                        GROUP BY t2.PositionID) AS MinCountt1);

-- Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM  (***)
SELECT 
    t1.DepartmentID,
    t1.PositionID,
    IF((t2.number_of_account IS NULL),
        0,
        t2.number_of_account) AS number_of_account
FROM
    (SELECT 
        d.DepartmentID, p.PositionID
    FROM
        department d
    CROSS JOIN `position` p
    WHERE
        p.position_name IN ('Developer' , 'Tester', 'Scrum Master', 'Project Manager')
    ORDER BY d.DepartmentID , p.PositionID) AS t1
        LEFT JOIN
    (SELECT 
        d.DepartmentID,
            p.PositionID,
            COUNT(a.AccountID) AS number_of_account
    FROM
        position p
    LEFT JOIN `account` a ON p.PositionID = a.PositionID
    RIGHT JOIN department d ON a.DepartmentID = d.DepartmentID
    WHERE
        p.PositionName IN ('Developer' , 'Tester', 'Scrum Master', 'Project Manager')
    GROUP BY d.DepartmentID , p.PositionID) AS t2 ON t1.DepartmentID = t2.DepartmentID
        AND t1.PositionID = t2.PositionID
GROUP BY t1.DepartmentID , t1.PositionID
ORDER BY t1.DepartmentID , t1.PositionID;

	--  Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì (***)
SELECT t1.QuestionID,t1.Content AS CAU_HOI,t2.TypeName AS LOAI_CAU_HOI,t1.CreatorID AS NGUOI_TAO,t1.CreateDate AS NGAY_TAO,t3.Content AS CAU_TRA_LOI
FROM `Question` t1
JOIN `TypeQuestion` t2 ON t1.TypeID = t2.TypeID
JOIN `Answer` t3 ON t1.QuestionID = t3.QuestionID ;


-- Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm 
SELECT t1.* , COUNT(t2.TypeID) AS SO_LUONG
FROM `TypeQuestion` t1
JOIN `Question` t2 ON t1.TypeID = t2.TypeID
GROUP BY t2.TypeID 
ORDER BY t2.TypeID;

-- Lấy ra group không có account nào
SELECT t1.GroupID,t1.GroupName
FROM `Group` t1
LEFT JOIN `GroupAccount` t2 ON t1.GroupID = t2.GroupID
WHERE t2.GroupID IS NULL;

-- Lấy ra question không có answer nào 
SELECT t1.QuestionID,t1.Content
FROM `Question` t1
LEFT JOIN `Answer` t2 ON t1.QuestionID = t2.QuestionID
WHERE t2.QuestionID IS NULL;

-- 	Exercise 2: Union Question 17:  a) Lấy các account thuộc nhóm thứ 1 b) Lấy các account thuộc nhóm thứ 2 c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau 
SELECT t1.GroupID,t2.AccountID,t2.Email,t2.UserName,t2.FullName
FROM `GroupAccount` t1
JOIN `Account` t2 ON t1.AccountID = t2.AccountID
WHERE t1.GroupID = 1
UNION
SELECT t1.GroupID,t2.AccountID,t2.Email,t2.UserName,t2.FullName
FROM `GroupAccount` t1
JOIN `Account` t2 ON t1.AccountID = t2.AccountID
WHERE t1.GroupID = 2;

-- Question 18:  a) Lấy các group có lớn hơn 5 thành viên b) Lấy các group có nhỏ hơn 7 thành viên c) Ghép 2 kết quả từ câu a) và câu b) (***)
SELECT t1.GroupID,t1.GroupName,COUNT(t2.AccountID) AS SO_THANH_VIEN
FROM `Group` t1
JOIN `GroupAccount` t2 ON t1.GroupID = t2.GroupID 
GROUP BY t2.GroupID HAVING SO_THANH_VIEN > 5
UNION
SELECT t1.GroupID,t1.GroupName,COUNT(t2.AccountID) AS SO_THANH_VIEN
FROM `Group` t1
JOIN `GroupAccount` t2 ON t1.GroupID = t2.GroupID 
GROUP BY t2.GroupID HAVING SO_THANH_VIEN < 7
















