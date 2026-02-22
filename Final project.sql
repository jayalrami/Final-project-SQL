CREATE DATABASE University;
USE University;

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    BirthDate DATE,
    EnrollmentDate DATE
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    DepartmentID INT,
    Credits INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Instructors (
    InstructorID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    DepartmentID INT,
    Salary DECIMAL(10,2),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Departments VALUES
(1, 'Computer Engineer'),
(2, 'Sciences');

INSERT INTO Students VALUES
(1, 'jayal', 'gorajiya', 'jayalgorajiya@email.com', '2000-01-15', '2022-08-01'),
(2, 'raj', 'darji', 'raj90@email.com', '1999-04-15', '2021-09-01'),
(3, 'het', 'patel', 'het@email.com', '2002-03-20', '2023-07-10');

INSERT INTO Courses VALUES
(101, 'Introduction to SQL', 1, 3),
(102, 'Data Structures', 2, 4);

INSERT INTO Instructors VALUES
(1, 'Ajay', 'Patel', 'Ajay.Patel@email.com', 1, 80000),
(2, 'shivam', 'shah', 'shivam.shah@email.com', 2, 75000);

INSERT INTO Enrollments VALUES
(1, 1, 101, '2022-08-01'),
(2, 2, 102, '2021-08-01'),
(3, 1, 102, '2022-09-01'),
(4, 3, 101, '2023-07-10');

-- QUERIES SOLUTION -- 
-- 1. CRUD Operations Example -- 
-- create --
INSERT INTO Students VALUES (4, 'Vraj', 'prajapati', 'Vraj@email.com', '2002-06-10', '2024-08-01'); 
-- Read -- 
SELECT * FROM Students; 
-- Update --
UPDATE Students SET Email='Vraj789@email.com' WHERE StudentID=4; 
-- Delete --
DELETE FROM Students WHERE StudentID=4; 

-- 2. Students enrolled after 2022 --

SELECT * FROM Students
WHERE EnrollmentDate > '2022-01-01';

-- 3. Courses in Mathematics Department (Limit 5) -- 

SELECT * FROM Courses
WHERE DepartmentID = 2
LIMIT 5;

-- 4. Number of students per course (more than 5) --

SELECT CourseID, COUNT(StudentID) AS TotalStudents
FROM Enrollments
GROUP BY CourseID
HAVING COUNT(StudentID) > 5;

-- 5. Students enrolled in BOTH SQL and Data Structures -- 

SELECT s.StudentID, s.FirstName
FROM Students s
JOIN Enrollments e1 ON s.StudentID = e1.StudentID AND e1.CourseID = 101
JOIN Enrollments e2 ON s.StudentID = e2.StudentID AND e2.CourseID = 102;

-- 6. Students enrolled in SQL OR Data Structures -- 

SELECT DISTINCT s.StudentID, s.FirstName
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
WHERE e.CourseID IN (101,102);

-- 7. Average credits of all courses -- 

SELECT AVG(Credits) AS AvgCredits FROM Courses;

-- 8. Maximum salary in Computer Science Department -- 

SELECT MAX(Salary) AS MaxSalary
FROM Instructors
WHERE DepartmentID = 1;

-- 9. Count students in each department -- 

SELECT d.DepartmentName, COUNT(e.StudentID) AS TotalStudents
FROM Departments d
JOIN Courses c ON d.DepartmentID = c.DepartmentID
JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY d.DepartmentName;

-- 10. INNER JOIN Students & Courses -- 

SELECT s.FirstName, c.CourseName
FROM Students s
INNER JOIN Enrollments e ON s.StudentID = e.StudentID
INNER JOIN Courses c ON e.CourseID = c.CourseID;

-- 11. LEFT JOIN Students & Courses -- 

SELECT s.FirstName, c.CourseName
FROM Students s
LEFT JOIN Enrollments e ON s.StudentID = e.StudentID
LEFT JOIN Courses c ON e.CourseID = c.CourseID;

-- 12. Subquery: Students in courses with more than 10 students -- 

SELECT * FROM Students
WHERE StudentID IN (
    SELECT StudentID FROM Enrollments
    WHERE CourseID IN (
        SELECT CourseID FROM Enrollments
        GROUP BY CourseID
        HAVING COUNT(StudentID) > 10
    )
);

-- 13. Extract Year from EnrollmentDate -- 

SELECT StudentID, YEAR(EnrollmentDate) AS EnrollYear
FROM Students;

-- 14. Concatenate Instructor Name -- 

SELECT CONCAT(FirstName, ' ', LastName) AS FullName
FROM Instructors;

-- 15. Running Total of Students (Window Function) -- 

SELECT CourseID,
       COUNT(StudentID) AS TotalStudents,
       SUM(COUNT(StudentID)) OVER (ORDER BY CourseID) AS RunningTotal
FROM Enrollments
GROUP BY CourseID;

-- 16. Label Students Senior / Junior -- 

SELECT StudentID, FirstName,
CASE 
    WHEN EnrollmentDate <= DATE_SUB(CURDATE(), INTERVAL 4 YEAR)
    THEN 'Senior'
    ELSE 'Junior'
END AS StudentLevel
FROM Students;