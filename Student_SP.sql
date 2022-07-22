
-- CREATE DB
CREATE DATABASE Students;


--CLEAN DB
DROP TABLE IF EXISTS StudentData
DROP PROCEDURE IF EXISTS GetStudents
DROP PROCEDURE IF EXISTS SaveStudent
DROP PROCEDURE IF EXISTS DeleteStudent

--CREATE STUDENT TABLE
DROP TABLE IF EXISTS StudentData
GO
CREATE TABLE StudentData 
(
    StudentID  INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(255) NOT NULL,
	Surname NVARCHAR(255) NOT NULL,
	Grade NVARCHAR(10) NOT NULL,
	IsActive BIT DEFAULT 1
);

--INSERT TEST DATA
INSERT INTO StudentData (Name, Surname, Grade) VALUES ('NAMITA','CHHABRA','A')
INSERT INTO StudentData (Name, Surname, Grade) VALUES ('SUDHIR','DAVINDER','A')
INSERT INTO StudentData (Name, Surname, Grade) VALUES ('ABDUL','QAIYUM','A')
INSERT INTO StudentData (Name, Surname, Grade) VALUES ('MANISHA','CHANDGI','B')


-- SP TO GET ALL ACTIVE STUDENTS
DROP PROCEDURE IF EXISTS GetStudents
GO

CREATE PROCEDURE GetStudents
AS
BEGIN

SELECT Name,Surname, Grade,IsActive  FROM StudentData WHERE IsActive = 1 

END

 --- SP TO SAVE STUDENT
DROP PROCEDURE IF EXISTS SaveStudent
GO

CREATE PROCEDURE SaveStudent
(
   @Name  NVARCHAR(255),
   @Surname NVARCHAR(255),
   @Grade NVARCHAR(10)
)
AS
BEGIN

INSERT INTO StudentData (Name, Surname, Grade) VALUES (@Name,@Surname,@Grade)

END

 --- SP TO DELETE STUDENT (IT USE SOFT DELETE, UPDATE ACTIVE FLAG)
DROP PROCEDURE IF EXISTS DeleteStudent
GO

CREATE PROCEDURE DeleteStudent
(
    @StudentID INT
)
AS
BEGIN

UPDATE  StudentData SET IsActive =0 WHERE StudentID = @StudentID

END



SELECT * FROM StudentData