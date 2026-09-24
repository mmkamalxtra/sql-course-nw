/*
 * NULLS Exercise
*/

/*
 * Add a WHERE clause to the SQL query below to filter to those patients for whom ethnicity is not known  
*/
SELECT ps.PatientId,
       ps.Ethnicity
FROM   PatientStay AS ps
WHERE  ps.Ethnicity IS NULL;


/*
 * Improve the SQL query below so that the values of the EthnicityIsNull calculated column is 'Not Known' rather than NULL
 * Use the ISNULL() function
*/
SELECT
	ps.PatientId
	,ps.Ethnicity
	,ISNULL(ps.Ethnicity, 'Not known') AS EthnicityIfNull
FROM
	PatientStay ps ;

/*
 * Improve the SQL query below so that the values of the EthnicityCoalesce calculated column is 'Not Known' rather than NULL
 * Use the COALESCE() function
*/
SELECT
	ps.PatientId
	,ps.Ethnicity
	,COALESCE(ps.ethnicity, 'Not known') AS EthnicityCoalesce
FROM
	PatientStay ps ;

/* 
 * Summarise the PatientStay table in a query that returns one row and two columns named:
 * NumberOfPatients
 * NumberOfPatientsWithKnownEthnicity
*/
SELECT
	count(*) AS NumberOfPatients
	,COUNT(ps.ethnicity) as NumberOfPatientsWithKnownEthnicity
FROM
	PatientStay ps ;