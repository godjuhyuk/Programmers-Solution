-- 코드를 작성해주세요
SELECT COUNT(*) AS FISH_COUNT, MAX(A.LENGTH) AS MAX_LENGTH, A.FISH_TYPE
FROM (
    SELECT ID, FISH_TYPE, IFNULL(LENGTH, 10) AS LENGTH
    FROM FISH_INFO
) A
GROUP BY A.FISH_TYPE
HAVING SUM(LENGTH)/COUNT(LENGTH)>=33
ORDER BY FISH_TYPE ASC