INSERT INTO customer(c_email,c_pwd,c_name)
VALUE('ccc@ccc.com',PASSWORD('11111111'),'아아아');

UPDATE customer
SET c_pwd=PASSWORD('22222222'),c_name='성영한1'
	WHERE c_email = 'aaa@aaa.com';

SELECT c_email,c_pwd,c_name
FROM customer;

SELECT c_email, c_name
FROM customer
WHERE c_email = 'aaa@aaa.com';

DELETE FROM customer
WHERE c_email = 'dto.getEmail()';



notice