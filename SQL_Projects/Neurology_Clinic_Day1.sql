CREATE TABLE Patients (
    patient_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    age INTEGER,
    gender TEXT
);

CREATE TABLE Visits (
    visit_id INTEGER PRIMARY KEY,
    patient_id INTEGER,
    visit_date DATE,
    diagnosis TEXT,
    department TEXT,
    consultation_fee INTEGER,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

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

INSERT INTO Visits (visit_id, patient_id, visit_date, diagnosis, department, consultation_fee) VALUES
(1, 1, '2025-11-01', 'Migraine', 'Neurology', 500),
(2, 2, '2025-11-02', 'Tension Headache', 'Neurology', 500),
(3, 3, '2025-11-02', 'Epilepsy', 'Neurology', 700),
(4, 4, '2025-11-03', 'Migraine', 'Neurology', 500),
(5, 5, '2025-11-03', 'Stroke Follow-up', 'Neurology', 900),
(6, 6, '2025-11-04', 'Dizziness', 'Neurology', 500),
(7, 7, '2025-11-04', 'Chronic Headache', 'Neurology', 600),
(8, 8, '2025-11-05', 'Migraine', 'Neurology', 500),
(9, 9, '2025-11-05', 'Seizure Disorder', 'Neurology', 700),
(10, 10, '2025-11-06', 'Neuropathy', 'Neurology', 650);

-- Query: Total clinic revenue
SELECT SUM(consultation_fee) AS total_revenue
FROM Visits;

-- Query: Total clinic revenue
SELECT COUNT(*) AS migraine_cases
FROM Visits
WHERE diagnosis = 'Migraine';

SELECT AVG(consultation_fee) AS avg_fee
FROM Visits;

SELECT *
FROM Patients
WHERE age > 50;

SELECT 
    P.name,
    P.age,
    V.visit_date,
    V.diagnosis,
    V.consultation_fee
FROM Patients P
JOIN Visits V
ON P.patient_id = V.patient_id;

-- Query: Average age of migraine patients
SELECT AVG(P.age) AS avg_age_migraine
FROM Patients P
JOIN Visits V
ON P.patient_id = V.patient_id
WHERE V.diagnosis = 'Migraine';
