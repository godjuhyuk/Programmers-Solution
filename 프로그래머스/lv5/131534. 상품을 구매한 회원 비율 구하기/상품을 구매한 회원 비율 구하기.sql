-- 코드를 입력하세요
SELECT
    YEAR(SALES_DATE) AS YEAR,
    MONTH(SALES_DATE) AS MONTH,
    COUNT(DISTINCT A.USER_ID) AS PURCHASED_USERS,
    -- (SELECT COUNT(*) FROM USER_INFO WHERE YEAR(JOINED) = 2021),
    ROUND(COUNT(DISTINCT A.USER_ID) / (SELECT COUNT(*) FROM USER_INFO WHERE YEAR(JOINED) = 2021), 1) AS PURCHASED_RATIO
FROM USER_INFO A
INNER JOIN  ONLINE_SALE B ON A.USER_ID = B.USER_ID
WHERE YEAR(JOINED) = 2021
GROUP BY YEAR(SALES_DATE), MONTH(SALES_DATE)
ORDER BY 1, 2