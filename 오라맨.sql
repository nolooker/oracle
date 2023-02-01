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

-- pseudo column : 오라클 시스템이 관리상의 편의를 위하여 만든 칼럼들
select rownum, rowid, id, salary from employees ;

update employees set salary = 100 * rownum ;

select * from employees ;

commit ;

-- CATS 기법 
create table myemp
as 
select id,name,salary,marriage,gender from employees where marriage in('결혼') ;

select * from tab ;
select * from myemp ;

-- 세이브 포인트 : point01 지정
savepoint point01 ;

update myemp set salary = 1000 where gender = '여자' ;

select * from myemp ;

savepoint point02 ;

delete from myemp where gender = '남자' ; 

-- 현재 상태 : 여자 3명이 존재하고, 급여들이 1000원인 상태

rollback to point02 ;

rollback to point01 ;

select * from myemp ;

select * from employees ;

-- 여러 컬럼을 명시할 때는 콤마를 사용합니다.

select id,name,salary from employees ;

select name, salary, id from employees ;

select gender from employees ;

select distinct gender from employees ;

select name, salary, salary + 100 from employees ;

select name, salary, 12*salary from employees; 

-- alias는 컬럼에 이름을 한시적으로 부여해서 만드는 별칭
select name, salary, 1.1*salary 급여, 12*salary as "ann sal" from employees; 

select name || '의 급여는 ' || salary || '원 입니다. ' as result from employees ;

select '이름 : ' || name || ', 성별 : ' || gender || ', 급여 : ' || salary as result from employees ;

select '성별 : ' || gender || ', 연봉 : ' || 12*salary || '원 입니다.' as result from employees; 

select * from employees ;

select * from employees where id = 'an' ;

select * from employees where salary >= 1000 ;

select * from employees where gender = '남자' ;

select * from employees where salary >= 600 and salary <= 1000 ;

select * from employees where salary >= 1100 or salary <= 400 ;

select * from employees where id = 'an' or id = 'soon' ; 

select * from employees where salary = 800 or salary = 1000 ;

-- 널 데이터 사전 실습
update employees set salary = null where id in('kang','nongae','queen') ;

commit ;

-- 널은 비교 판독이 불가능하며, 널 존재 여부는 be 동사 is 를 사용합니다.

-- 급여 책정이 안 된 사원들
select * from employees where salary is null ;

-- 관리자들 조회
select * from employees where manager is null ;

select name,salary,12*salary from employees ;

select * from employees ;

select * from employees where salary between 800 and 1400 ;

select * from employees

where name between '사' and '자' ;

select name, salary from employees where id in ('an','soon') ;

select name, salary from employees where salary in (200,500) ;

select * from employees where name like '김%' ;

select * from employees where name like '%신%' ;

select * from employees where name like '_순%' ;

select * from employees where name like '%후' ; 

select * from employees where id not in ('kim9' ,'yusin' , 'soon' );

select * from employees where marriage not in ('이혼') ;

select * from employees where salary not between 900 and 1400 ;

select * from employees where name not like '김%' ;

select * from employees where salary is not null ;

select * from employees where manager is not null ; 

select * from employees
where (salary is not null) and (manager is not null) ;

select * from employees where gender = '남자' and salary < 600 ; 

select * from employees where marriage = '결혼' and address = '서대문' ;

select * from employees 
where marriage = '결혼' or address in ('용산', '마포')
order by salary asc;

select * from employees where manager = 'kim9' and address = '서대문' ;

select * from employees where name like '김%' or gender in ('여자') order by name desc ;

update employees set birth = sysdate where id in('an', 'soon') ;
update employees set birth = null where id in('queen', 'yusin') ;
update employees set birth = '1988/10/10' where id in('kang', 'lee') ;
commit ;

select * from employees ;

select * from employees order by salary ;

select * from employees order by salary asc ;

select * from employees order by name asc;

-- 나이가 적은 순으로 정렬
select * from employees order by birth desc; 

select * from employees order by name desc;

-- 이름과 연봉 출력, 연봉이 높은 순
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

select concat('아이디 : ',name) as result from employees ;

select concat(concat(concat('이름은 ', name), concat('이고, 급여는 ',salary)), '원 입니다') as result from employees;

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

select id, name,salary, abs(salary) from employees where gender = '여자' ;

select id, name,salary, ceil(salary),floor(salary) from employees where gender = '여자' ;

select id,name,salary,round(salary),trunc(salary) from employees where gender = '여자' ; 

select sqrt(5) from dual ;

select round(sqrt(5),3) from dual ;

select * from employees ;

select name, sqrt(abs(salary)) from employees where gender = '여자' ;

select mod(14,5) from dual ;

select mod(1700,500) from dual ;

select * from employees where mod(length(id), 5) = 0 ;

select power(2,3) from dual ;

select id,name, power(length(id),2) from employees where gender = '여자' ;

select name,salary,sign(salary) from employees where gender = '여자' ;

select sysdate from dual;

alter session set nls_date_format = 'yyyy-mm-dd hh:mi:ss' ;

select sysdate from dual;

alter session set nls_date_format = 'yy/mm/dd' ;
alter session set nls_date_format = 'yyyy-mm-dd hh:mi:ss' ;
select sysdate from dual ;

select sysdate + 1, sysdate -1 from dual ;

select sysdate, sysdate +2/ 24, sysdate - 5/24/60/60 from dual ;

select name,birth,round(sysdate - birth,3) as "살아온 날수" from employees ;

select months_between(sysdate, '2020/01/01') from dual ;

select name,birth,round(months_between(sysdate, birth),3) as result from employees ;

select sysdate, add_months(sysdate,3), add_months(sysdate,-5) from dual ;

select * from employees where id in('kim9','general') ;

update employees set birth = add_months(birth,-5) where id in('kim9','general') ;

select * from employees where id in ('kim9','general');

select * from employees where id in ('hwang','maria');

update employees set birth = birth - 74 where id in('hwang','maria') ;

select * from employees where id in ('hwang', 'maria') ;

select next_day(sysdate, '금') from dual ;

select last_day(sysdate) from dual ;

select round(sysdate,'month') from dual ;

select round(sysdate, 'year') from dual ;

select trunc(sysdate, 'month') from dual ;

select trunc(sysdate,'year') from dual ;

select sysdate, to_char(sysdate, 'yyyy-mm-dd') from dual ;

select name, to_char(birth, 'mm/dd') from employees;

select name, to_char(birth, 'year month') from employees ;

select name, to_char(birth, 'yyyy"年" mm"月" dd"日"') as "생일 정보" from employees;

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

-- decode 함수는 오라클 전용 함수입니다.
rollback;
select * from employees;

select id,name,manager, decode
(manager,'yusin','김유신 장군','soon','유관순 누나','kim9','김구 선생님','관리자')
as result from employees;

update employees set salary = 200.0 where id = 'nongae' ;
update employees set salary = 300.0 where id = 'queen' ;

commit ;

select nvl('가나다','하하') from dual ;

select nvl(null,'하하') from dual ;

select name,salary,nvl(salary,100) newsalary from employees where gender = '남자' ;

select name,nvl(manager,'관리자') newmanager from employees where gender = '여자' ;

select name,salary,nvl(salary,100) newsalary,12*nvl(salary,100) annsal from employees 
where gender = '남자' ;

select name,salary,nvl2(salary,'급여 존재함','급여가 null임') from employees where gender = '남자' ;

select id,name,marriage, nullif(marriage, '미혼') as result from employees where gender = '남자' ;

select id,name,marriage, nullif(marriage, '결혼') as result from employees where gender = '여자' ;

select id,name,marriage, nullif(marriage, '미혼') 
as result from employees where gender = '여자' ;

update employees set salary = null where id = 'soon' ;
commit ;

select name, coalesce(manager, to_char(salary), '모두 널') as result from employees
where gender = '여자' ;

select id, name, manager,case manager
when 'yusin' then '김유신 장군'
when 'soon' then '유관순 누나'
when 'kim9' then '김구 선생님'
else '관리자' end as result from employees ;

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