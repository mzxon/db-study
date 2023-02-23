��  -����->���θ����->�����ͺ��̽� ����-> �����ͺ��̽� ����
    ->���ϸ� : 20230223_05��������.sql
    ->������ġ : i:\java202301\database
///////////////////////////////////////////////////////

rollback;

-- sungjuk ���̺� ����
drop table sungjuk;

-- sungjuk ���̺� ����
create table sungjuk(
    sno     int         primary key                  -- �⺻Ű(���ϼ�) �ߺ��� ������ x
    ,uname  varchar(50) not null
    ,kor    int         check(kor between 0 and 100) -- �������� 0~100���̸� �Է°���
    ,eng    int         check(eng between 0 and 100) -- �������� 0~100���̸� �Է°���
    ,mat    int         check(mat between 0 and 100) -- �������� 0~100���̸� �Է°���
    ,addr   varchar(50) check(addr in ('Seoul', 'Jeju', 'Busan', 'Suwon'))
    ,aver   int         default 0
    ,tot    int         default 0
    ,wdata  date        default sysdate              -- ���� ��¥ �Լ�
);
////////////////////////////////////////////////////////  
select * from sungjuk;

�� [���̺� �������� ���� �޼���]

-- primary key ��������
-- ORA-00001: ���Ἲ ���� ����(SYSTEM.SYS_C007338)�� ����˴ϴ�
-- sno Į���� �⺻Ű(pk)�̹Ƿ� �ߺ��� ���� ������� ����
insert into sungjuk(sno, uname) values(1, 'ȫ�浿'); --2�� �������� �� ���� �߻�


-- not null ����
-- ORA-01400: NULL�� ("SYSTEM"."SUNGJUK"."UNAME") �ȿ� ������ �� �����ϴ�
insert into sungjuk(sno) values(2);

insert into sungjuk(sno, uname) values(2, '1234567890');
insert into sungjuk(sno, uname) values(3, 'ABCDEFGHIJ');

-- ORA-12899: "SYSTEM"."SUNGJUK"."UNAME" ���� ���� ���� �ʹ� ŭ(����: 11, �ִ밪: 10)
insert into sungjuk(sno, uname) values(4, 'ABCDEFGHIJk');

insert into sungjuk(sno, uname) values(5, '����ȭ');

-- ORA-12899: "SYSTEM"."SUNGJUK"."UNAME" ���� ���� ���� �ʹ� ŭ(����: 12, �ִ밪: 10)
insert into sungjuk(sno, uname) values(6, '���ѹα�');


-- check ��������
-- ORA-02290: üũ ��������(SYSTEM.SYS_C007349)�� ����Ǿ����ϴ�
insert into sungjuk(sno, uname, kor, eng, mat)
values(1, 'ȫ�浿', -10, 20, 300);

-- ORA-02290: üũ ��������(SYSTEM.SYS_C007350)�� ����Ǿ����ϴ�
-- addrĮ���� 'Incheon' ��� ����
insert into sungjuk(sno, uname, kor, eng, mat, addr)
values(1, 'ȫ�浿', 10, 20, 300, 'Incheon');


-- default ��������
-- TOT�� AVER�� 0�Է�, WDATE�� ���� ��¥�� �Էµ�
insert into sungjuk(sno, uname, kor, eng, mat, addr)
values(1, 'ȫ�浿', 10, 20, 300, 'Incheon');

-- SQL ���� : ORA-00913 : ���� ���� �ʹ� �����ϴ� - "too many values"
insert into sungjuk(sno, uname, kor, eng, mat)
values(2, 'ȫ�浿', 10, 20, 30, 'Seoul');








