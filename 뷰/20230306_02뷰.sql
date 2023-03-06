��  -����->���θ����->�����ͺ��̽� ����-> �����ͺ��̽� ����
    ->���ϸ� : 20230306_02��.sql
    ->������ġ : i:\java202301\database
///////////////////////////////////////////////////////


�� [�� View]

-- ����� (�ι�°���ʹ� ����)
-- ����) create or replace view ���̸� as ������ ������ SQL��

-- ���̺�, �� ��� Ȯ��
select * from tab;                         --��� ��ü ���� Ȯ��
select * from tab where tabtype='TABLE';   --���̺� ���
select * from tab where tabtype='VIEW';    --�� ���
////////////////////////////////////////////////////////////////////////////////
-- sungjuk ���̺� ��� Ȯ��
select * from sungjuk;


-- �ּҰ� ����, ���������� �̸�, ��, ��, ��, �ּҸ� ��ȸ�Ͻÿ�
select uname, kor, eng, mat, addr
from sungjuk
where addr in ('Seoul', 'Jeju');

create or replace view test1_view
as 
    select uname, kor, eng, mat, addr
    from sungjuk
    where addr in ('Seoul', 'Jeju');
    

--������ ��� ���̺�ó�� ��� �����ϴ�
select * from test1_view; 


--�����ͻ���(user_views���̺�)���� ���� ���� ���� Ȯ��
select * from user_views;
select text from user_views where view_name='TEST1_VIEW';

-�� ����
drop view test1_View;

///////////////////////////////////////////////////////////////////////////////

create or replace view test2_view
as
    select uname as �̸�, kor as ����, eng as ����, mat as ����, addr as �ּ�
    from sungjuk
    where addr in ('Seoul', 'Jeju');
    
select * from test2_view;

//////////////////////////////////////////////////////////////////////////////

��) ������û�� �л����� �й�, �������� ��� �����Ͻÿ�(test3_view)
     g1001  14����
     g1002  8����
     g1005  12����
     g1006  3����
     
--1) ������û������ ������ �����ͼ� �й����� ������ ���ϱ�
select SU.hakno, sum(GW.ghakjum) || '����' as ������
from tb_sugang SU join tb_gwamok GW
on SU.gcode = GW.gcode
group by SU.hakno;

--2) 1)�� ����� test3_view �� �����ϱ�
create or replace view test3_view
as
    select SU.hakno, sum(GW.ghakjum) || '����' as ������
    from tb_sugang SU join tb_gwamok GW
    on SU.gcode = GW.gcode
    group by SU.hakno;

select * from test3_view;


--3) 2)���� ������ ��� �л����̺��� �����ؼ� �й�, �̸�, ������ ����ϱ�
select tb_student.uname, test3_view.*
from tb_student join test3_view
on tb_student.hakno = test3_view.hakno
order by tb_student.hakno;







