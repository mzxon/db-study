●  -파일->새로만들기->데이터베이스 계층-> 데이터베이스 파일
    ->파일명 : 20230303_01테이블조인.sql
    ->저장위치 : i:\java202301\database
///////////////////////////////////////////////////////

● [테이블 조인 연습 문제]

--전체 행 갯수
select count(*) from tb_student;
select count(*) from tb_gwamok;
select count(*) from tb_sugang;

문2) 지역별로 수강신청 인원수, 지역을 조회하시오
     서울 2명
     제주 2명
     
     
1) 수강테이블 조회
select * from tb_sugang order by hakno;

2) 수강 신청한 학생들의 명단 조회 (학번)
select hakno from tb_sugang order by hakno;
select distinct(hakno) from tb_sugang order by hakno;
select hakno from tb_sugang group by hakno;
select hakno, count(*) from tb_sugang group by hakno;

3) 수강신청한 학번(AA)들의 주소를 학생테이블에서 가져오기
select AA.hakno, ST.address
from(select hakno from tb_sugang group by hakno)AA join tb_student ST
on AA.hakno = ST.hakno;



4) 3)의 결과를 BB테이블로 만든 후 
select BB.address, count(*) || '명' as cnt
from (
        select AA.hakno, ST.address
        from(select hakno from tb_sugang group by hakno)AA join tb_student ST
        on AA.hakno = ST.hakno
     ) BB
group by BB.address;



-- 다른 방법
select AA.address, count(AA.address)
from (
        select SU.hakno, address
        from tb_sugang SU join tb_student ST
        on SU.hakno = ST.hakno
        group by SU.hakno, address
     ) AA
group by AA.address;


////////////////////////////////////////////////////////////////////////////////

문3) 과목별 수강 신청 인원수, 과목코드, 과목명를 조회하시오 
     d001  HTML    2명
     d002  포토샵    1명
     d003  일러스트  1명
     p001  JAVA    4명
     p002  Oracle  2명
     p003  JSP     2명
     p004  Python  1명
     
     
--1) 수강테이블에서 과목코드별로 정렬해서 조회하기
select * from tb_sugang order by gcode;

--2) 수강테이블에서 과목코드가 동일한 행을 그룹화 하기
select gcode, count(*) from tb_sugang group by gcode;

--3)
select AA.gcode, GW.gname, concat(AA.cnt, '명') as 수강인원
from (
      select gcode, count(*) as cnt 
      from tb_sugang 
      group by gcode
      ) AA join tb_gwamok GW on AA.gcode=GW.gcode
order by AA.gcode;

     
     
    
     
문4) 학번별 수강신청과목의 총학점을 학번별순으로 조회하시오
     g1001  홍길동  12학점
     g1002  홍길동   8학점
     g1005  진달래  12학점
     g1006  개나리   3학점
     
--1) 수강테이블에서 학번별로 조회
select hakno, gcode from tb_sugang order by hakno;

--2) 수강테이블에 과목코드가 일치하는 학점을 과목테이블에서 가져와서 붙이기
select SU.hakno, SU.gcode, GW.ghakjum
from tb_sugang SU join tb_gwamok GW
     on SU.gcode = GW.gcode;
     
--3) 2)의 결과를 AA테이블로 만들고, 학번별로 그룹화한 후, 학점의 합계를 구하기
select AA.hakno, SUM(AA.ghakjum) as hap
from (
      select SU.hakno, SU.gcode, GW.ghakjum
      from tb_sugang SU join tb_gwamok GW
      on SU.gcode = GW.gcode
      ) AA
group by AA.hakno;
     
--4) 3)의 결과를 BB테이블로 만들고
select BB.hakno, ST.uname, BB.hap || '학점' as hap
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

문4)의 또다른 방법
--1) 수강테이블 + 학생테이블 + 과목테이블 = 3개 테이블 한꺼번에 조인
select SU.hakno, ST.uname, GW.ghakjum
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode = GW.gcode
order by SU.hakno;

--2) 1차그룹(학번), 2차그룹(이름)으로 그룹화하고 총학점 구하기
select SU.hakno, ST.uname, SUM(GW.ghakjum) || '학점' as hap
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode = GW.gcode
group by SU.hakno, ST.uname;




        
문5) 학번 g1001이 수강신청한 과목을 과목코드별로 조회하시오
     g1001  d001  HTML
     g1001  p001  JAVA
     g1001  p002  Oracle
     g1001  p003  JSP
     g1001  p004  Python    
     
     
--1) 수강테이블 + 과목테이블 조인
select SU.hakno, SU.gcode, GW.gname
from tb_sugang SU join tb_gwamok GW
on SU.gcode = GW.gcode;

--2) 학번 g1001이 신청한 정보 조회하기
select SU.hakno, SU.gcode, GW.gname
from tb_sugang SU join tb_gwamok GW
on SU.gcode = GW.gcode
where SU.hakno = 'g1001'
order by SU.gcode;
////////////////////////////////////////////////////////////////////////////////

문6) 수강신청을 한 학생들의 학번, 이름 조회
     g1001  홍길동
     g1002  홍길동
     g1005  진달래
     g1006  개나리
1)
select SU.hakno, ST.uname
from tb_sugang SU join tb_student ST
     on SU.hakno = ST.hakno
group by SU.hakno, ST.uname;

2)
select hakno, uname
from tb_student
where hakno in (select hakno from tb_sugang);


문7)수강신청을 하지 않은 학생들의 학번, 이름 조회
     g1003  개나리
     g1004  홍길동


select hakno, uname
from tb_student
where hakno not in (select hakno from tb_sugang);



select * from tb_student;
select * from tb_gwamok;
select * from tb_sugang;
     

     