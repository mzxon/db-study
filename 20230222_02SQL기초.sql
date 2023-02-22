● 파일->새로만들기->데이터베이스 계층-> 데이터베이스 파일
  ->파일명 : 202302022_02SQL기초.sql
  ->저장위치 : i:\java202301\database
////////////////////////////////////////////////////

[sungjuk 테이블 삭제]
drop table sungjuk;

[sungjuk 테이블 생성]
create table sungjuk(
    uname varchar(50) not null --빈값을 허용하지 않음. 반드시 입력
                                --영문자 50글자 이내 입력
                                --한글 16글자 이내 입력
    ,kor   int         not null --정수형
    ,eng   int         not null
    ,mat   int         not null
    ,tot   int         null     --빈값 허용
    ,aver  int                  --null 생략가능 (=빈값허용)
);
/////////////////////////////////////////////////////////////////


[샘플 데이터 행추가]
insert into sungjuk(uname,kor,eng,mat) values ('홍길동', 70, 85, 100);
insert into sungjuk(uname,kor,eng,mat) values ('무궁화',30,30,40);
insert into sungjuk(uname,kor,eng,mat) values ('진달래',90,90,20);
insert into sungjuk(uname,kor,eng,mat) values ('개나리',100,60,30);
insert into sungjuk(uname,kor,eng,mat) values ('라일락',30,80,40);
insert into sungjuk(uname,kor,eng,mat) values ('봉선화',80,80,20);
insert into sungjuk(uname,kor,eng,mat) values ('대한민국',10,65,35);
insert into sungjuk(uname,kor,eng,mat) values ('해바라기',30,80,40);
insert into sungjuk(uname,kor,eng,mat) values ('나팔꽃',30,80,20);
insert into sungjuk(uname,kor,eng,mat) values ('대한민국',100,100,100);
/////////////////////////////////////////////////////////////////////////

[전체 레코드 조회]
select uname, kor, eng, mat, tot, aver
from sungjuk;

[전체 행 갯수 조회]
select count (*) from sungjuk;

[select 조회 및 검색]
select kor, eng, mat from sungjuk;
select tot, aver from sungjuk;
select * from sungjuk; --전체 모든 칼럼 조회



[as} --칼럼명을 임시 변경(일회성) (ex : 만들어낸 데이터에 이름 붙이기 (=전체 행 갯수)
     --실제 칼럼명은 alter로 변경
select kor as korea, eng as english, mat as mate
from sungjuk;

--as 생략가능함
select kor korea, eng english, mat mate
from sungjuk;

-- 임시 한글 컬럼명은 일시적으로 분석해야하는 경우만 추천!
select uname as 이름, kor as 국어, eng as 영어, mat as 수학, tot 총점, aver 평균
from sungjuk;


-- 칼럼의 순서는 의미가 없다 ==> 내가 쓴대로 순서가 적용됨
select uname, kor, eng, mat from sungjuk;
select kor, eng, mat from sungjuk;


[count 함수] - 행 갯수 조회
select count(uname) from sungjuk; --10
select count(kor) from sungjuk;   --10
select count(eng) from sungjuk;   --10
select count(mat) from sungjuk;   --10

--null 값은 카운트하지 않는다
select count(tot) from sungjuk;   --0
select count(aver) from sungjuk;  --0

select count(kor) as cnt_kor from sungjuk;   --10
select count(eng) as 영어갯수 from sungjuk;   --10 임시 칼럼명으로 한글 가능

--sungjuk 테이블의 전체 행의 갯수
select count(*) from sungjuk;
select count(*) as 전체행갯수 from sungjuk;
select count(*) 전체행갯수 from sungjuk;

























