��  -����->���θ����->�����ͺ��̽� ����-> �����ͺ��̽� ����
    ->���ϸ� : 20230303_04CSV��ȯ.sql
    ->������ġ : i:\java202301\database
///////////////////////////////////////////////////////
��1) ������ �������߿��� ������ ���� ���� �������� ������û�� ����� ��ȸ�Ͻÿ�
    (�й�, �̸�, �����ڵ�)
    
select * from tb_student;
select * from tb_sugang;
select * from tb_gwamok;

select BB.hakno, ST.uname, BB.gcode
from (
        select AA.gcode, AA.ghakjum, SU.hakno
        from (        
                select gcode, ghakjum
                from tb_gwamok
                where gcode LIKE '%d%' and ghakjum=(select max(ghakjum) from tb_gwamok)
             ) AA join tb_sugang SU on AA.gcode = SU.gcode
     ) BB join tb_student ST on BB.hakno = ST.hakno;
     
    



��2) �й��� ������û�� �������� ���ϰ� �й������� �����ؼ� �ٹ�ȣ 4~6�� ��ȸ�Ͻÿ�
    (��, ������û���� ���� �л��� �������� 0���� ǥ��)


select * from tb_student;
select * from tb_sugang;
select * from tb_gwamok;

select BB.������, rownum
from (
       select sum(nvl(GW.ghakjum,0)) as ������
       from (
                select ST.hakno, SU.gcode
                from tb_student ST left join tb_sugang SU
                on ST.hakno=SU.hakno
                order by ST.hakno
             ) AA left join tb_gwamok GW on AA.gcode=GW.gcode
       group by AA.hakno
     ) BB;



��3) �й����� ������û �������� ���ϰ�, ������������ �������� ������
     ������ ���� 1�Ǹ� ��ȸ�Ͻÿ� (�й�, �̸�, ������)\
     
select * from tb_student;
select * from tb_sugang;
select * from tb_gwamok;










select hakno
from tb_sugang;

select ST.hakno, SU.gcode
from tb_student ST left join tb_sugang SU
on ST.hakno=SU.hakno;

select SU.hakno, GW.ghakjum
from tb_sugang SU left join tb_gwamok GW
on SU.gcode=GW.gcode;


select AA.hakno, AA.ghakjum, SU.uname
from (
        select SU.hakno, GW.ghakjum
        from tb_sugang SU left join tb_gwamok GW
        on SU.gcode=GW.gcode
     ) AA right join tb_student SU on AA.hakno = SU.hakno;





select BB.hakno, BB
from (
        select AA.hakno, AA.uname, SUM(nvl(GW.ghakjum, 0)) as ������
        from (
                select ST.hakno, ST.uname, SU.gcode
                from tb_student ST left join tb_sugang SU
                on ST.hakno=SU.hakno
             ) AA left join tb_gwamok GW on AA.gcode=GW.gcode
        group by AA.hakno, AA.uname, GW.ghakjum
    )BB











select AA.hakno, AA.uname, nvl(GW.ghakjum,0)
from (
        select ST.hakno, ST.uname, SU.gcode
        from tb_student ST left join tb_sugang SU
        on ST.hakno=SU.hakno
     ) AA left join tb_gwamok GW on AA.gcode=GW.gcode;






















select SUM(ghakjum)
from tb_sugang SU left join tb_gwamok GW
on SU.gcode=GW.gcode
group by SU.hakno
order by SU.hakno;
     
     
     
select SUM(ghakjum)
from tb_sugang SU left join tb_gwamok GW
on SU.gcode=GW.gcode
group by SU.hakno
order by SU.hakno;
     
     
     
     
     
     
     
     
     
     
     
     
     