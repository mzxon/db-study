●  -파일->새로만들기->데이터베이스 계층-> 데이터베이스 파일
    ->파일명 : 20230303_04CSV변환.sql
    ->저장위치 : i:\java202301\database
///////////////////////////////////////////////////////
문1) 디자인 교과목중에서 학점이 제일 많은 교과목을 수강신청한 명단을 조회하시오
    (학번, 이름, 과목코드)
    
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
     
    



문2) 학번별 수강신청한 총학점을 구하고 학번순으로 정렬해서 줄번호 4~6행 조회하시오
    (단, 수강신청하지 않은 학생의 총학점도 0으로 표시)


select * from tb_student;
select * from tb_sugang;
select * from tb_gwamok;

select BB.총학점, rownum
from (
       select sum(nvl(GW.ghakjum,0)) as 총학점
       from (
                select ST.hakno, SU.gcode
                from tb_student ST left join tb_sugang SU
                on ST.hakno=SU.hakno
                order by ST.hakno
             ) AA left join tb_gwamok GW on AA.gcode=GW.gcode
       group by AA.hakno
     ) BB;



문3) 학번별로 수강신청 총학점을 구하고, 총학점순으로 내림차순 정렬후
     위에서 부터 1건만 조회하시오 (학번, 이름, 총학점)\
     
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
        select AA.hakno, AA.uname, SUM(nvl(GW.ghakjum, 0)) as 총학점
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
     
     
     
     
     
     
     
     
     
     
     
     
     