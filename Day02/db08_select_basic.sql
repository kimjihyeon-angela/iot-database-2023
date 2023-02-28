-- Active: 1677474351187@@127.0.0.1@3306@employees
-- 사용 데이터베이스 변경
USE homeplus;

-- SELECT ALL -> 이렇게 적으면 안됨 ALL => *
-- 한 문장 끝은 ;(세미콜론)으로 마침
SELECT * FROM indextbl;
SELECT * FROM homeplus.indextbl; /* 동일한 의미 */

SELECT * FROM employees.titles; -- 다른 DB의 테이블에서 데이터를 가져오려면 사용하는 방법

-- 필요한 컬럼만 가져오기
SELECT first_name, last_name FROM indextbl;

-- sqldb를 사용
USE sqldb;

-- 조건절 검색
SELECT userID
	 , name
     , birthYear
     , height 
  FROM usertbl 
 WHERE name = '김경호';
 
 -- 관계 연산자
 SELECT *
   FROM usertbl
  WHERE birthYear >= 1970
    AND height >= 182;
 
-- 사이의 값을 조회
SELECT *
  FROM usertbl
 WHERE height >= 180 
   AND height < 183;
   
SELECT *
  FROM usertbl
 WHERE height BETWEEN 180 AND 183;
 
-- IN 연산자
SELECT *
  FROM usertbl
 WHERE addr = '경남' OR addr = '경북' OR addr = '전남';

SELECT *
  FROM usertbl
 WHERE addr IN ('경남', '경북', '전남');
 
 
-- 문자열 검색- 뉴스 본문 안에서 일정 단어를 검색
SELECT *
  FROM usertbl
 WHERE name LIKE '%김%';
 
SELECT *
  FROM usertbl
 WHERE name LIKE '김__';
 

-- Subquery (서브쿼리)
SELECT name
     , height
  FROM usertbl
 WHERE height > (SELECT height FROM usertbl WHERE name = '김경호');
/*
 서브쿼리 사용위치
  1. 컬럼위치
  2. 테이블 위치 (FROM 절)
  3. 조건절 위치 (WHERE 절)
 WHERE 절에 서브쿼리가 컬럼이 한개 이상이거나 결과가 한 개 이상인 경우 조건 연산자로 조회할 수 없음
 IN을 쓸 경우 되기도 함
*/

-- 가상테이블
-- AS -> 별명
SELECT u.userID
     , u.name
     , (2023 - u.birthYear) AS age
  FROM (SELECT userID, name, birthYear, addr
		  FROM usertbl
		) AS u
 WHERE u.birthyear > 1969;
 
 -- 컬럼에 쓰는 서브쿼리
 SELECT b.userID AS '아이디'
      , (SELECT name FROM usertbl WHERE userID = b.userID) AS name
      , b.prodName
      , b.price * b.amount AS '판매액'
   FROM buytbl as b;

   -- 정렬 ORDER BY : DEFAULT = ASC => 안적어도 오름차순
   -- 내림차순 : DESC (DESCENDING)
   -- 여러 조건으로 정렬할 수 있음, 앞에 있는 조건이 우선조건임
SELECT *
  FROM usertbl
 WHERE birthYear > 1969
 ORDER BY birthYear ASC, height DESC;

-- 중복제거 DISTINCT 
-- 중복제거 할 컬럼만 있어야함
SELECT DISTINCT addr
  FROM usertbl;
  
-- 출력 개수 제한 LIMIT
USE homeplus;

SELECT *
  FROM indexTbl
 LIMIT 5;
 
 USE sqldb;
-- 조회하면서 새로운 테이블 생성하는 쿼리
-- PK, FK 같은 제약조건은 복사안됨
-- 일부 컬럼(열)만 복사 테이블 생성 가능
CREATE TABLE elec_buytbl_new
SELECT num
     , prodName
     , price
  FROM buytbl
 WHERE groupName = '전자';



