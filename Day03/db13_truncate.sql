INSERT INTO proctbl (total_name)
VALUES ('BBK');

SELECT *
  FROM proctbl;

-- DELETE
DELETE FROM proctbl
 WHERE ID = 3;
 
DELETE FROM proctbl;

-- 완전 초기화
TRUNCATE proctbl;