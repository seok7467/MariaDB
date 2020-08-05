CREATE TABLE notice(
n_num INT PRIMARY key,
n_writer VARCHAR(20) NOT null,
n_title VARCHAR(300) NOT NULL,
n_content VARCHAR(10000) NOT NULL,
n_regdate DATETIME NOT NULL);

n_status CHAR(1) NOT NULL, #1. 정상 #2. 삭제(사용자) #3.삭제(관리자) ~~
n_ip VARCHAR(200),
n_hit INT 

INSERT INTO notice(n_num, n_writer, n_title, n_content, n_regdate)VALUE(1,'홍길동','주민번호','',NOW());
INSERT INTO notice(n_num, n_writer, n_title, n_content, n_regdate)VALUE(2,'aaa2','제목','내용',NOW());
INSERT INTO notice(n_num, n_writer, n_title, n_content, n_regdate)VALUE(3,'aaa3','제목','내용',NOW());
INSERT INTO notice(n_num, n_writer, n_title, n_content, n_regdate)VALUE(4,'aaa4','제목','내용',NOW());
INSERT INTO notice(n_num, n_writer, n_title, n_content, n_regdate)VALUE(5,'aaa5','제목','내용',NOW());
INSERT INTO notice(n_num, n_writer, n_title, n_content, n_regdate)VALUE(6,'aaa6','제목','내용',NOW());
INSERT INTO notice(n_num, n_writer, n_title, n_content, n_regdate)VALUE(7,'aaa7','제목','내용',NOW());
INSERT INTO notice(n_num, n_writer, n_title, n_content, n_regdate)VALUE(8,'aaa8','제목','내용',NOW());
INSERT INTO notice(n_num, n_writer, n_title, n_content, n_regdate)VALUE(9,'aaa9','제목','내용',NOW());
INSERT INTO notice(n_num, n_writer, n_title, n_content, n_regdate)VALUE(10,'aaa10','제목','내용',NOW());
INSERT INTO notice(n_num, n_writer, n_title, n_content, n_regdate)VALUE(11,'aaa11','제목','내용',NOW());


SELECT n_num,n_writer,n_title,n_content,date_format(n_regdate,'%Y.%m.%d %h:%i')
FROM notice
ORDER BY n_num DESC
LIMIT 0,10;

SELECT n_num,n_writer,n_title,n_content,date_format(n_regdate,'%Y.%m.%d %h:%i')
FROM notice
WHERE n_num=1;

UPDATE notice
SET n_writer = 'aaa1',n_title='제목1',n_content='내용1',n_regdate=NOW()
WHERE n_num=1;

DELETE FROM notice;

SELECT COUNT(*) FROM notice;

SELECT ifnull(MAX(n_num)+1,1) FROM notice;

SELECT * FROM member;

CREATE TABLE customer(
c_email VARCHAR(128) PRIMARY KEY,
c_pwd VARCHAR(100) NOT NULL,
c_name VARCHAR(50) NOT NULL
);

INSERT INTO customer(c_email,c_pwd,c_name)
VALUE('bbb@bbb.com',PASSWORD('11111111'),'가가가');

SELECT c_email,c_pwd,c_name
FROM customer;

SELECT c_email,c_pwd,c_name
FROM customer
WHERE c_email='aaa@aaa.com' AND c_pwd='11111111';
