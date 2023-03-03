-- 쇼핑몰에 가입하고 물건을 한번도 구매하지 않은 회원까지 모두 출력
SELECT u.*
     , b.prodName
     , b.groupName
     , b.price
     , b.amount
  FROM usertbl AS u
  LEFT OUTER JOIN buytbl AS b
    ON u.userID = b.userID
 WHERE b.userID IS NULL;
    
-- 오른쪽 테이블(buytbl)기준
SELECT u.*
     , b.prodName
     , b.groupName
     , b.price
     , b.amount
  FROM usertbl AS u
 RIGHT OUTER JOIN buytbl AS b
    ON u.userID = b.userID;
    
-- 학생 중에 동아리에 가입하지 않은 학생
SELECT s.stdName
     , s.addr
     , j.num
     , c.clubName 
     , c.roomNo
  FROM stdtbl AS s
  LEFT OUTER JOIN stdclubtbl AS j
    ON s.stdName = j.stdName
  LEFT OUTER JOIN clubtbl AS c
    ON c.clubName = j.clubName;
    
-- 아무도가입하지 않은 동아리
SELECT s.stdName
     , s.addr
     , j.num
     , c.clubName 
     , c.roomNo
  FROM stdtbl AS s
  LEFT OUTER JOIN stdclubtbl AS j
    ON s.stdName = j.stdName
  RIGHT OUTER JOIN clubtbl AS c
    ON c.clubName = j.clubName;
   
-- 두 쿼리 결과 합쳐줌 UNION(집합)
SELECT s.stdName
     , s.addr
     , j.num
     , c.clubName 
     , c.roomNo
  FROM stdtbl AS s
  LEFT OUTER JOIN stdclubtbl AS j
    ON s.stdName = j.stdName
  LEFT OUTER JOIN clubtbl AS c
    ON c.clubName = j.clubName
    
 UNION -- 집합  
 -- UNION ALL -> 왼쪽 집합결과, 오른쪽 집합 결과 모두 출력해줌
 
SELECT s.stdName
     , s.addr
     , j.num
     , c.clubName 
     , c.roomNo
  FROM stdtbl AS s
 RIGHT OUTER JOIN stdclubtbl AS j
    ON s.stdName = j.stdName
 RIGHT OUTER JOIN clubtbl AS c
    ON c.clubName = j.clubName;
  
-- INNER JOIN의 약식표현 (권장x)
SELECT u.*
     , b.userID
     , b.prodName
     , b.groupName
     , b.price
     , b.amount
  FROM usertbl AS u, buytbl AS b
 WHERE u.userID = b.userID;
 
-- IN : 조건 만족하는 것만 출력
-- NOT IN : 조건 만족하지 않는 것만 출력
SELECT name
     , height
  FROM usertbl
 WHERE height NOT IN (SELECT height
                        FROM usertbl 
					   WHERE name like '김경호%');
                       
