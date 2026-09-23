/*
Example lesson stub
*/
--Some explanation
SELECT   ps.PatientId,
         ps.AdmittedDate,
         ps.DischargeDate,
         ps.Hospital,
         ps.Ward,
         ps.Ethnicity,
         DATEDIFF(DAY, ps.AdmittedDate, ps.DischargeDate) AS LengthOfStay
FROM     PatientStay AS ps
WHERE    ps.Hospital IN ('kingston', 'PRUH')
         AND --AND ps.Ward LIKE '%surgery'
         ps.AdmittedDate BETWEEN '2024-2-28' AND '2024-03-01'
ORDER BY LengthOfStay DESC, ps.AdmittedDate DESC;

SELECT   ps.Hospital,
         ps.Ward,
         COUNT(*) AS NumberOfPatients,
         SUM(ps.tariff) AS TotalTariff,
         MAX(ps.Tariff) AS BiggestTariff
FROM     PatientStay AS ps
GROUP BY ps.Hospital, ps.Ward
HAVING  sum(ps.tariff) >= 10
ORDER BY TotalTariff desc;

