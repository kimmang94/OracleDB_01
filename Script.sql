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