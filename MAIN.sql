CREATE TABLE STUDENTS
(
    "id"                 int           NOT NULL,
    first_name           varchar(50)   NOT NULL,
    last_name            varchar(50)   NOT NULL,
    age                  int           NOT NULL,
    grade                int           NOT NULL,
    address              varchar(50)   NOT NULL,
    date_of_birth        date          NOT NULL,
    gender               varchar(50)   NOT NULL,
    city                 varchar(50)   NOT NULL,
    "state"              varchar(50)   NOT NULL,
    country              varchar(50)   NOT NULL,
    parent_first_name    varchar(50)   NOT NULL,
    parent_last_name     varchar(50)   NOT NULL,
    parent_email         varchar(50)   NOT NULL,
    parent_phone_number  varchar(50)   NOT NULL,
    highschool_grad_year interval year NOT NULL,
    CONSTRAINT PK_1 PRIMARY KEY ("id")
);


CREATE TABLE SUBJECT
(
    SubjectID    INT PRIMARY KEY,
    SubjectName  VARCHAR(255),
    InstructorID INT,
    Credits      INT,
    Department   VARCHAR(50),
    Description  TEXT
);


CREATE TABLE TEACHERS
(
    InstructorID INT PRIMARY KEY,
    FirstName    VARCHAR(50),
    LastName     VARCHAR(50),
    SubjectID    INT,
    FOREIGN KEY (SubjectID) REFERENCES SUBJECT (SubjectID)
);



CREATE TABLE ENROLLMENT
(
    EnrollmentID   INT PRIMARY KEY,
    StudentID      INT,
    SubjectID      INT,
    EnrollmentDate DATE,
    Grade          FLOAT,
    FOREIGN KEY (StudentID) REFERENCES Students (id),
    FOREIGN KEY (SubjectID) REFERENCES SUBJECT (SubjectID)
);


CREATE TABLE GRADES
(
    GradeID   INT PRIMARY KEY,
    StudentID INT,
    SubjectID INT,
    Grade     FLOAT,
    Date      DATE,
    FOREIGN KEY (StudentID) REFERENCES Students (id),
    FOREIGN KEY (SubjectID) REFERENCES SUBJECT (SubjectID)
);



create function QUERYS() returns varchar
as
$$
begin
    -- All students grades 7-12
    SELECT * FROM STUDENTS WHERE grade > 6;
    -- All grades that pass
    SELECT * FROM GRADES WHERE Grade > 60 ORDER BY Grade DESC;
    -- All Subjects that give more than one credit
    SELECT * FROM SUBJECT WHERE Credits > 1;

end
$$;
