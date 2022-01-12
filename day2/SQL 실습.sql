-- �� ������ ��ȸ�ϴ� ������
SELECT * FROM emp
WHERE sal = 5000;

SELECT * FROM emp
 WHERE job =  'CLERK';
 
 SELECT * FROM emp
 WHERE comm = 0 OR comm IS NULL;

 SELECT * FROM emp
 WHERE comm = 0 AND comm IS NULL;


--���ʽ��� NULL�̰� ������ ANALYST�� ����� ����
 SELECT * FROM emp
 WHERE comm IS NULL AND job = 'ANALYST';


--��������
SELECT empno, ename, deptno
 FROM emp
 WHERE deptno = 30;
 
 -- ����, �ΰ� �̻��� ���̺��� �ϳ��� ���̺�ó�� ��ȸ�ϴ¹��
 SELECT e.empno, e.ename, e.job, e.hiredate, e.sal, d.deptno, d.dname
  FROM emp e
  JOIN dept d
  ON e. deptno = d.deptno;
  
  -- DISTINCT ����(���� ���� �ߺ����� ��Ÿ��)
  SELECT DISTINCT job FROM emp;
  
  
  -- ��Ī ALIAS 
  SELECT ename, job, sal, sal+sal+sal+sal+sal+sal+sal+sal+sal+sal+sal+sal
   FROM emp;
--�ؿ� ��ó�� ���� ����( ������ ������ ���̴°� ����������)
SELECT ename, job, sal, sal*12+comm
   FROM emp;
   
   --�̸��� annsal�� ���ϴ°�
SELECT ename, job, sal, sal*12 AS annsal 
FROM emp
ORDER BY sal DESC;  --ASC�������� /DESC �������� ASCENDING/DESCENDING


-- WHERE 
SELECT ename, job, sal, sal*12 AS annsal 
 FROM emp   
 WHERE sal <> 1000; -- <> /!= /^=  �´� ���� ������ <>�� ���� ����


SELECT ename, job, sal, sal*12 AS annsal 
 FROM emp   
 WHERE NOT sal = 1000;  --NOT �� != �� ������  (WHERE sal != 1000)
 
 --IN 
 SELECT ename, job, sal, sal*12 annsal
  FROM emp 
  WHERE sal IN(800, 1600, 5000);  --  IN�� ������ = 800 OR sal = 1600 ... �ۼ��ؾ���   ������� ��� �� �ٿ��� �� ����.

--�Ұ���
SELECT ename, job, sal, sal*12 annsal
  FROM emp 
  WHERE sal = 800, 1600, 5000;   
  
  --BETWEEN A AND B
SELECT ename, job, sal, sal*12 annsal
 FROM emp
 WHERE sal >= 1600  AND sal <= 2975;
-- ���� ��
SELECT ename, job, sal, sal*12 annsal
  FROM emp 
  WHERE sal BETWEEN 1600 AND 2975;

--LIKE( j�� �����ϴ� �� �̸� ã�� �� %)
SELECT ename, job, sal, sal*12 annsal
  FROM emp 
  WHERE ename LIKE 'J%'; 
  
-- ES�� ������ �̸�
  SELECT ename, job, sal, sal*12 annsal
  FROM emp 
  WHERE ename LIKE '%ES';
  
 -- E�� ���� ��� 
  SELECT ename, job, sal, sal*12 annsal
  FROM emp 
  WHERE ename LIKE '%E%';
 

 --����� ���ڼ�  
  SELECT ename, job, sal, sal*12 annsal
  FROM emp 
  WHERE ename LIKE '__RD';
  
  
--NULL, �Լ��� NVL() ���߿� �˷���
SELECT ename, job, sal, comm
  FROM emp 
  WHERE comm IS NULL;     -- �ݴ�� IS NOT NULL
  
  --����
  SELECT empno, ename, job FROM emp
  WHERE comm IS NOT NULL
  UNION  ALL
  SELECT deptno, dname, loc FROM dept;
  
  
  