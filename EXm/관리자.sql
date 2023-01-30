-- 오라클 주석은 빼기 2개를 연속으로 사용
-- 신규 사용자를 생성합니다(아이디 oraman / 비번 oracle)

CREATE USER ORAMAN identified by oracle account unlock ;

-- 사용자의 테이블 스페이스를 변경합니다
alter user ORAMAN default tablespace users quota unlimited on users;

-- 사용자에게 접속 권한과 resource 권한을 부여해 줍니다
grant connect, resource to ORAMAN;

CREATE USER gomdori identified by omygod account unlock ;

alter user gomdori default tablespace users quota unlimited on users;

grant connect, resource to gomdori;

CREATE USER sundori identified by abc123 account unlock ;

alter user sundori default tablespace users quota unlimited on users;

grant connect, resource to sundori;
