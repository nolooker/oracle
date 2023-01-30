-- ���̺� �����ϱ�
-- default�� �⺻ �� ������ ���
-- sysdate : ���� �ð��� �ǹ��ϴ� ����Ŭ ���� �Լ�
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
values('yusin','������','abc123','����','1990/12/25','��ȥ',220,'���',null) ;

insert into employees(id,name,password,gender,birth,marriage,salary,address,manager)
values('choi','�ָ�','abc1234','����','1990/12/25','��ȥ',220,'���',null) ;

insert into employees(id,name,password,gender,birth,marriage,salary,address,manager)
values('kang','������','abc123','����','1990/12/25','��ȥ',220,'���',null) ;

-- ȸ�� ���̺� ��ȸ�ϱ�
select * from employees


-- Ŀ��) ������ ������ �������� ��� ���� ����
commit ;
-- �ѹ�) ������ ������ �������� ���� �Ϸ� �ϴ� ��
-- rollback ;

-- ���� ������ ���̺� ����Ʈ
select * from tab;

-- �ش� ���̺� ���� ������ ����
desc empolyees;

alter table employees add (hphone varchar2(15));
alter table employees add (nickname varchar2(30) default'ö��');
alter table employees add (age number default 0);

select * from employees ;

alter table employees modify(id varchar2(30));

insert into employees(id,name,password,gender,birth,marriage,salary,address,manager)
values('yusinyusinyusinyusinyusin','������','abc123','����','1990/12/25','��ȥ',220,'���',null) ;

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

