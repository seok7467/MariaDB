SELECT *
FROM member;


DELETE FROM member
WHERE num=9;

SELECT num, NAME, addr
FROM member
ORDER BY num DESC;

update member
set NAME='샤넬1', addr='프랑스1'
WHERE num=9;

SELECT *
FROM member;

DELETE FROM member WHERE num = 8;

SELECT num, NAME, addr
FROM member
WHERE num=1;