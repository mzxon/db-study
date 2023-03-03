��  -����->���θ����->�����ͺ��̽� ����-> �����ͺ��̽� ����
    ->���ϸ� : 20230303_01���̺�����.sql
    ->������ġ : i:\java202301\database
///////////////////////////////////////////////////////

�� [���̺� ���� ���� ����]

--��ü �� ����
select count(*) from tb_student;
select count(*) from tb_gwamok;
select count(*) from tb_sugang;

��2) �������� ������û �ο���, ������ ��ȸ�Ͻÿ�
     ���� 2��
     ���� 2��
     
     
1) �������̺� ��ȸ
select * from tb_sugang order by hakno;

2) ���� ��û�� �л����� ��� ��ȸ (�й�)
select hakno from tb_sugang order by hakno;
select distinct(hakno) from tb_sugang order by hakno;
select hakno from tb_sugang group by hakno;
select hakno, count(*) from tb_sugang group by hakno;

3) ������û�� �й�(AA)���� �ּҸ� �л����̺��� ��������
select AA.hakno, ST.address
from(select hakno from tb_sugang group by hakno)AA join tb_student ST
on AA.hakno = ST.hakno;



4) 3)�� ����� BB���̺�� ���� �� 
select BB.address, count(*) || '��' as cnt
from (
        select AA.hakno, ST.address
        from(select hakno from tb_sugang group by hakno)AA join tb_student ST
        on AA.hakno = ST.hakno
     ) BB
group by BB.address;



-- �ٸ� ���
select AA.address, count(AA.address)
from (
        select SU.hakno, address
        from tb_sugang SU join tb_student ST
        on SU.hakno = ST.hakno
        group by SU.hakno, address
     ) AA
group by AA.address;


////////////////////////////////////////////////////////////////////////////////

��3) ���� ���� ��û �ο���, �����ڵ�, ����� ��ȸ�Ͻÿ� 
     d001  HTML    2��
     d002  ���伥    1��
     d003  �Ϸ���Ʈ  1��
     p001  JAVA    4��
     p002  Oracle  2��
     p003  JSP     2��
     p004  Python  1��
     
     
--1) �������̺��� �����ڵ庰�� �����ؼ� ��ȸ�ϱ�
select * from tb_sugang order by gcode;

--2) �������̺��� �����ڵ尡 ������ ���� �׷�ȭ �ϱ�
select gcode, count(*) from tb_sugang group by gcode;

--3)
select AA.gcode, GW.gname, concat(AA.cnt, '��') as �����ο�
from (
      select gcode, count(*) as cnt 
      from tb_sugang 
      group by gcode
      ) AA join tb_gwamok GW on AA.gcode=GW.gcode
order by AA.gcode;

     
     
    
     
��4) �й��� ������û������ �������� �й��������� ��ȸ�Ͻÿ�
     g1001  ȫ�浿  12����
     g1002  ȫ�浿   8����
     g1005  ���޷�  12����
     g1006  ������   3����
     
--1) �������̺��� �й����� ��ȸ
select hakno, gcode from tb_sugang order by hakno;

--2) �������̺� �����ڵ尡 ��ġ�ϴ� ������ �������̺��� �����ͼ� ���̱�
select SU.hakno, SU.gcode, GW.ghakjum
from tb_sugang SU join tb_gwamok GW
     on SU.gcode = GW.gcode;
     
--3) 2)�� ����� AA���̺�� �����, �й����� �׷�ȭ�� ��, ������ �հ踦 ���ϱ�
select AA.hakno, SUM(AA.ghakjum) as hap
from (
      select SU.hakno, SU.gcode, GW.ghakjum
      from tb_sugang SU join tb_gwamok GW
      on SU.gcode = GW.gcode
      ) AA
group by AA.hakno;
     
--4) 3)�� ����� BB���̺�� �����
select BB.hakno, ST.uname, BB.hap || '����' as hap
from (
        select AA.hakno, SUM(AA.ghakjum) as hap
        from (
                select SU.hakno, SU.gcode, GW.ghakjum
                from tb_sugang SU join tb_gwamok GW
                on SU.gcode = GW.gcode
              ) AA
        group by AA.hakno
     ) BB join tb_student ST on BB.hakno = ST.hakno
order by BB.hakno;
--------------------------------------------------------------------------------

��4)�� �Ǵٸ� ���
--1) �������̺� + �л����̺� + �������̺� = 3�� ���̺� �Ѳ����� ����
select SU.hakno, ST.uname, GW.ghakjum
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode = GW.gcode
order by SU.hakno;

--2) 1���׷�(�й�), 2���׷�(�̸�)���� �׷�ȭ�ϰ� ������ ���ϱ�
select SU.hakno, ST.uname, SUM(GW.ghakjum) || '����' as hap
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode = GW.gcode
group by SU.hakno, ST.uname;




        
��5) �й� g1001�� ������û�� ������ �����ڵ庰�� ��ȸ�Ͻÿ�
     g1001  d001  HTML
     g1001  p001  JAVA
     g1001  p002  Oracle
     g1001  p003  JSP
     g1001  p004  Python    
     
     
--1) �������̺� + �������̺� ����
select SU.hakno, SU.gcode, GW.gname
from tb_sugang SU join tb_gwamok GW
on SU.gcode = GW.gcode;

--2) �й� g1001�� ��û�� ���� ��ȸ�ϱ�
select SU.hakno, SU.gcode, GW.gname
from tb_sugang SU join tb_gwamok GW
on SU.gcode = GW.gcode
where SU.hakno = 'g1001'
order by SU.gcode;
////////////////////////////////////////////////////////////////////////////////

��6) ������û�� �� �л����� �й�, �̸� ��ȸ
     g1001  ȫ�浿
     g1002  ȫ�浿
     g1005  ���޷�
     g1006  ������
1)
select SU.hakno, ST.uname
from tb_sugang SU join tb_student ST
     on SU.hakno = ST.hakno
group by SU.hakno, ST.uname;

2)
select hakno, uname
from tb_student
where hakno in (select hakno from tb_sugang);


��7)������û�� ���� ���� �л����� �й�, �̸� ��ȸ
     g1003  ������
     g1004  ȫ�浿


select hakno, uname
from tb_student
where hakno not in (select hakno from tb_sugang);



select * from tb_student;
select * from tb_gwamok;
select * from tb_sugang;
     

     