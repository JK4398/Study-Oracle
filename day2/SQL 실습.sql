-- 행 단위로 조회하는 셀렉션
SELECT * FROM emp
WHERE sal = 5000;

SELECT * FROM emp
 WHERE job =  'CLERK';
 
 SELECT * FROM emp
 WHERE comm = 0 OR comm IS NULL;

 SELECT * FROM emp
 WHERE comm = 0 AND comm IS NULL;


--보너스가 NULL이고 직업이 ANALYST인 사람만 셀렉
 SELECT * FROM emp
 WHERE comm IS NULL AND job = 'ANALYST';


--프로젝션
SELECT empno, ename, deptno
 FROM emp
 WHERE deptno = 30;
 
 -- 조인, 두개 이상의 테이블을 하나의 테이블처럼 조회하는방법
 SELECT e.empno, e.ename, e.job, e.hiredate, e.sal, d.deptno, d.dname
  FROM emp e
  JOIN dept d
  ON e. deptno = d.deptno;
  
  -- DISTINCT 복습(같은 직업 중복없이 나타냄)
  SELECT DISTINCT job FROM emp;
  
  
  -- 별칭 ALIAS 
  SELECT ename, job, sal, sal+sal+sal+sal+sal+sal+sal+sal+sal+sal+sal+sal
   FROM emp;
--밑에 식처럼 변형 가능( 하지만 셀에서 보이는게 예쁘지않음)
SELECT ename, job, sal, sal*12+comm
   FROM emp;
   
   --이름을 annsal로 정하는것
SELECT ename, job, sal, sal*12 AS annsal 
FROM emp
ORDER BY sal DESC;  --ASC오름차순 /DESC 내림차순 ASCENDING/DESCENDING


-- WHERE 
SELECT ename, job, sal, sal*12 AS annsal 
 FROM emp   
 WHERE sal <> 1000; -- <> /!= /^=  셋다 같은 거지만 <>이 자주 쓰임


SELECT ename, job, sal, sal*12 AS annsal 
 FROM emp   
 WHERE NOT sal = 1000;  --NOT 은 != 랑 같은거  (WHERE sal != 1000)
 
 --IN 
 SELECT ename, job, sal, sal*12 annsal
  FROM emp 
  WHERE sal IN(800, 1600, 5000);  --  IN이 없으면 = 800 OR sal = 1600 ... 작성해야함   결과값을 얻는 걸 줄여줄 수 있음.

--불가능
SELECT ename, job, sal, sal*12 annsal
  FROM emp 
  WHERE sal = 800, 1600, 5000;   
  
  --BETWEEN A AND B
SELECT ename, job, sal, sal*12 annsal
 FROM emp
 WHERE sal >= 1600  AND sal <= 2975;
-- 같은 뜻
SELECT ename, job, sal, sal*12 annsal
  FROM emp 
  WHERE sal BETWEEN 1600 AND 2975;

--LIKE( j로 시작하는 얘 이름 찾을 때 %)
SELECT ename, job, sal, sal*12 annsal
  FROM emp 
  WHERE ename LIKE 'J%'; 
  
-- ES로 끝나는 이름
  SELECT ename, job, sal, sal*12 annsal
  FROM emp 
  WHERE ename LIKE '%ES';
  
 -- E가 들어가는 사람 
  SELECT ename, job, sal, sal*12 annsal
  FROM emp 
  WHERE ename LIKE '%E%';
 

 --언더바 글자수  
  SELECT ename, job, sal, sal*12 annsal
  FROM emp 
  WHERE ename LIKE '__RD';
  
  
--NULL, 함수명 NVL() 나중에 알려줌
SELECT ename, job, sal, comm
  FROM emp 
  WHERE comm IS NULL;     -- 반대는 IS NOT NULL
  
  --집합
  SELECT empno, ename, job FROM emp
  WHERE comm IS NOT NULL
  UNION  ALL
  SELECT deptno, dname, loc FROM dept;
  
  
  