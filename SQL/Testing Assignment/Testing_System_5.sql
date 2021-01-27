-- Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale 
CREATE VIEW NhanvienSale AS
SELECT t1.AccountID,t1.FullName,t2.DepartmentName
FROM `Account` t1
JOIN `Department` t2 ON t1.DepartmentID = t2.DepartmentID 
WHERE t2.DepartmentName = 'Sale';

-- Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất 
CREATE VIEW AccountGroup AS
SELECT t1.AccountID,COUNT(t2.AccountID) AS SO_GROUP
FROM `Account` t1
JOIN `GroupAccount` t2 ON t1.AccountID = t2.AccountID 
GROUP BY t1.AccountID HAVING COUNT(t2.AccountID) = (SELECT MAX(SO_GROUP) FROM (SELECT COUNT(t2.AccountID) AS SO_GROUP
													FROM `Account` t1
                                                    JOIN `GroupAccount` t2 ON t1.AccountID = t2.AccountID
                                                    GROUP BY t2.AccountID ) AS MaxSO_GROUP );
                                                    
-- Tạo view có chứa câu hỏi có những content quá dài (content quá 300 từ được coi là quá dài) và xóa nó đi Question 
CREATE VIEW CauHoiDai AS
SELECT QuestionID ,length(Content)-length(replace(Content,' ',''))+1 AS 'Số Từ'
FROM `Question`
WHERE length(Content)-length(replace(Content,' ',''))+1 > 3;
DROP VIEW CauHoiDai;

-- Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất
CREATE VIEW danhsachphongban AS
SELECT t1.*,Count(t2.DepartmentID) AS SO_NHAN_VIEN
FROM `Department` t1 
JOIN `Account` t2 ON t1.DepartmentID = t2.DepartmentID
GROUP BY t1.DepartmentID HAVING COUNT(t2.DepartmentID) = (SELECT MAX(countt2) FROM (SELECT COUNT(t2.DepartmentID) AS countt2
														  FROM `Department` t1
                                                          JOIN `Account` t2 ON t1.DepartmentID = t2.DepartmentID
                                                          GROUP BY t2.DepartmentID ) AS MaxCountt2);
                                                          
-- Tạo view có chứa tất các các câu hỏi do user họ Nguyễn tạo 
CREATE VIEW Cauhoi AS
SELECT t1.QuestionID,t1.CreatorID,t2.FullName
FROM `Question` t1
JOIN `Account` t2 ON t1.CreatorID = t2.AccountID
WHERE t2.FullName LIKE 'Nguyễn%'



                                                          


