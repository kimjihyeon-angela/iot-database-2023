-- 변수사용
USE sqldb;

SET @myVar1 = 5;
SELECT @myVar1;
SET @myVar2 = '이름 ==> ';

SELECT @myVar2, name
  FROM usertbl
 WHERE height > 170;

SELECT name, height + @myVar1
  FROM usertbl;

-- 형변환
SELECT CAST(birthYear AS CHAR)
  FROM usertbl;

SELECT CAST(CONVERT(birthYear, CHAR) AS SIGNED INTEGER)
  FROM usertbl;

-- 암시적 형변환
SELECT 200 + 300;

SELECT CONCAT('Hello ', 'World');

SELECT '200' + '300'; -- MySQL 이외에서는 200+300으로 출력됨

SELECT CONCAT(200, '300'); -- 200300

SELECT 200 + '300'; -- 500

SELECT 1 = 1; -- 1 -> True
SELECT 2 = 1; -- 0 -> False

/* 내장함수 리스트 */
-- 흐름함수
-- 100>200 ? '참':'거짓'
SELECT IF (100 > 200, '참', '거짓');

SELECT IFNULL(NULL, '널입니다');

-- NULL 은 계산이 오류가 나고 결과도 NULL로 나옴
SELECT NULL + 100; -- 100

-- NULL 계산시 IFNULL 활용하여 0으로 바꿔줘야함
SELECT IFNULL(NULL, 0) + 100;

-- NULLIF는 많이 사용 안됨
-- SELECT NULLIF(100, 100); -- NULL
-- SELECT NULLIF(100, 900); -- 100

-- 쿼리 작성시 많이 사용됨
SELECT name
     , birthYear
     , addr
     , CASE addr
	   WHEN '서울' THEN '수도권'
       WHEN '경기' THEN '수도권'
       WHEN '부산' THEN '광역권'
       WHEN '한양' THEN '조선권'
       ELSE '지역권' END AS '권역'
  FROM usertbl;
  
-- 문자열함수
-- SELECT ASCII('A'), CHAR(65), ASCII('a');
-- SELECT ASCII('한'); -- 한글은 사용하면 안됨

-- CHAR_LENGTH : 글자길이
-- LENGTH : byte
SELECT CHAR_LENGTH('ABC'), LENGTH('ABC');
SELECT CHAR_LENGTH('가나다'), LENGTH('가나다');

SELECT REPLACE('Hello World', 'Hello', 'Byebye');

-- 안녕하세요, 여러분에서 여의 위치를 알려줌
-- 데이터베이스에서 인덱스는 1부터 시작함
SELECT INSTR('안녕하세요, 여러분', '여');

-- LEFT, RIGHT
SELECT LEFT('ABCDEFGHIJKLMN', 3);  -- ABC
SELECT RIGHT('ABCDEFGHIJKLMN', 3); -- LMN

-- UPPER, LOWER
SELECT UPPER('Hello World'), Lower('Hello World');

-- LTRIM, RTRIM, TRIM
SELECT LTRIM('          Hello World!          ') AS 'LTRIM'
     , RTRIM('          Hello World!          ') AS 'RTRIM'
     , TRIM('          Hello World!          ') AS 'TRIM';
     
-- 'Hello' * 3
-- SELECT REPEAT('HEllo ', 3);

-- SUBSTRING
SELECT SUBSTRING('대한민국만세', 5, 2); -- 만세

-- 수학함수
SELECT ABS (-10);

SELECT CEILING(4.7); -- 올림
SELECT FLOOR(4.9);   -- 내림
SELECT ROUND (4.4);  -- 반올림

SELECT MOD(157, 10); -- 나머지

SELECT RAND(); -- 0~1 사이의 랜덤수
SELECT RAND(), FLOOR(1 + (RAND() * 6)); -- 주사위놀이

-- 날짜 및 시간 함수
SELECT NOW();
SELECT ADDDATE('2023-03-02', INTERVAL 10 DAY);

SELECT YEAR(NOW())
     , MONTH(NOW())
     , DAY(NOW())
     , DATE(NOW())
     , TIME(NOW())
     , DAYOFWEEK(NOW()); -- DAYOFWEEK 일요일(1) ~ 토요일 (7)

SELECT LAST_DAY(NOW()); -- 지금 날짜달의 마지막 날
SELECT LAST_DAY('2020-02-01'); -- 2020년 2월 1일의 마지막 날

-- 시스템 함수
SELECT USER();

SELECT DATABASE();

-- ROW_COUNT()
USE sqldb;
UPDATE buytbl SET price = price*2;
SELECT ROW_COUNT();

SELECT VERSION();  
