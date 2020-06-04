SELECT * FROM emp;

INSERT INTO emp(empno,ename, job,mgr,hiredate,sal,comm,deptno) VALUES
(8002,'kim','SALESMAN',7900,CURDATE(),1000,NULL,40);

UPDATE emp 
SET ename='kim1', job='CLERK',mgr=7782,hiredate=CURDATE(),sal=1001,comm=10,deptno = 30
WHERE empno=8002;

DELETE FROM emp
WHERE empno =8002;

SELECT empno, ename, job,mgr, date_format(hiredate,'%Y.%m.%d'), sal, comm,deptno
FROM emp
ORDER BY empno DESC
LIMIT 0,10;

SELECT empno, ename, job,mgr, date_format(hiredate,'%Y.%m.%d'), sal, comm,deptno
FROM emp
WHERE empno=8001;

START TRANSACTION;

INSERT INTO dept(deptno, dname, loc) VALUES(50,'A1','b1');
INSERT INTO dept(deptno, dname, loc) VALUES(60,'A2','b2');
INSERT INTO dept(deptno, dname, loc) VALUES(70,'A3','b3');
INSERT INTO dept(deptno, dname, loc) VALUES(80,'A4','b4');

COMMIT;
ROLLBACK;


SELECT * FROM dept;

INSERT INTO dept(deptno, dname, loc) VALUES(90,'A5','B5');
INSERT INTO dept(deptno, dname, loc) VALUES(100,'A6','B6');
