-- lấy ra tất cả các phòng ban 
SELECT * 
FROM department;

-- lấy ra id của phòng ban "Sale" 
SELECT DepartmentID
FROM department 
WHERE DepartmentName = 'Sale';

-- lấy ra thông tin account có full name dài nhất 
SELECT *
FROM account_id
WHERE length(Fullname) = ( SELECT MAX(LENGTH (Fullname)) FROM account_id);

-- Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id          = 3 
SELECT *
FROM account_id
WHERE length(Fullname) = ( SELECT MAX(LENGTH (Fullname)) FROM account_id)
AND DepartmentID = 3;

-- Lấy ra tên group đã tham gia trước ngày 20/12/2019 
SELECT GroupName
FROM group_id
WHERE CreateDate < '2019-12-20';

-- Lấy ra ID của question có >= 4 câu trả lời 
SELECT QuestionID
FROM answer
GROUP BY QuestionID
HAVING COUNT(AnswerID) >= 4;

-- Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 20/12/2019 
SELECT Code_ 
FROM exam
WHERE Duration >= '01:00:00' AND CreateDate < '2019-12-20';

--  Lấy ra 5 group được tạo gần đây nhất
SELECT *
FROM group_id
ORDER BY CreateDate DESC
LIMIT 5 ; 

-- Đếm số nhân viên thuộc department có id = 2 
SELECT COUNT(AccountID) AS 'SO_NHAN_VIEN'
FROM account_id
WHERE DepartmentID = 2;

-- Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o" 
SELECT Fullname
FROM account_id
WHERE Fullname LIKE('D%%o');

-- Xóa tất cả các exam được tạo trước ngày 20/12/2019 
DELETE 
FROM exam
WHERE CreateDate < '2019-12-20';

--  Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và email thành loc.nguyenba@vti.com.vn 
UPDATE account_id
SET Fullname = 'Nguyễn Bá Lộc' , Email = 'loc.nguyenba@vti.com.vn'
WHERE AccountID = 5;

-- Update account có id = 5 sẽ thuộc group có id = 4 
UPDATE account_id
SET AccountID = 5 
WHERE GroupID = 4;















