create table employees(

id varchar2(20) primary key,
name varchar2(30) not null,
password varchar2(30) not null,
gender varchar2(10),
birth date default sysdate,
marriage varchar2(30),
salary number default 100,
address varchar2(50),
manager varchar2(50)

);

insert into employees values('yusin', '김유신', 'abc1234','남자','1990/12/25','결혼',220,'용산',null);

insert into employees values('lee', '이순신', 'abc1234','남자','1990/12/25','이혼',220,'마포','yusin');

insert into employees values('choi', '최영', 'abc1234','남자','1990/12/25','결혼',155,'강남','yusin');

insert into employees values('kang', '강감찬', 'abc1234','남자','1990/12/25','이혼',null,'서대문','yusin');

insert into employees(id,name,password,gender,birth,marriage, salary, address,manager)
values('yoon', '윤봉길', 'abc1234','남자','1990/12/25','미혼',230,'용산','yusin');

insert into employees(id,name,password,gender,birth,marriage, salary, address,manager)
values('kim9', '김구', 'abc1234','남자','1990/12/25','결혼',280,'강남',null);

insert into employees(id,name,password,gender,birth,marriage, salary, address,manager)
values('general', '김좌진', 'abc1234','남자','1990/12/25','이혼',385,'마포','kim9');

insert into employees(id,name,password,gender,birth,marriage, salary, address,manager)
values('an', '안중근', 'abc1234','남자','1990/12/25','결혼',360,'서대문','kim9');

insert into employees(id,name,password,gender,birth,marriage, address,manager)
values('nongae', '논개', 'abc1234','여자','1990/12/25','미혼','강남','soon');

insert into employees(id,name,password,gender,birth,marriage, address,manager)
values('queen', '선덕여왕', 'abc1234','여자','1990/12/25','결혼','용산','soon');

insert into employees(id,name,password,gender,birth,marriage, salary, address)
values('soon', '유관순', 'abc1234','여자','1990/12/25','미혼',240,'마포');

insert into employees(id, salary, manager, address, name, password, gender, birth, marriage)
values('shin', 215, 'kim9', '서대문', '신사임당','abc1234','여자','1990/12/25','미혼');

insert into employees(id, salary, manager, address, name, password, gender, birth, marriage)
values('hwang', 215, 'kim9', '용산', '황진이','abc1234','여자','1990/12/25','결혼');

insert into employees(id, salary, manager, address, name, password, gender, birth, marriage)
values('myoung', 215, 'soon', '강남', '명성왕후','abc1234','여자','1990/12/25','이혼');

insert into employees(id, salary, manager, address, name, password, gender, birth, marriage)
values('maria', 215, 'soon', '서대문', '조마리아','abc1234','여자','1990/12/25','이혼');

insert into employees(id, salary, manager, address, name, password, gender, birth, marriage)
values('pricess', 215, 'soon', '마포', '덕혜옹주','abc1234','여자','1990/12/25','결혼');

commit ;

-- 2023/01/31

select * from employees ;

update employees set salary = 500 where name = '김유신' ;

update employees set salary = 100 ; 

select * from employees ;

-- 모든 회원 생일을 현재 시각으로 수정
update employees set birth = sysdate ;

-- 모든 회원 비번을 'qwert'으로 수정
update employees set password = 'qwert' ;

-- 모든 회원 결혼을 '결혼'으로 수정
update employees set marriage = '결혼' ;

select * from employees ;

-- 모든 회원들의 급여 500으로, 비번을 'abc123' 으로 수정
update employees set salary = 500, password = 'abc123';

-- 안중근의 급여를 400으로 변경
update employees set salary = 400 where id = 'an' ;

-- 윤봉길 '이혼' 으로 변경
update employees set marriage = '이혼' where id = 'yoon' ;

rollback ;

select * from employees; 

-- 직원들의 급여 10% 인상
update employees set salary = 1.1 * salary ; 

-- 김좌진의 급여 100원 감봉
update employees set salary = salary - 100 where id = 'general' ;

-- 황진이의 급여 50원 인상 및 주소지를 '마포'로 변경
update employees set salary = salary + 50 ,address = '마포' where id = 'hwang' ;

-- 최영이 '최부식'으로 개명했고, '서대문'으로 이사갔습니다
update employees set name = '최부식' , address = '서대문' where id = 'choi' ;

-- 관리자 김구인 회원들의 급여를 600으로 변경
update employees set salary = 600 where manager = 'kim9' ;

update employees set salary = 300 where salary <= 200 ; 

update employees set salary = 700 where manager = 'yusin' and salary >= 250 ;

update employees set salary = 450 where id = 'kim9' or id = 'hwang' ;

select * from employees where id = 'kim9' or id = 'hwang' ;

select * from tab ;

select * from employees ;

update employees set salary = 1000 where id in ('kim9','hwang') ;

select * from employees where id in ('kim9','hwang') ; 

update employees set salary = 555 where manager in ('yusin','soon') ;

select * from employees where manager in ('yusin','soon') ;

update employees set salary = 777 where marriage not in ('미혼', '이혼') ;

select * from employees where marriage not in ('미혼', '이혼') ;

rollback ;

select * from employees ;

delete from employees where id = 'an' ;

select * from employees ;

rollback; 

delete from employees where manager in ('yusin') and salary >= 220 ;

select * from employees ;

rollback ;

delete from employees where address in ('마포' , '용산') ;

select * from employees ;

rollback ;

update employees set salary = 100 * rownum ; 

select * from employees ;

