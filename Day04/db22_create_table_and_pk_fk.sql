CREATE DATABASE tabledb;

USE tabledb;

CREATE TABLE usertbl (
	userID    CHAR(8) NOT NULL PRIMARY KEY,
    userName  VARCHAR(10) NOT NULL,
    birthYear INT NOT NULL,
    addr      VARCHAR(10)
);

CREATE TABLE buytbl (
	num      INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    userID   CHAR(8) NOT NULL,
    prodName VARCHAR(10) NOT NULL,
    price    INT,
    FOREIGN KEY(userID) REFERENCES usertbl(userID)
);

-- 실무에 가장 근접한 PK 잡는방법
-- 기본키 2개
CREATE TABLE prodtbl (
	prodCode CHAR(3)  NOT NULL,
    prodID   CHAR(4)  NOT NULL,
    prodDate DateTIME NOT NULL,
    prodCur  VARCHAR(10) NULL,
    CONSTRAINT pk_prodtbl_prodCode_prodID
       PRIMARY KEY (prodCode, ProdID)
);

-- 멤버테이블
CREATE TABLE membertbl (
	userID CHAR(8)     NOT NULL PRIMARY KEY,
    name   VARCHAR(10) NOT NULL,
    email  VARCHAR(50) NULL UNIQUE  -- 유니크 제약조건
    -- pk와의 차이점 => unique는 null값이 들어가짐
);

CREATE TABLE stdtbl (
	userID CHAR(8) NOT NULL PRIMARY KEY,
    name   VARCHAR(10),
    grade  INT CHECK (grade >= 1 and grade <= 4), -- 학년 : 1학년~ 4학년
    CONSTRAINT CK_name CHECK (name IS NOT NULL) -- NOT NULL과 같음
);



