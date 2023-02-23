��  -����->���θ����->�����ͺ��̽� ����-> �����ͺ��̽� ����
    ->���ϸ� : 20230223_06group.sql
    ->������ġ : i:\java202301\database
///////////////////////////////////////////////////////

-- sungjuk ���̺� ����
drop table sungjuk;

-- sungjuk ���̺� ����
create table sungjuk(
    sno     int         primary key                  
    ,uname  varchar(50) not null
    ,kor    int         check(kor between 0 and 100) 
    ,eng    int         check(eng between 0 and 100) 
    ,mat    int         check(mat between 0 and 100)
    ,addr   varchar(50) check(addr in ('Seoul', 'Jeju', 'Busan', 'Suwon'))
    ,aver   int         default 0
    ,tot    int         default 0
    ,wdate  date        default sysdate           
);

-- sungjuk ���̺� �Է� ������
 �� ���� I:\java202301\database\20230223_04�������̺�.sql
 
commit;
select count(*) from sungjuk;
select * from sungjuk; 


�� [������ �׷�ȭ]

select * from sungjuk order by addr; --����


�� [distinct]
        - Į���� �ߺ� ������ ������ ��ǥ�� 1���� ���
        - ����) distinct Į����

select addr from sungjuk;
select addr from sungjuk order by addr;     --asc ��������
select addr from sungjuk order by addr asc;
select addr from sungjuk order by addr desc;

select distinct(addr) from sungjuk;
select distinct(uname) from sungjuk;


//////////////////////////////////////////////////////////

�� [group by]
  - Į���� ���� ���볢�� �׷�ȭ ��Ŵ
  - ����) group by Į��1, Į��2, Į��3

-- �ּҰ� ������ ���� �׷�ȭ��Ű�� �ּҸ� ��ȸ
select addr
from sungjuk
group by addr;  --distinct�� ����� ���� �� �� ���� / ����, ��賻�� �Լ��� ���� ����


-- ORA-00979: GROUP BY ǥ������ �ƴմϴ�. -  "not a GROUP BY expression"
select addr, uname -- �׷��� �������� �ϳ��� ���� ���ö��� ����
from sungjuk
group by addr; -- ����



























select * from sungjuk;