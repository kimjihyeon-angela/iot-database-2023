-- INSERT
INSERT INTO usertbl
(userID, name, birthYear, addr, mobile1, mobile2, height, mDate)
VALUES
('SMG', '성명건', 1976, '부산', '010', '66887777', 179, '2023-03-02');

-- 컬럼을 다 적을 때 입력 안할 컬럼은 NULL로 지정
INSERT INTO usertbl
(userID, name, birthYear, addr, mobile1, mobile2, height, mDate)
VALUES
('HGS', '홍길순', 2000, '한양', NULL, NULL, NULL, NULL);

-- NULL 컬럼 생략 가능
INSERT INTO usertbl
(userID, name, birthYear, addr)
VALUES
('SHM', '손흥민', 1991, '서울');

-- 컬럼 지정 생략 가능 (단, 입력할 값의 순서가 컬럼 순서와 일치해야함)
INSERT INTO usertbl VALUES
('SJW', '손정웅', 1969, '서울', '010', '55664433', '176', NULL );

-- AUTO_INCREMENT 의 경우 필드값을 입력하지 않아도 됨
-- AUTO_INCREMENT의 경우 INSERT 계속하면 계속 입력됨 
-- if, 같은 값이 입력되어 삭제한 경우 다시 입력하면 삭제된 번호 다음 번호부터 입력됨
INSERT INTO buytbl
(userID, prodName, groupName, price, amount)
VALUES
('SMG', '노트북', '전자', 5000000, 1);

