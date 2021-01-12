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

--  Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất
SELECT t1.QuestionID,t1.Content,COUNT(t2.QuestionID) AS SO_LAN_SU_DUNG
FROM `Question` t1
JOIN `ExamQuestion` t2 ON t1.QuestionID = t2.QuestionID 
GROUP BY t1.QuestionID HAVING COUNT(t2.QuestionID)
ORDER BY t2.QuestionID ASC
LIMIT 1;


-- Thông kê mỗi category Question được sử dụng trong bao nhiêu Question
SELECT t1.CategoryID,t1.CategoryName,COUNT(t2.CategoryID) AS SO_Question
FROM `CategoryQuestion` t1
JOIN `Question` t2 ON t1.CategoryID = t2.CategoryID
GROUP BY t1.CategoryName HAVING COUNT(t2.CategoryID);

-- Thông kê mỗi Question được sử dụng trong bao nhiêu Exam

-- Lấy ra Question có nhiều câu trả lời nhất 
SELECT t1.QuestionID,t1.Content,COUNT(t2.QuestionID) AS SO_CAU_TRA_LOI
FROM `Question` t1
JOIN `Answer` t2 on t1.QuestionID = t2.QuestionID 
GROUP BY t2.QuestionID HAVING COUNT(t2.QuestionID)
ORDER BY t2.QuestionID ASC
LIMIT 1;

-- Thống kê số lượng account trong mỗi group 
SELECT t1.GroupID,t1.GroupName,COUNT(t2.AccountID) AS SO_LUONG
FROM `Group` t1
JOIN `GroupAccount` t2 on t1.GroupID = t2.GroupID
GROUP BY t1.GroupID HAVING COUNT(t2.AccountID);

-- Tìm chức vụ có ít người nhất 
SELECT t1.PositionName,COUNT(t2.PositionID) AS SO_NHAN_VIEN
FROM `Position` t1
JOIN `Account` t2 ON t1.PositionID = t2.PositionID
GROUP BY t1.PositionName HAVING COUNT(t2.PositionID)











