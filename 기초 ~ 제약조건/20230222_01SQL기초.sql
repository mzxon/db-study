● 파일->새로만들기->데이터베이스 계층-> 데이터베이스 파일
  ->파일명 : 202302022_01SQL기초.sql
  ->저장위치 : i:\java202301\database

● [NCS 학습 모듈] - 응용 SW 기초 기술 활용
  3-3 관계형 데이터베이스 테이블 조작 ( p95)
///////////////////////////////////////////////////////

-- 테이블 생성
create table sungjuk(
   uname varchar (20)
  , kor int
  , eng int
  , mat int
  , aver int 
);

-- 테이블 삭제
drop table sungjuk;


● [sungjuk 테이블 CRUD 작업]

1. 행추가
insert into sungjuk(uname,kor,eng,mat)
values('무궁화', 80, 85, 100);

insert into sungjuk(uname,kor,eng,mat)
values('홍길동', 90, 100, 50);



2. 조회 및 검색
select uname,kor,eng,mat,aver
from sungjuk;


3. 행 수정
update sungjuk
set aver=(kor+eng+mat)/3;

4. 행 삭제
delete from sungjuk;


















