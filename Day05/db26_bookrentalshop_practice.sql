/* BookRentalShop 연습 */
SELECT *
  FROM divtbl;
  
SELECT *
  FROM bookstbl;

SELECT *
  FROM membertbl;

SELECT *
  FROM rentaltbl;
  
-- 서브쿼리 (성능이 떨어지는 영향 - 안좋음,,)
SELECT b.Author   AS '저자' -- 1
  -- , b.Division AS '장르' -- 2
     , (SELECT Names 
          From divtbl 
		 WHERE Division = b.Division) AS '장르'
     , b.Names    AS '책제목'
     , b.ISBN
     , b.Price    AS '금액'
  FROM bookstbl AS b
 ORDER BY b.Names;  -- 책제목 기준으로 정렬 (b.Names 대신 책제목, 3적어도 됨)

-- 조인 (서브쿼리 대신 가능하면 조인으로 쓰기)
SELECT b.Author   AS '저자'
     , b.Division 
     , d.Names    AS '장르'
     , b.Names    AS '책제목'
     , b.ISBN
     , b.Price    AS '금액'
  FROM bookstbl AS b
 INNER JOIN divtbl AS d
    ON b.Division = d.Division
 ORDER BY b.Names;

-- 서브쿼리 (장르로 그룹핑)
SELECT (SELECT Names 
          FROM divtbl 
		 WHERE Division = bb.Division) AS '장르'
	 , bb.총합
  FROM (
		SELECT b.Division
			 , SUM(b.Price) AS '총합'
		  FROM bookstbl AS b
		 GROUP BY b.Division
       ) AS bb;
  
-- 내부 조인 
SELECT m.Names      AS '이름'
     , m.Addr       AS '주소'
     , m.Mobile     AS '연락처'
     , r.rentalDate AS '대여일자'
     , IFNULL(r.returnDate, '미반납') AS '반납일자'
     , b.Names      AS '책제목'
     , d.Names      AS '장르'
     , b.Price      AS '금액'
  FROM membertbl AS m
 INNER JOIN rentaltbl AS r
    ON m.memberIdx = r.memberIdx
 INNER JOIN bookstbl AS b
    ON r.bookIdx = b.bookIdx
 INNER JOIN divtbl AS d
    ON b.Division = d.Division;
    
-- 외부조인
SELECT m.Names      AS '이름'
     , m.Addr       AS '주소'
     , m.Mobile     AS '연락처'
     , r.rentalIdx
     , r.rentalDate AS '대여일자'
     , r.returnDate AS '반납일자'
     , b.Names      AS '책제목'
     , d.Names      AS '장르'
     , b.Price      AS '금액'
  FROM membertbl AS m
  LEFT OUTER JOIN rentaltbl AS r
    ON m.memberIdx = r.memberIdx
  LEFT OUTER JOIN bookstbl AS b
    ON r.bookIdx = b.bookIdx
  LEFT OUTER JOIN divtbl AS d
    ON b.Division = d.Division
 WHERE  r.rentalIdx IS NULL;
 
-- 책을 두권 이상 출판한 저자
SELECT bb.Author
     , bb.Division
     , d.Names AS '장르'
     , bb.출판권수
     , bb.합계금액
  FROM (
		SELECT b.Author
			 , b.Division
			 , COUNT(b.Author) AS '출판권수'
			 , SUM(b.Price)    AS '합계금액'
		  FROM bookstbl AS b
		 GROUP BY b.Author, b.Division
		HAVING COUNT(b.Author) >= 2
       ) AS bb
 INNER JOIN divtbl as d
    ON bb.Division = d.Division
 ORDER BY bb.출판권수 DESC;

