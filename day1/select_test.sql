--  �ּ�, �Ʒ��� select ������ ����
SELECT *FROM emp;

--�÷��� �����ؼ� select
SELECT ename, job, hiredate
   FROM emp;
   
   --�μ��� ���(�ߺ�����:DISTINCT)
   SELECT DISTINCT deptno
    FROM emp;
    
    --�̰��� �ߺ� ���Ű� �ȵ� �ߺ�����
    SELECT DISTINCT empno, deptno
     FROM emp;
     
     SELECT DISTINCT job, deptno 
      FROM emp;
      
      --������ where
      SELECT * FROM emp
      WHERE empno = 7499;
      
      SELECT * FROM emp
      WHERE ename = 'ȫ�浿';
    
   SELECT * FROM emp
      WHERE job = 'CLERK';   
      
      --�޿��� sal�� 1500 �̻��� ��� ��ȸ
      SELECT * FROM emp
      WHERE sal > 1500;