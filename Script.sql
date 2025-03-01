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
