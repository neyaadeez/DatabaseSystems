REM   Script: HW2_MustafaMokashi_Q3
REM   answer for q3

CREATE TABLE Staff ( 
    StaffID INT PRIMARY KEY, 
    Name VARCHAR(255), 
    Role VARCHAR(255), 
    LicenseID INT NULL, 
    Salary DECIMAL(10, 2) 
);

CREATE TABLE FrontDeskWorkers ( 
    WorkerID INT PRIMARY KEY, 
    Name VARCHAR(255), 
    Salary DECIMAL(10, 2) 
);

INSERT INTO Staff (StaffID, Name, Role, Salary) 
VALUES (1, 'Michael Johnson', 'Surgeon', 80000.00);

INSERT INTO Staff (StaffID, Name, Role, Salary) 
VALUES (2, 'Jane Smith', 'Nurse', 40000.00);

INSERT INTO Staff (StaffID, Name, Role, Salary) 
VALUES (3, 'John Doe', 'hygienist', 90000.00);

INSERT INTO Staff (StaffID, Name, Role, Salary) 
VALUES (4, 'Amanda Walker', 'doctor1', 20000.00);

INSERT INTO Staff (StaffID, Name, Role, Salary) 
VALUES (5, 'Elizabeth King', 'physician', 90000.00);

INSERT INTO FrontDeskWorkers (WorkerID, Name, Salary) 
VALUES (1001, 'Emily Brown', 35000.00);

INSERT INTO FrontDeskWorkers (WorkerID, Name, Salary) 
VALUES (1002, 'David Wilson', 25000.00);

INSERT INTO FrontDeskWorkers (WorkerID, Name, Salary) 
VALUES (1003, 'Jennifer Wilson', 45000.00);

INSERT INTO FrontDeskWorkers (WorkerID, Name, Salary) 
VALUES (1004, 'Charles Adams', 55000.00);

INSERT INTO FrontDeskWorkers (WorkerID, Name, Salary) 
VALUES (1005, 'Christopher Lee', 65000.00);

CREATE TABLE Capabilities ( 
  EmployeeID INT, 
  Skill VARCHAR(255), 
  EmployeeType VARCHAR(255) CHECK (EmployeeType IN ('Staff', 'FrontDesk')) 
);

CREATE OR REPLACE TRIGGER trg_check_staff_fk 
BEFORE INSERT ON Capabilities 
FOR EACH ROW 
DECLARE 
    v_exists NUMBER; 
BEGIN 
    IF :NEW.EmployeeType = 'Staff' THEN 
        SELECT COUNT(*) INTO v_exists FROM Staff WHERE StaffID = :NEW.EmployeeID; 
        IF v_exists = 0 THEN 
            RAISE_APPLICATION_ERROR(-20001, 'EmployeeID does not exist in Staff table.'); 
        END IF; 
    END IF; 
END; 
/

CREATE OR REPLACE TRIGGER trg_check_frontdesk_fk 
BEFORE INSERT ON Capabilities 
FOR EACH ROW 
DECLARE 
    v_exists NUMBER; 
BEGIN 
    IF :NEW.EmployeeType = 'FrontDesk' THEN 
        SELECT COUNT(*) INTO v_exists FROM FrontDeskWorkers WHERE WorkerID = :NEW.EmployeeID; 
        IF v_exists = 0 THEN 
            RAISE_APPLICATION_ERROR(-20001, 'EmployeeID does not exist in FrontDeskWorkers table.'); 
        END IF; 
    END IF; 
END; 
/

INSERT INTO Capabilities (EmployeeID, Skill, EmployeeType)  
VALUES (1, 'File taxes', 'Staff');

INSERT INTO Capabilities (EmployeeID, Skill, EmployeeType)  
VALUES (1, 'Meet the press', 'Staff');

INSERT INTO Capabilities (EmployeeID, Skill, EmployeeType)  
VALUES (1, 'Organize spring cleaning', 'Staff');

INSERT INTO Capabilities (EmployeeID, Skill, EmployeeType)  
VALUES (1, 'Do teeth cleaning', 'Staff');

INSERT INTO Capabilities (EmployeeID, Skill, EmployeeType)  
VALUES (1, 'Reorder inventory', 'Staff');

INSERT INTO Capabilities (EmployeeID, Skill, EmployeeType)  
VALUES (2, 'Reorder inventory', 'Staff');

INSERT INTO Capabilities (EmployeeID, Skill, EmployeeType)  
VALUES (2, 'Reorder inventory', 'Staff');

INSERT INTO Capabilities (EmployeeID, Skill, EmployeeType)  
VALUES (3, 'Do teeth cleaning', 'Staff');

INSERT INTO Capabilities (EmployeeID, Skill, EmployeeType)  
VALUES (3, 'Do teeth cleaning', 'Staff');

INSERT INTO Capabilities (EmployeeID, Skill, EmployeeType)  
VALUES (4, 'Organize spring cleaning', 'Staff');

INSERT INTO Capabilities (EmployeeID, Skill, EmployeeType)  
VALUES (5, 'Meet the press', 'Staff');

INSERT INTO Capabilities (EmployeeID, Skill, EmployeeType)  
VALUES (5, 'Meet the press', 'Staff');

INSERT INTO Capabilities (EmployeeID, Skill, EmployeeType)  
VALUES (5, 'Meet the press', 'Staff');

INSERT INTO Capabilities (EmployeeID, Skill, EmployeeType)  
VALUES (5, 'Meet the press', 'Staff');

INSERT INTO Capabilities (EmployeeID, Skill, EmployeeType)  
VALUES (5, 'Meet the press', 'Staff');

INSERT INTO Capabilities (EmployeeID, Skill, EmployeeType)  
VALUES (1001, 'Meet the press', 'FrontDesk');

CREATE TABLE Staff ( 
    StaffID INT PRIMARY KEY, 
    Name VARCHAR(255), 
    Role VARCHAR(255), 
    LicenseID INT NULL, 
    Salary DECIMAL(10, 2) 
);

CREATE TABLE FrontDeskWorkers ( 
    WorkerID INT PRIMARY KEY, 
    Name VARCHAR(255), 
    Salary DECIMAL(10, 2) 
);

INSERT INTO Staff (StaffID, Name, Role, Salary) 
VALUES (1, 'Michael Johnson', 'Surgeon', 80000.00);

INSERT INTO Staff (StaffID, Name, Role, Salary) 
VALUES (2, 'Jane Smith', 'Nurse', 40000.00);

INSERT INTO Staff (StaffID, Name, Role, Salary) 
VALUES (3, 'John Doe', 'hygienist', 90000.00);

INSERT INTO Staff (StaffID, Name, Role, Salary) 
VALUES (4, 'Amanda Walker', 'doctor1', 20000.00);

INSERT INTO Staff (StaffID, Name, Role, Salary) 
VALUES (5, 'Elizabeth King', 'physician', 90000.00);

INSERT INTO FrontDeskWorkers (WorkerID, Name, Salary)  
VALUES (1001, 'Emily Brown', 35000.00);

INSERT INTO FrontDeskWorkers (WorkerID, Name, Salary)  
VALUES (1002, 'David Wilson', 25000.00);

INSERT INTO FrontDeskWorkers (WorkerID, Name, Salary)  
VALUES (1003, 'Jennifer Wilson', 45000.00);

INSERT INTO FrontDeskWorkers (WorkerID, Name, Salary)  
VALUES (1004, 'Charles Adams', 55000.00);

INSERT INTO FrontDeskWorkers (WorkerID, Name, Salary)  
VALUES (1005, 'Christopher Lee', 65000.00);

CREATE TABLE Capabilities ( 
  EmployeeID INT, 
  Skill VARCHAR(255), 
  EmployeeType VARCHAR(255) CHECK (EmployeeType IN ('Staff', 'FrontDesk')) 
);

CREATE OR REPLACE TRIGGER trg_check_staff_fk 
BEFORE INSERT ON Capabilities 
FOR EACH ROW 
DECLARE 
    v_exists NUMBER; 
BEGIN 
    IF :NEW.EmployeeType = 'Staff' THEN 
        SELECT COUNT(*) INTO v_exists FROM Staff WHERE StaffID = :NEW.EmployeeID; 
        IF v_exists = 0 THEN 
            RAISE_APPLICATION_ERROR(-20001, 'EmployeeID does not exist in Staff table.'); 
        END IF; 
    END IF; 
END; 
/

CREATE OR REPLACE TRIGGER trg_check_frontdesk_fk 
BEFORE INSERT ON Capabilities 
FOR EACH ROW 
DECLARE 
    v_exists NUMBER; 
BEGIN 
    IF :NEW.EmployeeType = 'FrontDesk' THEN 
        SELECT COUNT(*) INTO v_exists FROM FrontDeskWorkers WHERE WorkerID = :NEW.EmployeeID; 
        IF v_exists = 0 THEN 
            RAISE_APPLICATION_ERROR(-20001, 'EmployeeID does not exist in FrontDeskWorkers table.'); 
        END IF; 
    END IF; 
END; 
/

INSERT INTO Capabilities (EmployeeID, Skill, EmployeeType)  
VALUES (1, 'File taxes', 'Staff');

INSERT INTO Capabilities (EmployeeID, Skill, EmployeeType)  
VALUES (1, 'Meet the press', 'Staff');

INSERT INTO Capabilities (EmployeeID, Skill, EmployeeType)  
VALUES (1, 'Organize spring cleaning', 'Staff');

INSERT INTO Capabilities (EmployeeID, Skill, EmployeeType)  
VALUES (1, 'Do teeth cleaning', 'Staff');

INSERT INTO Capabilities (EmployeeID, Skill, EmployeeType)  
VALUES (1, 'Reorder inventory', 'Staff');

INSERT INTO Capabilities (EmployeeID, Skill, EmployeeType)  
VALUES (2, 'Reorder inventory', 'Staff');

INSERT INTO Capabilities (EmployeeID, Skill, EmployeeType)  
VALUES (2, 'Reorder inventory', 'Staff');

INSERT INTO Capabilities (EmployeeID, Skill, EmployeeType)  
VALUES (3, 'Do teeth cleaning', 'Staff');

INSERT INTO Capabilities (EmployeeID, Skill, EmployeeType)  
VALUES (3, 'Do teeth cleaning', 'Staff');

INSERT INTO Capabilities (EmployeeID, Skill, EmployeeType)  
VALUES (4, 'Organize spring cleaning', 'Staff');

INSERT INTO Capabilities (EmployeeID, Skill, EmployeeType)  
VALUES (5, 'Meet the press', 'Staff');

INSERT INTO Capabilities (EmployeeID, Skill, EmployeeType)  
VALUES (5, 'Meet the press', 'Staff');

INSERT INTO Capabilities (EmployeeID, Skill, EmployeeType)  
VALUES (5, 'Meet the press', 'Staff');

INSERT INTO Capabilities (EmployeeID, Skill, EmployeeType)  
VALUES (5, 'Meet the press', 'Staff');

INSERT INTO Capabilities (EmployeeID, Skill, EmployeeType)  
VALUES (5, 'Meet the press', 'Staff');

INSERT INTO Capabilities (EmployeeID, Skill, EmployeeType)  
VALUES (1001, 'Meet the press', 'FrontDesk');

INSERT INTO Capabilities (EmployeeID, Skill, EmployeeType) VALUES (5, 'File taxes', 'Staff');

INSERT INTO Capabilities (EmployeeID, Skill, EmployeeType) VALUES (1004, 'File taxes', 'FrontDesk');

INSERT INTO Capabilities (EmployeeID, Skill, EmployeeType) VALUES (5, 'Meet the press', 'Staff');

INSERT INTO Capabilities (EmployeeID, Skill, EmployeeType) VALUES (1004, 'Meet the press', 'FrontDesk');

INSERT INTO Capabilities (EmployeeID, Skill, EmployeeType) VALUES (5, 'Organize spring cleaning', 'Staff');

INSERT INTO Capabilities (EmployeeID, Skill, EmployeeType) VALUES (1004, 'Organize spring cleaning', 'FrontDesk');

INSERT INTO Capabilities (EmployeeID, Skill, EmployeeType) VALUES (5, 'Do teeth cleaning', 'Staff');

INSERT INTO Capabilities (EmployeeID, Skill, EmployeeType) VALUES (1004, 'Do teeth cleaning', 'FrontDesk');

INSERT INTO Capabilities (EmployeeID, Skill, EmployeeType) VALUES (5, 'Reorder inventory', 'Staff');

INSERT INTO Capabilities (EmployeeID, Skill, EmployeeType) VALUES (1004, 'Reorder inventory', 'FrontDesk');

WITH emp_skills AS ( 
    SELECT c.EmployeeID, COUNT(DISTINCT c.Skill) AS NumSkills 
    FROM Capabilities c 
    WHERE c.Skill IN ('File taxes', 'Meet the press', 'Organize spring cleaning', 'Do teeth cleaning', 'Reorder inventory') 
    GROUP BY c.EmployeeID 
), 
all_skills AS ( 
    SELECT COUNT(DISTINCT Skill) AS TotalSkills 
    FROM Capabilities 
    WHERE Skill IN ('File taxes', 'Meet the press', 'Organize spring cleaning', 'Do teeth cleaning', 'Reorder inventory') 
) 
SELECT e.EmployeeID, e.EmployeeName, e.EmployeeType 
FROM emp_skills 
JOIN all_skills ON emp_skills.NumSkills = all_skills.TotalSkills 
JOIN ( 
    SELECT StaffID AS EmployeeID, Name AS EmployeeName, 'Staff' AS EmployeeType 
    FROM Staff 
    UNION ALL 
    SELECT WorkerID AS EmployeeID, Name AS EmployeeName, 'FrontDesk' AS EmployeeType 
    FROM FrontDeskWorkers 
) e ON emp_skills.EmployeeID = e.EmployeeID


