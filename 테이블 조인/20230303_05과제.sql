��  -����->���θ����->�����ͺ��̽� ����-> �����ͺ��̽� ����
    ->���ϸ� : 20230303_04CSV��ȯ.sql
    ->������ġ : i:\java202301\database
///////////////////////////////////////////////////////
��1) ������ �������߿��� ������ ���� ���� �������� ������û�� ����� ��ȸ�Ͻÿ�
    (�й�, �̸�, �����ڵ�)
    
select * from tb_student;
select * from tb_sugang;
select * from tb_gwamok;

--������ �������� ���� ��ȸ�ϱ�

select * from tb_gwamok where gcode like 'd%' order by ghakjum desc;

--1) ������ �������߿��� ������ ���� ���� ���� ��ȸ�ϱ�
select max(ghakjum)     --5
from tb_gwamok
where gcode like 'd%';

--2) 1)������� ���� ����(5)�� ������ ������ ���� �ִ� �࿡�� �����ڵ� ����
--  ��, ������ �������߿��� ������ ���� ���� �����ڵ� (��, �ߺ��� ������ ���ٴ� �����Ͽ�)
select gcode
from tb_gwamok
where ghakjum=(5)
and gcode like 'd%';    --d002

select gcode
from tb_gwamok
where ghakjum=(select max(ghakjum) from tb_gwamok where gcode like 'd%')
and gcode like 'd%';    --d002

--3) 2)���� ���� �����ڵ�(d002)�� ������û�� ����� ��ȸ
select gcode, hakno from tb_sugang where gcode=('d002');

select gcode, hakno
from tb_sugang
where gcode=(
                select gcode
                from tb_gwamok
                where ghakjum=(select max(ghakjum) from tb_gwamok where gcode like 'd%')
                and gcode like 'd%'
            );
            
--4) 3)�� ����� AA���̺�� ���� ��, �л� ���̺� �����ؼ� �̸� ��������
select ST.uname, AA.hakno, AA.gcode
from(
        select gcode, hakno
        from tb_sugang
        where gcode=(
                        select gcode
                        from tb_gwamok
                        where ghakjum=(select max(ghakjum) from tb_gwamok where gcode like 'd%')
                        and gcode like 'd%'
                    )

    ) AA join tb_student ST on AA.hakno = ST.hakno;








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
     
     
     
     
     
     
     
     
     
     
     
     
     