-- 코드를 작성해주세요
SELECT 
    ID,
    IF(CHILD_COUNT IS NULL, 0, CHILD_COUNT) AS CHILD_COUNT
FROM ECOLI_DATA A
LEFT OUTER JOIN (SELECT
    PARENT_ID, 
    COUNT(*) AS CHILD_COUNT
FROM ECOLI_DATA
WHERE PARENT_ID IS NOT NULL
GROUP BY PARENT_ID) B ON A.ID = B.PARENT_ID 
ORDER BY 1