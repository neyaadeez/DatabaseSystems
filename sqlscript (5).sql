REM   Script: HW2_MustafaMokashi_Q4
REM   answer for the q4

CREATE TABLE Room ( 
    RoomNumber INT PRIMARY KEY 
);

CREATE TABLE Appointment ( 
    AppointmentID INT PRIMARY KEY, 
    PatientID INT NOT NULL, 
    StaffID INT NOT NULL, 
    RoomNumber INT NOT NULL, 
    ADate DATE, 
    ATime TIMESTAMP, 
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID), 
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID), 
    FOREIGN KEY (RoomNumber) REFERENCES Room(RoomNumber) 
);

INSERT INTO Room (RoomNumber) VALUES (1);

INSERT INTO Room (RoomNumber) VALUES (2);

INSERT INTO Room (RoomNumber) VALUES (3);

INSERT INTO Room (RoomNumber) VALUES (4);

INSERT INTO Room (RoomNumber) VALUES (5);

INSERT INTO Room (RoomNumber) VALUES (6);

INSERT INTO Room (RoomNumber) VALUES (7);

INSERT INTO Room (RoomNumber) VALUES (8);

INSERT INTO Appointment (AppointmentID, PatientID, StaffID, RoomNumber, ADate, ATime) 
VALUES (1, 1, 1, 1, DATE '2025-01-01', TIMESTAMP '2025-01-01 08:00:00');

INSERT INTO Appointment (AppointmentID, PatientID, StaffID, RoomNumber, ADate, ATime) 
VALUES (2, 2, 2, 2, DATE '2025-01-02', TIMESTAMP '2025-01-02 09:00:00');

INSERT INTO Appointment (AppointmentID, PatientID, StaffID, RoomNumber, ADate, ATime) 
VALUES (3, 3, 3, 3, DATE '2025-01-03', TIMESTAMP '2025-01-03 10:00:00');

INSERT INTO Appointment (AppointmentID, PatientID, StaffID, RoomNumber, ADate, ATime) 
VALUES (4, 4, 4, 4, DATE '2025-01-04', TIMESTAMP '2025-01-04 11:00:00');

INSERT INTO Appointment (AppointmentID, PatientID, StaffID, RoomNumber, ADate, ATime) 
VALUES (5, 5, 5, 5, DATE '2025-01-05', TIMESTAMP '2025-01-05 12:00:00');

INSERT INTO Appointment (AppointmentID, PatientID, StaffID, RoomNumber, ADate, ATime) 
VALUES (6, 1, 1, 1, DATE '2025-01-10', TIMESTAMP '2025-01-10 08:00:00');

INSERT INTO Appointment (AppointmentID, PatientID, StaffID, RoomNumber, ADate, ATime) 
VALUES (7, 2, 2, 2, DATE '2025-01-10', TIMESTAMP '2025-01-10 09:00:00');

INSERT INTO Appointment (AppointmentID, PatientID, StaffID, RoomNumber, ADate, ATime) 
VALUES (8, 3, 3, 3, DATE '2025-01-10', TIMESTAMP '2025-01-10 10:00:00');

INSERT INTO Appointment (AppointmentID, PatientID, StaffID, RoomNumber, ADate, ATime) 
VALUES (9, 4, 4, 4, DATE '2025-01-10', TIMESTAMP '2025-01-10 11:00:00');

INSERT INTO Appointment (AppointmentID, PatientID, StaffID, RoomNumber, ADate, ATime) 
VALUES (10, 5, 5, 5, DATE '2025-01-10', TIMESTAMP '2025-01-10 12:00:00');

SELECT  
    p.Name AS PatientName, 
    s.Name AS StaffName, 
    s.Role AS StaffRole, 
    a.ADate AS AppointmentDate, 
    a.ATime AS AppointmentTime 
FROM  
    Appointment a 
JOIN  
    Patient p ON a.PatientID = p.PatientID 
JOIN  
    Staff s ON a.StaffID = s.StaffID 
WHERE  
    a.ADate = DATE '2025-01-01';

SELECT  
    p.Name AS PatientName, 
    s.Name AS StaffName, 
    s.Role AS StaffRole, 
    a.ADate AS AppointmentDate, 
    a.ATime AS AppointmentTime 
FROM  
    Appointment a 
JOIN  
    Patient p ON a.PatientID = p.PatientID 
JOIN  
    Staff s ON a.StaffID = s.StaffID 
WHERE  
    a.ADate = DATE '2025-01-10';

