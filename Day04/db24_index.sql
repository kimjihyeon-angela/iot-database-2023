CREATE TABLE tbl1 (
	ID       INT NOT NULL PRIMARY KEY,
    bridge   INT NULL,
    contents VARCHAR(5000)
);

-- sql DB의 usertbl데이터 중 userID, name, birthYear, addr 가져와서 tabledb의 usertbl에 삽입
INSERT INTO tabledb.usertbl 
SELECT userID, name, birthYear, addr
  FROM sqldb.usertbl;  
  
SELECT * FROM usertbl WHERE userName = '김범수';