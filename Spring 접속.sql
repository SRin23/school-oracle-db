CREATE TABLE TEST(
    DATA1 number(10),
    DATA2 varchar2(30)
);

SELECT * FROM TEST;

DELETE FROM TEST;


CREATE TABLE USERINFO(
    userid varchar2(30),
    userpass varchar2(30),
    username varchar2(30),
    userAge int
);


SELECT * FROM USERINFO;

DELETE FROM USERINFO;

update userinfo set username = 'SE' where userid = 1;


CREATE TABLE MEMBER(
    NAME varchar2(30),
    PASSWORD varchar2(30),
    EMAIL varchar2(50)
);

select * from member;

insert into member values ('Lee', '2222', 'a@gamil.com');
