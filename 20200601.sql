SELECT COUNT(ename) FROM emp;

selECT COUNT(*) FROM emp;

SELECT SUM(sal) FROM emp;

SELECT sal, comm, sal+IFNULL(comm,0)
FROM emp;

SELECT AVG(sal),AVG(IFNULL(comm,0))
FROM emp;

SELECT empno, MAX(sal) FROM emp;

SELECT empno, min(sal) FROM emp;

SELECT deptno, sal 
FROM emp 
ORDER BY deptno ASC;

SELECT deptno, ROUND(AVG(sal))
FROM emp
WHERE sal>=2000
GROUP BY deptno

SELECT deptno, COUNT(deptno), round(AVG(sal),1), SUM(sal)
FROM emp 
GROUP BY deptno;

SELECT job, MAX(sal) maxsal
FROM emp
GROUP BY deptno
ORDER BY maxsal DESC;

SELECT deptno, ROUND(AVG(sal))
FROM emp
WHERE sal >= 1000
GROUP BY deptno
ORDER BY deptno Desc;

SELECT deptno, ROUND(AVG(sal)) avgsal
FROM emp
WHERE sal >= 2000
GROUP BY deptno
ORDER BY ROUND(AVG(sal)) ASC;


SELECT deptno, job, COUNT(*) jobcount
FROM emp 
GROUP BY deptno, job
ORDER BY deptno ASC, jobcount DESC;

SELECT deptno, AVG(sal) AVGSAL
FROM emp
where sal>=1000
GROUP BY deptno
HAVING AVGSAL>=2000
ORDER BY deptno ASC;

#limit a,b: a는 시작위치 b는 길이
#limit 10,20 : 11번째부터 20개 가져옴
SELECT empno, ename, job
FROM emp
ORDER BY hiredate DESC
LIMIT 0,2;

SELECT *
FROM dept;

SELECT empno, ename, deptno
FROM emp;

SELECT deptno, dname, loc
FROM dept;

SELECT empno, ename,dname
FROM emp e, dept d
WHERE d.deptno = e.deptno;

SELECT * 
FROM emp , dept; #일반적인 두 테이블 join (14* 4)

SELECT empno, ename, emp.deptno, dname, loc
FROM emp, dept
WHERE dept.DEPTNO = emp.deptno; #뒤에 있는 값(FK)이 숫자값으로 변함 (14*1)

#emp테이블의 모든 사원들의 이름, 부서번호, 부서명을 출력
SELECT ename, dept.deptno, dname
FROM emp, dept
WHERE dept.DEPTNO = emp.deptno;

#테이블에 alias를 추가하는 경우 좀더 편함
SELECT ename, d.deptno, dname
FROM emp e ,dept d
WHERE d.DEPTNO = e.DEPTNO;

#join  ~ on 표현식을 사용하는 경우
SELECT ename, d.deptno, dname
FROM emp e JOIN dept d
ON d.deptno = e.deptno;

#ansi join : join using
#칼럼 명이 같아야 쓸 수 있음
SELECT ename, d.deptno, dname
FROM emp e JOIN dept d
USING(deptno);

#급여가 3000에서 5000사이의 사원이름과 부서명을 출력
SELECT ename, dname, sal
FROM emp e, dept d
WHERE sal BETWEEN 3000 AND 5000 AND d.deptno = e.deptno ; #데이터를 줄인다음 join하자

#부서명이 'accounting'인 사원의 이름, 입사일, 부서번호,
#부서명을 출력
SELECT ename, hiredate, d.DEPTNO, dname 
FROM emp e, dept d
WHERE d.deptno = e.deptno and dname='accounting';

#커미션이 null이 아닌 사원의 이름, 입사일, 부서명을 출력
#단 입사일은 2020년11월20일 형식으로 출력
SELECT ename,date_format(hiredate,'%Y년 %m월 %d일'),dname, comm
FROM emp e, dept d
WHERE d.deptno = e.DEPTNO AND comm IS NOT NULL;


#부서명이 'accounting'인 사원의 이름, 입사일, 부서번호, 부서명 출력
SELECT ename,date_format(hiredate,'%Y년 %m월 %d일') hiredate ,d.DEPTNO,dNAME
FROM emp e, dept d
WHERE d.deptno=e.deptno AND dname='accounting';

INSERT INTO emp(empno,ename,job,mgr,hiredate,sal,comm)
VALUES(8000,'ERIC','CLERK',7900,'1983-02-25',500,NULL);

SELECT *
FROM emp;

#사원번호, 부서번호, 부서명을 출력
#단, 사원이 근무하지 않는 부서명도 같이 출력
#left join
SELECT empno, e.deptno, dname
FROM emp e left join dept d
on d.deptno = e.deptno;

#emp테이블과 dept테이블을 조인하여
#부서번호 , 부서명, 이름, 급여를 출력
SELECT d.deptno, dname, ename, sal
FROM emp e LEFT JOIN dept d
ON d.deptno = e.deptno
ORDER BY sal desc;

#사원의 이름이 'allen'인 사원의 부서명을 출력
SELECT dname
FROM emp e , dept d
where d.deptno = e.deptno and ename='allen';

#모든 사원의 이름, 부서번호, 부서명, 급여를 춝력
#단 emp 테이블에 없는 부서도 출력
SELECT ename, d.deptno, dname, sal
FROM emp e LEFT JOIN dept d
ON d.deptno = e.deptno;

#사원의이름과 급여, 급여의 등급을 출력
#emp테이블과 salgrade 테이블을 조인해야함

SELECT ename, sal, s.grade
FROM emp e, salgrade s
WHERE sal BETWEEN losal AND hisal
ORDER BY grade DESC;

#사원의 이름과 부서명, 급여의 등급을 출력
#em테이블과 salgrade테이블 조인
SELECT ename, dname, grade
FROM emp e, dept d, salgrade s
WHERE e.DEPTNO = d.deptno AND sal BETWEEN losal AND hisal
ORDER BY grade DESC;

#'smith' 가 근무하는 부서명을 서브쿼리를 이용해서 출력
SELECT ename, dname 
FROM dept d, emp e
WHERE d.deptno = e.deptno and ename='smith';

#'allen'과 같은 부서에서 근무하는 사원의 이름과 부서의 번호 출력
SELECT ename, deptno 
FROM emp
WHERE deptno =(SELECT deptno
FROM emp
WHERE ename = 'allen')


