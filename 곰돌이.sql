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

-- 모든 책들의 단가를 1000원으로 변경해 보세요. 
update Books set price = 1000 ;

select * from Books ;

-- 모든 출판사의 이름을 '가나 출판사'으로 변경해 보세요. 
update Books set bname = '가나 출판사' ;
select * from Books ;

-- 모든 출판사의 이름을 '대한 출판사'로 단가를 5000으로 변경해 보세요.
update Books set bname = '대한 출판사' , price = 5000 ;

select * from Books ;

-- 데이터를 롤백하시고, 서적 아이디가 'java'인 서적의 단가를 4000으로 변경해 보세요.
rollback ;
select * from Books ;

update Books set price = 4000 where bid = 'java' ;
select * from Books ;

-- 모든 서적들에 대하여 값을 10%씩 인상해 보세요.
update books set price = 1.1 * price ;
select * from Books ;

-- 아이디가 'database'이거나 'xml'인 책의 단가를 2배수로 만들어 보세요.
update books set price = 2 * price where bid = 'database' or 'xml' ;
select * from Books ;

-- 서적 아이디가 'database'인 서적의 단가를 100만큼 뺄셈하세요.
update books set price = price -100 where bid = 'database' ;
select * from Books ;

-- 서적 아이디가 'java'인 서적의 단가가 50원 인상이 되었고, 이름은 '자바'로 변경이 되었습니다.
update books set price = price + 50 , bname = '자바' where bid = 'java' ;
select * from Books ;

-- 서적 아이디가 'python'인 서적의 이름을 '파이썬'으로 변경하세요.
update books set bname = '파이썬' where bid = 'python' ; 
select * from Books ;

-- 서적 아이디가 'python'인 서적의 단가를 600으로 변경하세요.
update books set price = 600 where bid = 'python' ;
select * from Books ;

-- 단가가 5,000원이하인 항목들의 단가를 3,000원으로 변경하세요.
update books set price = 3000 where price <= 5000 ;
select * from Books ;

-- 단가가 10,000원 이상이고 서적 아이디가 'java' 또는 'xml'인 서적들의 단가를 13000으로 변경하세요.
update books set price = 13000 where price >= 10000 and bid = 'java' or bid = 'xml' ;
select * from Books ;

-- 서적 아이디가 'java'또는 'spring'인 서적의 단가를 450으로 변경해 보세요.
update books set price = 450 where bid = 'java' or bid = 'spring' ;
select * from Books ;

-- 롤백하세요.
rollback; 
select * from Books ;

-- 출판사 '민국 미디어'를 '영문 출판사'로 변경해 보세요.
update books set publisher = '영문 출판사' where publisher = '민국 미디어' ;
select * from Books ;

-- 위의 사항들을 롤백하시오. 
rollback ;

-- 모든 변경이 되었던 내용에 대하여 다시 원래 데이터로 복귀했는 지 확인하도록 합니다. 
select * from Books ;
 
 
-- 이후의 모든 실습후 각각 롤백을 수행하면서 다음 실습을 진행하도록 합니다.

-- 모든 서적을 삭제한 다음 조회를 수행해 보세요.

-- 서적 아이디가 'mybatis'인 서적을 삭제해 보세요.
delete from books where bid = 'mybatis' ;
select * from Books ;

-- 출판사가 '민국 미디어'인 서적을 삭제해 보세요.
delete from books where publisher = '민국 미디어' ;

-- 출판사가 '민국 미디어'와 '지한 출판사'인 서적들을 삭제해 보세요.
delete from books where publisher = '민국 미디어' and publisher = '지한 출판사' ;
select * from Books ;
rollback ;
-- 출판사가 '소셜 미디어'인 서적 중에서 단가가 10,000이상인 서적들을 삭제해 보세요.
delete from books where publisher = '소셜 미디어' and price >= 10000 ;
select * from Books ;
rollback ;

-- 단가가 8,000원 미만이거나 13,000원이상인 서적들을 삭제해 보세요.
delete from books where price < 8000 and price >= 13000 ;
select * from Books ;

-- 출판사가 '지한 출판사'과 '소셜 미디어'을 제외한 다른 출판사의 서적들을 모두 삭제하세요. 
delete from books where publisher not in ('지한 출판사','소셜 미디어')  ;
select * from Books ;
-- 이번 예시에서는 in 키워드와 not 키워드를 같이 사용하는 not in 구문을 사용하면 합니다.
rollback;
select * from Books ;
-- 서적 아이디 'jsp'가 절판이 되었습니다.

-- 서적 아이디 'java', 'spring'이 절판되었습니다.

-- 위의 사항들을 롤백 하시오.
rollback; 

-- savepoint를 실습합니다.
savepoint point01 ;

-- 샘플용 테이블 mybook을 다음과 같이 생성하도록 합니다.
create table mybook
as
select bid, bname, price from books where price < 10000  ;
select * from mybook ;
 
-- 모든 서적의 단가를 10,000원으로 수정합니다.
update mybook set price = 10000 ;
select * from mybook ;
-- 현재 상황) 모든 서적의 단가가 10000원입니다.


-- point02 지점으로 이동하면, 여자들의 급여가 이전 상태로 돌아갑니다.
savepoint point02 ;
rollback;
select * from mybook ;
-- 모든 서적들의 단가가 이전의 값으로 되돌아 갈것이라고 기대됩니다.

rollback to point01 ;
select * from mybook ;
-- point01 지점으로 이동하면, 8000 이하인 서적들도 보여야 합니다.
-- 8000원짜리 이하의 서적 목록도 보입니다.

update books set price = null where bid in ('r','database','mybatis' ) ;

commit ;

-- 모든 서적들의 정보를 출력해 보세요.
select * from books ;
-- 모든 서적들의 아이디, 서적 이름, 단가를 조회해 보세요.
select bid,bname,price from books ;
-- 모든 서적들의 서적 이름, 단가, 아이디를 조회해 보세요.
select bname,price,bid from books ;
-- 서적의 이름과 10권을 판매한 금액을 출력해 보세요.

-- 서적의 이름과 가격과 10 퍼센트 할인된 가격 정보를 출력해 보세요.
select bname,price,price - price* 0.1 from books
rollback;
select * from books ;
-- 출판사 이름만 조회해 보세요.
select publisher from books ;
-- 출판사 이름만 조회하되, 중복된 데이터는 하나만 출력되도록 해주세요.
select distinct publisher from books ;
-- 서적의 이름과 단가와 100원 인상된 가격을 출력해 보세요.
select bname, price, price + 100 as upprice from books ;
-- 서적의 이름과 단가와 50% 인상된 가격을 출력해 보세요.
select bname, price, price + price /2 as result from books ;
-- 서적의 이름과 단가와 50% 인상된 가격을 출력하되 별칭을 적절히 사용해 보세요.
select bname, price, price + price /2 as result from books ;
-- 서적 이름과 단가를 출력하되, 별칭 '서적_이름', '가격'으로 출력해 보세요.
select bname as "'서적 이름'", price as "'가격'" from books ;
-- 문자열 연결 연산자를 사용하여 다음과 같이 출력해 보세요.

-- 자바 프로그래밍의 가격은 7000원입니다.
select bname || '의 가격은 ' || price || ' 입니다.' as result from books ;
-- 서적 이름 : 자바 프로그래밍, 출판사 : 대한 출판사, 가격 : 7000
select '이름 : ' || bname || ', 출판사 : ' || publisher || ', 가격 : ' || price as result from books ;
-- 행의 제한
select * from books ;
-- 서적의 아이디가 python인 서적을 조회해 보세요.
select * from books where bid = 'python' ;
-- 서적 제목이 '파이썬 프로그래밍'인 서적들을 출력해 보세요.
select * from books where bname = '파이썬 프로그래밍' ;
-- 오라클에서 문자는 외따옴표로 사용해야 합니다.
select * from books ;
-- 서적의 단가가 10,000원 이상인 서적을 조회해 보세요.
select * from books where price >= 10000 ;
-- 출판사의 이름이 '지한 출판사'인 행들만 조회해 보세요.
select * from books where bname = '지한 출판사' ;
-- 서적의 단가가 9,000원이상이고, 13,000원 이하인 서적들을 조회해 보세요.
select * from books where price >= 9000 and price <= 13000 ;
-- 서적의 단가가 30,000원 이상이거나 7,000원 이하인 서적들을 조회해 보세요.
select * from books where price >= 30000 or price <= 7000 ;
-- 서적의 아이디가 'python' 또는 'database'인 서적의 서적 이름과 단가를 조회해 보세요.
select bname,price from books where bid = 'python' or bid = 'database' ;
select * from books ;
-- 서적의 단가가 8,000원이거나 13,000원인 서적들을 조회해 보세요.
select * from books where price = 8000 or price = 13000 ;
-- 서적의 단가가 없는 서적들을 출력해 보세요. 
select * from books where price is null ;
-- 단가가 존재하는 서적을 출력해 보세요.
select * from books where price is not null ;
-- 모든 서적들의 서적 이름과 단가와 10권 판매된 금액을 조회해 보세요. 

-- 서적의 단가가 9,000원 이상, 13,000 이하인 서적들을 조회해 보세요.
select * from books where price >= 9000 and price <= 13000 ;
rollback ;
select * from books ;
-- 서적 이름의 '사'로 시작하고 '자'로 끝나는 서적들을 조회해 보세요. 

-- 출판사 이름이 '소셜 미디어'이거나 '대한 출판사'인 서적들을 조회해 보세요.
select * from books where publisher = '소셜 미디어' or bname = '대한 출판사' ;
-- in 절(clause)을 사용하여 서적의 아이디가 'java', 'python' , 'database'인 행을 출력해 보세요.
select * from books where bid in ('java','python','database') ;
-- 서적 제목이 'R 프로그래밍'이거나 '스프링 Framework'인 서적들은?
select * from books where bname = 'R 프로그래밍' or bname = '스프링 Framework' ;
-- like 연산자
-- 서적 이름이 '자'로 시작하는 서적들을 출력해 보세요.
select * from books where bname like '자%' ;
-- 글자 '파'로 시작하는 모든 서적들을 출력해 보세요.
select * from books where bname like '파%' ;
-- 서적 이름에 '프로'자가 들어가는 서적들을 출력해 보세요.
select * from books where bname like '%프로%' ;
-- 두 번째 글자가 반드시 '이'인 서적들을 출력해 보세요.
select * from books where bname like '_이%' ;
-- 출판사 이름이 '사'로 끝나는 모든 서적들을 출력해 보세요.
select * from books where publisher like '%사' ;

-- 서적 이름이 '프'로 시작하거나, '론'으로 끝나는 모든 서적들을 출력해 보세요.
select * from books where bname like '프%' or bname like '%론' ;


-- 부정어 사용해보기
-- 출판사 이름이 '대한 출판사'와 '지한 출판사'이 아닌 모든 서적들을 출력해 보세요.
select * from books where publisher not in ('대한 출판사','지한 출판사') ;
-- 서적의 아이디가 'r', 'database', 'mybatis'가 아닌 서적들을 출력해 보세요.
select * from books where bid not in ('r','database','mybatis') ;
-- 단가가 9,000원과 13,000원 사이에 있지 않은 서적들을 출력해 보세요.
select * from books where price not between 9000 and 13000 ;
-- 서적의 이름이 '프로그래밍'으로 끝나지 않은 서적들을 출력해 보세요.
select * from books where bname not like '%프로그래밍' ;
-- 서적의 단가가 결정이 된 서적들을 출력해 보세요.
select * from books where price is not null ;
-- 연산자의 복합적 사용
-- 출판사 이름이 '대한 출판사'가 아니고, 단가가 10,000원 이하인 서적들을 출력해 보세요.
select * from books where publisher not in ('대한 출판사') and price <= 10000 ;
-- 서적의 이름이 '프로그래밍'으로 끝나는 서적 중에서 단가가 8,000원 이하인 서적들을 출력해 보세요.
select * from books where bname like '%프로그래밍' and price <= 8000 ;
-- 서적의 단가가 결정이 된 서적 중에서 단가가 8,000원과 13,000원 사이에 있지 않은 서적들을 출력해 보세요. 
select * from books where price is not null and price not between 8000 and 13000 ;
-- 데이터 정렬하기
rollback ;
select * from books ;
commit ;
-- 서적의 단가가 낮은 것부터 출력해 보세요.
select * from books order by price asc ;
-- 서적의 이름에 대하여 오름차순으로 출력해 보세요.
select * from books order by bname asc ;
-- 서적의 이름에 대하여 내림차순으로 출력해 보세요.
select * from books order by bname desc ; 
-- 입고 일자가 빠른 것 부터 정렬해 보세요.
select * from books order by inputdate desc ;
-- 출판사 이름으로 내림차순 정렬 후, 단가가 낮은 서적부터 정렬해 보세요.
select * from books order by publisher desc, price asc ;

insert into customer(id, name, address, phone, manager, salary) 
values('yoon', '윤봉길', '중국 상하이', '000-1111-1111', 'shin', 100);

insert into customer(id, name, address, phone, manager, salary) 
values('yusin', '김유신', '신라 경주', '000-2222-2222', 'shin', 200);  

insert into customer(id, name, address, phone, manager, salary) 
values('shin', '신사임당', '백제 공주', '000-3333-3333', null, 300);

insert into customer(id, name, address, phone, manager, salary) 
values('an', '안중근', '조선 강원도', '000-4444-4444', 'hong', 400);

insert into customer(id, name, address, phone, manager, salary) 
values('hong', '홍범도', '일제 시대 간도',  null, null, 500);

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

-- '곰돌이' 사용자의 'Books' 테이블에 대하여 적절한 함수를 사용하여 풀어 보세요
-- 문자열 함수부터 먼저 풀어 보도록 하겠습니다.

-- 서적의 이름을 대문자, 소문자 등으로 변경해 보세요. 
select bid,upper(bid),lower(bid),initcap(bid) from books ;
-- 반드시 concat 함수를 사용하여 다음 예시와 같이 출력되도록 하세요.
select * from books; 
-- 제목 : 자바 프로그래밍, 출판사 : 대한 출판사
select concat(concat('제목 : ',bname),concat(', 출판사 : ', publisher)) as result from books ;
-- 서적 이름의 5번째 글자부터 끝까지 추출해 보세요. 
select substr(bname,5) from books ;
-- 서적 이름의 앞 3글자만 추출해 보세요. 
select substr(bname,1,3) from books ;
-- 서적과 출판사의 이름과 이름의 길이를 조회해 보세요. 
select bname,publisher,length(bname),length(publisher) from books ;
-- 서적 이름이 9자리 이상인 항목만 조회해 보세요. 
select bid,bname,publisher from books where length(bname) in 9 ;
-- instr 함수()를 사용하여 책의 이름에 '프로그래밍'라는 단어가 들어있는 행만 조회하세요. 
select bid,bname,publisher, instr(bname, '프로그래밍') from books ;
-- lpad 함수를 사용하여 price 컬럼을 전체 10자리 형식으로 채워 주세요.
select bid,bname,publisher,price, lpad(price,10,'*') from books; 
-- 모자란 공간은 '*' 기호로 채우도록 하세요. 
select bid,bname,publisher,price, lpad(price,10,'*') from books; 
-- price 컬럼의 값과 (책이름의 문자열 길이)의 제곱 값을 더한 결과를 출력해보세요.
select price,length(bname),price + length(bname)*length(bname) from books ;
-- 예를 들어서 price=8000이고, 책이름이 "자바 프로그래밍"(8자리)이면 64이므로 최종 결과는 8064이 되어야 합니다.

-- 서적 이름에 '프로그래밍'을 'programming'으로 치환해 보세요. 
select bname, replace(bname, '프로그래밍','programming') from books ;
-- rtrim() 함수를 사용하여 서적 이름에 '프로그래밍'이라는 단어를 삭제해 보세요.
select bname, rtrim('프로그래밍') as result from books ;
-- 서적의 아이디의 길이가 3의 배수인 행들만 조회해 보세요. 
select *from books where mod(length(bname),3 )= 0  ;
-- 다음은 customers 테이블에서 실습하도록 합니다.
-- 주소 컬럼에서 국가 이름만 출력해 보세요. 
select substr(address,1,3)from customer ;
-- instr 함수()를 사용하여 전화 번호에 '3333'이 들어 있는 행만 조회해 보세요. 
select id,name,address,phone, instr(phone,'3333') from customer ;
-- substr 함수()를 사용하여, 성씨를 제외하고, 이름만 추출해 보세요. 
select substr(name,2) from customer ;
-- 숫자형 함수 실습을 위하여 다음 문장을 우선 실행하도록 합니다.
update books set price = 1.1 * price ;
update books set price = -123.4567 where bid in('r', 'database', 'python') ;
commit ;
-- 
-- 단가에 대한 절대 값을 구해 보세요. 
select bname,price,abs(price) from books ;
-- 서적의 아이디가 'r', 'database', 'mybatis', 'spring'인 서적에 대하여 가격을 올림/버림해 보세요. 
select bid,price, ceil(price),floor(price) from books where bid = 'r';
select bid,price, ceil(price),floor(price) from books where bid = 'database';
select bid,price, ceil(price),floor(price) from books where bid = 'mybatis';
select bid,price, ceil(price),floor(price) from books where bid = 'spring';
-- 단가들을 정수 값으로 반올림 및 절삭해보세요. 
select bid,bname,price, round(price),trunc(price) from books ;
-- 모든 단가에 대하여 절대 값으로 변경하고, 루트를 씌운 결과를 출력하세요. 
select sqrt(abs(price)) from books ;
-- 서적 이름의 길이가 5의 배수인 서적들을 출력해 보세요. 
select mod(length(bname),5) from books;
select * from books where mod(length(bname),5) = 0 ;
-- 서적 이름의 길이를 3제곱하는 문장을 만들어 보세요. 
select bname, power(length(bname),3) from books ;
-- 단가에서 서적 이름의 길이의 2제곱을 뺄셈하는 문장을 만들어 보세요. 
select bname,price, price - power(length(bname),2) from books ;
-- 서적의 단가에 부호 함수를 적용해 보세요. 
select price, sign(price) from books ;
-- 절대 값 함수인 abs를 사용하지 않고 서적의 단가에 대하여 절대값으로 변경해 보세요. 

-- 날짜 함수

-- 서적들의 이름과 입고 날짜부터 경과한 일수를 조회해 보세요. 
alter session set nls_date_format = 'yyyy-mm-dd' ;
alter session set nls_date_format = 'yyyy-mm-dd hh:mi:ss' ;
-- 서적들의 이름과 입고 날짜부터 경과한 월수를 소수점 3째자리까지 보여 주세요. 
select sysdate from books;
-- 서적의 아이디가 'r', 'database'인 서적의 입고 일자를 3개월 전으로 변경하세요. 
select sysdate, add_months(sysdate, 3) from books where bid = 'r' ;

select sysdate, add_months(sysdate, 3) from books where bid = 'database' ;
-- 변경 전의 데이터와 변경 후의 데이터를 동시에 출력해 봅니다.
select inputdate,sysdate, add_months(sysdate, 3) from books where bid = 'r' ;
-- 서적의 아이디가 'python', 'spring'인 서적의 입고 일자를 5일전으로 변경해 보세요. 
update books set inputdate = inputdate - 5 where bid in ('python' ,'spring') ;
-- 변경 전의 데이터와 변경 후의 데이터를 동시에 출력해 봅니다.
select * from books where bid in ('python','spring') ;

-- 아이디가 'python', 'spring'인 서적의 입고 일자를 돌아오는 금요일로 변경해 보세요. 
select next_day(sysdate,'금') from books where bid in ('python','spring') ;

-- 타입 변환 함수
-- 서적의 입고 일자를 '월/일' 형식으로 출력해 보세요. 
select bname, to_char(inputdate,'mm/dd') from books ;
-- 서적의 입고 일자를 'yyyy年 mm월 dd일' 형식으로 출력해 보세요.
select bname, to_char(inputdate,'yyyy"年"mm"월"dd"일"') from books ;
-- 다음 문장을 실행하고, 그 결과를 예측해 보세요.
select 
to_char(price, '$999,999.00') as price01,
to_char(price, '$000,000.00') as price02,
to_char(price, 'L999,999.00') as price03,
to_char(price, '000,000.00') as price04
from books ;
-- 
-- null 처리 함수 실습을 위하여 다음 문장을 우선 실습해 주세요.
update books set inputdate = null where bid in ('python', 'spring') ;
commit ;
-- 
-- 서적의 이름과 입고 일자를 출력해 보세요.
select bname,inputdate from books ;
-- 입고 일자가 존재하지 않는 데이터는 현재 시각으로 출력해보세요. 
update books set inputdate = null where bid in ('python', 'spring') ;
select * from books ;
update books set inputdate = sysdate where inputdate = null ;
select nvl(inputdate,sysdate) from books;
-- 서적의 이름과 단가를 출력해 보세요.
select bname,price from books ;
-- 단가가 존재하지 않는 데이터는 1,000원으로 출력해보세요. 
select nvl(price,1000) from books ;
-- 서적들의 이름과 단가를 조회해 보세요. 
select bname,price from books ;
-- 단가의 존재 여부에 대하여 코멘트('단가 존재함', '단가가 null임')를 작성해 보세요. 
select bname,price, nvl2(price,'단가 존재함','단가가 null임') from books;
-- 서적의 이름과 출판사를 조회하시오. 
select bname,publisher from books;
-- 단, 출판사 '소셜 미디어'인 출판사는 null 값으로 대체 하세요. 
select replace(publisher,'소셜 미디어',null) from books;
-- 출판사의 이름이 '민국 미디어'이면 'm'을, '대한 출판사'이면 'd'를, '지한 출판사'이면 's'를
select replace(publisher,'민국 미디어','m') from books;
select replace(publisher,'대한 출판사','d') from books;
select replace(publisher,'지한 출판사','s') from books;

select bname,publisher, decode(publisher ,'민국 미디어', 'm' , '대한 출판사' ,'d','지한 출판사','s','x')as result from books;
-- 나머지는 'x'를 출력하는 코드를 작성해 보세요. 
-- 위의 문제를 case 표현식으로 다시 풀어 보세요. 
select bname,publisher,case publisher
when '민국 미디어' then 'm'
when '대한 출판사' then 'd'
when '지한 출판사' then 's'
else 'x'
end
as result from books;
-- 서적들의 아이디, 이름, 출판사, 단가 및 파생 결과를 출력해보세요. 파생 결과는 출판사가 '민국 미디어'이면, 단가의 10% 인상액, 출판사가 '대한 출판사'이면, 20%, 출판사가 '지한 출판사'이면, 30%, 나머지는 원래 단가를 그대로 출력해야 합니다. 단, 단가가 null이면 기본 값으로 100원을 지정하도록 합니다. 
-- 
-- orders 테이블
-- 아래의 실습을 하기 위하여 다음 문장을 수행하세요. 
update orders set saleprice = null  where oid in(1, 3, 5) ;
update orders set saledate = null  where oid in(1, 2, 3) ;
commit ;
-- 
-- 
-- orders 테이블에 대하여 다음과 같이 출력이 되는 sql 구문을 작성해 보세요.
-- cid 컬럼과 case 구문을 사용하여 고객 아이디와 이름을 출력해 보세요.
-- 단, 판매가가, 존재하지 않으면 10,000원으로 출력하세요.
-- 판매가는 21,000일때, \21,000.00의 형식으로 출력하세요. 
-- 단, 주문 일자가, 존재하지 않으면 현재 시각으로 출력하세요.
-- 주문 일자는 '2014年 07月 13日'의 형식으로 출력하세요. 

-- 그룹(집계) 함수
-- books 테이블에 대하여 다음과 같은 집계 함수 사용법에 대한 물음에 필요한 sql 구문을 작성해 보세요.
-- 차후 실습을 위하여 다음 문장을 우선 수행하도록 합니다.
-- 
update books set price = abs(price) ;
commit ;
-- 
-- 총 서적은 몇 권인가요?
select count(bname) from books;
-- 단가가 정해진 서적은 총 몇 권인가요?
select count(price) from books; 
-- count(*)와 count(price)를 사용하여 단가가 null인 행 개수를 구해 보세요.
select count(price) from books ;
select count(*) from books ;
-- 출판사의 갯수는 총 몇 개인가요? 
select count(publisher) from books ;
-- 모든 서적들의 단가의 평균 값을 소수점 2째자리까지 구해 보세요. 
select avg(price) from books;
-- 단가의 평균을 구하되, null인 서적은 100으로 치환하여 계산하세요. 
select avg(nvl(price,100)) from books;
-- 단가의 총합을 구해 보세요. 
select sum(price) from books;
-- 단가의 총금액을 구하되, null인 서적은 100으로 치환하여 계산하세요. 
select sum(nvl(price,100)) from books;
-- 책의 최저 단가와 최고 단가는 각각 얼마인가? 
select max(price), min(price) from books;
-- 출판사 이름을 기준으로 오름차순 정렬시 가장 먼저 조회되는 출판사는 어디인가요?
select publisher, count(*) as cnt
from books
group by publisher order by publisher asc ;

-- 출판사 이름을 기준으로 오름차순 정렬시 가장 나중에 조회되는 출판사는 어디인가요? 
select publisher, count(*) as cnt
from books
group by publisher order by publisher asc ;

-- 출판사별로 책들의 단가의 총합을 구해 보세요. 
select publisher, sum(nvl(price,100)) as sumsal
from books group by publisher ;

-- 출판사별로 각각 몇 권의 서적을 가지고 있는지 확인해 보세요. 
select publisher, count(nvl(bname,0)) as result
from books group by publisher ;

-- 출판사별로 책들의 단가의 총합과 최소 값을 구해보세요.
select publisher, sum(nvl(price,10000)) as sumsal , min(nvl(price,0)) as minsal
from books group by publisher ;
-- 단, 단가가 null이면 10,000원으로 치환하여 계산해야 합니다. 
-- 출판사별로 책들의 단가의 총합을 구하되, '민국 미디어'는 제외하도록 하고, 단가의 총합이 큰 것부터 정렬하세요. 
select publisher, sum(nvl(price,100)) as sumsal
from books 
where publisher is not null and publisher != '민국 미디어' 
group by publisher ;

-- 출판사별로 책들의 단가의 총합을 구해 보세요.
select publisher, sum(price) as sumsal
from books 
where price >= 20000
group by publisher ;
-- 단, 단가의 총합이 20,000이상인 항목만 조회하세요. 
select * from books ;
-- 출판사별로 책들의 단가의 총합을 구해 보세요.
-- 단, 단가의 총합이 20,000이상이고, 30,000이하인 항목만 조회하세요. 
select publisher, sum(price) as sumsal
from books 
where price >= 20000 and price <= 30000 
group by publisher ;
-- 시퀀스와 게시물
-- 시퀀스 실습을 위하여 주문(orders) 테이블의 데이터를 모두 삭제합니다.
-- 시퀀스 seqorder를 생성하고, 해당 시퀀스를 사용하여 주문(orders) 테이블을 다시 생성하세요.
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
-- 조인(Join)
-- 고객의 이름과 주문한 책의 아이디를 조회해 보세요.      
select cid,bid from orders ;
-- 고객의 이름과 주문한 책의 아이디를 조회해 보세요. 
select cid,bid from orders ;
-- 단, 고객의 이름이 '안중근', '윤봉길'인 사람들만 조회하도록 합니다. 
select customer.name, orders.bid
from customer join orders
on customer.id = orders.cid ;
-- 다음과 같이 등급을 의미하는 테이블을 생성합니다.
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
-- 생성한 등급 테이블을 이용하여 각 고객들의 등급 정보를 출력해 보세요.
select c.name, c.salary, g.glevel
from customer c, grades g
where c.salary between g.lowsal and g.highsal ;
-- 고객의 이름과 주문한 책의 아이디와 판매 금액을 조회해 보세요.
-- 단, 주문하지 않은 고객들의 이름 정보도 출력이 되어야 합니다. 

select c.name, c.id, o.bid ,o.saleprice
from customer c full outer join orders o
on c.id = o.cid ;

-- 고객과 매니저 정보를 같이 출력해 보세요.

select c.name, c.id, o.bid ,o.saleprice ,c.manager
from customer c full outer join orders o
on c.id = o.cid ;

-- 매니저에 대한 정보는 manager 컬럼을 참조하면 됩니다.

-- '윤봉길의 관리자는 shin입니다.'
select c.name || '의 관리자는' || g.manager || '입니다' as result
from customer c inner join customer g
on c.id = g.manager ;

-- 고객과 매니저 정보를 같이 출력해 보세요.
-- 매니저도 하나의 행으로 출력이 되어야 합니다.  
select c.name || '의 관리자는' || g.manager || '입니다' as result
from customer c full join customer g
on c.id = g.manager ;

-- 각 고객들의 이름과 주문 건수를 출력해 보세요.
-- 단, 주문하지 않은 고객들의 이름 정보도 출력이 되어야 합니다.
select c.name, count(nvl(salary,0)) as cnt
from customer c left outer join orders o
on c.id = o.bid group by c.name order by cnt desc, c.name asc ;
