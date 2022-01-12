## 2일차 학습
### WHERE절

'''sql
SELECT ename, job, sal, sal*12 annsal
  FROM emp 
  WHERE sal IN(800, 1600, 5000);