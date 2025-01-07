-- 곱산 산술 연산자를 사용한 예
SELECT * 
FROM EMP
WHERE SAL * 12 = 36000;

-- 문자열을 대소 비교 연산자로 비교하기
SELECT *
FROM EMP
WHERE ENAME <= 'FORZ';

-- 등가 비교 연산자(!=)를 사용하여 출력하기

SELECT *
FROM EMP
WHERE SAL != 3000;

-- 등가 비교 연산자(<>) 를 사용하여 출력하기

SELECT *
FROM EMP
WHERE SAL <> 3000;

-- 등가 비교 연산자(^=)를 사용하여 출력하기
SELECT *
FROM EMP
WHERE SAL ^= 3000;

-- NOT 연산자를 사용하여 출력하기

SELECT *
FROM EMP
WHERE NOT SAL = 3000;

-- OR 연산자를 사용하여 여러 개 조건을 만족하는 데이터 출력하기
SELECT *
FROM EMP
WHERE JOB = 'MANAGER'
OR JOB ='SALEMAN'
OR JOB = 'CLERK';

-- IN 연산자를 사용하여 출력하기
SELECT *
FROM EMP
WHERE JOB IN ('MANAGER', 'SALESMANS', 'CLERK');

-- 등가 비교 연산자와 AND 연산자를 사용하여 출력하기
SELECT *
FROM EMP
WHERE JOB != 'MANNAGER'
AND JOB <> 'SALESMAN'
AND JOB ^= 'CLERK';

-- IN 연산자와 논리 부정 연산자를 사용하여 출력하기
SELECT *
FROM EMP
WHERE JOB NOT IN ('MANANGER', 'SALESMAN','CLERK');

-- 대소 비교 연산자와 AND 연산자를 사용하여 출력하기
SELECT *
FROM EMP
WHERE SAL >= 2000
AND SAL <= 3000;

-- BETWEEN A AND B 연산자를 사용하여 출력하기
SELECT *
FROM EMP
WHERE SAL BETWEEN 2000 AND 3000;

-- BETWEEN A AND B 연산자와 NOT 연산자를 사용하여 출력하기
SELECT *
FROM EMP
WHERE SAL NOT BETWEEN 2000 AND 3000;

-- LIKE 연산자 사용하여 출력하기
SELECT *
FROM EMP
WHERE ENAME LIKE 'S%';

-- 사원 이름의 두 번째 글자가 L인 사원만 출력하기
SELECT *
FROM EMP
WHERE ENAME LIKE '_L%'

-- 사원 이름에 AM이 포함되어 있는 사원 데이터만 출력하기
SELECT *
FROM EMP
WHERE ENAME LIKE '%AM%';

-- IS NULL 연산자를 사용하여 출력하기
SELECT *
FROM EMP
WHERE COMM IS NULL;

-- 월급이 1000에서 3000사이인 사원들의 이름과 월급 출력
SELECT ename, sal
FROM emp
WHERE sal BETWEEN 1000 AND 3000;

-- 1982년도에 입사한 사원들의 이름과 입사일을 조회
SELECT ename, hiredate
FROM emp
WHERE hiredate BETWEEN '1982/01/01' AND '1982/12/31'