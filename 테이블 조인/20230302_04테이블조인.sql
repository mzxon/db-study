●  -파일->새로만들기->데이터베이스 계층-> 데이터베이스 파일
    ->파일명 : 20230302_04테이블조인.sql
    ->저장위치 : i:\java202301\database
///////////////////////////////////////////////////////

● [테이블 조인]

  - 여러 테이블을 하나의 테이블처럼 사용하는 조인
  - 두개이상의 테이블을 결합하여 데이터를 추출하는 기법
  - 두테이블의 공통값을 이용하여 컬럼을 조합하는 수단

 형식)
       select 칼럼명
       from 테이블1 join 테이블2
       on 조건절;                --ANSI(표준) SQL문
       
       select 칼럼명
       from 테이블1, 테이블2
       on 조건절;                --Oracle DB SQL문
       
       
       select T1.*, T2.*        --T1.모든칼럼, T2모든칼럼
       from T1 inner join T2    --inner 생략가능
       on T1.x = T2.x           --테이블명, 칼럼명
       
       
       select T1.*, T2.*, T3.*
       from T1 join T2
       on T1.x=T2.x join T3
       on T1.y=T3.y;           --3개 테이블 조인
       
       
       select T1.*, T2.*, T3.*, T4.*
       from T1 join T2
       on T1.x=T2.x join T3
       on T1.y=T3.y join T4
       on T1.z=T3.z;     
       
    
● 조건절 : where 조건절, having조건절, on조건절


       
● 물리적 테이블과 논리적 테이블은 서로 동등한 관계이다.
   - 물리적 테이블 : 실제 create table한 테이블
   - 논리적 테이블 : SLQ문에 의해 가공된 테이블
////////////////////////////////////////////////////////////////////////////////

● inner join 연습

select * from tb_sugang;
       
-- 학번을 기준으로 수강테이블과 학생테이블 조인
select tb_sugang.*, tb_student.*
from tb_sugang inner join tb_student
on tb_sugang.hakno = tb_student.hakno;

-- 두테이블간의 교집합 조인, inner생략가능, 가장 기본
select tb_sugang.*, tb_student.*
from tb_sugang join tb_student
on tb_sugang.hakno = tb_student.hakno;

-- 수강신청한 학생들의 학번, 과목코드, 이름, 이메일 조회하시오
select tb_sugang.*, tb_student.uname, tb_student.email
from tb_sugang inner join tb_student
on tb_sugang.hakno=tb_student.hakno;


select * from tb_sugang;

--과목코드를 기준으로 수강테이블과 과목테이블 조인
select tb_sugang.*, tb_gwamok.gname, tb_gwamok.ghakjum
from tb_sugang inner join tb_gwamok
on tb_sugang.gcode = tb_gwamok.gcode;


-- 3개 테이블 조인 : 수강테이블 + 학생테이블(이름) + 과목테이블(과목명)
select tb_sugang.*, tb_student.uname, tb_gwamok.gname
from tb_sugang inner join tb_student
on tb_sugang.hakno=tb_student.hakno inner join tb_gwamok
on tb_sugang.gcode=tb_gwamok.gcode;
       
-- 테이블의 alias(별칭)도 가능하다
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

-- 조회시 테이블간에 중복되지 않은 칼럼명은 테이블명을 생략할 수 있다.
select SU.*, uname, email, gname, ghakjum
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode=GW.gcode;

-- 중복되는 칼럼명은 소속 테이블명을 정확히 명시해야 한다
-- ORA-00918: 열의 정의가 애매합니다
select hakno, uname, email, gname, ghakjum      --에러
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode=GW.gcode;

select SU.hakno, SU.gcode, uname, email, gname, ghakjum 
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode=GW.gcode;
////////////////////////////////////////////////////////////////////////////////

● [테이블 조인 연습 문제]

문1) 수강신청을 한 학생들 중에서 '제주'에 사는 학생들만 학번, 이름, 주소를 조회하시오

select * from tb_student;
select * from tb_sugang;
select * from tb_gwamok;

select SU.hakno, uname, ST.address
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno
where ST.address = '제주';


-- 가공된 논리적 테이블의 이름을 AA라고 지정하고, 다시 재가공 할 수 있다
select AA.hakno, AA.gcode, AA.uname, AA.address
from (
        select SU.hakno, SU.gcode, uname, address
        from tb_sugang SU join tb_student ST
        on SU.hakno = ST.hakno
    ) AA
where AA.address='제주';


-- ORA-00904: "AA"."EMAIL": 부적합한 식별자
-- ST 테이블에서 email 칼럼을 가져오지 않았음
select AA.hakno, AA.gcode, AA.uname, AA.address, AA.email
from (
        select SU.hakno, SU.gcode, uname, address
        from tb_sugang SU join tb_student ST
        on SU.hakno = ST.hakno
    ) AA
where AA.address='제주';

-- AA별칭 생략 가능
select hakno, gcode, uname, address
from (
        select SU.hakno, SU.gcode, uname, address
        from tb_sugang SU join tb_student ST
        on SU.hakno = ST.hakno
     ) AA
where AA.address='제주';


-- AA테이블의 모든 칼럼
select *
from (
        select SU.hakno, SU.gcode, uname, address
        from tb_sugang SU join tb_student ST
        on SU.hakno = ST.hakno
     ) AA
where AA.address='제주';
////////////////////////////////////////////////////////////////////////////////

문2) 지역별로 수강신청 인원수, 지역을 조회하시오
     서울 2명
     제주 2명
     



select AA.address, count(AA.address)
from (
        select SU.hakno, address
        from tb_sugang SU join tb_student ST
        on SU.hakno = ST.hakno
        group by SU.hakno, address
     ) AA
group by AA.address;





        
              
       
       
       
       
       
       
       
       