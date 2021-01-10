-- Question 2: Viết lệnh để lấy ra tất cả các thực tập sinh đã vượt qua bài test đầu vào, nhóm chúng thành các tháng sinh khác nhau 
SELECT * FROM `Trainee`
WHERE Result = 1 
ORDER BY DateOfBirth ASC;

-- Question 3: Viết lệnh để lấy ra thực tập sinh có tên dài nhất, lấy ra các thông tin sau: tên, tuổi, các thông tin cơ bản (như đã được định nghĩa trong table) 
SELECT *,LENGTH(FullName) FROM `Trainee`
WHERE LENGTH(FullName) = (SELECT(MAX(LENGTH(FullName))) FROM `Trainee`);

-- Question 4: Viết lệnh để lấy ra tất cả các thực tập sinh là ET
SELECT TraineeID,FullName FROM `Trainee`
WHERE TotalPoint >= 20 AND ET_IQ >= 8 AND ET_Gmath >= 8 AND ET_English >= 18 AND FirstTestResult = 1;

-- Question 5: xóa thực tập sinh có TraineeID = 3
DELETE FROM `Trainee`
WHERE TraineeID = 3;

-- Question 6: Thực tập sinh có TraineeID = 5 được chuyển sang lớp "2". Hãy cập nhật thông tin vào database 
UPDATE `Trainee`
SET Training_Class = 2
WHERE TraineeID = 5
 
