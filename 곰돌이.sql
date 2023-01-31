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