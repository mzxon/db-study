��  -����->���θ����->�����ͺ��̽� ����-> �����ͺ��̽� ����
    ->���ϸ� : 20230302_04���̺�����.sql
    ->������ġ : i:\java202301\database
///////////////////////////////////////////////////////

�� [���̺� ����]

  - ���� ���̺��� �ϳ��� ���̺�ó�� ����ϴ� ����
  - �ΰ��̻��� ���̺��� �����Ͽ� �����͸� �����ϴ� ���
  - �����̺��� ���밪�� �̿��Ͽ� �÷��� �����ϴ� ����

 ����)
       select Į����
       from ���̺�1 join ���̺�2
       on ������;                --ANSI(ǥ��) SQL��
       
       select Į����
       from ���̺�1, ���̺�2
       on ������;                --Oracle DB SQL��
       
       
       select T1.*, T2.*        --T1.���Į��, T2���Į��
       from T1 inner join T2    --inner ��������
       on T1.x = T2.x           --���̺��, Į����
       
       
       select T1.*, T2.*, T3.*
       from T1 join T2
       on T1.x=T2.x join T3
       on T1.y=T3.y;           --3�� ���̺� ����
       
       
       select T1.*, T2.*, T3.*, T4.*
       from T1 join T2
       on T1.x=T2.x join T3
       on T1.y=T3.y join T4
       on T1.z=T3.z;     
       
    
�� ������ : where ������, having������, on������


       
�� ������ ���̺�� ���� ���̺��� ���� ������ �����̴�.
   - ������ ���̺� : ���� create table�� ���̺�
   - ���� ���̺� : SLQ���� ���� ������ ���̺�
////////////////////////////////////////////////////////////////////////////////

�� inner join ����

select * from tb_sugang;
       
-- �й��� �������� �������̺�� �л����̺� ����
select tb_sugang.*, tb_student.*
from tb_sugang inner join tb_student
on tb_sugang.hakno = tb_student.hakno;

-- �����̺��� ������ ����, inner��������, ���� �⺻
select tb_sugang.*, tb_student.*
from tb_sugang join tb_student
on tb_sugang.hakno = tb_student.hakno;

-- ������û�� �л����� �й�, �����ڵ�, �̸�, �̸��� ��ȸ�Ͻÿ�
select tb_sugang.*, tb_student.uname, tb_student.email
from tb_sugang inner join tb_student
on tb_sugang.hakno=tb_student.hakno;


select * from tb_sugang;

--�����ڵ带 �������� �������̺�� �������̺� ����
select tb_sugang.*, tb_gwamok.gname, tb_gwamok.ghakjum
from tb_sugang inner join tb_gwamok
on tb_sugang.gcode = tb_gwamok.gcode;


-- 3�� ���̺� ���� : �������̺� + �л����̺�(�̸�) + �������̺�(�����)
select tb_sugang.*, tb_student.uname, tb_gwamok.gname
from tb_sugang inner join tb_student
on tb_sugang.hakno=tb_student.hakno inner join tb_gwamok
on tb_sugang.gcode=tb_gwamok.gcode;
       
-- ���̺��� alias(��Ī)�� �����ϴ�
select SU.*, ST.uname, ST.email
from tb_sugang SU join tb_student ST
on SU.hakno=ST.hakno;

select SU.*, GW.gname, GW.ghakjum
from tb_sugang SU join tb_gwamok GW
on SU.gcode=GW.gcode;

select *
from tb_sugang SU join tb_student ST
on SU.hakno=ST.hakno join tb_gwamok GW
on SU.gcode=GW.gcode;

-- ��ȸ�� ���̺��� �ߺ����� ���� Į������ ���̺���� ������ �� �ִ�.
select SU.*, uname, email, gname, ghakjum
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode=GW.gcode;

-- �ߺ��Ǵ� Į������ �Ҽ� ���̺���� ��Ȯ�� ����ؾ� �Ѵ�
-- ORA-00918: ���� ���ǰ� �ָ��մϴ�
select hakno, uname, email, gname, ghakjum      --����
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode=GW.gcode;

select SU.hakno, SU.gcode, uname, email, gname, ghakjum 
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode=GW.gcode;
////////////////////////////////////////////////////////////////////////////////

�� [���̺� ���� ���� ����]

��1) ������û�� �� �л��� �߿��� '����'�� ��� �л��鸸 �й�, �̸�, �ּҸ� ��ȸ�Ͻÿ�

select * from tb_student;
select * from tb_sugang;
select * from tb_gwamok;

select SU.hakno, uname, ST.address
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno
where ST.address = '����';


-- ������ ���� ���̺��� �̸��� AA��� �����ϰ�, �ٽ� �簡�� �� �� �ִ�
select AA.hakno, AA.gcode, AA.uname, AA.address
from (
        select SU.hakno, SU.gcode, uname, address
        from tb_sugang SU join tb_student ST
        on SU.hakno = ST.hakno
    ) AA
where AA.address='����';


-- ORA-00904: "AA"."EMAIL": �������� �ĺ���
-- ST ���̺��� email Į���� �������� �ʾ���
select AA.hakno, AA.gcode, AA.uname, AA.address, AA.email
from (
        select SU.hakno, SU.gcode, uname, address
        from tb_sugang SU join tb_student ST
        on SU.hakno = ST.hakno
    ) AA
where AA.address='����';

-- AA��Ī ���� ����
select hakno, gcode, uname, address
from (
        select SU.hakno, SU.gcode, uname, address
        from tb_sugang SU join tb_student ST
        on SU.hakno = ST.hakno
     ) AA
where AA.address='����';


-- AA���̺��� ��� Į��
select *
from (
        select SU.hakno, SU.gcode, uname, address
        from tb_sugang SU join tb_student ST
        on SU.hakno = ST.hakno
     ) AA
where AA.address='����';
////////////////////////////////////////////////////////////////////////////////

��2) �������� ������û �ο���, ������ ��ȸ�Ͻÿ�
     ���� 2��
     ���� 2��
     



select AA.address, count(AA.address)
from (
        select SU.hakno, address
        from tb_sugang SU join tb_student ST
        on SU.hakno = ST.hakno
        group by SU.hakno, address
     ) AA
group by AA.address;





        
              
       
       
       
       
       
       
       
       