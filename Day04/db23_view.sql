-- 뷰

USE sqldb;

CREATE VIEW uv_potentialUser
AS 
	SELECT u.*
         , b.num
         , b.prodName
         , b.price
         , b.amount
      FROM usertbl AS u
      LEFT OUTER JOIN buytbl AS b
        ON u.userID = b.userID
	 WHERE b.userID IS NULL;
     
SELECT *
  FROM uv_potentialUser;

-- 사용자 테이블 뷰  
CREATE VIEW uv_usertbl
AS 
	SELECT u.userID
         , u.name
         , u.birthYear
         , u.addr
      FROM usertbl AS u;
      
SELECT *
  FROM uv_usertbl;

INSERT INTO uv_usertbl VALUES
	('KKK', '케케케', 1988,'제주');
    
SELECT *
  FROM uv_potentialUser;
  
INSERT INTO uv_potentialUser VALUES
('TTT', '티티티', 1990, '서울', '010', '89898989', '190', '2023-01-01');
-- 뷰가 한개의 테이블을 이용해서 만들 경우 수정, 내용 삽입 가능 
-- but, 여러 개의 테이블을 이용해서 만든 뷰인 경우 수정, 삽입 불가
      
