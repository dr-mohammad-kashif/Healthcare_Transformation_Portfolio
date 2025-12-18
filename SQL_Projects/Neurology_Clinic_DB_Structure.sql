-- 1) PATIENTS TABLE

CREATE TABLE Patients (
    patient_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    age INTEGER,
    gender TEXT
);

-- 2) VISITS TABLE

CREATE TABLE Visits (
    visit_id INTEGER PRIMARY KEY,
    patient_id INTEGER,
    visit_date DATE,
    reason TEXT,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

-- 3) DIAGNOSIS TABLE

CREATE TABLE Diagnosis (
    diagnosis_id INTEGER PRIMARY KEY,
    visit_id INTEGER,
    diagnosis TEXT,
    FOREIGN KEY (visit_id) REFERENCES Visits(visit_id)
);

--  PATIENTS

INSERT INTO Patients (patient_id, name, age, gender) VALUES
(1, 'Ali Khan', 28, 'M'),
(2, 'Sara Ahmed', 35, 'F'),
(3, 'Mohammad Iqbal', 52, 'M'),
(4, 'Fatima Noor', 44, 'F'),
(5, 'Rashid Hussain', 63, 'M'),
(6, 'Ayesha Siddiqui', 31, 'F'),
(7, 'Imran Malik', 47, 'M'),
(8, 'Zara Ali', 22, 'F'),
(9, 'Omar Farooq', 56, 'M'),
(10, 'Hiba Yusuf', 39, 'F');


--   VISITS

INSERT INTO Visits (visit_id, patient_id, visit_date, reason) VALUES
(1, 1, '2025-11-01', 'Headache Evaluation'),
(2, 2, '2025-11-02', 'Headache Evaluation'),
(3, 3, '2025-11-02', 'Seizure Review'),
(4, 4, '2025-11-03', 'Headache Evaluation'),
(5, 5, '2025-11-03', 'Stroke Follow-up'),
(6, 6, '2025-11-04', 'Dizziness'),
(7, 7, '2025-11-04', 'Chronic Headache'),
(8, 8, '2025-11-05', 'Headache Evaluation'),
(9, 9, '2025-11-05', 'Seizure Review'),
(10, 10, '2025-11-06', 'Neuropathy Assessment');

-- SAMPLE DATA – DIAGNOSIS

INSERT INTO Diagnosis (diagnosis_id, visit_id, diagnosis) VALUES
(1, 1, 'Migraine'),
(2, 2, 'Tension Headache'),
(3, 3, 'Epilepsy'),
(4, 4, 'Migraine'),
(5, 5, 'Stroke – Follow Up'),
(6, 6, 'Dizziness – Vestibular'),
(7, 7, 'Chronic Headache'),
(8, 8, 'Migraine'),
(9, 9, 'Seizure Disorder'),
(10, 10, 'Peripheral Neuropathy');

--        ANALYTICS QUERIES

-- TOTAL NUMBER OF MIGRAINE CASES
SELECT COUNT(*) AS migraine_cases
FROM Diagnosis
WHERE diagnosis = 'Migraine';

-- ALL VISITS WITH PATIENT DETAILS
SELECT 
    P.name,
    P.age,
    V.visit_date,
    D.diagnosis
FROM Patients P
JOIN Visits V ON P.patient_id = V.patient_id
JOIN Diagnosis D ON V.visit_id = D.visit_id;

-- AVERAGE AGE OF MIGRAINE PATIENTS
SELECT AVG(P.age) AS avg_age_migraine
FROM Patients P
JOIN Visits V ON P.patient_id = P.patient_id
JOIN Diagnosis D ON V.visit_id = D.visit_id
WHERE D.diagnosis = 'Migraine';

-- COUNT OF PATIENTS AGED > 50
SELECT * 
FROM Patients
WHERE age > 50;
