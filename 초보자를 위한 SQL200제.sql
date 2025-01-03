-- 테이블에서 특정 열(COLUMN) 선택하기

SELECT empno, ename, sal
FROM emp;

-- 테이블에서 모든 열(COLUMN) 출력하기
SELECT * 
FROM emp;

-- 컬럼 별칭을 사용하여 출력되는 컬럼명 변경하기
SELECT empno AS 사원번호, ename AS 사원이름, sal AS "Salary"
FROM emp;


-- 연결 연산자 사용하기 (||)
SELECT ename || sal
FROM emp;

SELECT ename || '의 월급은 ' || sal || '입니다' AS 월급정보
FROM emp;

SELECT ename || '의 직업은 ' || job || '입니다' AS 직업정보
FROM emp;

-- 중복된 데이터를 제거해서 출력하기(DISTINCT)
SELECT DISTINCT job
FROM emp;

SELECT UNIQUE job
FROM emp;

-- 데이터를 정렬해서 출력하기 (ORDER BY)
SELECT ename, sal
FROM emp
ORDER BY sal asc;

SELECT ename, sal AS 월급
FROM emp
ORDER BY 월급 ASC;

SELECT ename, deptno, sal
FROM emp
ORDER BY deptno ASC, sal DESC;

SELECT ename, deptno, sal
FROM emp
ORDER BY 2 ASC, 3 DESC;

-- WHERE절 배우기 (숫자 데이터 검색)
SELECT ename, sal, job
FROM emp
WHERE sal = 3000;

SELECT ename AS 이름, sal AS 월급
FROM emp
WHERE sal >= 3000;

SELECT ename AS 이름, sal AS 월급
FROM emp
WHERE 월급 >= 3000; -- 에러 발생

-- WHERE 절 배우지 2 (문자와 날짜 검색)
SELECT ename, sal, job, hiredate, deptno
FROM emp
WHERE ename ='SCOTT';

SELECT ename, hiredate
FROM emp
WHERE hiredate = '81/11/17';

SELECT *
FROM NLS_SESSION_PARAMETERS
WHERE PARAMETER = 'NLS_DATE_FORMAT';

ALTER SESSION SET NLS_DATE_FORMAT='YY/MM/DD';

SELECT ename, sal
FROM emp
WHERE hiredate='81/11/17';

ALTER SESSION SET NLS_DATE_FORMAT='RR/MM/DD';

-- 산술 연산자 배우기 (*, /, +, -)
SELECT ename, sal*12 AS 연봉
FROM emp
WHERE sal*12 >= 36000;

SELECT ename, sal, comm, sal + comm
FROM emp
WHERE deptno = 10;