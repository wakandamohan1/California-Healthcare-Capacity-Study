use ashwin1;


SELECT * FROM  hospital ;

--#SHEET1) *Quarterwise Revenue* 

SELECT qtr_month, sum(net_tot) AS Net_Total_Revenue
FROM hospital
GROUP BY qtr_month
ORDER BY 2 DESC;

--#SHEET2) CountyWise Net Revenue

SELECT top 4 county_name, SUM(net_tot) AS Net_Total_Revenue
FROM hospital
GROUP BY county_name
ORDER BY 2 DESC;

--SHEET3) TYPE OF HOSPITAL REVENUE

SELECT type_hosp, SUM(net_tot) AS Net_Total_Revenue
FROM hospital
GROUP BY type_hosp
ORDER BY 2 DESC;

--#(sheet4 -sheet7) KPI cards - 

--num of doctors 

SELECT COUNT(DISTINCT CEO) AS Total_Doctors
FROM hospital;

--Total Hospitals

SELECT COUNT(DISTINCT fac_name) AS Total_Hospital
FROM hospital;

SELECT qtr_month, COUNT(fac_name) AS Total_Hospital
FROM hospital group by qtr_month; --just for check 

SELECT qtr_month, COUNT(fac_name) AS Total_Hospital
FROM hospital group by qtr_month; -- just for check 

--Total Patients 

SELECT SUM(vis_tot) AS Total_Patients
FROM hospital;

--sheet8 - Average Length of Stay of Patient

SELECT (SUM(DAY_TOT) / SUM(DIS_TOT)) Overall_Average_Length_of_Stay
FROM hospital;

--SELECT AVG(day_tot) / AVG(dis_tot) AS average_length_of_stay FROM hospital;  - wrong 

-- sheet9 - 
SELECT qtr_month,
    sum(STF_BEDS) AS 'Staffed_Beds',
    sum(AVL_BEDS) AS "Available_Beds",
    sum(LIC_BEDS) AS "Licensed_Beds"
FROM hospital group by qtr_month ORDER BY 1;


--checks 

select * from hospital;
-- TOTAL DAYS 
select sum(day_tot) from hospital;


-- 10 ) top 5 cities with highest hopital number

SELECT TOP 5 * from (
    SELECT CITY, COUNT(DISTINCT FAC_NAME) AS Number_of_Hospitals 
    FROM hospital 
    GROUP BY CITY
) AS subquery
ORDER BY 2 desc;


-- (without sub query)
SELECT TOP 5 CITY, COUNT(DISTINCT FAC_NAME) AS Number_of_Hospitals 
FROM hospital 
GROUP BY CITY
ORDER BY 2 DESC;



--11)top 5 CEO /  DOCTORS- hospital number wise - ( top 10 doctors visiting most number of hospitals )

SELECT top 5 CEO, count(DISTINCT fac_name) number_of_hopistals
FROM hOSPITAL
group by ceo
ORDER BY 2 desc;


--12) City with the Highest Total Visits

SELECT TOP 5 CITY, sum(VIS_TOT) AS total_visits
    FROM hospital 
    GROUP BY city ORDER BY  2 desc;
