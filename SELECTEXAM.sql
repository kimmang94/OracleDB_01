
-- SELECT [조회할 열 이름], [열이름2], *를사용하면 모든 열 
-- FROM [조회할 테이블명]

SELECT * FROM EMP;

SELECT EMPNO, ENAME, DEPTNO
FROM EMP;

SELECT EMPNO, DEPTNO
FROM EMP;

-- 중복 데이터 삭제
SELECT DISTINCT DEPTNO
FROM EMP;

SELECT DISTINCT JOB, DEPTNO
FROM EMP;

-- 중복되는 열 제거 없이 그대로 출력
SELECT ALL JOB, DEPTNO
FROM EMP;

-- 별칭 설정하기
-- 값 안에서 사칙연산이 가능
SELECT ENAME, SAL, SAL*12+COMM, COMM
FROM EMP;

-- 별칭을 지정하는 방식
-- SAL*12+COMM ANNSAL 연산 및 가공된 문장 이후 한 칸 띄우고 별칭 지정
SELECT ENAME,SAL, SAL*12+COMM ANNSAL
FROM EMP;

-- SAL*12+COMM "ANNSAL" 연산 및 가공된 문장 이후 한칸 띄우고 별칭을 큰따옴표로 묶어 지정
SELECT ENAME, SAL, SAL*12+COMM "ANNSAL"
FROM EMP;

-- 연산 및 가공된 문장 이후 한 칸 띄운 후 'AS', 한칸 뒤에 별칭 지정
SELECT ENAME, SAL, SAL*12+COMM AS ANNSAL 
FROM EMP;

-- 연산 및 가공된 문장 이후 한 칸 띄운 후 'AS', 한 칸 뒤에 별칭을 큰따옴표로 묶어 지정
SELECT ENAME, SAL, SAL*12+COMM AS "ANNSAL"
FROM EMP;

-- AS 방식이 선호된다. (큰따옴표 없는)
