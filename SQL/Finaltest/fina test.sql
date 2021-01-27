DROP DATABASE IF EXISTS ThucTap;
-- Tao database
CREATE DATABASE ThucTap;
USE ThucTap;

-- Tao bang Country
DROP TABLE IF EXISTS `Country`;
CREATE TABLE `Country` (
country_id INT AUTO_INCREMENT PRIMARY KEY,
country_name VARCHAR (20) NOT NULL 
);

-- insert data cho Country 
INSERT INTO `Country` (country_name)
VALUES 				  ('Việt Nam'),
					  ('Trung Quốc'),
                      ('Mỹ');
                      

-- Tao bang Location
DROP TABLE IF EXISTS `Location`;
CREATE TABLE `Location` (
location_id INT AUTO_INCREMENT PRIMARY KEY,
street_address VARCHAR (50) NOT NULL,
postal_code INT UNSIGNED NOT NULL,
country_id INT NOT NULL,
FOREIGN KEY (country_id) REFERENCES `Country`(country_id) ON DELETE CASCADE
);

-- insert data cho Location
INSERT INTO `Location` (street_address,postal_code,country_id)
VALUES 				   ('Bach Mai Hai Ba Trung Disctrict',100000,1),
					   ('AnjiahutongFengtai District',100076,2),
                       ('Cantwell',99729,3);

-- Tao bang Employee
DROP TABLE IF EXISTS `Employee`;
CREATE TABLE `Employee` (
employee_id INT AUTO_INCREMENT PRIMARY KEY,
full_name VARCHAR (30) NOT NULL,
email VARCHAR (50) UNIQUE KEY,
location_id INT NOT NULL,
FOREIGN KEY (location_id) REFERENCES `Location`(location_id) ON DELETE SET NULL
);

-- insert data cho bang Employee
INSERT INTO `Employee`(full_name,email,location_id)
VALUES 				  ('Hoàng Minh Khôi','khoihoang2402@gmail.com',1),
					  ('LinDan','nn03@gmail.com',2),
                      ('Joe Biden','bidenxi@yahoo.com',3);
                      
                      
-- Question
-- Lấy tất cả các nhân viên thuộc Việt Nam
SELECT t1.full_name,t3.country_name
FROM `Employee` t1
JOIN `Location` t2 ON t1.location_id = t2.location_id
JOIN `Country` t3 ON t2.country_id = t3.country_id
WHERE t3.country_name = 'Việt Nam';

-- Lấy ra tên quốc gia của employee có email là "nn03@gmail.com"
SELECT t1.full_name,t1.email,t3.country_name
FROM `Employee` t1
JOIN `Location` t2 ON t1.location_id = t2.location_id
JOIN `Country` t3 ON t2.country_id = t3.country_id
WHERE t1.email = 'nn03@gmail.com';

-- Thống kê mỗi country, mỗi location có bao nhiêu employee đang làm việc
SELECT t1.country_name,t2.street_address,COUNT(t3.employee_id) AS 'Số nhân viên'
FROM `Country` t1
JOIN `Location` t2 ON t1.country_id = t2.country_id
LEFT JOIN `Employee` t3 ON t2.location_id = t3.location_id
GROUP BY t1.country_name;

-- Tạo trigger cho table Employee chỉ cho phép insert mỗi quốc gia có tối đa 10 employee
DROP TRIGGER IF EXISTS insert_of_employee;
DELIMITER $$

CREATE TRIGGER insert_of_employee BEFORE INSERT
ON `Employee`
FOR EACH ROW
BEGIN
	DECLARE country_name_1 VARCHAR (20);
    
    SELECT t1.country_Name INTO country_name_1
    FROM (
    SELECT t1.country_name,COUNT(t3.employee_id) AS 'Số Employee'
    FROM `Country` t1
    JOIN `Location` t2 ON t1.country_id = t2.country_id
	LEFT JOIN `Employee` t3 ON t2.location_id = t3.location_id
    GROUP BY t1.country_name
    HAVING COUNT(t3.employee_id) = 10);
    
    IF 'Số Employee' > 10
    THEN 
	SIGNAL SQLSTATE '1234'
	SET MESSAGE_TEXT = 'Tối đa 10 emloyee cho mỗi quốc gia';
END IF;
END $$
DELIMITER ;
    

-- Hãy cấu hình table sao cho khi xóa 1 location nào đó thì tất cả employee ở location đó sẽ có location_id = null
DELETE FROM `location` WHERE location_id =3;
SELECT * FROM `Employee`;


















