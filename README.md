🎓 University Database Management System
📌 Project Overview

This project demonstrates a relational database system for managing a university.
It includes departments, students, courses, instructors, and enrollments.

The project covers:

Database design

Table relationships (Primary & Foreign Keys)

CRUD operations

Joins (INNER, LEFT)

Subqueries

Aggregate functions

Window functions

Date and string functions

CASE statements

🗄️ Database Name

University

🏗️ Database Structure
1️⃣ Departments Table
Column Name	Data Type	Description
DepartmentID	INT (PK)	Unique department ID
DepartmentName	VARCHAR(100)	Department name
2️⃣ Students Table
Column Name	Data Type	Description
StudentID	INT (PK)	Unique student ID
FirstName	VARCHAR(50)	Student first name
LastName	VARCHAR(50)	Student last name
Email	VARCHAR(100)	Student email
BirthDate	DATE	Date of birth
EnrollmentDate	DATE	Enrollment date
3️⃣ Courses Table
Column Name	Data Type	Description
CourseID	INT (PK)	Unique course ID
CourseName	VARCHAR(100)	Course name
DepartmentID	INT (FK)	References Departments
Credits	INT	Course credits
4️⃣ Instructors Table
Column Name	Data Type	Description
InstructorID	INT (PK)	Unique instructor ID
FirstName	VARCHAR(50)	First name
LastName	VARCHAR(50)	Last name
Email	VARCHAR(100)	Email
DepartmentID	INT (FK)	References Departments
Salary	DECIMAL(10,2)	Instructor salary
5️⃣ Enrollments Table
Column Name	Data Type	Description
EnrollmentID	INT (PK)	Unique enrollment ID
StudentID	INT (FK)	References Students
CourseID	INT (FK)	References Courses
EnrollmentDate	DATE	Enrollment date
🔗 Entity Relationships

One Department → Many Courses

One Department → Many Instructors

One Student → Many Enrollments

One Course → Many Enrollments

📥 Sample Data

2 Departments

3+ Students

2 Courses

2 Instructors

4 Enrollments

🔎 Queries Implemented
✅ 1. CRUD Operations

INSERT (Create)

SELECT (Read)

UPDATE

DELETE

✅ 2. Students Enrolled After 2022

Uses WHERE EnrollmentDate > '2022-01-01'

✅ 3. Courses in Specific Department

Uses WHERE DepartmentID = 2 with LIMIT

✅ 4. Count Students Per Course

Uses:

GROUP BY

COUNT()

HAVING

✅ 5. Students Enrolled in BOTH Courses

Uses self-join on Enrollments table.

✅ 6. Students Enrolled in SQL OR Data Structures

Uses IN (101,102) with DISTINCT.

✅ 7. Average Course Credits

Uses AVG() aggregate function.

✅ 8. Maximum Instructor Salary

Uses MAX().

✅ 9. Count Students Per Department

Multi-table join:

Departments

Courses

Enrollments

✅ 10. INNER JOIN

Displays students with their enrolled courses.

✅ 11. LEFT JOIN

Displays all students including those not enrolled.

✅ 12. Subquery Example

Students enrolled in courses with more than 10 students.

✅ 13. Extract Year

Uses YEAR() function.

✅ 14. Concatenate Instructor Name

Uses:

CONCAT(FirstName, ' ', LastName)
✅ 15. Running Total (Window Function)
SUM(COUNT(StudentID)) OVER (ORDER BY CourseID)
✅ 16. Student Level (CASE Statement)

Categorizes students:

Senior

Junior

Based on enrollment duration using DATE_SUB().

🧠 Concepts Covered

Relational Database Design

Primary & Foreign Keys

CRUD Operations

INNER JOIN / LEFT JOIN

Subqueries

Aggregate Functions

GROUP BY & HAVING

Window Functions

Date Functions

String Functions

CASE Statements


🎯 Project Level

Intermediate SQL Project
