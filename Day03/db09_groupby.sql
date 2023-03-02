-- 집계함수 사용하기 위해서 / 그룹핑
-- Groupt BY에 작성된 컬럼명만 SELECT 절에 쓸 수 있음
SELECT userID AS '아이디'
     , SUM(amount) AS '구매 개수'
  FROM buytbl
 GROUP BY userID; 

SELECT userID AS '아이디'
     , AVG(amount) AS '평균 구매 개수'
  FROM buytbl
 GROUP BY userID; 
 
-- HAVING -> 집계함수 등의 결과값을 조건으로 필터링 하기 위해 사용
SELECT userID
     , SUM(price * amount) AS '합산'
  FROM buytbl
 GROUP BY userID
HAVING SUM(price * amount) >= 1000;
-- HAVING 합산 >= 1000 이렇게 적어도 됨

-- ROLLUP : 전체합계 자동 계산
SELECT userID
     , SUM(price * amount) AS '합산'
  FROM buytbl
 GROUP BY userID
  WITH ROLLUP; 
  
