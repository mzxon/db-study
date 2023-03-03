●  -파일->새로만들기->데이터베이스 계층-> 데이터베이스 파일
    ->파일명 : 20230303_04CSV변환.sql
    ->저장위치 : i:\java202301\database
///////////////////////////////////////////////////////

● [CSV 파일]
  - 모든 데이터가 , 로 구분되어 있는 파일
  
● [CSV 파일을 데이터베이스로 가져오기]
  - 공공데이터포털 https://www.data.go.kr/ 활용
////////////////////////////////////////////////////////////////////////////////

문1) 도로명 우편번호 테이블 구축하기

-- 1) zipdoro.csv 준비 (258267행)

-- 2) zipdoro.csv 내용을 저장하는 zipdoro 테이블 생성
create table zipdoro(
    zipno       char(5)         --우편번호
   ,zipaddress  varchar(1000)   --주소
);

commit;
drop table school_loaction;             --테이블 삭제


-- 3) 가져오기와 내보내기
- zipdoro 테이블 우클릭 -> 데이터 임포트 (가져오기)
- zipdoro 테이블 우클릭 -> export       (내보내기)

-- 4) 전체 행 갯수 조회하기
select count(*) from zipdoro;    --258267
////////////////////////////////////////////////////////////////////////////////

문2) 한국교원대학교_초중등학교위치.csv를 변환해서 테이블에 저장하시오 (11873행)
create table school_location (
    scid          varchar(10)
   ,scname        varchar(100)
   ,scgrd         varchar(12)
   ,scaddress     varchar(1000)
   ,credate       varchar(50)
   ,editdate      varchar(50)
   ,latitude      char(50)
   ,longitude     char(50)
);

commit;
select * from school_location;
select count(*) from school_location;

-- 과제1) 비어있는 값(null)을 찾으시오

select *
from school_location
where scid is NULL or scname is NULL or scgrd is NULL
      or scaddress is NULL or credate is NULL or editdate is NULL
      or latitude is NULL or longitude is NULL;






