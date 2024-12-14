-- SELECT [조회 할 열 이름], [조회할 열 이름]
-- FROM [조회할 테이블 명]
-- 그밖의 절
-- ORDER BY [정렬하려는 열이름(여러 열 지정 가능)][정렬 옵션];
-- ASC(오름차순), DESC (내림차순)

SELECT *
FROM EMP
ORDER BY SAL;

-- EMP 테이블의 모든 열을 급여 기준으로 내림차순 정렬하기
SELECT * 
FROM EMP
ORDER BY SAL DESC;

-- 더 정확하고 다양하게 결과를 출력하는 WHERE 절과 연산자
SELECT *
FROM EMP
WHERE DEPTNO = 30;

-- 사원번호가 7782 인 사원정보만 나오도록 출력하기
SELECT *
FROM EMP
WHERE EMPNO = 7782;

-- 여러 개 조건식을 사용하는 AND, OR 연산자

SELECT *
FROM EMP
WHERE DEPTNO = 30
AND JOB = 'SALESMAN';