-- 테이블 생성하기
-- default는 기본 값 지정시 사용
-- sysdate : 현재 시각을 의미하는 오라클 내장 함수
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

insert into employees(id,name,password,gender,birth,marriage,salary,address,manager)
values('yusin','김유신','abc123','남자','1990/12/25','결혼',220,'용산',null) ;

insert into employees(id,name,password,gender,birth,marriage,salary,address,manager)
values('choi','최명','abc1234','남자','1990/12/25','결혼',220,'용산',null) ;

insert into employees(id,name,password,gender,birth,marriage,salary,address,manager)
values('kang','강감찬','abc123','남자','1990/12/25','결혼',220,'용산',null) ;

-- 회원 테이블 조회하기
select * from employees


-- 커밋) 이전에 실행한 구문들을 모두 영구 저장
commit ;
-- 롤백) 이전에 실행한 구문들을 없던 일로 하는 것
-- rollback ;

-- 내가 보유한 테이블 리스트
select * from tab;

-- 해당 테이블 구조 간략히 보기
desc empolyees;

alter table employees add (hphone varchar2(15));
alter table employees add (nickname varchar2(30) default'철수');
alter table employees add (age number default 0);

select * from employees ;

alter table employees modify(id varchar2(30));

insert into employees(id,name,password,gender,birth,marriage,salary,address,manager)
values('yusinyusinyusinyusinyusin','김유신','abc123','남자','1990/12/25','결혼',220,'용산',null) ;

commit ;
select * from employees;

alter table employees rename column hphone to handphone;
alter table employees rename column manager to mgr ;

alter table employees drop column handphone ;
alter table employees drop column nickname ;
alter table employees drop column age ; 

select * from employees;

rename employees to emp99 ;

select * from tab ;

drop table emp99 purge ;

select * from tab ;

