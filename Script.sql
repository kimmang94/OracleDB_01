-- 테이블에서 특정 열(Column) 선택하기

SELECT empno, ename, sal
FROM emp;

-- 테이블에서 모든 열(Column) 출력하기

SELECT *
FROM emp;

-- * 를 사용하지 않는다면 전체 열들을 나열해 줘야한다

SELECT empno,
ename,
job,
mgr,
hiredate,
sal,
comm,
deptno
FROM emp;

-- 컬럼 별칭을 사용하여 출력되는 컬럼명 변경하기

SELECT empno AS 사원번호,
ename AS 사원이름,
sal AS "Salary"
FROM emp;

-- 연결 연산자 사용하기 (||)
SELECT ename || sal
FROM emp;

SELECT ename || '의 월급은' || sal || '입니다' AS 월급정보
FROM emp;


-- 중복된 데이터를 제거해서 출력하기 (DISTINCT)
SELECT DISTINCT job
FROM emp;

-- 데이터를 정렬해서 출력하기 (ORDER BY)
SELECT ename, sal
FROM emp
ORDER BY sal ASC;

-- 컬럼 별칭을 사용한 ORDER BY
SELECT ename, sal AS 월급
FROM emp
ORDER BY 월급 ASC;

SELECT ename, deptno, sal
FROM emp
ORDER BY deptno ASC, sal DESC;

-- 컬럼명 대신 숫자
SELECT ename, deptno, sal
FROM emp
ORDER BY 2 ASC, 3 DESC;

-- WHERE 절 배우기 (숫자 데이터 검색)

SELECT ename, sal, job
FROM emp
WHERE sal = 3000;

-- 월급이 3000 이상인 사원들의 이름과 월급을 출력하는 SQL 문장
SELECT ename AS 이름, sal AS 월급
FROM emp
WHERE sal >= 3000;

-- 컬럼 별칭을 사용한 WHERE (에러 발생)
--SELECT ename AS 이름, sal AS 월급
--FROM emp
--WHERE 월급 >= 3000;

-- WHERE 절 배우기 (문자와 날짜 검색)
SELECT ename, sal, job, hiredate, deptno
FROM emp
WHERE ename = 'SCOTT'

-- 81년 11월 17일에 입사한 사원의 이름과 입사일
SELECT ename, hiredate
FROM emp
WHERE hiredate = '81/11/17'

SELECT *
FROM NLS_SESSION_PARAMETERS
WHERE PARAMETER = 'NLS_DATE_FORMAT';

ALTER SESSION SET NLS_DATE_FORMAT='YY/MM/DD';

SELECT ename, sal
FROM emp
WHERE hiredate = '81/11/17'

-- 날짜 형식 변경
ALTER SESSION SET NLS_DATE_FORMAT='RR/MM/DD'


-- 산술 연산자 배우기 (*. /, +, -)
SELECT ename, sal * 12 AS 연봉
FROM emp
WHERE sal*1 >= 36000

-- 부서번호가 10인 사원들의 이름, 월급, 커미션, 월급 + 커미션
SELECT ename, sal, comm, sal + comm
FROM emp
WHERE deptno = 10;

-- 비교 연산자 배우기 (>, <, >=, <=, =, !=, <>, ^=)
SELECT ename, sal, job, deptno
FROM emp
WHERE sal <= 1200;

-- 비교 연산자 배우기 (BETWEEN AND)
SELECT ename, sal
FROM emp
WHERE sal BETWEEN 1000 AND 3000;

SELECT ename, sal
FROM emp
WHERE (sal >= 1000 AND sal <= 3000);

-- 월급이 1000에서 3000사이가 아닌 사원들의 이름과 월급 조회
SELECT ename, sal
FROM emp
WHERE sal NOT BETWEEN  1000 AND 3000;

SELECT ename, sal
FROM emp
WHERE (sal < 1000 OR sal > 3000);

-- 1982년도에 입사한 사원들의 이름과 입사일을 조회
SELECT ename, hiredate
FROM emp
WHERE hiredate BETWEEN '1982/01/01' AND '1982/12/31'

-- 비교 연산자 배우기 (LIKE)
SELECT ename, sal
FROM emp
WHERE ename LIKE 'S%';

SELECT ename
FROM emp
WHERE ename LIKE '_M%'

-- 이름의 끝 글자가 T로 끝나는 사원
SELECT ename
FROM emp
WHERE ename LIKE '%T';

SELECT ename 
FROM emp
WHERE ename LIKE '%A%';

-- 비교 연산자 배우기 (IS NULL)
SELECT ename, comm
FROM emp
WHERE comm IS NULL;

-- 비교 연산자 배우기 (IN)
SELECT ename, sal, job
FROM emp
WHERE job IN ('SALESMAN', 'ANALYST', 'MANAGER')

-- 위 예제와 동일한 결과를 출력하는 SQL
SELECT ename, sal, job
FROM emp
WHERE (job = 'SALESMAN' OR job = 'ANALYST' OR job = 'MANAGER')

-- 직업이 SALESMAN, ANALYST, MANAGER 가 아닌 사원들의 이름과 월급, 직업 검색
SELECT ename, sal, job
FROM emp
WHERE job NOT IN ('SALESMAN', 'ANAYST', 'MANAGER')

-- 논리 연산자 배우기 (AND , OR, NOT)

SELECT ename, sal, job
FROM emp
WHERE job = 'SALESMAN' AND sal >= 1200;

SELECT ename, sal, job
FROM emp
WHERE job = 'ABCDEFG' AND sal = 1200;

-- 대소문자 변환 함수 배우기 (UPPER, LOWER, INITCAP)
SELECT UPPER(ename), LOWER(ename), INITCAP(ename)
FROM emp;

SELECT ENAME, SAL
FROM emp
WHERE LOWER(ename) = 'SMITH';

-- 문자에서 특정 철자 추출하기 (SUBSTR)
SELECT SUBSTR('SMITH',1,3)
FROM DUAL;

-- 문자열의 길이를 출력하기 (LENGTH)
SELECT ename, LENGTH(ename)
FROM emp;

-- 문자에서 특정 철자의 위치 출력하기 (INSTR)
SELECT INSTR('SMITH','M')
FROM DUAL;

SELECT INSTR('abcedfg@naver.com', '@')
FROM DUAL;

SELECT SUBSTR('abcdefgh@naver.com', INSTR('abcdefgh@naver.com', '@') +1)
FROM DUAL;

-- 특정 철자를 다른 철자로 변경하기 (REPLACE)
SELECT ename, REPLACE(sal, 0, '*')
FROM emp;

SELECT ename, REGEXP_REPLACE(sal, '[0-3]', '*') AS SALARY
FROM emp;

-- 특정 철자를 N개 만큼 채우기 (LPAD, RPAD)
SELECT ename, LPAD(sal, 10, '*') AS aslary1, RPAD(sal, 10, '*') AS salary2
FROM emp;

-- 특정 철자 잘라내기 (Trim, RTRIM, LTRIM)
SELECT 'smith', LTRIM('smith', 's'), RTRIM('smith', 'h'), TRIM('s' FROM 'smiths')
FROM dual;

INSERT INTO emp(empno,ename,sal,job,deptno) values(8291, 'JACK ', 3000, 'SALESMAN', 30);
COMMIT;

SELECT ename, sal
FROM emp
WHERE ename='JACK';

SELECT ename, sal
FROM emp
WHERE RTRIM(ename)='JACK';

DELETE FROM EMP WHERE TRIM(ENAME) = 'JACK';
COMMIT;

-- 반올림해서 출력하기 (ROUND)
SELECT '876.567' AS 숫자, ROUND(876.567,1)
FROM dual;

-- 숫자를 버리고 출력하기 (TRUNC)
SELECT '876.567' AS  숫자, TRUNC(876.567,1)
FROM dual;

-- 나눈 나머지 값 출력하기 (MOD)
SELECT MOD(10,3)
FROM DUAL;

SELECT empno, ename
FROM emp
WHERE MOD (empno,2) = 0;

SELECT FLOOR(10/3)
FROM DUAL;

-- 날짜 간 개월 수 출력하기 (MONTHS_BETWEEN)
SELECT ename, MONTHS_BETWEEN(sysdate, hiredate)
FROM emp;

-- 2018년 10월 1일에서  2019년 6월 1일 사의의 총일수 출력
SELECT TO_DATE('2019-06-01', 'RRRR-MM-DD') - TO_DATE('2018-10-01','RRRR-MM-DD')
FROM dual;

-- 2018년 10월 1일 에서 2019년 6월1일 사이의 총 주 수 출력
SELECT ROUND((TO_DATE('2019-06-01', 'RRRR-MM-DD') - TO_DATE('2018-10-01','RRRR-MM-DD')) / 7 ) AS "총 주수"
FROM dual;

-- 2019년 5월 1일부터 100일 후 돌아오는 날짜

SELECT TO_DATE('2019-05-01','RRRR-MM-DD') + 100
FROM DUAL;

SELECT TO_DATE('2019-05-01', 'RRRR-MM-DD') + INTERVAL '100' MONTH 
FROM DUAL;

SELECT TO_DATE('2019-05-01', 'RRRR-MM-DD') + INTERVAL  '1-3' year(1) TO MONTH
FROM dual;


SELECT TO_DATE('2019-05-01', 'RRRR-MM-DD') + INTERVAL  '3' YEAR 
FROM dual;

-- TO_YMINTERVAL 함수를 이용
SELECT TO_DATE('2019-05-01', 'RRRR-MM-DD') + TO_YMINTERVAL('03-05') AS 날짜
FROM dual;

-- 특정 날짜 뒤에 오는 요일 날짜 출력하기 (NEXT_DAY)

SELECT '2019/05/22' AS 날짜, NEXT_DAY('2019/05/22', '월요일')
FROM DUAL;

SELECT SYSDATE AS "오늘 날짜"
FROM DUAL;

-- 오늘부터 앞으로 돌아올 화요일의 날짜 출력
SELECT NEXT_DAY(SYSDATE, '화요일') AS "다음 날짜"
FROM DUAL;

-- 오늘부터 100달 뒤에 돌아오는 월요일의 날짜 출력
SELECT NEXT_DAY(ADD_MONTHS(sysdate,100),'월요일') AS "다음 날짜"
FROM DUAL;

-- 특정 날짜가 있는 달의 마지막 날짜 출력하기 (LAST_DAY)
SELECT '2019/05/22' AS 날짜, LAST_DAY('2019/05/22') AS "마지막 날짜"
FROM DUAL;

-- 오늘부터 이번달 말일까지 총 며칠 남았는지 출력
SELECT LAST_DAY(SYSDATE) - SYSDATE  AS "남은 날짜"
FROM DUAL;

-- 이름이 KING인 사원의 이름, 입사일, 입사한 달의 마지막 날짜를 출력하는 쿼리
SELECT ename, hiredate, LAST_DAY(hiredate)
FROM emp
WHERE ename='KING';

-- 문자형으로 데이터 유형 변환하기 (TO_CHAR)
SELECT ename, TO_CHAR(hiredate, 'DAY') AS 요일, TO_CHAR(sal, '999,999') AS 월급
FROM emp
WHERE ename = 'KING'

SELECT hiredate, TO_CHAR(hiredate,'RRRR') AS 연도, TO_CHAR(hiredate, 'MM') AS 달,
	             TO_CHAR(hiredate,'DD') AS 일, TO_CHAR(hiredate, 'DAY') AS 요일
FROM emp
WHERE ename = 'KING'

-- 1981년도에 입사한 사원의 이름과 입사일 출력
SELECT ename, hiredate
FROM emp
WHERE TO_CHAR(hiredate,'RRRR') = '1981';

-- 날짜 컬럼에서 연도/월/일/시간/분/초를 추출하기 위해 EXTRACT 함수 사용하기
SELECT ename AS 이름, EXTRACT (YEAR FROM hiredate) AS 연도,
					 EXTRACT(MONTH FROM hiredate) AS 달,
					 EXTRACT(DAY FROM hiredate) AS 요일
FROM emp;

-- 월급을 출력할 때 천 단위를 표시해서 출력
SELECT ename AS 이름, to_char(sal, '999,999') AS 월급
FROM emp;

-- 천단위와 백만 단위를 표시하는 예제
SELECT ename AS 이름, TO_CHAR(sal * 200 , '999,999,999') AS 월급
FROM emp;

-- 알파벳 L 을 사용하면 화폐만뒤를 붙여 출력할 수 있다.

SELECT ename AS 이름, TO_CHAR(sal * 200, 'L999,999,999') AS 월급
FROM emp;

-- 날짜 형으로 데이터 유형 변환하기(TO_DATE)
SELECT ename, hiredate
FROM emp
WHERE HIREDATE = TO_DATE('81/11/17', 'RR/MM/DD');

SELECT *
FROM NLS_SESSION_PARAMETERS
WHERE PARAMETER = 'NLS_DATE_FORMAT';

-- 결과가 RR/MM/DD 라고 한다면 날자를 검색할 때 다음과 같이 해야한다
SELECT ename, hiredate
FROM emp
WHERE hiredate = '81/11/17'

-- 내가 접속한 세션의 날짜 형식을 DD/MM/RR 로 변경해보고 검색하기

ALTER SESSION SET NLS_DATE_FORMAT='DD/MM/RR';

SELECT ename,hiredate
FROM emp
WHERE hiredate = '17/11/81';

SELECT ename, hiredate
FROM emp
WHERE hiredate = TO_DATE('81/11/17', 'RR/MM/DD');

ALTER SESSION SET NLS_DATE_FORMAT='RR/MM/DD';

-- 암시적 형 변환 이해하기
SELECT ename, sal
FROM emp
WHERE sal = '3000';

CREATE TABLE EMP32
(
	ENAME VARCHAR2(10),
	SAL VARCHAR2(10)
);

INSERT INTO EMP32 VALUEs('SCOTT', '3000');
INSERT INTO EMP32 VALUES('SMITH', '1200');
COMMIT;

SELECT ename, sal
FROM emp32
WHERE sal = '3000';

SELECT ename, sal
FROM emp32
WHERE sal = 3000;

SET AUTOT ON

SELECT ename, sal
FROM emp32
WHERE SAL = 3000;

-- NULL 값 대신 다른 데이터 출력하기 (NVL, NVL2)
SELECT ename, comm, NVL(comm,0)
FROM emp;

SELECT ename, sal, comm, sal +  comm
FROM emp
WHERE job IN ('SALESMAN', 'ANALYST')

-- NULL 을 0으로 치환하여 월급 + 커미션 출력
SELECT ename, sal, comm, NVL(comm,0), sal + NVL(comm,0)
FROM emp
WHERE job IN ('SALESMAN', 'ANALYST');



