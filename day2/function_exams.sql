--���ڿ� �Լ�

--�빮��UPPER/ �ҹ���LOWER
SELECT * FROM emp
 WHERE job = UPPER('analyst');
 
 SELECT UPPER('analyst') FROM dual;
 
 SELECT LOWER(ename), LOWER(job) FROM emp  
  WhERE comm IS NOT NULL; 
 
 SELECT LOWER(ename) ename, 
        INITCAP(job) job   --INITCAP ù ���ڸ� �빮�ڷ�
FROM emp  
WhERE comm IS NOT NULL;  --AS�� ����ؼ� ����ϰ� �������

--LENGTH ���� (���ڼ�), LENGTHB ����Ʈ��
SELECT ename, LENGTH(ename) ���ڼ�
 FROM emp;
 
 SELECT ename �����̸�, LENGTHB(ename) ����Ʈ��
 FROM emp;
 
 -- SUBSSTRING ���ڸ� �߶󳻴� ��
 SELECT SUBSTR('�ȳ��ϼ���. �Ѱ���IT�����п� �����͹��Դϴ�.',18,1) phase FROM dual;  
 --FROM dual ������ ���� ����� ��
 
 --REPLACE ���ڸ� ��ü�ϴ°�
 SELECT REPLACE('�ȳ��ϼ���. �Ѱ���IT�����п� �����͹��Դϴ�.','�ȳ��ϼ���', '����������')
 phase FROM dual;  
 
 -- || = CONCAT ����
SELECT 'A' || 'B' FROM dual;
SELECT CONCAT('A','B')FROM dual;

--TRIM(�����ϴ�) Left/Right Trim, �յ� ������ ���� �� ������ �߰� ������ �ȵ�. 
SELECT LTRIM('     �ȳ��ϼ���     ')FROM dual;
SELECT TRIM('     �ȳ��ϼ���     ')res FROM dual;  --res�� �� ���� �� ������?


- ROUND �ݿø�
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


-- �����Լ� SUM, COUNT, MIN, MAX, AVG
SELECT sal, NVL(comm,0) FROM emp;
SELECT SUM(sal) totalsalary FROM emp;
SELECT SUM(comm) totalcomm FROM emp;

SELECT MAX(sal)  FROM emp;
SELECT MIN(sal)  FROM emp;
SELECT ROUND(AVG(sal),0) sal_avg FROM emp;


-- GROUP BY ��ư� �߿���

SELECT MAX(sal) �����ִ�, SUM(sal) ��������޿��հ�, job
FROM emp
GROUP BY job;

--HAVING  WHERE���� �Ϲ����� ���ǰ˻�/ �׷��εȰſ��� HAVING
SELECT MAX(sal) �����ִ�, SUM(sal) ��������޿��հ�, job
FROM emp
GROUP BY job
HAVING MAX(sal) > 4000;

--
SELECT deptno, job, AVG(sal), MAX(sal),SUM(sal), COUNT(*)
 FROM emp 
 GROUP BY deptno, job
-- HAVING AVG(sal) >= 1000
 ORDER BY deptno , job ;   --���������� �� �ᵵ ���������� ����� DESC
 
 
 SELECT deptno, NVL(job, '�հ�') JOB,  
  ROUND(AVG(sal),2) �޿����, MAX(sal) �޿��ִ�,
  SUM(sal) �޿��հ�, COUNT(*) �׷캰������
  FROM emp 
 GROUP BY ROLLUP (deptno, job);