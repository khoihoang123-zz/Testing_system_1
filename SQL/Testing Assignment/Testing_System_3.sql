-- Lấy ra tất cả phòng ban
SELECT * FROM `Department`;

-- Lấy ra id của phòng ban Sale
SELECT * FROM `Department`
WHERE DepartmentName = 'Sale';

-- Lấy ra thông tin account có fullname dài nhất
SELECT FullName,length(FullName) FROM `Account`
WHERE length(FullName) = (SELECT MAX(Length(FullName)) FROM `Account`);

--  Lấy ra thông tin account có fullname dài nhất và thuộc phòng ban có id bằng = 3
SELECT FullName,length(FullName) FROM `Account`
WHERE length(FullName) = (SELECT MAX(Length(FullName)) FROM `Account`) 
AND DepartmentID = 3;

-- Lấy ra tên group đã tham gia trước ngày 20/12/2019 
SELECT GroupName FROM `Group`
WHERE CreateDate < '2019-12-20';

-- Lấy ra ID của question có >= 4 câu trả lời
SELECT * FROM Answer
GROUP BY QuestionID 
HAVING Count(AnswerID) > 4;

-- Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 20/12/2019 
SELECT `Code`, CreateDate, Duration FROM `Exam` 
WHERE Duration >= 60 AND CreateDate < '2019-12-20';

-- Lấy ra 5 group được tạo gần đây nhất
SELECT * FROM `Group`
ORDER BY CreateDate DESC 
LIMIT 5;

-- Đếm số nhân viên thuộc department có id = 2
SELECT Count(AccountID) AS SONHANVIEN FROM `Account` 
WHERE DepartmentID = 2;

--  Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o" 
SELECT FullName FROM `Account`
WHERE FullName LIKE 'D%o';

-- Xóa tất cả các exam được tạo trước ngày 20/12/2019 
DELETE FROM `Exam`
WHERE CreateDate < '2019-12-20';

-- Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi" 
DELETE FROM `Question`
WHERE Content LIKE 'câu hỏi';

-- Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và email thành loc.nguyenba@vti.com.vn 
UPDATE `Account`
SET FullName = 'Nguyễn Bá Lộc',Email = 'loc.nguyenba@vti.com.vn'
WHERE AccountID = 5;

--  update account có id = 5 sẽ thuộc group có id = 4 
UPDATE `GroupAccount`
SET GroupID = 4
WHERE AccountID = 5;










