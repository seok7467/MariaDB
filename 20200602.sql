#'allen'의 급여와 동일하거나 더 많이 받는
#사원의 이름 , 급여 출력
SELECT ename, sal
FROM emp
WHERE sal >=( SELECT sal
FROM emp 
WHERE ename='allen'
);

#'dallad'에서 근무하는 사원의 이름, 부서번호를 출력
SELECT ename, deptno
FROM emp
where deptno =(SELECT deptno 
FROM dept
WHERE loc = 'dallas'
);

#'sales'부서에서 근무하는 모든 사원의 이름과 급여 출력
SELECT ename, sal
FROM emp 
WHERE deptno = (SELECT deptno
FROM dept
WHERE dname='sales'
);

#자신의 직속 상관이 'king'인 사원의 이름과 급여 출력
SELECT ename, sal
from emp
WHERE mgr = (SELECT empno FROM emp WHERE ename = 'king');

#급여를 3000이상 받는 사원이 소속된 부서와 동일한 부서에서 근무하는  사원들의
# 이름과 급여, 부서번호 출력
SELECT ename, sal, deptno
FROM emp
WHERE deptno IN (SELECT deptno FROM emp WHERE sal>=3000);

#in 연산자 이용해 부서별 가장 급여 많이 받는 사원
#의 사원번호, 급여, 부서번호
SELECT empno, sal, deptno
FROM emp
WHERE sal IN(SELECT max(sal) FROM emp GROUP BY deptno);

#직책이 manager인 사람이 속한 부서의 부서번호와 부서명과 부서의 위치를 출력
SELECT deptno, dname, loc
FROM dept
WHERE deptno IN(SELECT deptno FROM emp WHERE job='manager');

#직책이 salesman보다 급여를 많이 받는 사원들의
#이름, 급여 출력(any연산자 이용)
SELECT ename,sal
FROM empWHERE sal > any (SELECT sal FROM emp WHERE job='salesman');


# EMP 테이블에아래와같은사원을추가해보세요.
# EMPNO : 8000 , ENAME :최수만, JOB :방장, MGR : 7900
# HIREDATE :오늘, SAL : 2000, COMM : 100 , DEPTNO : 40

#date => curdate() : 2020-06-02
#datetime => now(): 2020-06-02 11:25:45
insert INTO emp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES(8001,'최수만','방장',7900,CURDATE(),18,100,40);

#member 테이블의내용중num칼럼이1인회원의주소를한국으로수정
UPDATE member
SET addr = '한국'
WHERE num = 1;

#member 테이블내용중num칼럼이2인회원의이름과주소를'aaaaaa' , '일본'으로바꾸기

UPDATE member
SET NAME = 'aaaaaa', addr = '일본'
WHERE num = 2;

#member 테이블에서 num칼럼이 3인 회원의 정보를 삭제
DELETE from member
WHERE num=4;

START TRANSACTION;

INSERT INTO member(num,NAME, addr)VALUES(7,'베조스','미국');
INSERT INTO member(num,NAME, addr)VALUES(8,'머스크','미국');
INSERT INTO member(num,NAME, addr)VALUES(9,'이재용','한국');

COMMIT;
ROLLBACK;

#1이면 autocommit 설정된거, 0이면 아닌거 0모드 쓰는게 안전
#시작할때마다 1로 설정되서 매번 입력해줘야함
SELECT @@autocommit;
SET autocommit =1;


SELECT * FROM member;

#DDL
DROP TABLE test; #트랜젝션이여도 복구 안됨 조심

#varchar(크기): 21842까지 가능
CREATE TABLE test(
num INT, 
NAME VARCHAR(50)
);

#테이블 구조 확인
DESC test;

#테이블 이름 변경
ALTER TABLE test RENAME test1;

#테이블 삭제하기
DROP TABLE test1;

CREATE TABLE dept2(
deptno tinyINT PRIMARY KEY,
dname VARCHAR(15) DEFAULT '영업부',
loc CHAR(1) CHECK(loc IN('1','2'))
);

INSERT INTO dept2(deptno, dname, loc)
VALUES(10,'관리부','1');

#check 제약조건
INSERT INTO dept2(deptno, dname, loc)
VALUES(11,'관리부','3');

#default값 주기
INSERT INTO dept2(deptno, loc)
VALUES(12,'2');

SELECT *
FROM dept2;


CREATE TABLE dept3(
deptno TINYINT PRIMARY KEY,
dname VARCHAR(15) NOT NULL
);

INSERT INTO dept3(deptno, dname) 
VALUES(10,'총무부');

INSERT INTO dept3(deptno, dname) 
VALUES(11,null);

CREATE TABLE emp2(
empno SMALLINT PRIMARY KEY,
ename VARCHAR(15) NOT NULL,
deptno TINYINT,
FOREIGN KEY(deptno) REFERENCES dept2(deptno)
);


INSERT INTO emp2(empno,ename,deptno) VALUES(10,'kim',10);
INSERT INTO emp2(empno,ename,deptno) VALUES(11,'lee',11);
#외래키를 사용할 때 부모 테이블에 존재하는 정보를 사용해야 함.
INSERT INTO emp2(empno,ename,deptno) VALUES(14,'PARK',40);


#칼럼추가
ALTER TABLE dept3 ADD(loc CHAR(1));
DESC dept3;

#칼럼수정
ALTER TABLE dept3 MODIFY loc CHAR(2);
DESC dept3;

#칼럼 이름 수정
ALTER TABLE dept3 CHANGE loc location CHAR(2);
DESC dept3;

#칼럼 삭제
ALTER TABLE dept3 DROP location;
DESC dept3;

CREATE TABLE dept4(
deptno TINYINT,
dname VARCHAR(15),
loc VARCHAR(13)
);

#테이블 복사1
INSERT INTO dept4 SELECT * FROM dept;
SELECT * FROM dept4;

#테이블 복사2
#제약조건 복사 안됨
CREATE TABLE dept5 AS SELECT * FROM dept;
SELECT * FROM dept5;

#테이블 구조만 복사하고 데이터는 복사하지 않음
CREATE TABLE dept6 AS SELECT * FROM dept WHERE 1=2;
SELECT * FROM dept6;

SELECT * FROM member;

update member
set NAME='샤넬1', addr='프랑스1'
WHERE num=9; 

SELECT * FROM member;