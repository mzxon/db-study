●  -파일->새로만들기->데이터베이스 계층-> 데이터베이스 파일
    ->파일명 : 20230303_04CSV변환.sql
    ->저장위치 : i:\java202301\database
///////////////////////////////////////////////////////
문1) 디자인 교과목중에서 학점이 제일 많은 교과목을 수강신청한 명단을 조회하시오
    (학번, 이름, 과목코드)
    
select * from tb_student;
select * from tb_sugang;
select * from tb_gwamok;

--디자인 교과목의 학점 조회하기

select * from tb_gwamok where gcode like 'd%' order by ghakjum desc;

--1) 디자인 교과목중에서 학점이 제일 많은 학점 조회하기
select max(ghakjum)     --5
from tb_gwamok
where gcode like 'd%';

--2) 1)결과에서 나온 학점(5)과 동일한 학점을 갖고 있는 행에서 과목코드 선택
--  즉, 디자인 교과목중에서 학점이 제일 많은 과목코드 (단, 중복된 학점이 없다는 가정하에)
select gcode
from tb_gwamok
where ghakjum=(5)
and gcode like 'd%';    --d002

select gcode
from tb_gwamok
where ghakjum=(select max(ghakjum) from tb_gwamok where gcode like 'd%')
and gcode like 'd%';    --d002

--3) 2)에서 나온 과목코드(d002)를 수강신청한 명단을 조회
select gcode, hakno from tb_sugang where gcode=('d002');

select gcode, hakno
from tb_sugang
where gcode=(
                select gcode
                from tb_gwamok
                where ghakjum=(select max(ghakjum) from tb_gwamok where gcode like 'd%')
                and gcode like 'd%'
            );
            
--4) 3)의 결과를 AA테이블로 만든 후, 학생 테이블 조인해서 이름 가져오기
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
     
     
     
     
     
     
     
     
     
     
     
     
     