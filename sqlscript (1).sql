REM   Script: HW2-MustafaMokashi_Q1
REM   Answer to the Question 1 of HW2

CREATE TABLE Patient (  
  PatientID INT PRIMARY KEY,  
  Name VARCHAR(255) NOT NULL,  
  Address VARCHAR(255),  
  Phone VARCHAR(20),  
  InsuranceInformation VARCHAR(255),  
  MedicalRecord VARCHAR(255),  
  SchedulingStatus VARCHAR(50) DEFAULT 'Active'  
);

CREATE TABLE Procedure ( 
  ProcedureID INT PRIMARY KEY, 
  Name VARCHAR(255) NOT NULL, 
  Description VARCHAR(255) NULL 
);

CREATE TABLE BillingRecord ( 
  BillingRecordID INT PRIMARY KEY, 
  PatientID INT NOT NULL, 
  ProcedureID INT NOT NULL, 
  TreatmentID INT NULL, 
  SurgeryID INT NULL, 
  ProcedureDuration INT NOT NULL, 
  ProcedureAmount FLOAT NOT NULL, 
  AmountOwed FLOAT NOT NULL, 
  AmountPaidByInsurance FLOAT DEFAULT 0, 
  AmountPaidByPatient FLOAT DEFAULT 0, 
  BillingDate DATE NOT NULL, 
  FOREIGN KEY (PatientID) REFERENCES Patient(PatientID), 
  FOREIGN KEY (ProcedureID) REFERENCES Procedure(ProcedureID) 
);

INSERT INTO Patient (PatientID, Name, Address, Phone, SchedulingStatus) VALUES 
(1, 'John Doe', '123 Main Street, Anytown, CA 90210', '(555) 555-1234', 'Active');

INSERT INTO Patient (PatientID, Name, Address, Phone, SchedulingStatus) VALUES 
(2, 'Jane Smith', '456 Elm Street, Anytown, CA 90210', '(555) 555-5678', 'Active');

INSERT INTO Patient (PatientID, Name, Address, Phone, SchedulingStatus) VALUES 
(3, 'Mike Jones', '789 Oak Street, Anytown, CA 90210', '(555) 555-9012', 'Active');

INSERT INTO Patient (PatientID, Name, Address, Phone, SchedulingStatus) VALUES 
(4, 'Mary Brown', '1011 Maple Street, Anytown, CA 90210', '(555) 555-2345', 'Active');

INSERT INTO Patient (PatientID, Name, Address, Phone, SchedulingStatus) VALUES 
(5, 'David Miller', '1213 Pine Street, Anytown, CA 90210', '(555) 555-6789', 'Active');

INSERT INTO Patient (PatientID, Name, Address, Phone, SchedulingStatus) VALUES 
(6, 'Sarah Taylor', '1415 Hickory Street, Anytown, CA 90210', '(555) 555-0123', 'Active');

INSERT INTO Patient (PatientID, Name, Address, Phone, SchedulingStatus) VALUES 
(7, 'Christopher Lee', '1617 Spruce Street, Anytown, CA 90210', '(555) 555-3456', 'Active');

INSERT INTO Patient (PatientID, Name, Address, Phone, SchedulingStatus) VALUES 
(8, 'Amanda Walker', '1819 Walnut Street, Anytown, CA 90210', '(555) 555-7890', 'Active');

INSERT INTO Patient (PatientID, Name, Address, Phone, SchedulingStatus) VALUES 
(10, 'Susan Williams', '2223 Oak Street, Anytown, CA 90210', '(555) 555-5670', 'Active');

INSERT INTO Patient (PatientID, Name, Address, Phone, SchedulingStatus) VALUES 
(9, 'James Johnson', '2021 Elm Street, Anytown, CA 90210', '(555) 555-1230', 'Active');

INSERT INTO Procedure (ProcedureID, Name, Description) VALUES 
(1, 'Appendectomy', 'Surgical removal of the appendix');

INSERT INTO Procedure (ProcedureID, Name, Description) VALUES 
(2, 'Colonoscopy', 'Diagnostic examination of the large intestine');

INSERT INTO Procedure (ProcedureID, Name, Description) VALUES 
(3, 'Physical Therapy Evaluation', 'Initial assessment of physical function');

INSERT INTO Procedure (ProcedureID, Name, Description) VALUES 
(4, 'Ultrasound', 'Imaging technique using sound waves');

INSERT INTO Procedure (ProcedureID, Name, Description) VALUES 
(5, 'X-ray', 'Imaging technique using electromagnetic radiation');

INSERT INTO BillingRecord (BillingRecordID, PatientID, ProcedureID, BillingDate, ProcedureDuration, ProcedureAmount, AmountOwed, AmountPaidByInsurance, AmountPaidByPatient) 
VALUES 
(1, 1, 1,DATE '2021-01-10', 60, 2500.00, 2500.00, 0.00, 2500.00);

INSERT INTO BillingRecord (BillingRecordID, PatientID, ProcedureID, BillingDate, ProcedureDuration, ProcedureAmount, AmountOwed, AmountPaidByInsurance, AmountPaidByPatient) 
VALUES 
(2, 2, 2,DATE '2021-01-15', 30, 1000.00, 1000.00, 500.00, 500.00);

INSERT INTO BillingRecord (BillingRecordID, PatientID, ProcedureID, BillingDate, ProcedureDuration, ProcedureAmount, AmountOwed, AmountPaidByInsurance, AmountPaidByPatient) 
VALUES 
(3, 3, 3, DATE '2021-01-20', 45, 150.00, 150.00, 0.00, 150.00);

INSERT INTO BillingRecord (BillingRecordID, PatientID, ProcedureID, BillingDate, ProcedureDuration, ProcedureAmount, AmountOwed, AmountPaidByInsurance, AmountPaidByPatient) 
VALUES 
(4, 4, 4, DATE '2021-01-25', 15, 200.00, 200.00, 150.00, 50.00);

INSERT INTO BillingRecord (BillingRecordID, PatientID, ProcedureID, BillingDate, ProcedureDuration, ProcedureAmount, AmountOwed, AmountPaidByInsurance, AmountPaidByPatient) 
VALUES 
(5, 5, 5, DATE '2021-01-30', 10, 100.00, 100.00, 0.00, 100.00);

SELECT 
  p.Name AS procedure_name, 
  AVG(br.ProcedureAmount) AS average_cost, 
  AVG(br.ProcedureDuration) AS average_duration 
FROM BillingRecord br 
INNER JOIN Procedure p ON br.ProcedureID = p.ProcedureID 
WHERE br.BillingDate >= DATE '2021-01-01' AND br.BillingDate <= DATE '2021-01-31' 
GROUP BY p.Name;

