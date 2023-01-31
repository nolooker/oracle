create table Books(

bid varchar2(30) not null,
bname varchar2(40),
publisher varchar2(40),
price number default 0,
inputdate date default sysdate

);

insert into Books values('java','자바 프로그래밍','대한 출판사',7000,'70/08/28');
insert into Books values('jsp','jsp 프로그래밍','대한 Books',8000,'80/08/');
insert into Books values('python','파이썬 프로그래밍','민국 미디어',9000,'90/07/17');
insert into Books values('r','R 프로그래밍','민국 미디어',35000,'75/11/11');
insert into Books values('database','데이터 베이스 개론','대한 출판사',8000,'78/03/01');
insert into Books values('mybatis','마이바티스','대한 출판사',7500,'45/08/15');
insert into Books values('spring','스프링 Framework','소셜 미디어',20000,'50/06/25');
insert into Books values('xml','xml 프로그래밍','소셜 미디어',13000,'70/06/06');
insert into Books values('story','프로그래밍 이야기','성안당',6000,'70/09/09');
insert into Books values('timeseries','시계열 예측','성안당',13000,'50/06/25');

commit ;