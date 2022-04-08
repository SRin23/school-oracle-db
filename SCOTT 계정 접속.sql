--DROP TABLE EMP;
--DROP TABLE DEPT;
--DROP TABLE LOCATIONS;
--DROP TABLE SALGRADE;

-- ctrl+enter 조작시, 값이 실행되며, ;(세미콜론)은 문장이 끝났다는 뜻이다.
CREATE TABLE DEPT(
    DEPTNO NUMBER(2) CONSTRAINT PK_DEPT PRIMARY KEY,
	DNAME VARCHAR2(14) ,
	LOC VARCHAR2(13) 
); 

CREATE TABLE EMP(
    EMPNO NUMBER(4) CONSTRAINT PK_EMP PRIMARY KEY,
	ENAME VARCHAR2(10),
	JOB VARCHAR2(9),
	MGR NUMBER(4),
	HIREDATE DATE,
	SAL NUMBER(7,2),
	COMM NUMBER(7,2),
	DEPTNO NUMBER(2) CONSTRAINT FK_DEPTNO REFERENCES DEPT
);

CREATE TABLE SALGRADE( 
    GRADE NUMBER,
	LOSAL NUMBER,
	HISAL NUMBER 
);
CREATE TABLE LOCATIONS (
     LOC_CODE  CHAR(2) ,
     CITY      VARCHAR2(12)
) ;

-- DEPT에 Insert문을 이용해 값 저장
INSERT INTO DEPT VALUES(10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES(20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES(30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES(40,'OPERATIONS','BOSTON');

-- EMP에 Insert문을 이용해 값 저장
INSERT INTO EMP VALUES
(7369,'SMITH','CLERK',7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20);
INSERT INTO EMP VALUES
(7499,'ALLEN','SALESMAN',7698,to_date('20-2-1981','dd-mm-yyyy'),1600,300,30);
INSERT INTO EMP VALUES
(7521,'WARD','SALESMAN',7698,to_date('22-2-1981','dd-mm-yyyy'),1250,500,30);
INSERT INTO EMP VALUES
(7566,'JONES','MANAGER',7839,to_date('2-4-1981','dd-mm-yyyy'),2975,NULL,20);
INSERT INTO EMP VALUES
(7654,'MARTIN','SALESMAN',7698,to_date('28-9-1981','dd-mm-yyyy'),1250,1400,30);
INSERT INTO EMP VALUES
(7698,'BLAKE','MANAGER',7839,to_date('1-5-1981','dd-mm-yyyy'),2850,NULL,30);
INSERT INTO EMP VALUES
(7782,'CLARK','MANAGER',7839,to_date('9-6-1981','dd-mm-yyyy'),2450,NULL,10);
INSERT INTO EMP VALUES
(7788,'SCOTT','ANALYST',7566,to_date('09-12-1982','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP VALUES
(7839,'KING','PRESIDENT',NULL,to_date('17-11-1981','dd-mm-yyyy'),5000,NULL,10);
INSERT INTO EMP VALUES
(7844,'TURNER','SALESMAN',7698,to_date('8-9-1981','dd-mm-yyyy'),1500,0,30);
INSERT INTO EMP VALUES
(7876,'ADAMS','CLERK',7788,to_date('12-1-1983','dd-mm-yyyy'),1100,NULL,20);
INSERT INTO EMP VALUES
(7900,'JAMES','CLERK',7698,to_date('3-12-1981','dd-mm-yyyy'),950,NULL,30);
INSERT INTO EMP VALUES
(7902,'FORD','ANALYST',7566,to_date('3-12-1981','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP VALUES
(7934,'MILLER','CLERK',7782,to_date('23-1-1982','dd-mm-yyyy'),1300,NULL,10);

-- SALGRADE에 insert를 이용해 값 저장
INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);

--commit : 현재까지 한 내용을 DB에 보냄
--현재까지의 내용을 확정함 -> 저장
commit;

--EMP의 전체 값을 조회
--아래 두 실행문을 같은 값을 출력한다.
SELECT * FROM EMP;
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTO FROM EMP;

SELECT * FROM DEPT;

SELECT EMPNO, ENAME, SAL, COMM FROM EMP;

--순서 변경 가능
SELECT JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, EMPTNO FROM EMP;

SELECT EMPNO, ENAME, SAL, SAL+300 FROM EMP;
SELECT EMPNO, ENAME, SAL, 2*SAL+300 FROM EMP;
SELECT EMPNO, ENAME, SAL, 2*(SAL+300) FROM EMP;

--NULL+300 = NULL이다.(NULL에 어떤 계산을 해도 NULL이 반환된다.)
--COMM+300에서 COMM값이 NULL값이면 그 결과도 NULL이 된다.
SELECT EMPNO, ENAME, SAL, COMM, COMM+300 FROM EMP;

--SELECT절과 FROMW절을 각 행에 나누어 작성하기도 한다.
--ENAME의 별명 NAME을 부여, SAL*12의 별명 Annual Salary(연봉)를 부여
--SELECT시, 위 속성명이 NAME, SAL, Annual Salary로 변경되어 보여짐
SELECT ENAME AS NAME, SAL, SAL*12 AS "Annual Salary" 
FROM EMP;

--Literal 문자열 실습
--결과1, 결과2, 결과3, 결과4는 별칭을 부여한것
select ename 결과1, 'ABCde' 결과2, sal 결과3, 500 결과4 
from emp;

--연결연산자
--별칭으로 이름_번호_직업을 생성
SELECT ENAME || ':' || EMPNO || ':' || JOB 이름_번호_직업
FROM EMP;

--예제2. emp테이블에서 이름과 업무를 King is a PRESIDENT 형태로 출력
SELECT ENAME || ' is a '|| JOB AS "Employees Details"
FROM EMP;

--예제3.  emp테이블에서 일므과 연봉을 KING : 1 Year salary = 60000형태로 조회
-- SAL*12는 월급을 12(1년)으로 곱해 연봉을 나타낸 것이다.
SELECT ENAME || ' : 1 Year salart = ' || 12*SAL MONTHLY 
FROM EMP;

--ALL*  = * 
--ALL이 생략되어 두 연산자가 같은 값이 나온다.
SELECT ALL * FROM EMP;
SELECT * FROM EMP;

--JOB 컬럼을 가지고 중복 제거
SELECT DISTINCT JOB
FROM EMP;

--DEPTNO(부서번호)와 JOB 컬럼의 값이 중복되지 않게 출력
SELECT DISTINCT DEPTNO, JOB
FROM EMP;

--
SELECT ROWID, ROWNUM, ENAME, SAL
FROM EMP
WHERE ROWNUM <= 3;

SELECT * FROM EMP;

--WHERE문, JOB이 MANAGER인것의 EMPNO, ENAME, JOB, SAL 컬럼 조회
--한줄씩 읽으며, 해당 조건이 만족하면 출력되는것
--한줄씩 읽음 -> WHERE절 체크 -> SELECT문 출력
SELECT EMPNO, ENAME, JOB, SAL
FROM EMP
WHERE JOB = 'MANAGER';

--값이 없음 (명령문이 아닌, 실제 데이터는 대소문자를 확인하여 조회해야한다.
--MANAGER은 있지만, Manager은 없는것
--대부분의 실제 데이터는 대문자로 저장되어 있다.
SELECT EMPNO, ENAME, JOB, SAL
FROM EMP
WHERE JOB = 'Manager';

--예제2. 급여가 3000이상인 사원의 사원번호, 이름, 담당업무, 급여를 조회
--항상 문장 끝에는 세미콜론을 찍어야한다.
SELECT EMPNO, ENAME, JOB, SAL 
FROM EMP
WHERE SAL >= 3000;

--예제3. 부서번호가 30이 아닌 사원들의 이름, 급여, 부서번호를 조회
--같지 않다 : !=, <>, ^=
SELECT ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO<>30;

--비교 연산자

--예제1. 급여가 1300에서 1700사이(1300이상 1700이하)
--WHERE SAL >= 1300 AND SAL <= 1700
SELECT ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE SAL BETWEEN 1300 AND 1700;

--예제2
--위치를 바꾸면 값이 없다
--WHERE SAL >= 1700 AND SAL <= 1300과 같기 때문(성립할 수 없는 식)
SELECT ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE SAL BETWEEN 1700 AND 1300;

--예제3. 사원번호가 7902, 7788, 7566인 사원의 사원번호, 성명, 담당업무, 급여, 입사일자 조회
--IN은 값이 하나라도 포함되면 출력함
--IN(7902, 7788, 7566)는 EMP테이블에 이쓴 데이터중에서 EMPNO값이 존재할 경우 TRUE값이 RETURN된다.
SELECT EMPNO, ENAME, JOB, SAL, HIREDATE
FROM EMP
WHERE EMPNO IN (7902, 7788, 7566);

--위와 같은 결과가 출력된다.
SELECT EMPNO, ENAME, JOB, SAL, HIREDATE
FROM EMP
WHERE EMPNO = 7902 OR EMPNO = 7788 OR EMPNO = 7566;

--예제4. EMP테이블에서 이름의 두번째 글자가 'A'인 사원이름, 급여, 업무 조회
--WIDECARD인 _(한글자), %(0개이상)을 이용하여 'A'조회
SELECT ENAME, SAL, JOB
FROM EMP
WHERE ENAME LIKE '_A%';

--예제5. EMP 테이블에서 이름에 'A'문자가 포함된 사원이름, 급여, 업무 조회
--%는 0개도 포함하므로 %를 사용하여 작성한다.
SELECT ENAME, SAL, JOB
FROM EMP
WHERE ENAME LIKE '%A%';

--예제7
--ESCAPE뒤에 오는 %는 WILDCARD의 기능을 갖지 않는다.
--이름에 %가 포함된 사원 정보 출력
SELECT * FROM EMP
WHERE ENAME LIKE '%#%%';

--예제8
--결과 없음(COMM==NULL인 결과는 NULL)
SELECT EMPNO, ENAME, JOB, SAL, COMM, DEPTNO
FROM EMP 
WHERE COMM = NULL;

--NULL은 아무리 연산해도 NULL밖에 안나옴
SELECT EMPNO, ENAME, JOB, SAL, COMM, DEPTNO
FROM EMP 
WHERE COMM < NULL;

--그래서 아래와 같이 작성해야 NULL인지 확인할 수 있다.
--COMM에 있는 데이터가 NULL이면 TRUE값이 RETURN -> 값이 출력됨
SELECT EMPNO, ENAME, JOB, SAL, COMM, DEPTNO
FROM EMP 
WHERE COMM IS NULL;

--논리연산자
--급여가 2800이상이고, JOB이 MANAGER인 사원
--"MANAGER"가 아닌, 'MANAGER'로 작성해야한다.
--'MANAGER'은 대소문자를 구분해야한다.(데이터는 원본그대로여야함)
--AND는 모든 조건이 만족해야한다.
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE SAL >= 2800 AND JOB='MANAGER';

--OR은 조건 중 하나라도 만족하면 된다.
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE SAL >= 2800 OR JOB='MANAGER';

--NOT

--담당업무가 MANAGER, CLERK, ANALYST인 행 출력
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE JOB IN('MANAGER', 'CLERK', 'ANALYST');    

 --담당업무가 MANAGER, CLERK, ANALYST가 아닌 행 출력
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE NOT JOB IN('MANAGER', 'CLERK', 'ANALYST');   

--급여가 1000~3000이 아닌 사람 출력
SELECT ENAME, SAL, JOB
FROM EMP
WHERE SAL NOT BETWEEN 1000 AND 3000;

--A문자로 시작하는 이름 찾아 출력
SELECT *
FROM EMP
WHERE ENAME LIKE 'A%';  

--A문자로 시작하지 않는 이름찾아 출력    
SELECT *
FROM EMP
WHERE ENAME NOT LIKE 'A%';  

--보너스(COMM)가 NULL인 사원만 출력
SELECT ENAME, SAL, COMM, DEPTNO
FROM EMP
WHERE COMM IS NULL;

--보너스(COMM)가 NULL아 아닌 사원만 출력
SELECT ENAME, SAL, COMM, DEPTNO
FROM EMP
WHERE COMM IS NOT NULL;

--NVL : NVL(COMM, 0)에서 COMM이 NULL이면 0값으로 변환 
SELECT ENAME, SAL, COMM, DEPTNO
FROM EMP
WHERE (NVL(COMM, 0)=0);


--
SELECT EMPNO, ENAME, JOB, SAL
FROM EMP
WHERE SAL > 1500 AND (JOB = 'PRESIDENT' OR JOB = 'SALESMAN');

SELECT EMPNO, ENAME, JOB, SAL
FROM EMP
WHERE SAL > 1500 AND JOB IN('PRESIDENT', 'SALESMAN');

--ORDER BY(43p)
--예제1
--날짜는 과거가 큰값이다.(과거->현재->미래)
--과거 날짜부터 - 오름차순(기본값)
SELECT EMPNO, ENAME, JOB, SAL, HIREDATE, DEPTNO
FROM EMP
ORDER BY HIREDATE;

--최근날짜부터 (내림차순)
SELECT EMPNO, ENAME, JOB, SAL, HIREDATE, DEPTNO
FROM EMP
ORDER BY HIREDATE DESC;

--예제2
--부서번호로 오름차순 정렬 후, 부서번호가 같으면 급여가 많은 순으로 정렬(내림차순)
SELECT EMPNO, ENAME, JOB, DEPTNO, SAL
FROM EMP
ORDER BY DEPTNO ASC, SAL DESC;

--예제3
--empno : 1 / ename : 2 / job : 3 / sal : 4 / deptno : 5 / hiredate : 6 -> 각 컬럼은 순서대로 번호를 가짐
-- 즉, sal을 기준으로 오름차순 정렬
select empno, ename, job, sal, deptno, hiredate
from emp
order by 4;

--deptno을 기준으로 오름차순 정렬 후, 같은 값은 sal의 내림차순으로 정렬
select empno, ename, job, deptno, sal, hiredate
from emp
order by 4, 5 desc;

--예제4
--SAL을 12번 곱한 연봉의 별명을 ANN_SAL로 하여
--ANN_SAL을 기준으로 하여 오름차순 정렬
SELECT ENAME, SAL, SAL*12 ANN_SAL
FROM EMP
ORDER BY ANN_SAL;
--ORDER BY SAL*12;

--예제 5(47P)
--부서별로 담당하는 업무를 한번씩 조회하라 단, 업무기준으로 정렬
--DISTINCT : 데이터 중복을 제거한다.
SELECT DISTINCT DEPTNO, JOB
FROM EMP
ORDER BY JOB;

--예제6) 다음 문장을 수행한 결과는? -> ERROR 발생
--DISTINCT를 사용할 경우에는 SELECT절에 있는 컬럼만 정렬에 사용할 수 있다.
--DISTINCT를 사용하지 않으면 EMP테이블에 있는 모든 컬럼을 정렬 기준으로 사용할 수 있다.
SELECT DISTINCT DEPTNO, JOB
FROM EMP
ORDER BY SAL;

--예제 7) 다음 문장을 수행한 결과는? -> SAL+COMM을 기준으로 오름차순 정렬되어 나타남
SELECT DISTINCT JOB, SAL+COMM
FROM EMP
ORDER BY 2; --2는 SAL+COMM 을 일겉는다.





--03. 단일 행 함수
--예제1(55p) 전체 소문자(LOWER), 첫글자만 대문자(INITCAP)
SELECT EMPNO, ENAME, LOWER(JOB), INITCAP(JOB)
FROM EMP
WHERE DEPTNO=10;

--예제2(56p)
--CONCAT(A, B)는 A와 B를 연결해서 하나의 컬럼을 만든다.
SELECT EMPNO, ENAME, JOB, 
CONCAT(EMPNO, ENAME) E_ENAME, 
CONCAT(ENAME, EMPNO) E_EMPNO,
CONCAT(ENAME, JOB) E_JOB
FROM EMP
WHERE DEPTNO=10;

--예제3)EMP테이블에서 이름의 첫글자가 'K'보다 크고 'Y'보다 작은 사원의 정보를 이름순으로 정렬하여 출력
-- SUBSTR(문자열, 위치, 개수)로 하여 문자열의 원하는 값을 잘라낼 수 있다.
--ENAME의 값에서 첫번째 문자 1개를 반환한다.
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE SUBSTR(ENAME, 1, 1)>'K' AND SUBSTR(ENAME, 1, 1)<'Y'
ORDER BY ENAME;

--예제4) 부서가 20인 사원의 정보조회
--LENGTH는 해당 데이터의 길이를 출력한다.
SELECT EMPNO, ENAME, LENGTH(ENAME), SAL, LENGTH(SAL)
FROM EMP
WHERE DEPTNO=20;

--예제5(57p)
SELECT ENAME, 
INSTR(ENAME, 'L') E_NULL,  --ENAME중 'L'의 위치 출력 -> POSITION과 개수 생략(1, 1)로
INSTR(ENAME, 'L', 1, 1) E_11,   --ENAME의 처음부터 시작해 'L'의 첫번째 위치 출력
INSTR(ENAME, 'L', 1, 2) E_12, --ENAME의 처음부터 시작해 'L'의 두번째 위치 출력
INSTR(ENAME, 'L', 4, 1) E_41 --ENAME의 4번째부터 시작(MILLER -> LER)해 'L'의 첫번째 위치 출력 
FROM EMP
ORDER BY ENAME; 

--※참고) 한글 1글자 : 3byte
--출력 : NUL_CHARACTERSET / AL32UTF8
SELECT PARAMETER, VALUE
FROM NLS_DATABASE_PARAMETERS
WHERE PARAMETER = 'NLS_CHARACTERSET';

--예제6)
--DUAL은 ORACLE에서 제공하는 가상테이블이다.
--영문자는 1글자를 1BYTE로 인식하기 때문에 5는 문자열의 5번째 위치와 같다.
--SUBSTR은 문장의 5번째 문자에서 시작해 3개를 잘라온다.
--SUBSTRB는 BYTE 5번째 BYTE에서 3BYTE만큼 잘라온다(참고, 한글은 1글자당 3BYTE이므로 한글자만 출력)
SELECT 
SUBSTRB('I am here with you', 5, 3) 결과1,    -- _he(앞에 띄워쓰기가 된것) -> 영어는 SUBSTRB에 영향 크게 받지 않는다.(1글자당 1BYTE)
SUBSTR('나 여기 있어', 5, 3) 결과2,    -- _있어
SUBSTRB('나 여기 있어', 5, 3) 결과3,   --
SUBSTRB('나 여기 있어', 5, 4) 결과4,
SUBSTRB('나 여기 있어', 5, 5) 결과5,   -- 3BYTE를 다 채우지 못해 '기'가 출력되지 않음
SUBSTRB('나 여기 있어', 5, 6) 결과6    
FROM DUAL;

--예제7
--부서번호가 10인 사원의 이름출력
SELECT ENAME,
    SUBSTR(ENAME, 1, 3),    --1번째 위치부터 3개 출력
    SUBSTR(ENAME, 3), --3번째 위치부터 끝까지 출력
    SUBSTR(ENAME, -3, 2)    --오른쪽에서 3번째 위치부터 2개출력
FROM EMP
WHERE DEPTNO=10;

--예제1(59p)
SELECT 
ENAME, LPAD(ENAME, 15, '*'), --15자리의 문자열을 만들어 왼쪽의 빈 공간은 *로 채워 반환
SAL, 
LPAD(SAL, 10, '$') --10자리의 문자열을 만들어 왼쪽의 빈 공간은 $로 채워 반환
FROM EMP
WHERE DEPTNO = 10;

--예제2
SELECT 
ENAME, RPAD(ENAME, 15, '*'), --15자리의 문자열을 만들어 오른쪽의 빈 공간은 *로 채워 반환
SAL, 
RPAD(SAL, 10, '$') --10자리의 문자열을 만들어 오른쪽의 빈 공간은 $로 채워 반환
FROM EMP
WHERE DEPTNO = 10;


--예제3(60P)
--20번 부서의 사원에 대하여 담당업무 중 가장 좌측에 'A'를 삭제하고, 급여중 가장 좌측의 값이 '1'이면 '1'을 삭제하여 출력
--연속적으로 삭제할 값이 좌측에 있는 경우 그 값을 모두 삭제한다.
SELECT ENAME, JOB, LTRIM(JOB, 'A'), SAL, LTRIM(SAL, 1)
FROM EMP
WHERE DEPTNO = 20;

--예제4) 
SELECT ENAME, JOB, RTRIM(JOB, 'T'), SAL, RTRIM(SAL, 0)
FROM EMP
WHERE DEPTNO = 10;

--예제5)
--ENAME중 'SC'문자열을 '*?'로 변환하여 출력
SELECT ENAME, REPLACE(ENAME, 'SC', '*?') 변경결과1
FROM EMP
WHERE DEPTNO = 20;

--예제6(61p)
--TRANSLATE(ENAME, 'SC', '*?') -> 연속하지 않아도, S는 *로, C는 ?로 변환하여 반환한다.
--즉, 1:1로 변환하여 반환한다.
--TRANSLATE(ENAME, 'SC', '*') 이렇게 작성시, C위치의 값은 사라지게 된다. EX. SCOTT -> *OTT
--TRANSLATE(ENAME, 'SC', '')이렇게 작성시, 일대일로 대응되지 않으므로 NULL로 변환된다.
SELECT ENAME, TRANSLATE(ENAME, 'SC', '*?') 변경결과2
FROM EMP
WHERE DEPTNO = 20;

--예제7
--TRIM : 왼쪽이나 오른쪽, 양쪽의 지정된 문자나 공백을 제거한 결과를 반환
SELECT 
TRIM(LEADING 'A' FROM 'AABDCADD') 결과1,  --LEADING(LEFT) 왼쪽의 A를 지움
TRIM ('A' FROM 'AABDCADDA') 결과2, --BOTH가 기본값으로 (BOTH 'A' FROM 'AABDCADD')와 같은 의미이다.
TRIM (TRAILING 'D' FROM 'AABDCADD') 결과3,  --TRAILING(RIGHT) 오른쪽의 D를 지움
TRIM(' AABDCADD ') 결과4--TRIM_SOURCE만 작성하면 양옆 빈 공백문자를 제거후 반환한다.
FROM DUAL;

--예제 8
--TRANSLATE를 이용하여 부서가 10인 사원 이름을 소문자로 바꾸어 조회
SELECT EMPNO, ENAME, TRANSLATE(ENAME, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ',  'abcdefghijklmnopqrstuvwxyz') u_lower
FROM EMP
WHERE DEPTNO=10;

SELECT EMPNO, ENAME, LOWER(ENAME)
FROM EMP
WHERE DEPTNO = 20;

--63P
--예제1
--ROUND(반올림)
SELECT ROUND(4567.678) 결과1, --아래와 값이 같다.
ROUND(4567.678,0) 결과2,
ROUND(4567.678,2) 결과3,  --소수점 아래 2자리에서 반올림한다.
ROUND(4567.678,-2) 결과4  --*100
FROM DUAL;

--예제2
--버림
SELECT TRUNC(4567.678) 결과1,
TRUNC(4567.678, 0) 결과2,
TRUNC(4567.678, 2) 결과3,
TRUNC(4567.678, -2) 결과4
FROM DUAL;

--예제3
SELECT 
POWER(2, 10) 결과1,   --2의 10제곱
CEIL(3.7) 결과2,      --올림(소숫점 이하 첫째 자리 올림)
FLOOR(3.7) 결과3,      --내림(소숫점 이하 첫째 자리 내림)
TRUNC(3.7) 결과4      --버림
FROM DUAL;

-- 64P
--예제4
--MOD : 나머지 구하기
SELECT SAL, MOD(SAL, 30) 나머지   --SAL%30
FROM EMP
WHERE DEPTNO = 10;

--예제5
SELECT ENAME, SAL, SIGN(SAL-2975) SIGN --2975보다 크면 1, 같으면 0, 작으면 -1
FROM EMP
WHERE DEPTNO = 20;

--65P
--데이터 베이스 서버의 현재 날짜 및 시간 
SELECT SYSDATE FROM DUAL;
--데이터 베이스 서버의 현재 날짜와 시간을 TIMESTAMP WITH TIME ZONE의 형식으로 반환
SELECT SYSTIMESTAMP FROM DUAL;

--오라클 날짜 형식 조회
SELECT VALUE
FROM NLS_SESSION_PARAMETERS
WHERE PARAMETER='NLS_DATE_FORMAT';

--예제1
SELECT ENAME, HIREDATE, HIREDATE+3, HIREDATE+5/24
FROM EMP
WHERE DEPTNO = 30;

--날짜 형식 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS'; 
COMMIT;

--66P
--예제2
SELECT ENAME, HIREDATE, SYSDATE, SYSDATE-HIREDATE "Total Days",
TRUNC((SYSDATE-HIREDATE)/7,0) Weeks,
ROUND(MOD((SYSDATE-HIREDATE), 7), 0) Days
FROM EMP
ORDER BY SYSDATE-HIREDATE DESC;

--예제3
--EXTRACT함수
SELECT EXTRACT(DAY  FROM SYSDATE) 일자, 
EXTRACT(MONTH FROM SYSDATE) 월,
EXTRACT(YEAR FROM SYSDATE) 년도
FROM DUAL;

--오라클 날짜 형식 조회
SELECT VALUE
FROM NLS_SESSION_PARAMETERS
WHERE PARAMETER = 'NLS_DATE_FORMAT';

--현재 날짜를 나타내는 컬럼
SELECT ENAME, HIREDATE, HIREDATE+3, HIREDATE+5/24
FROM EMP
WHERE DEPTNO = 30;

--예제4
--TIME ZONE :  경도 0도에 있는 그리니치 전문대를 기준으로 한시각의 차이
--대한민국은 9를 더함
--'HH24'는 24시간제 중 시간을 출력하는 형식이다.
SELECT SYSTIMESTAMP A, 
EXTRACT(HOUR FROM SYSTIMESTAMP) B,  --현재 시각(24시간제)에서 9을 뺀 값
TO_CHAR(SYSTIMESTAMP, 'HH24') C --현재 시각(24시간제)
FROM DUAL;

--예제 5
SELECT 
    SYSTIMESTAMP, 
    TO_CHAR(SYSTIMESTAMP, 'HH24') ch, 
    EXTRACT(TIMEZONE_HOUR FROM SYSTIMESTAMP) ETZH, --시차 9 출력
    EXTRACT(HOUR FROM SYSTIMESTAMP) EH, --현재시각-시차(9)
    EXTRACT(HOUR FROM CAST(SYSTIMESTAMP AS TIMESTAMP)) EHC --SYSTIMESTAMP를 TIMESTAMP로 형변환하여 시간을 뽑아내면 현재 시간 출력
FROM DUAL;

--예제 6
SELECT SYSTIMESTAMP, 
EXTRACT(HOUR FROM SYSTIMESTAMP) H1,
EXTRACT(HOUR FROM SYSTIMESTAMP) + EXTRACT(TIMEZONE_HOUR FROM SYSTIMESTAMP) H2
FROM DUAL;

--예제 7
SELECT ENAME, HIREDATE, 
EXTRACT(YEAR FROM HIREDATE) "year",     --입사연도
EXTRACT(MONTH FROM HIREDATE) "month",     --입사연도
EXTRACT (DAY FROM HIREDATE) "day"   --입시일
FROM EMP
WHERE DEPTNO = 20;


--69P
--예제1
SELECT 
    ENAME, HIREDATE, SYSDATE, 
    MONTHS_BETWEEN(SYSDATE, HIREDATE) M_BETWEEN,   -- 현재 날짜에서 입사일자 사이의 개월 수를 출력
    TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE), 0) T_BETWEEN --현재날짜에서 입사날짜 사이의 개월수의 소수점 이하 버림
FROM EMP
WHERE DEPTNO = 10
ORDER BY M_BETWEEN DESC;

---예제2
SELECT ENAME, HIREDATE, 
ADD_MONTHS(HIREDATE, 5) A_MONTH --입사일자에서 5개월을 더한 결과
FROM EMP
WHERE DEPTNO IN (10, 30)    --주소번호가 10또는 30인 사람
ORDER BY HIREDATE DESC;

--에제 3
SELECT ENAME, HIREDATE, NEXT_DAY(HIREDATE, 6) N_6, --입사일자 이후의 금요일에 해당하는 날짜 출력
NEXT_DAY(HIREDATE, 7) N_7   --입사일자 이후의 토요일에 해당하는 날짜를 출력
FROM EMP
WHERE DEPTNO = 10
ORDER BY HIREDATE DESC;

SELECT 
    NEXT_DAY(SYSDATE, 6) N_6,   --오늘 날짜 이후의 금요일 출력
    NEXT_DAY(SYSDATE, 7) N_7    --오늘 날짜 이후의 토요일 출력
    FROM DUAL;

--예제 4
SELECT EMPNO, ENAME, HIREDATE, 
    LAST_DAY(HIREDATE) L_LAST, --입사한 달의 마지막 날짜 출력
    LAST_DAY(HIREDATE) - HIREDATE L_DAY -- 입사한 달의 근무일수(토, 일 포함)
FROM EMP
ORDER BY L_DAY DESC;

--예제 5
SELECT TO_CHAR(SYSDATE, 'YY/MM/DD HH24:MI:SS') NORMAL,  --오늘 날짜를 'YY/MM/DD HH24:MI:SS' 형식으로 변환
    TO_CHAR(TRUNC(SYSDATE), 'YY/MM/DD HH24:MI:SS') TRUNC,    --시간부분을 0으로 초기화
    TO_CHAR(ROUND(SYSDATE), 'YY/MM/DD HH24:MI:SS') ROUND    --현재시간을 기준으로 12시보다 크면 다음 날짜 출력
FROM DUAL;

--예제 6
SELECT HIREDATE, 
    ROUND(HIREDATE, 'MONTH') ,  --입사일자의 '일'을 기준(15일)으로 다음달 혹은 이번달 1일이 출력
    ROUND(HIREDATE, 'YEAR') --입사일자의 '월'을 기준(6월)으로 다음연도 혹은 이번연도의 1월 1일이 출력 
FROM EMP
WHERE DEPTNO = 20;

--예제 7
--TRANC는 버림을 뜻한다.
SELECT HIREDATE, 
    TRUNC(HIREDATE, 'MONTH'),   -- 입사일자의 '일'을 버림 -> 해당 달의 1일로 출력
    TRUNC(HIREDATE, 'YEAR') --입사일자의 '월', '일'을 버림 -> 해당 연의 1월 1일로 출력
FROM EMP
WHERE DEPTNO = 20;