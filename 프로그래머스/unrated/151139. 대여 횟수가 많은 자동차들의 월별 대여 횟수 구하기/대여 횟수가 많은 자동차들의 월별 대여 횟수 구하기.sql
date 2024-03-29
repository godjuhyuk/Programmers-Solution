-- 코드를 입력하세요

SELECT
    DATE_FORMAT(START_DATE, "%m") AS MONTH,
    CAR_ID,
    COUNT(HISTORY_ID) AS RECORDS
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
WHERE CAR_ID IN (SELECT
    
    CAR_ID
    
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY 
WHERE DATE_FORMAT(START_DATE, "%Y-%m") BETWEEN "2022-08" AND "2022-10"
GROUP BY CAR_ID
HAVING COUNT(HISTORY_ID) >= 5)
AND DATE_FORMAT(START_DATE, "%Y-%m") BETWEEN "2022-08" AND "2022-10"
GROUP BY DATE_FORMAT(START_DATE, "%Y-%m"), CAR_ID
ORDER BY DATE_FORMAT(START_DATE, "%m") ASC, CAR_ID DESC