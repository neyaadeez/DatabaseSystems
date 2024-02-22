REM   Script: HW2_MustafaMokashi_Q2
REM   Q2

CREATE TABLE Income( 
  IncomeID INT PRIMARY KEY, 
  Source VARCHAR(255) NOT NULL, 
  Amount DECIMAL(10,2) NOT NULL, 
  IncomeDate DATE NOT NULL);

CREATE TRIGGER procedure_income  
AFTER INSERT ON BillingRecord  
FOR EACH ROW  
DECLARE procedure_name VARCHAR2(255);  
BEGIN  
  -- Get procedure name from Procedure table  
  SELECT Name INTO procedure_name FROM Procedure WHERE ProcedureID = :NEW.ProcedureID;  
    
  -- Insert income record  
  INSERT INTO Income (Source, Amount, IncomeDate) VALUES (  
    'Procedure-' || procedure_name,  
    :NEW.ProcedureAmount,  
    :NEW.BillingDate  
  );  
END;
/

CREATE SEQUENCE income_id_seq 
  START WITH 1 
  INCREMENT BY 1 
  NOMAXVALUE;

CREATE OR REPLACE TRIGGER income_id_trigger 
BEFORE INSERT ON Income 
FOR EACH ROW 
BEGIN 
  SELECT income_id_seq.NEXTVAL INTO :NEW.IncomeID FROM dual; 
END; 
/

select * from procedure;

select * from BillingRecord;

INSERT INTO BillingRecord (BillingRecordID, PatientID, ProcedureID, BillingDate, ProcedureDuration, ProcedureAmount, AmountOwed, AmountPaidByInsurance, AmountPaidByPatient) 
VALUES 
(6, 1, 1, date '2021-02-10', 60, 2500.00, 2500.00, 0.00, 2500.00);

select * from income;

INSERT INTO BillingRecord (BillingRecordID, PatientID, ProcedureID, BillingDate, ProcedureDuration, ProcedureAmount, AmountOwed, AmountPaidByInsurance, AmountPaidByPatient) 
VALUES 
(7, 2, 2, date '2021-02-10', 30, 1000.00, 1000.00, 500.00, 500.00);

INSERT INTO BillingRecord (BillingRecordID, PatientID, ProcedureID, BillingDate, ProcedureDuration, ProcedureAmount, AmountOwed, AmountPaidByInsurance, AmountPaidByPatient) 
VALUES 
(8, 3, 3, date '2021-02-10', 45, 150.00, 150.00, 0.00, 150.00);

INSERT INTO BillingRecord (BillingRecordID, PatientID, ProcedureID, BillingDate, ProcedureDuration, ProcedureAmount, AmountOwed, AmountPaidByInsurance, AmountPaidByPatient) 
VALUES 
(9, 4, 4, date '2021-02-15', 15, 200.00, 200.00, 150.00, 50.00);

INSERT INTO BillingRecord (BillingRecordID, PatientID, ProcedureID, BillingDate, ProcedureDuration, ProcedureAmount, AmountOwed, AmountPaidByInsurance, AmountPaidByPatient) 
VALUES 
(10, 5, 5, date '2021-02-15', 10, 100.00, 100.00, 0.00, 100.00);

select * from BillingRecord;

select * from income;

INSERT INTO BillingRecord (BillingRecordID, PatientID, ProcedureID, BillingDate, ProcedureDuration, ProcedureAmount, AmountOwed, AmountPaidByInsurance, AmountPaidByPatient)  
VALUES  
(13, 2, 5, date '2021-02-15', 10, 100.00, 100.00, 0.00, 100.00);

INSERT INTO BillingRecord (BillingRecordID, PatientID, ProcedureID, BillingDate, ProcedureDuration, ProcedureAmount, AmountOwed, AmountPaidByInsurance, AmountPaidByPatient)  
VALUES  
(11, 4, 5, date '2021-02-15', 10, 100.00, 100.00, 0.00, 100.00);

INSERT INTO BillingRecord (BillingRecordID, PatientID, ProcedureID, BillingDate, ProcedureDuration, ProcedureAmount, AmountOwed, AmountPaidByInsurance, AmountPaidByPatient)  
VALUES  
(12, 3, 5, date '2021-02-15', 10, 100.00, 100.00, 0.00, 100.00);

INSERT INTO BillingRecord (BillingRecordID, PatientID, ProcedureID, BillingDate, ProcedureDuration, ProcedureAmount, AmountOwed, AmountPaidByInsurance, AmountPaidByPatient)  
VALUES  
(14, 1, 5, date '2021-02-15', 10, 100.00, 100.00, 0.00, 100.00);

select * from income;

SELECT 
  SUM(Amount) AS TotalProcedureIncome 
FROM Income 
WHERE Source LIKE 'Procedure%' AND IncomeDate = Date '2021-02-10';

SELECT  
  SUM(Amount) AS TotalProcedureIncome  
FROM Income  
WHERE Source LIKE 'Procedure%' AND IncomeDate = Date '2021-02-15';

