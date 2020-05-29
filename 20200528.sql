CREATE TABLE member(
num INT PRIMARY KEY,
NAME VARCHAR(50),
addr VARCHAR(50));

DESC member;

INSERT INTO member(num,NAME,addr) VALUES(1,'assdadsa','asddsaasddsa'); #이 방법 씀
INSERT INTO member(num,NAME,addr) VALUES(1,'as','dsa'); #pri key 중복된 값 들어가서 오류
#pri key는 null 값 들어갈 수 없다.
INSERT INTO member(num,NAME) VALUES(3,'sadsa');
INSERT INTO member VALUES	(6,'asdsa','d'); --이건 잘 안씀. 
 
SELECT * FROM member;#알고는 있되 쓰지는 말것 

SELECT num,name from member;

SELECT num, NAME, addr FROM member;

DELETE FROM member WHERE addr = 'd'; # pri key아니면 같은 이름 다 지워질 가능성 있음

UPDATE	member SET addr='ads', NAME = 'bjkdsadsabkjdsabkjbjkdsa' WHERE num = 4;

SELECT * FROM salgrade ;