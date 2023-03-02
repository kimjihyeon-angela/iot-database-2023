-- UPDATE & TRANSACTION
START TRANSACTION;

-- 경고! UPDATE 구문에서 WHERE절 빼면 안됨
UPDATE usertbl_bak
   SET mobile1 = '010'
     , mobile2 = '66667788'
     , addr = '부산'
 WHERE userID = 'SMG';

COMMIT;
ROLLBACK;

-- DELETE
-- WHERE 절이 빠지면 전체 내용이 사라짐
DELETE FROM usertbl
 WHERE userID = 'HGS';


/*
UPDATE, DELETE 하기 전에 START TRANSACTION; 하고 UPDATE, DELETE하기
UPDATE, DELETE 한 뒤 잘못된 경우 ROLLBACK; 하기
제대로 된 경우 COMMIT 하기
UPDATE, DELETE 하기 전
START TRANSCATION;

COMMIT;
ROLLBACK;
적어놓고 시작하기
*/