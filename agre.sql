create database Aggregation_Task
use Aggregation_Task
CREATE TABLE Instructors ( 
    InstructorID INT PRIMARY KEY, 
    FullName VARCHAR(100), 
    Email VARCHAR(100), 
    JoinDate DATE 
); 
CREATE TABLE Categories ( 
    CategoryID INT PRIMARY KEY, 
    CategoryName VARCHAR(50) 
); 
CREATE TABLE Courses ( 
    CourseID INT PRIMARY KEY, 
    Title VARCHAR(100), 
    InstructorID INT, 
    CategoryID INT, 
    Price DECIMAL(6,2), 
    PublishDate DATE, 
    FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID), 
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID) 
); 
CREATE TABLE Students ( 
    StudentID INT PRIMARY KEY, 
    FullName VARCHAR(100), 
    Email VARCHAR(100), 
    JoinDate DATE 
); 
CREATE TABLE Enrollments ( 
    EnrollmentID INT PRIMARY KEY, 
    StudentID INT, 
    CourseID INT, 
    EnrollDate DATE, 
    CompletionPercent INT, 
    Rating INT CHECK (Rating BETWEEN 1 AND 5), 
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID), 
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) 
); 
--Step 2: Insert Sample Data 
-- Instructors 
INSERT INTO Instructors VALUES 
(1, 'Sarah Ahmed', 'sarah@learnhub.com', '2023-01-10'), 
(2, 'Mohammed Al-Busaidi', 'mo@learnhub.com', '2023-05-21'); 
-- Categories 
INSERT INTO Categories VALUES 
(1, 'Web Development'), 
(2, 'Data Science'), 
(3, 'Business'); 
-- Courses 
INSERT INTO Courses VALUES 
(101, 'HTML & CSS Basics', 1, 1, 29.99, '2023-02-01'), 
(102, 'Python for Data Analysis', 2, 2, 49.99, '2023-03-15'), 
(103, 'Excel for Business', 2, 3, 19.99, '2023-04-10'), 
(104, 'JavaScript Advanced', 1, 1, 39.99, '2023-05-01'); 
-- Students 
INSERT INTO Students VALUES 
(201, 'Ali Salim', 'ali@student.com', '2023-04-01'), 
(202, 'Layla Nasser', 'layla@student.com', '2023-04-05'), 
(203, 'Ahmed Said', 'ahmed@student.com', '2023-04-10'); 
-- Enrollments 
INSERT INTO Enrollments VALUES 
(1, 201, 101, '2023-04-10', 100, 5), 
(2, 202, 102, '2023-04-15', 80, 4), 
(3, 203, 101, '2023-04-20', 90, 4), 
(4, 201, 102, '2023-04-22', 50, 3), 
(5, 202, 103, '2023-04-25', 70, 4), 
(6, 203, 104, '2023-04-28', 30, 2), 
(7, 201, 104, '2023-05-01', 60, 3); 
 
 select * from Instructors
 select * from Categories
 select * from Courses
 select * from Students
 select * from Enrollments
 
 -- SQL Aggregation Practice 

-- 1. Count total number of students.   
 SELECT COUNT(*) AS Total_Students
FROM Students;

-- 2. Count total number of enrollments.  
SELECT COUNT(*) AS Total_Enrollments
FROM Enrollments;

-- 3. Find average rating of each course.  
SELECT CourseID, AVG(Rating) AS Average_Rating
FROM Enrollments
GROUP BY CourseID;

-- 4. Total number of courses per instructor.  
SELECT InstructorID, COUNT(*) AS Total_Courses
FROM Courses
GROUP BY InstructorID;

-- 5. Number of courses in each category.  
SELECT CategoryID, COUNT(*) AS Number_Of_Courses
FROM Courses
GROUP BY CategoryID;

--6. Number of students enrolled in each course.  
SELECT CourseID, COUNT(StudentID) AS Numbers_Of_Students
FROM Enrollments
GROUP BY CourseID;

-- 7. Average course price per category. 
SELECT CategoryID, AVG(Price) AS Average_Price
FROM Courses
GROUP BY CategoryID;

--  8. Maximum course price.  
SELECT MAX(Price) AS Max_Course_Price
FROM Courses;

-- 9. Min, Max, and Avg rating per course.  
SELECT CourseID,
  MIN(Rating) AS Min_Rating,
  MAX(Rating) AS Max_Rating,
  AVG(Rating) AS Avg_Rating
FROM Enrollments
GROUP BY CourseID;

-- 10. Count how many students gave rating = 5
SELECT COUNT(*) AS Number_Of_Five_Star_Ratings
FROM Enrollments
WHERE Rating = 5;

