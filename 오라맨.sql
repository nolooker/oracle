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

