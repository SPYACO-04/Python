create database mini_project;
use mini_project;
-- Students Table 
 
CREATE TABLE Students ( 
    StudentID INT PRIMARY KEY, 
    Name VARCHAR(50), 
    Age INT, 
    Gender VARCHAR(10) 
);
-- Courses Table 
 
CREATE TABLE Courses ( 
    CourseID INT PRIMARY KEY, 
    CourseName VARCHAR(50), 
    Instructor VARCHAR(50) 
);

-- Enrollments Table 
 
CREATE TABLE Enrollments ( 
    EnrollmentID INT PRIMARY KEY, 
    StudentID INT, 
    CourseID INT, 
    Grade INT, 
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID), 
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) 
);
-- Students 
INSERT INTO Students VALUES 
(1, 'Alice', 20, 'Female'), 
(2, 'Bob', 21, 'Male'), 
(3, 'Charlie', 22, 'Male'), 
(4, 'Diana', 23, 'Female'); 
-- Courses 
INSERT INTO Courses VALUES 
(101, 'Mathematics', 'Dr. Rao'), 
(102, 'Computer Science', 'Dr. Iyer'), 
(103, 'Physics', 'Dr. Gupta'); 
-- Enrollments 
INSERT INTO Enrollments VALUES 
(1, 1, 101, 85), 
(2, 1, 102, 92), 
(3, 2, 101, 78), 
(4, 2, 103, 67), 
(5, 3, 101, 88), 
(6, 3, 102, 91), 
(7, 4, 103, 72), 
(8, 4, 102, 65); 
select * from Students;
select * from Courses;
select * from Enrollments;

-- 1. List all students with their courses and grades 
SELECT s.Name, c.CourseName, e.Grade 
FROM Students s 
JOIN Enrollments e ON s.StudentID = e.StudentID 
JOIN Courses c ON e.CourseID = c.CourseID; 

-- 2. Show average grade per course 
SELECT c.CourseName, AVG(e.Grade) AS AvgGrade 
FROM Courses c 
JOIN Enrollments e ON c.CourseID = e.CourseID 
GROUP BY c.CourseName; 

-- 3. Find the number of students enrolled in each course 
SELECT c.CourseName, COUNT(e.StudentID) AS StudentCount 
FROM Courses c 
JOIN Enrollments e ON c.CourseID = e.CourseID 
GROUP BY c.CourseName;

-- 4. Find students who scored above 90 
SELECT s.Name, c.CourseName, e.Grade 
FROM Students s 
JOIN Enrollments e ON s.StudentID = e.StudentID 
JOIN Courses c ON e.CourseID = c.CourseID 
WHERE e.Grade > 90; 

-- 5. Show top scorer per course 
SELECT c.CourseName, s.Name, e.Grade 
FROM Enrollments e 
JOIN Students s ON e.StudentID = s.StudentID 
JOIN Courses c ON e.CourseID = c.CourseID 
WHERE (e.CourseID, e.Grade) IN ( 
SELECT CourseID, MAX(Grade) 
FROM Enrollments 
GROUP BY CourseID 
);

-- 6. Create grade band (A/B/C) using CASE 
SELECT s.Name, c.CourseName, e.Grade, 
CASE 
WHEN e.Grade >= 90 THEN 'A' 
WHEN e.Grade >= 75 THEN 'B' 
WHEN e.Grade >= 60 THEN 'C' 
ELSE 'D' 
END AS GradeBand 
FROM Enrollments e 
JOIN Students s ON e.StudentID = s.StudentID 
JOIN Courses c ON e.CourseID = c.CourseID; 

-- 7. Find students enrolled in more than one course 
SELECT s.Name, COUNT(e.CourseID) AS CoursesEnrolled 
FROM Students s 
JOIN Enrollments e ON s.StudentID = e.StudentID 
GROUP BY s.Name 
HAVING COUNT(e.CourseID) > 1; 

-- 8. Average grade of each student across all courses 
SELECT s.Name, AVG(e.Grade) AS AvgStudentGrade 
FROM Students s 
JOIN Enrollments e ON s.StudentID = e.StudentID 
GROUP BY s.Name; 

-- 9. Students with average grade above overall average 
SELECT s.Name, AVG(e.Grade) AS AvgStudentGrade 
FROM Students s 
JOIN Enrollments e ON s.StudentID = e.StudentID 
GROUP BY s.Name 
HAVING AVG(e.Grade) > ( 
SELECT AVG(Grade) FROM Enrollments 
); 

-- 10. Total number of male and female students 
SELECT Gender, COUNT(*) AS Total 
FROM Students 
GROUP BY Gender; 