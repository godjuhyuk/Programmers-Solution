WITH TEST AS (
    SELECT
        BOOK_ID,
        SUM(SALES) AS SALES
    FROM BOOK_SALES
    WHERE DATE_FORMAT(SALES_DATE, "%Y-%m") = "2022-01"
    GROUP BY BOOK_ID
)

SELECT
    A.AUTHOR_ID,
    A.AUTHOR_NAME,
    B.CATEGORY,
    SUM(S.SALES * B.PRICE) AS TOTAL_SALES
FROM BOOK B
INNER JOIN AUTHOR A ON B.AUTHOR_ID = A.AUTHOR_ID
INNER JOIN TEST S ON B.BOOK_ID = S.BOOK_ID
GROUP BY A.AUTHOR_ID, B.CATEGORY
ORDER BY 1 ASC, 3 DESC