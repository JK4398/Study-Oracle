--문자열 함수

--대문자UPPER/ 소문자LOWER
SELECT * FROM emp
 WHERE job = UPPER('analyst');
 
 SELECT UPPER('analyst') FROM dual;
 
 SELECT LOWER(ename), LOWER(job) FROM emp  
  WhERE comm IS NOT NULL; 
 
 SELECT LOWER(ename) ename, 
        INITCAP(job) job   --INITCAP 첫 문자만 대문자로
FROM emp  
WhERE comm IS NOT NULL;  --AS를 사용해서 깔끔하게 만들어줌

--LENGTH 길이 (글자수), LENGTHB 바이트수
SELECT ename, LENGTH(ename) 글자수
 FROM emp;
 
 SELECT ename 직원이름, LENGTHB(ename) 바이트수
 FROM emp;
 
 -- SUBSSTRING 글자를 잘라내는 것
 SELECT SUBSTR('안녕하세요. 한가람IT전문학원 빅데이터반입니다.',18,1) phase FROM dual;  
 --FROM dual 가상의 문자 만드는 것
 
 --REPLACE 글자를 대체하는것
 SELECT REPLACE('안녕하세요. 한가람IT전문학원 빅데이터반입니다.','안녕하세요', '저리가세요')
 phase FROM dual;  
 
 -- || = CONCAT 결합
SELECT 'A' || 'B' FROM dual;
SELECT CONCAT('A','B')FROM dual;

--TRIM(정리하다) Left/Right Trim, 앞뒤 여백은 없앨 수 있으나 중간 여백은 안됨. 
SELECT LTRIM('     안녕하세요     ')FROM dual;
SELECT TRIM('     안녕하세요     ')res FROM dual;  --res를 안 쓰면 안 없어짐?


- ROUND 반올림
SELECT ROUND(15.193,1) FROM dual;

-SYSDATE 
SELECT SYSDATE FROM dual;

-- TO_CHAR
SELECT ename, TO_CHAR(hiredate, 'yyyy-mm-dd'), TO_CHAR(sal) || '$' FROM emp;

- TO NUMBER
SELECT TO_NUMBER(REPLACE('2400$', '$','')) + 100 FROM dual;


- TO DATE
SELECT TO_DATE('2022-01-12') FROM dual;
SELECT TO_DATE;

--NULL
SELECT ename, job, sal, NVL(comm,0) comm, 
        (sal*12) + NVL(comm,0)  AS annsal
FROM emp
ORDER BY sal DESC;


-- 집께함수 SUM, COUNT, MIN, MAX, AVG
SELECT sal, NVL(comm,0) FROM emp;
SELECT SUM(sal) totalsalary FROM emp;
SELECT SUM(comm) totalcomm FROM emp;

SELECT MAX(sal)  FROM emp;
SELECT MIN(sal)  FROM emp;
SELECT ROUND(AVG(sal),0) sal_avg FROM emp;


-- GROUP BY 어렵고 중요함

SELECT MAX(sal) 월급최대, SUM(sal) 직업군당급여합계, job
FROM emp
GROUP BY job;

--HAVING  WHERE절은 일반적인 조건검색/ 그룹핑된거에는 HAVING
SELECT MAX(sal) 월급최대, SUM(sal) 직업군당급여합계, job
FROM emp
GROUP BY job
HAVING MAX(sal) > 4000;

--
SELECT deptno, job, AVG(sal), MAX(sal),SUM(sal), COUNT(*)
 FROM emp 
 GROUP BY deptno, job
-- HAVING AVG(sal) >= 1000
 ORDER BY deptno , job ;   --오름차순은 안 써도 내림차순은 써야함 DESC
 
 
 SELECT deptno, NVL(job, '합계') JOB,  
  ROUND(AVG(sal),2) 급여평균, MAX(sal) 급여최대,
  SUM(sal) 급여합계, COUNT(*) 그룹별직원수
  FROM emp 
 GROUP BY ROLLUP (deptno, job);