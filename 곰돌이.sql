create table Books(

bid varchar2(30) not null,
bname varchar2(40),
publisher varchar2(40),
price number default 0,
inputdate date default sysdate

);

insert into Books values('java','�ڹ� ���α׷���','���� ���ǻ�',7000,'70/08/28');
insert into Books values('jsp','jsp ���α׷���','���� Books',8000,'80/08/');
insert into Books values('python','���̽� ���α׷���','�α� �̵��',9000,'90/07/17');
insert into Books values('r','R ���α׷���','�α� �̵��',35000,'75/11/11');
insert into Books values('database','������ ���̽� ����','���� ���ǻ�',8000,'78/03/01');
insert into Books values('mybatis','���̹�Ƽ��','���� ���ǻ�',7500,'45/08/15');
insert into Books values('spring','������ Framework','�Ҽ� �̵��',20000,'50/06/25');
insert into Books values('xml','xml ���α׷���','�Ҽ� �̵��',13000,'70/06/06');
insert into Books values('story','���α׷��� �̾߱�','���ȴ�',6000,'70/09/09');
insert into Books values('timeseries','�ð迭 ����','���ȴ�',13000,'50/06/25');

commit ;

-- ��� å���� �ܰ��� 1000������ ������ ������. 
update Books set price = 1000 ;

select * from Books ;

-- ��� ���ǻ��� �̸��� '���� ���ǻ�'���� ������ ������. 
update Books set bname = '���� ���ǻ�' ;
select * from Books ;

-- ��� ���ǻ��� �̸��� '���� ���ǻ�'�� �ܰ��� 5000���� ������ ������.
update Books set bname = '���� ���ǻ�' , price = 5000 ;

select * from Books ;

-- �����͸� �ѹ��Ͻð�, ���� ���̵� 'java'�� ������ �ܰ��� 4000���� ������ ������.
rollback ;
select * from Books ;

update Books set price = 4000 where bid = 'java' ;
select * from Books ;

-- ��� �����鿡 ���Ͽ� ���� 10%�� �λ��� ������.
update books set price = 1.1 * price ;
select * from Books ;

-- ���̵� 'database'�̰ų� 'xml'�� å�� �ܰ��� 2����� ����� ������.
update books set price = 2 * price where bid = 'database' or 'xml' ;
select * from Books ;

-- ���� ���̵� 'database'�� ������ �ܰ��� 100��ŭ �����ϼ���.
update books set price = price -100 where bid = 'database' ;
select * from Books ;

-- ���� ���̵� 'java'�� ������ �ܰ��� 50�� �λ��� �Ǿ���, �̸��� '�ڹ�'�� ������ �Ǿ����ϴ�.
update books set price = price + 50 , bname = '�ڹ�' where bid = 'java' ;
select * from Books ;

-- ���� ���̵� 'python'�� ������ �̸��� '���̽�'���� �����ϼ���.
update books set bname = '���̽�' where bid = 'python' ; 
select * from Books ;

-- ���� ���̵� 'python'�� ������ �ܰ��� 600���� �����ϼ���.
update books set price = 600 where bid = 'python' ;
select * from Books ;

-- �ܰ��� 5,000�������� �׸���� �ܰ��� 3,000������ �����ϼ���.
update books set price = 3000 where price <= 5000 ;
select * from Books ;

-- �ܰ��� 10,000�� �̻��̰� ���� ���̵� 'java' �Ǵ� 'xml'�� �������� �ܰ��� 13000���� �����ϼ���.
update books set price = 13000 where price >= 10000 and bid = 'java' or bid = 'xml' ;
select * from Books ;

-- ���� ���̵� 'java'�Ǵ� 'spring'�� ������ �ܰ��� 450���� ������ ������.
update books set price = 450 where bid = 'java' or bid = 'spring' ;
select * from Books ;

-- �ѹ��ϼ���.
rollback; 
select * from Books ;

-- ���ǻ� '�α� �̵��'�� '���� ���ǻ�'�� ������ ������.
update books set publisher = '���� ���ǻ�' where publisher = '�α� �̵��' ;
select * from Books ;

-- ���� ���׵��� �ѹ��Ͻÿ�. 
rollback ;

-- ��� ������ �Ǿ��� ���뿡 ���Ͽ� �ٽ� ���� �����ͷ� �����ߴ� �� Ȯ���ϵ��� �մϴ�. 
select * from Books ;
 
 
-- ������ ��� �ǽ��� ���� �ѹ��� �����ϸ鼭 ���� �ǽ��� �����ϵ��� �մϴ�.

-- ��� ������ ������ ���� ��ȸ�� ������ ������.

-- ���� ���̵� 'mybatis'�� ������ ������ ������.
delete from books where bid = 'mybatis' ;
select * from Books ;

-- ���ǻ簡 '�α� �̵��'�� ������ ������ ������.
delete from books where publisher = '�α� �̵��' ;

-- ���ǻ簡 '�α� �̵��'�� '���� ���ǻ�'�� �������� ������ ������.
delete from books where publisher = '�α� �̵��' and publisher = '���� ���ǻ�' ;
select * from Books ;
rollback ;
-- ���ǻ簡 '�Ҽ� �̵��'�� ���� �߿��� �ܰ��� 10,000�̻��� �������� ������ ������.
delete from books where publisher = '�Ҽ� �̵��' and price >= 10000 ;
select * from Books ;
rollback ;

-- �ܰ��� 8,000�� �̸��̰ų� 13,000���̻��� �������� ������ ������.
delete from books where price < 8000 and price >= 13000 ;
select * from Books ;

-- ���ǻ簡 '���� ���ǻ�'�� '�Ҽ� �̵��'�� ������ �ٸ� ���ǻ��� �������� ��� �����ϼ���. 
delete from books where publisher not in ('���� ���ǻ�','�Ҽ� �̵��')  ;
select * from Books ;
-- �̹� ���ÿ����� in Ű����� not Ű���带 ���� ����ϴ� not in ������ ����ϸ� �մϴ�.
rollback;
select * from Books ;
-- ���� ���̵� 'jsp'�� ������ �Ǿ����ϴ�.

-- ���� ���̵� 'java', 'spring'�� ���ǵǾ����ϴ�.

-- ���� ���׵��� �ѹ� �Ͻÿ�.
rollback; 

-- savepoint�� �ǽ��մϴ�.
savepoint point01 ;

-- ���ÿ� ���̺� mybook�� ������ ���� �����ϵ��� �մϴ�.
create table mybook
as
select bid, bname, price from books where price < 10000  ;
select * from mybook ;
 
-- ��� ������ �ܰ��� 10,000������ �����մϴ�.
update mybook set price = 10000 ;
select * from mybook ;
-- ���� ��Ȳ) ��� ������ �ܰ��� 10000���Դϴ�.


-- point02 �������� �̵��ϸ�, ���ڵ��� �޿��� ���� ���·� ���ư��ϴ�.
savepoint point02 ;
rollback;
select * from mybook ;
-- ��� �������� �ܰ��� ������ ������ �ǵ��� �����̶�� ���˴ϴ�.

rollback to point01 ;
select * from mybook ;
-- point01 �������� �̵��ϸ�, 8000 ������ �����鵵 ������ �մϴ�.
-- 8000��¥�� ������ ���� ��ϵ� ���Դϴ�.

update books set price = null where bid in ('r','database','mybatis' ) ;

commit ;

-- ��� �������� ������ ����� ������.
select * from books ;
-- ��� �������� ���̵�, ���� �̸�, �ܰ��� ��ȸ�� ������.
select bid,bname,price from books ;
-- ��� �������� ���� �̸�, �ܰ�, ���̵� ��ȸ�� ������.
select bname,price,bid from books ;
-- ������ �̸��� 10���� �Ǹ��� �ݾ��� ����� ������.

-- ������ �̸��� ���ݰ� 10 �ۼ�Ʈ ���ε� ���� ������ ����� ������.
select bname,price,price - price* 0.1 from books
rollback;
select * from books ;
-- ���ǻ� �̸��� ��ȸ�� ������.
select publisher from books ;
-- ���ǻ� �̸��� ��ȸ�ϵ�, �ߺ��� �����ʹ� �ϳ��� ��µǵ��� ���ּ���.
select distinct publisher from books ;
-- ������ �̸��� �ܰ��� 100�� �λ�� ������ ����� ������.
select bname, price, price + 100 as upprice from books ;
-- ������ �̸��� �ܰ��� 50% �λ�� ������ ����� ������.
select bname, price, price + price /2 as result from books ;
-- ������ �̸��� �ܰ��� 50% �λ�� ������ ����ϵ� ��Ī�� ������ ����� ������.
select bname, price, price + price /2 as result from books ;
-- ���� �̸��� �ܰ��� ����ϵ�, ��Ī '����_�̸�', '����'���� ����� ������.
select bname as "'���� �̸�'", price as "'����'" from books ;
-- ���ڿ� ���� �����ڸ� ����Ͽ� ������ ���� ����� ������.

-- �ڹ� ���α׷����� ������ 7000���Դϴ�.
select bname || '�� ������ ' || price || ' �Դϴ�.' as result from books ;
-- ���� �̸� : �ڹ� ���α׷���, ���ǻ� : ���� ���ǻ�, ���� : 7000
select '�̸� : ' || bname || ', ���ǻ� : ' || publisher || ', ���� : ' || price as result from books ;
-- ���� ����
select * from books ;
-- ������ ���̵� python�� ������ ��ȸ�� ������.
select * from books where bid = 'python' ;
-- ���� ������ '���̽� ���α׷���'�� �������� ����� ������.
select * from books where bname = '���̽� ���α׷���' ;
-- ����Ŭ���� ���ڴ� �ܵ���ǥ�� ����ؾ� �մϴ�.
select * from books ;
-- ������ �ܰ��� 10,000�� �̻��� ������ ��ȸ�� ������.
select * from books where price >= 10000 ;
-- ���ǻ��� �̸��� '���� ���ǻ�'�� ��鸸 ��ȸ�� ������.
select * from books where bname = '���� ���ǻ�' ;
-- ������ �ܰ��� 9,000���̻��̰�, 13,000�� ������ �������� ��ȸ�� ������.
select * from books where price >= 9000 and price <= 13000 ;
-- ������ �ܰ��� 30,000�� �̻��̰ų� 7,000�� ������ �������� ��ȸ�� ������.
select * from books where price >= 30000 or price <= 7000 ;
-- ������ ���̵� 'python' �Ǵ� 'database'�� ������ ���� �̸��� �ܰ��� ��ȸ�� ������.
select bname,price from books where bid = 'python' or bid = 'database' ;
select * from books ;
-- ������ �ܰ��� 8,000���̰ų� 13,000���� �������� ��ȸ�� ������.
select * from books where price = 8000 or price = 13000 ;
-- ������ �ܰ��� ���� �������� ����� ������. 
select * from books where price is null ;
-- �ܰ��� �����ϴ� ������ ����� ������.
select * from books where price is not null ;
-- ��� �������� ���� �̸��� �ܰ��� 10�� �Ǹŵ� �ݾ��� ��ȸ�� ������. 

-- ������ �ܰ��� 9,000�� �̻�, 13,000 ������ �������� ��ȸ�� ������.
select * from books where price >= 9000 and price <= 13000 ;
rollback ;
select * from books ;
-- ���� �̸��� '��'�� �����ϰ� '��'�� ������ �������� ��ȸ�� ������. 

-- ���ǻ� �̸��� '�Ҽ� �̵��'�̰ų� '���� ���ǻ�'�� �������� ��ȸ�� ������.
select * from books where publisher = '�Ҽ� �̵��' or bname = '���� ���ǻ�' ;
-- in ��(clause)�� ����Ͽ� ������ ���̵� 'java', 'python' , 'database'�� ���� ����� ������.
select * from books where bid in ('java','python','database') ;
-- ���� ������ 'R ���α׷���'�̰ų� '������ Framework'�� ��������?
select * from books where bname = 'R ���α׷���' or bname = '������ Framework' ;
-- like ������
-- ���� �̸��� '��'�� �����ϴ� �������� ����� ������.
select * from books where bname like '��%' ;
-- ���� '��'�� �����ϴ� ��� �������� ����� ������.
select * from books where bname like '��%' ;
-- ���� �̸��� '����'�ڰ� ���� �������� ����� ������.
select * from books where bname like '%����%' ;
-- �� ��° ���ڰ� �ݵ�� '��'�� �������� ����� ������.
select * from books where bname like '_��%' ;
-- ���ǻ� �̸��� '��'�� ������ ��� �������� ����� ������.
select * from books where publisher like '%��' ;

-- ���� �̸��� '��'�� �����ϰų�, '��'���� ������ ��� �������� ����� ������.
select * from books where bname like '��%' or bname like '%��' ;


-- ������ ����غ���
-- ���ǻ� �̸��� '���� ���ǻ�'�� '���� ���ǻ�'�� �ƴ� ��� �������� ����� ������.
select * from books where publisher not in ('���� ���ǻ�','���� ���ǻ�') ;
-- ������ ���̵� 'r', 'database', 'mybatis'�� �ƴ� �������� ����� ������.
select * from books where bid not in ('r','database','mybatis') ;
-- �ܰ��� 9,000���� 13,000�� ���̿� ���� ���� �������� ����� ������.
select * from books where price not between 9000 and 13000 ;
-- ������ �̸��� '���α׷���'���� ������ ���� �������� ����� ������.
select * from books where bname not like '%���α׷���' ;
-- ������ �ܰ��� ������ �� �������� ����� ������.
select * from books where price is not null ;
-- �������� ������ ���
-- ���ǻ� �̸��� '���� ���ǻ�'�� �ƴϰ�, �ܰ��� 10,000�� ������ �������� ����� ������.
select * from books where publisher not in ('���� ���ǻ�') and price <= 10000 ;
-- ������ �̸��� '���α׷���'���� ������ ���� �߿��� �ܰ��� 8,000�� ������ �������� ����� ������.
select * from books where bname like '%���α׷���' and price <= 8000 ;
-- ������ �ܰ��� ������ �� ���� �߿��� �ܰ��� 8,000���� 13,000�� ���̿� ���� ���� �������� ����� ������. 
select * from books where price is not null and price not between 8000 and 13000 ;
-- ������ �����ϱ�
rollback ;
select * from books ;
commit ;
-- ������ �ܰ��� ���� �ͺ��� ����� ������.
select * from books order by price asc ;
-- ������ �̸��� ���Ͽ� ������������ ����� ������.
select * from books order by bname asc ;
-- ������ �̸��� ���Ͽ� ������������ ����� ������.
select * from books order by bname desc ; 
-- �԰� ���ڰ� ���� �� ���� ������ ������.
select * from books order by inputdate desc ;
-- ���ǻ� �̸����� �������� ���� ��, �ܰ��� ���� �������� ������ ������.
select * from books order by publisher desc, price asc ;

insert into customer(id, name, address, phone, manager, salary) 
values('yoon', '������', '�߱� ������', '000-1111-1111', 'shin', 100);

insert into customer(id, name, address, phone, manager, salary) 
values('yusin', '������', '�Ŷ� ����', '000-2222-2222', 'shin', 200);  

insert into customer(id, name, address, phone, manager, salary) 
values('shin', '�Ż��Ӵ�', '���� ����', '000-3333-3333', null, 300);

insert into customer(id, name, address, phone, manager, salary) 
values('an', '���߱�', '���� ������', '000-4444-4444', 'hong', 400);

insert into customer(id, name, address, phone, manager, salary) 
values('hong', 'ȫ����', '���� �ô� ����',  null, null, 500);

commit ;

select * from customer ;

insert into orders(oid, cid, bid, saleprice, saledate) 
values(1, 'yoon', 'java', 6000, to_date('2021-07-01','yyyy-mm-dd')); 
insert into orders(oid, cid, bid, saleprice, saledate) 
values(2, 'yoon', 'python', 21000, to_date('2021-07-03','yyyy-mm-dd'));
insert into orders(oid, cid, bid, saleprice, saledate) 
values(3, 'yusin', 'database', 8000, to_date('2021-07-03','yyyy-mm-dd')); 
insert into orders(oid, cid, bid, saleprice, saledate) 
values(4, 'shin', 'jsp', 6000, to_date('2021-07-04','yyyy-mm-dd')); 
insert into orders(oid, cid, bid, saleprice, saledate) 
values(5, 'an', 'spring', 20000, to_date('2021-07-05','yyyy-mm-dd'));
insert into orders(oid, cid, bid, saleprice, saledate) 
values(6, 'yoon', 'jsp', 12000, to_date('2021-07-07','yyyy-mm-dd'));
insert into orders(oid, cid, bid, saleprice, saledate) 
values(7, 'an', 'jsp', 13000, to_date( '2021-08-15','yyyy-mm-dd'));
insert into orders(oid, cid, bid, saleprice, saledate) 
values(8, 'shin', 'java', 12000, to_date('2021-03-01','yyyy-mm-dd')); 
insert into orders(oid, cid, bid, saleprice, saledate) 
values(9, 'yusin', 'java', 7000, to_date('2021-12-25','yyyy-mm-dd')); 
insert into orders(oid, cid, bid, saleprice, saledate) 
values(10, 'shin', 'python', 13000, to_date('2021-07-10','yyyy-mm-dd'));
commit ;

select * from orders ;

-- '������' ������� 'Books' ���̺� ���Ͽ� ������ �Լ��� ����Ͽ� Ǯ�� ������
-- ���ڿ� �Լ����� ���� Ǯ�� ������ �ϰڽ��ϴ�.

-- ������ �̸��� �빮��, �ҹ��� ������ ������ ������. 
select bid,upper(bid),lower(bid),initcap(bid) from books ;
-- �ݵ�� concat �Լ��� ����Ͽ� ���� ���ÿ� ���� ��µǵ��� �ϼ���.
select * from books; 
-- ���� : �ڹ� ���α׷���, ���ǻ� : ���� ���ǻ�
select concat(concat('���� : ',bname),concat(', ���ǻ� : ', publisher)) as result from books ;
-- ���� �̸��� 5��° ���ں��� ������ ������ ������. 
select substr(bname,5) from books ;
-- ���� �̸��� �� 3���ڸ� ������ ������. 
select substr(bname,1,3) from books ;
-- ������ ���ǻ��� �̸��� �̸��� ���̸� ��ȸ�� ������. 
select bname,publisher,length(bname),length(publisher) from books ;
-- ���� �̸��� 9�ڸ� �̻��� �׸� ��ȸ�� ������. 
select bid,bname,publisher from books where length(bname) in 9 ;
-- instr �Լ�()�� ����Ͽ� å�� �̸��� '���α׷���'��� �ܾ ����ִ� �ุ ��ȸ�ϼ���. 
select bid,bname,publisher, instr(bname, '���α׷���') from books ;
-- lpad �Լ��� ����Ͽ� price �÷��� ��ü 10�ڸ� �������� ä�� �ּ���.
select bid,bname,publisher,price, lpad(price,10,'*') from books; 
-- ���ڶ� ������ '*' ��ȣ�� ä�쵵�� �ϼ���. 
select bid,bname,publisher,price, lpad(price,10,'*') from books; 
-- price �÷��� ���� (å�̸��� ���ڿ� ����)�� ���� ���� ���� ����� ����غ�����.
select price,length(bname),price + length(bname)*length(bname) from books ;
-- ���� �� price=8000�̰�, å�̸��� "�ڹ� ���α׷���"(8�ڸ�)�̸� 64�̹Ƿ� ���� ����� 8064�� �Ǿ�� �մϴ�.

-- ���� �̸��� '���α׷���'�� 'programming'���� ġȯ�� ������. 
select bname, replace(bname, '���α׷���','programming') from books ;
-- rtrim() �Լ��� ����Ͽ� ���� �̸��� '���α׷���'�̶�� �ܾ ������ ������.
select bname, rtrim('���α׷���') as result from books ;
-- ������ ���̵��� ���̰� 3�� ����� ��鸸 ��ȸ�� ������. 
select *from books where mod(length(bname),3 )= 0  ;
-- ������ customers ���̺��� �ǽ��ϵ��� �մϴ�.
-- �ּ� �÷����� ���� �̸��� ����� ������. 
select substr(address,1,3)from customer ;
-- instr �Լ�()�� ����Ͽ� ��ȭ ��ȣ�� '3333'�� ��� �ִ� �ุ ��ȸ�� ������. 
select id,name,address,phone, instr(phone,'3333') from customer ;
-- substr �Լ�()�� ����Ͽ�, ������ �����ϰ�, �̸��� ������ ������. 
select substr(name,2) from customer ;
-- ������ �Լ� �ǽ��� ���Ͽ� ���� ������ �켱 �����ϵ��� �մϴ�.
update books set price = 1.1 * price ;
update books set price = -123.4567 where bid in('r', 'database', 'python') ;
commit ;
-- 
-- �ܰ��� ���� ���� ���� ���� ������. 
select bname,price,abs(price) from books ;
-- ������ ���̵� 'r', 'database', 'mybatis', 'spring'�� ������ ���Ͽ� ������ �ø�/������ ������. 
select bid,price, ceil(price),floor(price) from books where bid = 'r';
select bid,price, ceil(price),floor(price) from books where bid = 'database';
select bid,price, ceil(price),floor(price) from books where bid = 'mybatis';
select bid,price, ceil(price),floor(price) from books where bid = 'spring';
-- �ܰ����� ���� ������ �ݿø� �� �����غ�����. 
select bid,bname,price, round(price),trunc(price) from books ;
-- ��� �ܰ��� ���Ͽ� ���� ������ �����ϰ�, ��Ʈ�� ���� ����� ����ϼ���. 
select sqrt(abs(price)) from books ;
-- ���� �̸��� ���̰� 5�� ����� �������� ����� ������. 
select mod(length(bname),5) from books;
select * from books where mod(length(bname),5) = 0 ;
-- ���� �̸��� ���̸� 3�����ϴ� ������ ����� ������. 
select bname, power(length(bname),3) from books ;
-- �ܰ����� ���� �̸��� ������ 2������ �����ϴ� ������ ����� ������. 
select bname,price, price - power(length(bname),2) from books ;
-- ������ �ܰ��� ��ȣ �Լ��� ������ ������. 
select price, sign(price) from books ;
-- ���� �� �Լ��� abs�� ������� �ʰ� ������ �ܰ��� ���Ͽ� ���밪���� ������ ������. 

-- ��¥ �Լ�

-- �������� �̸��� �԰� ��¥���� ����� �ϼ��� ��ȸ�� ������. 
alter session set nls_date_format = 'yyyy-mm-dd' ;
alter session set nls_date_format = 'yyyy-mm-dd hh:mi:ss' ;
-- �������� �̸��� �԰� ��¥���� ����� ������ �Ҽ��� 3°�ڸ����� ���� �ּ���. 
select sysdate from books;
-- ������ ���̵� 'r', 'database'�� ������ �԰� ���ڸ� 3���� ������ �����ϼ���. 
select sysdate, add_months(sysdate, 3) from books where bid = 'r' ;

select sysdate, add_months(sysdate, 3) from books where bid = 'database' ;
-- ���� ���� �����Ϳ� ���� ���� �����͸� ���ÿ� ����� ���ϴ�.
select inputdate,sysdate, add_months(sysdate, 3) from books where bid = 'r' ;
-- ������ ���̵� 'python', 'spring'�� ������ �԰� ���ڸ� 5�������� ������ ������. 
update books set inputdate = inputdate - 5 where bid in ('python' ,'spring') ;
-- ���� ���� �����Ϳ� ���� ���� �����͸� ���ÿ� ����� ���ϴ�.
select * from books where bid in ('python','spring') ;

-- ���̵� 'python', 'spring'�� ������ �԰� ���ڸ� ���ƿ��� �ݿ��Ϸ� ������ ������. 
select next_day(sysdate,'��') from books where bid in ('python','spring') ;

-- Ÿ�� ��ȯ �Լ�
-- ������ �԰� ���ڸ� '��/��' �������� ����� ������. 
select bname, to_char(inputdate,'mm/dd') from books ;
-- ������ �԰� ���ڸ� 'yyyyҴ mm�� dd��' �������� ����� ������.
select bname, to_char(inputdate,'yyyy"Ҵ"mm"��"dd"��"') from books ;
-- ���� ������ �����ϰ�, �� ����� ������ ������.
select 
to_char(price, '$999,999.00') as price01,
to_char(price, '$000,000.00') as price02,
to_char(price, 'L999,999.00') as price03,
to_char(price, '000,000.00') as price04
from books ;
-- 
-- null ó�� �Լ� �ǽ��� ���Ͽ� ���� ������ �켱 �ǽ��� �ּ���.
update books set inputdate = null where bid in ('python', 'spring') ;
commit ;
-- 
-- ������ �̸��� �԰� ���ڸ� ����� ������.
select bname,inputdate from books ;
-- �԰� ���ڰ� �������� �ʴ� �����ʹ� ���� �ð����� ����غ�����. 
update books set inputdate = null where bid in ('python', 'spring') ;
select * from books ;
update books set inputdate = sysdate where inputdate = null ;
select nvl(inputdate,sysdate) from books;
-- ������ �̸��� �ܰ��� ����� ������.
select bname,price from books ;
-- �ܰ��� �������� �ʴ� �����ʹ� 1,000������ ����غ�����. 
select nvl(price,1000) from books ;
-- �������� �̸��� �ܰ��� ��ȸ�� ������. 
select bname,price from books ;
-- �ܰ��� ���� ���ο� ���Ͽ� �ڸ�Ʈ('�ܰ� ������', '�ܰ��� null��')�� �ۼ��� ������. 
select bname,price, nvl2(price,'�ܰ� ������','�ܰ��� null��') from books;
-- ������ �̸��� ���ǻ縦 ��ȸ�Ͻÿ�. 
select bname,publisher from books;
-- ��, ���ǻ� '�Ҽ� �̵��'�� ���ǻ�� null ������ ��ü �ϼ���. 
select replace(publisher,'�Ҽ� �̵��',null) from books;
-- ���ǻ��� �̸��� '�α� �̵��'�̸� 'm'��, '���� ���ǻ�'�̸� 'd'��, '���� ���ǻ�'�̸� 's'��
select replace(publisher,'�α� �̵��','m') from books;
select replace(publisher,'���� ���ǻ�','d') from books;
select replace(publisher,'���� ���ǻ�','s') from books;

select bname,publisher, decode(publisher ,'�α� �̵��', 'm' , '���� ���ǻ�' ,'d','���� ���ǻ�','s','x')as result from books;
-- �������� 'x'�� ����ϴ� �ڵ带 �ۼ��� ������. 
-- ���� ������ case ǥ�������� �ٽ� Ǯ�� ������. 
select bname,publisher,case publisher
when '�α� �̵��' then 'm'
when '���� ���ǻ�' then 'd'
when '���� ���ǻ�' then 's'
else 'x'
end
as result from books;
-- �������� ���̵�, �̸�, ���ǻ�, �ܰ� �� �Ļ� ����� ����غ�����. �Ļ� ����� ���ǻ簡 '�α� �̵��'�̸�, �ܰ��� 10% �λ��, ���ǻ簡 '���� ���ǻ�'�̸�, 20%, ���ǻ簡 '���� ���ǻ�'�̸�, 30%, �������� ���� �ܰ��� �״�� ����ؾ� �մϴ�. ��, �ܰ��� null�̸� �⺻ ������ 100���� �����ϵ��� �մϴ�. 
-- 
-- orders ���̺�
-- �Ʒ��� �ǽ��� �ϱ� ���Ͽ� ���� ������ �����ϼ���. 
update orders set saleprice = null  where oid in(1, 3, 5) ;
update orders set saledate = null  where oid in(1, 2, 3) ;
commit ;
-- 
-- 
-- orders ���̺� ���Ͽ� ������ ���� ����� �Ǵ� sql ������ �ۼ��� ������.
-- cid �÷��� case ������ ����Ͽ� �� ���̵�� �̸��� ����� ������.
-- ��, �ǸŰ���, �������� ������ 10,000������ ����ϼ���.
-- �ǸŰ��� 21,000�϶�, \21,000.00�� �������� ����ϼ���. 
-- ��, �ֹ� ���ڰ�, �������� ������ ���� �ð����� ����ϼ���.
-- �ֹ� ���ڴ� '2014Ҵ 07�� 13��'�� �������� ����ϼ���. 

-- �׷�(����) �Լ�
-- books ���̺� ���Ͽ� ������ ���� ���� �Լ� ������ ���� ������ �ʿ��� sql ������ �ۼ��� ������.
-- ���� �ǽ��� ���Ͽ� ���� ������ �켱 �����ϵ��� �մϴ�.
-- 
update books set price = abs(price) ;
commit ;
-- 
-- �� ������ �� ���ΰ���?
select count(bname) from books;
-- �ܰ��� ������ ������ �� �� ���ΰ���?
select count(price) from books; 
-- count(*)�� count(price)�� ����Ͽ� �ܰ��� null�� �� ������ ���� ������.
select count(price) from books ;
select count(*) from books ;
-- ���ǻ��� ������ �� �� ���ΰ���? 
select count(publisher) from books ;
-- ��� �������� �ܰ��� ��� ���� �Ҽ��� 2°�ڸ����� ���� ������. 
select avg(price) from books;
-- �ܰ��� ����� ���ϵ�, null�� ������ 100���� ġȯ�Ͽ� ����ϼ���. 
select avg(nvl(price,100)) from books;
-- �ܰ��� ������ ���� ������. 
select sum(price) from books;
-- �ܰ��� �ѱݾ��� ���ϵ�, null�� ������ 100���� ġȯ�Ͽ� ����ϼ���. 
select sum(nvl(price,100)) from books;
-- å�� ���� �ܰ��� �ְ� �ܰ��� ���� ���ΰ�? 
select max(price), min(price) from books;
-- ���ǻ� �̸��� �������� �������� ���Ľ� ���� ���� ��ȸ�Ǵ� ���ǻ�� ����ΰ���?
select publisher, count(*) as cnt
from books
group by publisher order by publisher asc ;

-- ���ǻ� �̸��� �������� �������� ���Ľ� ���� ���߿� ��ȸ�Ǵ� ���ǻ�� ����ΰ���? 
select publisher, count(*) as cnt
from books
group by publisher order by publisher asc ;

-- ���ǻ纰�� å���� �ܰ��� ������ ���� ������. 
select publisher, sum(nvl(price,100)) as sumsal
from books group by publisher ;

-- ���ǻ纰�� ���� �� ���� ������ ������ �ִ��� Ȯ���� ������. 
select publisher, count(nvl(bname,0)) as result
from books group by publisher ;

-- ���ǻ纰�� å���� �ܰ��� ���հ� �ּ� ���� ���غ�����.
select publisher, sum(nvl(price,10000)) as sumsal , min(nvl(price,0)) as minsal
from books group by publisher ;
-- ��, �ܰ��� null�̸� 10,000������ ġȯ�Ͽ� ����ؾ� �մϴ�. 
-- ���ǻ纰�� å���� �ܰ��� ������ ���ϵ�, '�α� �̵��'�� �����ϵ��� �ϰ�, �ܰ��� ������ ū �ͺ��� �����ϼ���. 
select publisher, sum(nvl(price,100)) as sumsal
from books 
where publisher is not null and publisher != '�α� �̵��' 
group by publisher ;

-- ���ǻ纰�� å���� �ܰ��� ������ ���� ������.
select publisher, sum(price) as sumsal
from books 
where price >= 20000
group by publisher ;
-- ��, �ܰ��� ������ 20,000�̻��� �׸� ��ȸ�ϼ���. 
select * from books ;
-- ���ǻ纰�� å���� �ܰ��� ������ ���� ������.
-- ��, �ܰ��� ������ 20,000�̻��̰�, 30,000������ �׸� ��ȸ�ϼ���. 
select publisher, sum(price) as sumsal
from books 
where price >= 20000 and price <= 30000 
group by publisher ;
-- �������� �Խù�
-- ������ �ǽ��� ���Ͽ� �ֹ�(orders) ���̺��� �����͸� ��� �����մϴ�.
-- ������ seqorder�� �����ϰ�, �ش� �������� ����Ͽ� �ֹ�(orders) ���̺��� �ٽ� �����ϼ���.
-- 
create sequence seqorder ;

delete from orders ;

insert into orders(oid, cid, bid, saleprice, saledate) 
values(seqorder.nextval, 'yoon', 'java', 6000, to_date('2021-07-01','yyyy-mm-dd')); 
insert into orders(oid, cid, bid, saleprice, saledate) 
values(seqorder.nextval, 'yoon', 'python', 21000, to_date('2021-07-03','yyyy-mm-dd'));
insert into orders(oid, cid, bid, saleprice, saledate) 
values(seqorder.nextval, 'yusin', 'database', 8000, to_date('2021-07-03','yyyy-mm-dd')); 
insert into orders(oid, cid, bid, saleprice, saledate) 
values(seqorder.nextval, 'shin', 'jsp', 6000, to_date('2021-07-04','yyyy-mm-dd')); 
insert into orders(oid, cid, bid, saleprice, saledate) 
values(seqorder.nextval, 'an', 'spring', 20000, to_date('2021-07-05','yyyy-mm-dd'));
insert into orders(oid, cid, bid, saleprice, saledate) 
values(seqorder.nextval, 'yoon', 'jsp', 12000, to_date('2021-07-07','yyyy-mm-dd'));
insert into orders(oid, cid, bid, saleprice, saledate) 
values(seqorder.nextval, 'an', 'jsp', 13000, to_date( '2021-08-15','yyyy-mm-dd'));
insert into orders(oid, cid, bid, saleprice, saledate) 
values(seqorder.nextval, 'shin', 'java', 12000, to_date('2021-03-01','yyyy-mm-dd')); 
insert into orders(oid, cid, bid, saleprice, saledate) 
values(seqorder.nextval, 'yusin', 'java', 7000, to_date('2021-12-25','yyyy-mm-dd')); 
insert into orders(oid, cid, bid, saleprice, saledate) 
values(seqorder.nextval, 'shin', 'python', 13000, to_date('2021-07-10','yyyy-mm-dd'));
commit ;


select * from orders ;
-- ����(Join)
-- ���� �̸��� �ֹ��� å�� ���̵� ��ȸ�� ������.      
select cid,bid from orders ;
-- ���� �̸��� �ֹ��� å�� ���̵� ��ȸ�� ������. 
select cid,bid from orders ;
-- ��, ���� �̸��� '���߱�', '������'�� ����鸸 ��ȸ�ϵ��� �մϴ�. 
select customer.name, orders.bid
from customer join orders
on customer.id = orders.cid ;
-- ������ ���� ����� �ǹ��ϴ� ���̺��� �����մϴ�.
-- 
create table grades(		
	glevel varchar2(2),	
	lowsal number,	
	highsal number	
);		
insert into grades values('A', 0, 99) ;		
insert into grades values('B', 100, 199) ;		
insert into grades values('C', 200, 299) ;		
insert into grades values('D', 300, 399) ;		
insert into grades values('E', 400, 500) ;		
commit ;		

select * from grades;


--  
-- ������ ��� ���̺��� �̿��Ͽ� �� ������ ��� ������ ����� ������.
select c.name, c.salary, g.glevel
from customer c, grades g
where c.salary between g.lowsal and g.highsal ;
-- ���� �̸��� �ֹ��� å�� ���̵�� �Ǹ� �ݾ��� ��ȸ�� ������.
-- ��, �ֹ����� ���� ������ �̸� ������ ����� �Ǿ�� �մϴ�. 

select c.name, c.id, o.bid ,o.saleprice
from customer c full outer join orders o
on c.id = o.cid ;

-- ���� �Ŵ��� ������ ���� ����� ������.

select c.name, c.id, o.bid ,o.saleprice ,c.manager
from customer c full outer join orders o
on c.id = o.cid ;

-- �Ŵ����� ���� ������ manager �÷��� �����ϸ� �˴ϴ�.

-- '�������� �����ڴ� shin�Դϴ�.'
select c.name || '�� �����ڴ�' || g.manager || '�Դϴ�' as result
from customer c inner join customer g
on c.id = g.manager ;

-- ���� �Ŵ��� ������ ���� ����� ������.
-- �Ŵ����� �ϳ��� ������ ����� �Ǿ�� �մϴ�.  
select c.name || '�� �����ڴ�' || g.manager || '�Դϴ�' as result
from customer c full join customer g
on c.id = g.manager ;

-- �� ������ �̸��� �ֹ� �Ǽ��� ����� ������.
-- ��, �ֹ����� ���� ������ �̸� ������ ����� �Ǿ�� �մϴ�.
select c.name, count(nvl(salary,0)) as cnt
from customer c left outer join orders o
on c.id = o.bid group by c.name order by cnt desc, c.name asc ;
