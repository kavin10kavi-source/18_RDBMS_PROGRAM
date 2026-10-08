CREATE DATABASE CollegeDB;
USE CollegeDB;

SET SERVEROUTPUT ON;

CREATE TABLE Student (
    Student_ID NUMBER PRIMARY KEY,
    Student_Name VARCHAR2(50),
    Department VARCHAR2(50),
    Marks NUMBER
);

INSERT INTO Student VALUES (101, 'Kavi', 'Computer Science', 85);
INSERT INTO Student VALUES (102, 'Arun', 'Computer Science', 78);
INSERT INTO Student VALUES (103, 'Priya', 'Commerce', 82);
INSERT INTO Student VALUES (104, 'Ravi', 'Computer Science', 90);
INSERT INTO Student VALUES (105, 'Anu', 'Commerce', 75);

COMMIT;

CREATE OR REPLACE FUNCTION count_students (
    p_department IN VARCHAR2
)
RETURN NUMBER
IS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM Student
    WHERE Department = p_department;

    RETURN v_count;
END;
/

DECLARE
    v_result NUMBER;
BEGIN
    v_result := count_students('Computer Science');

    DBMS_OUTPUT.PUT_LINE(
        'Number of students in Computer Science: ' || v_result
    );
END;
/
