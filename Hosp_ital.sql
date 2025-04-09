CREATE DATABASE HOSPITAL;
USE HOSPITAL;

CREATE TABLE Department (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(50),
    Location VARCHAR(100)
);

CREATE TABLE Doctor (
    Doctor_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Specialization VARCHAR(50),
    Phone VARCHAR(15),
    Dept_ID INT,
    FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID)
);

CREATE TABLE Patient (
    Patient_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Gender CHAR(1),
    Contact VARCHAR(15),
    Address VARCHAR(100)
);

CREATE TABLE Appointment (
    Appointment_ID INT PRIMARY KEY,
    Patient_ID INT,
    Doctor_ID INT,
    Date DATE,
    Time TIME,
    Status VARCHAR(20),
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES Doctor(Doctor_ID)
);

CREATE TABLE Treatment (
    Treatment_ID INT PRIMARY KEY,
    Patient_ID INT,
    Diagnosis TEXT,
    Treatment_Details TEXT,
    Date DATE,
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID)
);

CREATE TABLE Bill (
    Bill_ID INT PRIMARY KEY,
    Patient_ID INT,
    Amount DECIMAL(10,2),
    Payment_Date DATE,
    Payment_Method VARCHAR(30),
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID)
);

INSERT INTO Department VALUES 
(1, 'Cardiology', 'Block A'),
(2, 'Neurology', 'Block B'),
(3, 'Orthopedics', 'Block C'),
(4, 'Pediatrics', 'Block D'),
(5, 'Dermatology', 'Block E'),
(6, 'ENT', 'Block F'),
(7, 'Oncology', 'Block G'),
(8, 'Gynecology', 'Block H'),
(9, 'Psychiatry', 'Block I'),
(10, 'Urology', 'Block J');

INSERT INTO Doctor VALUES 
(101, 'Dr. Sharma', 'Cardiologist', '9876543210', 1),
(102, 'Dr. Mehta', 'Neurologist', '9876543211', 2),
(103, 'Dr. Roy', 'Orthopedic', '9876543212', 3),
(104, 'Dr. Verma', 'Pediatrician', '9876543213', 4),
(105, 'Dr. Iyer', 'Dermatologist', '9876543214', 5),
(106, 'Dr. Das', 'ENT Specialist', '9876543215', 6),
(107, 'Dr. Gupta', 'Oncologist', '9876543216', 7),
(108, 'Dr. Reddy', 'Gynecologist', '9876543217', 8),
(109, 'Dr. Joshi', 'Psychiatrist', '9876543218', 9),
(110, 'Dr. Khan', 'Urologist', '9876543219', 10);

INSERT INTO Patient VALUES 
(201, 'Alice', 30, 'F', '9998887771', 'Area 1'),
(202, 'Bob', 45, 'M', '9998887772', 'Area 2'),
(203, 'Charlie', 22, 'M', '9998887773', 'Area 3'),
(204, 'Daisy', 28, 'F', '9998887774', 'Area 4'),
(205, 'Ethan', 35, 'M', '9998887775', 'Area 5'),
(206, 'Fiona', 50, 'F', '9998887776', 'Area 6'),
(207, 'George', 60, 'M', '9998887777', 'Area 7'),
(208, 'Hannah', 40, 'F', '9998887778', 'Area 8'),
(209, 'Ian', 32, 'M', '9998887779', 'Area 9'),
(210, 'Jane', 55, 'F', '9998887780', 'Area 10');

INSERT INTO Appointment VALUES 
(301, 201, 101, '2025-04-01', '10:00:00', 'Completed'),
(302, 202, 102, '2025-04-02', '11:00:00', 'Scheduled'),
(303, 203, 103, '2025-04-03', '09:30:00', 'Completed'),
(304, 204, 104, '2025-04-04', '14:00:00', 'Cancelled'),
(305, 205, 105, '2025-04-05', '15:30:00', 'Completed'),
(306, 206, 106, '2025-04-06', '12:00:00', 'Scheduled'),
(307, 207, 107, '2025-04-07', '13:00:00', 'Completed'),
(308, 208, 108, '2025-04-08', '16:00:00', 'Completed'),
(309, 209, 109, '2025-04-09', '10:30:00', 'Scheduled'),
(310, 210, 110, '2025-04-10', '11:30:00', 'Completed');

INSERT INTO Treatment VALUES 
(401, 201, 'Hypertension', 'Prescribed medication', '2025-04-01'),
(402, 202, 'Migraine', 'Scans and medication', '2025-04-02'),
(403, 203, 'Fracture', 'Surgery and physiotherapy', '2025-04-03'),
(404, 204, 'Cold and Fever', 'Basic medicine', '2025-04-04'),
(405, 205, 'Skin Allergy', 'Cream and pills', '2025-04-05'),
(406, 206, 'Ear Infection', 'Antibiotics', '2025-04-06'),
(407, 207, 'Lung Cancer', 'Chemotherapy', '2025-04-07'),
(408, 208, 'Pregnancy Checkup', 'Ultrasound done', '2025-04-08'),
(409, 209, 'Depression', 'Counseling', '2025-04-09'),
(410, 210, 'Kidney Stones', 'Laser Surgery', '2025-04-10');

INSERT INTO Bill VALUES 
(501, 201, 1500.00, '2025-04-01', 'Cash'),
(502, 202, 2000.00, '2025-04-02', 'Card'),
(503, 203, 10000.00, '2025-04-03', 'Online'),
(504, 204, 500.00, '2025-04-04', 'Cash'),
(505, 205, 1200.00, '2025-04-05', 'Card'),
(506, 206, 800.00, '2025-04-06', 'Online'),
(507, 207, 30000.00, '2025-04-07', 'Insurance'),
(508, 208, 1000.00, '2025-04-08', 'Card'),
(509, 209, 1800.00, '2025-04-09', 'Cash'),
(510, 210, 15000.00, '2025-04-10', 'Online');

SELECT * FROM Patient;

SELECT A.Appointment_ID, P.Name AS Patient, D.Name AS Doctor, A.Date, A.Time, A.Status
FROM Appointment A
JOIN Patient P ON A.Patient_ID = P.Patient_ID
JOIN Doctor D ON A.Doctor_ID = D.Doctor_ID;

SELECT Dept_Name, COUNT(A.Patient_ID) AS Total_Patients
FROM Appointment A
JOIN Doctor D ON A.Doctor_ID = D.Doctor_ID
JOIN Department DP ON D.Dept_ID = DP.Dept_ID
GROUP BY Dept_Name;

SELECT * FROM Treatment WHERE Patient_ID = 201;

UPDATE Patient SET Contact = '8887776666' WHERE Patient_ID = 202;

DELETE FROM Appointment WHERE Appointment_ID = 304;

SELECT Patient_ID, SUM(Amount) AS Total_Amount
FROM Bill
GROUP BY Patient_ID;

SELECT D.Name, D.Specialization, DP.Dept_Name
FROM Doctor D
JOIN Department DP ON D.Dept_ID = DP.Dept_ID;

SELECT * FROM Appointment WHERE Status = 'Completed';

SELECT * FROM Bill WHERE Amount > 5000;



drop database if exists HOSPITAL;
 
 

 