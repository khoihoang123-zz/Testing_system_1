DROP TABLE IF EXISTS `Trainee`;
CREATE TABLE `Trainee` 
(
TraineeID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
FullName VARCHAR (30) NOT NULL,
Birth_Date DATE NOT NULL,
Gender VARCHAR(10),
ET_IQ SMALLINT UNSIGNED NOT NULL,
ET_Gmath SMALLINT UNSIGNED NOT NULL,
ET_English SMALLINT UNSIGNED NOT NULL,
Training_Class CHAR(10),
Evaluation_Notes VARCHAR(100), 
FirstTestResult BIT
);
ALTER TABLE `Trainee` ADD TotalPoint INT UNSIGNED NOT NULL;

-- insert data cho bang trainee
insert into `Trainee` (TraineeID, FullName, Birth_Date, Gender, ET_IQ, ET_Gmath, ET_English, Training_Class, Evaluation_Notes, FirstTestResult) values (1, 'Fairfax Lernihan', '1996-10-05', 'Male', 5, 17, 21, 2, 'enim blandit mi in porttitor pede justo eu massa donec', 1);
insert into `Trainee` (TraineeID, FullName, Birth_Date, Gender, ET_IQ, ET_Gmath, ET_English, Training_Class, Evaluation_Notes, FirstTestResult) values (2, 'Bram Caccavella', '1995-03-09', 'Male', 7, 16, 6, 2, 'vestibulum rutrum rutrum neque aenean', 0);
insert into `Trainee` (TraineeID, FullName, Birth_Date, Gender, ET_IQ, ET_Gmath, ET_English, Training_Class, Evaluation_Notes, FirstTestResult) values (3, 'Tito Voas', '1995-02-12', 'Male', 2, 4, 32, 1, 'velit vivamus vel nulla eget eros elementum pellentesque quisque porta', 1);
insert into `Trainee` (TraineeID, FullName, Birth_Date, Gender, ET_IQ, ET_Gmath, ET_English, Training_Class, Evaluation_Notes, FirstTestResult) values (4, 'Conn De Ambrosi', '1996-10-26', 'Male', 4, 2, 9, 1, 'eros viverra eget congue eget semper rutrum', 0);
insert into `Trainee` (TraineeID, FullName, Birth_Date, Gender, ET_IQ, ET_Gmath, ET_English, Training_Class, Evaluation_Notes, FirstTestResult) values (5, 'Beaufort Spadeck', '1995-08-15', 'Male', 4, 13, 9, 1, 'non ligula pellentesque ultrices phasellus id', 1);
insert into `Trainee` (TraineeID, FullName, Birth_Date, Gender, ET_IQ, ET_Gmath, ET_English, Training_Class, Evaluation_Notes, FirstTestResult) values (6, 'Solomon Zack', '1995-05-19', 'Male', 10, 4, 5, 2, 'faucibus cursus urna ut tellus nulla ut', 1);
insert into `Trainee` (TraineeID, FullName, Birth_Date, Gender, ET_IQ, ET_Gmath, ET_English, Training_Class, Evaluation_Notes, FirstTestResult) values (7, 'Roley Roels', '1996-06-23', 'Male', 9, 14, 2, 2, 'sapien quis libero nullam sit', 1);
insert into `Trainee` (TraineeID, FullName, Birth_Date, Gender, ET_IQ, ET_Gmath, ET_English, Training_Class, Evaluation_Notes, FirstTestResult) values (8, 'Brianna Rainville', '1996-07-08', 'Female', 5, 18, 5, 1, 'in hac habitasse platea dictumst aliquam', 1);
insert into `Trainee` (TraineeID, FullName, Birth_Date, Gender, ET_IQ, ET_Gmath, ET_English, Training_Class, Evaluation_Notes, FirstTestResult) values (9, 'Deeann Schiesterl', '1995-10-14', 'Female', 5, 1, 32, 1, 'id pretium iaculis diam erat fermentum', 0);
insert into `Trainee` (TraineeID, FullName, Birth_Date, Gender, ET_IQ, ET_Gmath, ET_English, Training_Class, Evaluation_Notes, FirstTestResult) values (10, 'Vinita Limprecht', '1994-11-05', 'Female', 18, 18, 30, 2, 'placerat praesent blandit nam nulla integer', 1);

