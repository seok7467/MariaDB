SELECT *
FROM emp

SELECT EMPNO,sal, deptno
FROM emp 
ORDER BY sal DESC 

SELECT empno, sal, hiredate
FROM emp
ORDER BY sal ASC

SELECT job,sal
FROM emp
ORDER BY job ASC, sal DESC;

SELECT empno AS "사원번호", ename AS "사원이름"  ##공백이 있는 경우를 위해 ""붙임
FROM emp

SELECT deptno, sal, sal*1.2
FROM emp
WHERE deptno = 10

SELECT deptno, sal, sal+ifnull(comm,0)   # null산술연산 값은 null임 
FROM emp
WHERE deptno=10

SELECT empno, ename, job, mgr,hiredate,sal,comm,deptno
FROM emp
WHERE sal>=3000;

##and보다는 or을 써야 속도 빠름

selecT ename, sal
FROM emp
WHERE deptno = 10 AND sal>=3000

SELECT empno, deptno
FROM emp
WHERE job = 'SALESMAN' OR job ='manager'

SELECT empno, deptno
FROM emp
WHERE job!='clerk' AND job!='analyst' AND job!='president'

DESC emp

SELECT empno,ename, deptno FROM emp
WHERE deptno =10 OR deptno =20;

SELECT empno, ename, deptno FROM emp WHERE deptno IN (10,20);

SELECT empno, ename, sal FROM emp
WHERE sal BETWEEN 1000 AND 2000;

SELECT empno, ename, sal FROM emp
WHERE sal>=1000 AND sal<=2000;

SELECT empno, ename FROM emp
WHERE ename BETWEEN 'ford' AND 'scott'
ORDER BY ename ASC;  #select 하면 order by 필수!
 
# 사원이름이'J'로시작하는사원의사원이름과부서번호를출력
SELECT ename, deptno
FROM emp
WHERE ename LIKE 'j%';

# 사원이름이'J'를 포함하는 사원의 사원이름과부서번호를출력

SELECT ename, deptno
FROM emp
WHERE ename LIKE '%j%';

# 사원의 이름의 두번째 글자가 'a'인 사원의 이름 급여 입사일 출력
SELECT ename, sal, hiredate
FROM emp
WHERE ename LIKE '_a%'

#사원이름이  'es로 끝나는 사원
SELECT ename, sal, hiredate
FROM emp
WHERE ename LIKE '%es'

#입사년도가 81년인 사원
SELECT hiredate,empno
FROM emp
WHERE hiredate LIKE '1981%';

#null인사람 출력
SELECT ename,comm
FROM emp
WHERE comm is NULL;  # '=' 쓰지 말고 is 쓴다

SELECT ename,comm
FROM emp
WHERE comm is not NULL;

SELECT CONCAT(ename,"의 직업은",job,"입니다") intro #intro로 칼럼명 변경
FROM emp

SELECT CHAR(65);

SELECT CONCAT(ename,"님") NAME
FROM emp;

SELECT uppER(ename) #lower
FROM emp;

SELECT LPAD('hi',10,'*') #RPAD

SELECT ename, LENGTH(ename)
FROM emp;

SELECT ename, RPAD(Left(ename,3),LENGTH(ename),'*')
FROM emp;

SELECT ename, SUBSTRING(ename,2,2)
FROM emp;

SELECT FORMAT(123456.3456,2);

SELECT ename, IFNULL(comm,0) FROM emp;

SELECT ABS(-50000000);

SELECT CEIL(4.86789);
SELECT FLOOR(4.99999);
SELECT ROUND(123.546,2);
SELECT TRUNCATE(324343.432432,2);

SELECT NOW();
SELECT ADDDATE(NOW(),INTERVAL 10 minute);


INSERT INTO test(id, sdate, edate)
VALUES('aaaaaa',NOW(),ADDDATE(NOW(),INTERVAL 2 DAY));

INSERT INTO test(id, sdate, edate)
VALUES('bbbbb',NOW(),ADDDATE(NOW(),INTERVAL 20 DAY));

INSERT INTO test(id, sdate, edate)
VALUES('cccccc',NOW(),ADDDATE(NOW(),INTERVAL 40 DAY));

INSERT INTO test(id, sdate, edate)
VALUES('dddd',NOW(),ADDDATE(NOW(),INTERVAL 40 HOUR));

INSERT INTO test(id, sdate, edate)
VALUES('eeee',NOW(),ADDDATE(NOW(),INTERVAL 6 month));


SELECT id, sdate, edate FROM test

SELECT NOW(), SUBDATE(NOW(), INTERVAL 2 HOUR);

SELECT DATEDIFF('2020-06-06', NOW());

SELECT id, DATEDIFF(edate, sdate) diff FROM test;
SELECT TIMESTAMPDIFF(hour,NOW(),'2020-06-06');	

SELECT id, DATE_FORMAT(edate,'%c')
FROM test;