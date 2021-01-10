-- Exercise 1:Design a table

-- Question 1: Tạo table với các ràng buộc và kiểu dữ liệu 
DROP DATABASE IF EXISTS FresherManagement;
CREATE DATABASE FresherManagemenT;
USE FresherManagement;

-- tao bang thong tin thuc tap sinh
CREATE TABLE `Trainee` 
(
TraineeID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
FullName VARCHAR (30) NOT NULL,
Birth_Date DATE NOT NULL,
Gender BIT,
ET_IQ SMALLINT UNSIGNED NOT NULL,
ET_Gmath SMALLINT UNSIGNED NOT NULL,
ET_English SMALLINT UNSIGNED NOT NULL,
Training_Class CHAR(10),
Evaluation_Notes VARCHAR(100)
);

-- Question 2: thêm trường VTI_Account với điều kiện not null & unique Chú ý: chú tới tới các best practice 
ALTER TABLE `Trainee` ADD VTI_Account INT NOT NULL UNIQUE KEY;











