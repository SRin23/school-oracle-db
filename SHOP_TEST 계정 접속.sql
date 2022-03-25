-- MEMBERTBL 테이블의 모든 Field를 화면에 출력
SELECT * FROM MEMBERTBL;

-- memberTBL 테이블을 읽음 -> 조건) MEMBERNAME이 고양이 인것만 출력
SELECT * FROM MEMBERTBL
WHERE MEMBERNAME = '고양이';