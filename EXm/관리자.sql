-- ����Ŭ �ּ��� ���� 2���� �������� ���
-- �ű� ����ڸ� �����մϴ�(���̵� oraman / ��� oracle)

CREATE USER ORAMAN identified by oracle account unlock ;

-- ������� ���̺� �����̽��� �����մϴ�
alter user ORAMAN default tablespace users quota unlimited on users;

-- ����ڿ��� ���� ���Ѱ� resource ������ �ο��� �ݴϴ�
grant connect, resource to ORAMAN;

CREATE USER gomdori identified by omygod account unlock ;

alter user gomdori default tablespace users quota unlimited on users;

grant connect, resource to gomdori;

CREATE USER sundori identified by abc123 account unlock ;

alter user sundori default tablespace users quota unlimited on users;

grant connect, resource to sundori;
