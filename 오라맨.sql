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

insert into employees values('yusin', '������', 'abc1234','����','1990/12/25','��ȥ',220,'���',null);

insert into employees values('lee', '�̼���', 'abc1234','����','1990/12/25','��ȥ',220,'����','yusin');

insert into employees values('choi', '�ֿ�', 'abc1234','����','1990/12/25','��ȥ',155,'����','yusin');

insert into employees values('kang', '������', 'abc1234','����','1990/12/25','��ȥ',null,'���빮','yusin');

insert into employees(id,name,password,gender,birth,marriage, salary, address,manager)
values('yoon', '������', 'abc1234','����','1990/12/25','��ȥ',230,'���','yusin');

insert into employees(id,name,password,gender,birth,marriage, salary, address,manager)
values('kim9', '�豸', 'abc1234','����','1990/12/25','��ȥ',280,'����',null);

insert into employees(id,name,password,gender,birth,marriage, salary, address,manager)
values('general', '������', 'abc1234','����','1990/12/25','��ȥ',385,'����','kim9');

insert into employees(id,name,password,gender,birth,marriage, salary, address,manager)
values('an', '���߱�', 'abc1234','����','1990/12/25','��ȥ',360,'���빮','kim9');

insert into employees(id,name,password,gender,birth,marriage, address,manager)
values('nongae', '��', 'abc1234','����','1990/12/25','��ȥ','����','soon');

insert into employees(id,name,password,gender,birth,marriage, address,manager)
values('queen', '��������', 'abc1234','����','1990/12/25','��ȥ','���','soon');

insert into employees(id,name,password,gender,birth,marriage, salary, address)
values('soon', '������', 'abc1234','����','1990/12/25','��ȥ',240,'����');

insert into employees(id, salary, manager, address, name, password, gender, birth, marriage)
values('shin', 215, 'kim9', '���빮', '�Ż��Ӵ�','abc1234','����','1990/12/25','��ȥ');

insert into employees(id, salary, manager, address, name, password, gender, birth, marriage)
values('hwang', 215, 'kim9', '���', 'Ȳ����','abc1234','����','1990/12/25','��ȥ');

insert into employees(id, salary, manager, address, name, password, gender, birth, marriage)
values('myoung', 215, 'soon', '����', '������','abc1234','����','1990/12/25','��ȥ');

insert into employees(id, salary, manager, address, name, password, gender, birth, marriage)
values('maria', 215, 'soon', '���빮', '��������','abc1234','����','1990/12/25','��ȥ');

insert into employees(id, salary, manager, address, name, password, gender, birth, marriage)
values('pricess', 215, 'soon', '����', '��������','abc1234','����','1990/12/25','��ȥ');

commit ;

-- 2023/01/31

select * from employees ;

update employees set salary = 500 where name = '������' ;

update employees set salary = 100 ; 

select * from employees ;

-- ��� ȸ�� ������ ���� �ð����� ����
update employees set birth = sysdate ;

-- ��� ȸ�� ����� 'qwert'���� ����
update employees set password = 'qwert' ;

-- ��� ȸ�� ��ȥ�� '��ȥ'���� ����
update employees set marriage = '��ȥ' ;

select * from employees ;

-- ��� ȸ������ �޿� 500����, ����� 'abc123' ���� ����
update employees set salary = 500, password = 'abc123';

-- ���߱��� �޿��� 400���� ����
update employees set salary = 400 where id = 'an' ;

-- ������ '��ȥ' ���� ����
update employees set marriage = '��ȥ' where id = 'yoon' ;

rollback ;

select * from employees; 

-- �������� �޿� 10% �λ�
update employees set salary = 1.1 * salary ; 

-- �������� �޿� 100�� ����
update employees set salary = salary - 100 where id = 'general' ;

-- Ȳ������ �޿� 50�� �λ� �� �ּ����� '����'�� ����
update employees set salary = salary + 50 ,address = '����' where id = 'hwang' ;

-- �ֿ��� '�ֺν�'���� �����߰�, '���빮'���� �̻簬���ϴ�
update employees set name = '�ֺν�' , address = '���빮' where id = 'choi' ;

-- ������ �豸�� ȸ������ �޿��� 600���� ����
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

update employees set salary = 777 where marriage not in ('��ȥ', '��ȥ') ;

select * from employees where marriage not in ('��ȥ', '��ȥ') ;

rollback ;

select * from employees ;

delete from employees where id = 'an' ;

select * from employees ;

rollback; 

delete from employees where manager in ('yusin') and salary >= 220 ;

select * from employees ;

rollback ;

delete from employees where address in ('����' , '���') ;

select * from employees ;

rollback ;

update employees set salary = 100 * rownum ; 

select * from employees ;

-- pseudo column : ����Ŭ �ý����� �������� ���Ǹ� ���Ͽ� ���� Į����
select rownum, rowid, id, salary from employees ;

update employees set salary = 100 * rownum ;

select * from employees ;

commit ;

-- CATS ��� 
create table myemp
as 
select id,name,salary,marriage,gender from employees where marriage in('��ȥ') ;

select * from tab ;
select * from myemp ;

-- ���̺� ����Ʈ : point01 ����
savepoint point01 ;

update myemp set salary = 1000 where gender = '����' ;

select * from myemp ;

savepoint point02 ;

delete from myemp where gender = '����' ; 

-- ���� ���� : ���� 3���� �����ϰ�, �޿����� 1000���� ����

rollback to point02 ;

rollback to point01 ;

select * from myemp ;

select * from employees ;

-- ���� �÷��� ����� ���� �޸��� ����մϴ�.

select id,name,salary from employees ;

select name, salary, id from employees ;

select gender from employees ;

select distinct gender from employees ;

select name, salary, salary + 100 from employees ;

select name, salary, 12*salary from employees; 

-- alias�� �÷��� �̸��� �ѽ������� �ο��ؼ� ����� ��Ī
select name, salary, 1.1*salary �޿�, 12*salary as "ann sal" from employees; 

select name || '�� �޿��� ' || salary || '�� �Դϴ�. ' as result from employees ;

select '�̸� : ' || name || ', ���� : ' || gender || ', �޿� : ' || salary as result from employees ;

select '���� : ' || gender || ', ���� : ' || 12*salary || '�� �Դϴ�.' as result from employees; 

select * from employees ;

select * from employees where id = 'an' ;

select * from employees where salary >= 1000 ;

select * from employees where gender = '����' ;

select * from employees where salary >= 600 and salary <= 1000 ;

select * from employees where salary >= 1100 or salary <= 400 ;

select * from employees where id = 'an' or id = 'soon' ; 

select * from employees where salary = 800 or salary = 1000 ;

-- �� ������ ���� �ǽ�
update employees set salary = null where id in('kang','nongae','queen') ;

commit ;

-- ���� �� �ǵ��� �Ұ����ϸ�, �� ���� ���δ� be ���� is �� ����մϴ�.

-- �޿� å���� �� �� �����
select * from employees where salary is null ;

-- �����ڵ� ��ȸ
select * from employees where manager is null ;

select name,salary,12*salary from employees ;

select * from employees ;

select * from employees where salary between 800 and 1400 ;

select * from employees

where name between '��' and '��' ;

select name, salary from employees where id in ('an','soon') ;

select name, salary from employees where salary in (200,500) ;

select * from employees where name like '��%' ;

select * from employees where name like '%��%' ;

select * from employees where name like '_��%' ;

select * from employees where name like '%��' ; 

select * from employees where id not in ('kim9' ,'yusin' , 'soon' );

select * from employees where marriage not in ('��ȥ') ;

select * from employees where salary not between 900 and 1400 ;

select * from employees where name not like '��%' ;

select * from employees where salary is not null ;

select * from employees where manager is not null ; 

select * from employees
where (salary is not null) and (manager is not null) ;

select * from employees where gender = '����' and salary < 600 ; 

select * from employees where marriage = '��ȥ' and address = '���빮' ;

select * from employees 
where marriage = '��ȥ' or address in ('���', '����')
order by salary asc;

select * from employees where manager = 'kim9' and address = '���빮' ;

select * from employees where name like '��%' or gender in ('����') order by name desc ;

update employees set birth = sysdate where id in('an', 'soon') ;
update employees set birth = null where id in('queen', 'yusin') ;
update employees set birth = '1988/10/10' where id in('kang', 'lee') ;
commit ;

select * from employees ;

select * from employees order by salary ;

select * from employees order by salary asc ;

select * from employees order by name asc;

-- ���̰� ���� ������ ����
select * from employees order by birth desc; 

select * from employees order by name desc;

-- �̸��� ���� ���, ������ ���� ��
select name, 12* salary as annsal from employees order by annsal desc ;

select name, 12*salary as annsal from employees order by 2 desc ; 

select * from employees order by gender desc, salary desc ; 

select * from employees order by birth asc, salary asc ;

select * from employees order by gender asc, marriage desc ;

select * from employees ;

-- 2023/02/01
select * from dual ;

select 4 + 3 from dual ;

select 4 * 4 * 4 from dual ;

select power(2,10) from dual ;

select upper('abc') from dual ;

select mod(12,5) from dual ;

select id, upper(id), lower(id), initcap(id), name from employees ;

select concat('���̵� : ',name) as result from employees ;

select concat(concat(concat('�̸��� ', name), concat('�̰�, �޿��� ',salary)), '�� �Դϴ�') as result from employees;

select substr(password,4) from employees ;

select substr(password,1,3) from employees ;

select substr(password,-5,2) from employees ;

select id, length(id), name, length(name) from employees ;

select id,name,gender,address from employees where length(name) in (2,4) ;

select id,name,instr(id,'o') from employees ;

select * from employees where instr(id,'o') > 0 ;

select id, lpad(id,10,'*') from employees ;

select id, rpad(id,10,'*') from employees ;

select id, replace(id,'o','x') from employees ;

select trim(' abc   123    ') from employees ;

select rtrim('xxxabc123xxx' , 'x') from employees ;

select ltrim('xxxabc123xxx' , 'x') from employees ;

select id, reverse(id) from employees ;

update employees set salary = 1.1 * salary ;
update employees set salary = -123.4567 where id in('queen','nongae') ;
commit ;

select id, name,salary, abs(salary) from employees where gender = '����' ;

select id, name,salary, ceil(salary),floor(salary) from employees where gender = '����' ;

select id,name,salary,round(salary),trunc(salary) from employees where gender = '����' ; 

select sqrt(5) from dual ;

select round(sqrt(5),3) from dual ;

select * from employees ;

select name, sqrt(abs(salary)) from employees where gender = '����' ;

select mod(14,5) from dual ;

select mod(1700,500) from dual ;

select * from employees where mod(length(id), 5) = 0 ;

select power(2,3) from dual ;

select id,name, power(length(id),2) from employees where gender = '����' ;

select name,salary,sign(salary) from employees where gender = '����' ;

select sysdate from dual;

alter session set nls_date_format = 'yyyy-mm-dd hh:mi:ss' ;

select sysdate from dual;

alter session set nls_date_format = 'yy/mm/dd' ;
alter session set nls_date_format = 'yyyy-mm-dd hh:mi:ss' ;
select sysdate from dual ;

select sysdate + 1, sysdate -1 from dual ;

select sysdate, sysdate +2/ 24, sysdate - 5/24/60/60 from dual ;

select name,birth,round(sysdate - birth,3) as "��ƿ� ����" from employees ;

select months_between(sysdate, '2020/01/01') from dual ;

select name,birth,round(months_between(sysdate, birth),3) as result from employees ;

select sysdate, add_months(sysdate,3), add_months(sysdate,-5) from dual ;

select * from employees where id in('kim9','general') ;

update employees set birth = add_months(birth,-5) where id in('kim9','general') ;

select * from employees where id in ('kim9','general');

select * from employees where id in ('hwang','maria');

update employees set birth = birth - 74 where id in('hwang','maria') ;

select * from employees where id in ('hwang', 'maria') ;

select next_day(sysdate, '��') from dual ;

select last_day(sysdate) from dual ;

select round(sysdate,'month') from dual ;

select round(sysdate, 'year') from dual ;

select trunc(sysdate, 'month') from dual ;

select trunc(sysdate,'year') from dual ;

select sysdate, to_char(sysdate, 'yyyy-mm-dd') from dual ;

select name, to_char(birth, 'mm/dd') from employees;

select name, to_char(birth, 'year month') from employees ;

select name, to_char(birth, 'yyyy"Ҵ" mm"��" dd"��"') as "���� ����" from employees;

select 'abc' ||  123 from dual;

select 'abc' ||to_char(123) from dual; 

select

to_char(12345, '$999,999,00')as salary01,
to_char(12345, '$000,000,00')as salary02,
to_char(12345, 'L999,999,00')as salary03,
to_char(12345, '000,000,00')as salary04
from dual;

select 100 + '100' from dual ;

select 100 + to_number('100') from dual ;

-- decode �Լ��� ����Ŭ ���� �Լ��Դϴ�.
rollback;
select * from employees;

select id,name,manager, decode
(manager,'yusin','������ �屺','soon','������ ����','kim9','�豸 ������','������')
as result from employees;

update employees set salary = 200.0 where id = 'nongae' ;
update employees set salary = 300.0 where id = 'queen' ;

commit ;

select nvl('������','����') from dual ;

select nvl(null,'����') from dual ;

select name,salary,nvl(salary,100) newsalary from employees where gender = '����' ;

select name,nvl(manager,'������') newmanager from employees where gender = '����' ;

select name,salary,nvl(salary,100) newsalary,12*nvl(salary,100) annsal from employees 
where gender = '����' ;

select name,salary,nvl2(salary,'�޿� ������','�޿��� null��') from employees where gender = '����' ;

select id,name,marriage, nullif(marriage, '��ȥ') as result from employees where gender = '����' ;

select id,name,marriage, nullif(marriage, '��ȥ') as result from employees where gender = '����' ;

select id,name,marriage, nullif(marriage, '��ȥ') 
as result from employees where gender = '����' ;

update employees set salary = null where id = 'soon' ;
commit ;

select name, coalesce(manager, to_char(salary), '��� ��') as result from employees
where gender = '����' ;

select id, name, manager,case manager
when 'yusin' then '������ �屺'
when 'soon' then '������ ����'
when 'kim9' then '�豸 ������'
else '������' end as result from employees ;

select id, name, manager, salary,case manager
when 'yusin' then 1.1*nvl(salary, 100)
when 'soon' then 1.2*nvl(salary, 100)
when 'kim9' then 1.3*nvl(salary, 100)
else nvl(salary, 100) end as newsalary
from employees ;

select name, nvl(salary, 100),case 
when nvl(salary, 100) < 200 then 'low'
when nvl(salary, 100) < 240 then 'middle'
else 'high' end as result
from employees ;

17 19 8 31 36