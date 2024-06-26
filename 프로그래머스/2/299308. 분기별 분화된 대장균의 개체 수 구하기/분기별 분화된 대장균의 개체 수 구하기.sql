SELECT
    CASE
        WHEN DATE_FORMAT(DIFFERENTIATION_DATE, "%m") <= 3 THEN "1Q"
        WHEN DATE_FORMAT(DIFFERENTIATION_DATE, "%m") <= 6 THEN "2Q"
        WHEN DATE_FORMAT(DIFFERENTIATION_DATE, "%m") <= 9 THEN "3Q"
        WHEN DATE_FORMAT(DIFFERENTIATION_DATE, "%m") <= 12 THEN "4Q"
    END AS QUARTER,
    COUNT(*) AS ECOLI_COUNT
FROM ECOLI_DATA
GROUP BY QUARTER
ORDER BY 1