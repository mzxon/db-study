●  -파일->새로만들기->데이터베이스 계층-> 데이터베이스 파일
    ->파일명 : 20230223_06group.sql
    ->저장위치 : i:\java202301\database
///////////////////////////////////////////////////////

-- sungjuk 테이블 삭제
drop table sungjuk;

-- sungjuk 테이블 생성
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

-- sungjuk 테이블 입력 데이터
 ※ 참조 I:\java202301\database\20230223_04성적테이블.sql
 
commit;
select count(*) from sungjuk;
select * from sungjuk; 


● [데이터 그룹화]

select * from sungjuk order by addr; --정렬


● [distinct]
        - 칼럼에 중복 내용이 있으면 대표값 1개만 출력
        - 형식) distinct 칼럼명

select addr from sungjuk;
select addr from sungjuk order by addr;     --asc 생략가능
select addr from sungjuk order by addr asc;
select addr from sungjuk order by addr desc;

select distinct(addr) from sungjuk;
select distinct(uname) from sungjuk;


//////////////////////////////////////////////////////////

● [group by]
  - 칼럼에 동일 내용끼리 그룹화 시킴
  - 형식) group by 칼럼1, 칼럼2, 칼럼3

-- 주소가 동일한 값을 그룹화시키고 주소를 조회
select addr
from sungjuk
group by addr;  --distinct와 결과값 동일 좀 더 세밀 / 집계, 통계내는 함수랑 같이 쓰임


-- ORA-00979: GROUP BY 표현식이 아닙니다. -  "not a GROUP BY expression"
select addr, uname -- 그룹을 지었을때 하나의 값이 나올때만 가능
from sungjuk
group by addr; -- 에러



























select * from sungjuk;