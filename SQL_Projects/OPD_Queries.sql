-- 1) TOTAL VISITS BY EACH DAY

SELECT 
    Date,
    COUNT(*) AS visits_count
FROM OPD_Visits
GROUP BY Date
ORDER BY Date ASC;

-- 2) VISITS GROUPED BY DOCTOR

SELECT 
    Doctor,
    COUNT(*) AS total_visits
FROM OPD_Visits
GROUP BY Doctor
ORDER BY total_visits DESC;

-- 3) COUNT OF NEW VS FOLLOW-UP VISITS

SELECT 
    Visit_Type,
    COUNT(*) AS count_visits
FROM OPD_Visits
GROUP BY Visit_Type;

-- Average hides age clustering.
-- Doctor load doesn’t reflect complexity.
-- High counts don’t imply high clinical burden.
-- Diagnosis frequency ignores severity variation.
