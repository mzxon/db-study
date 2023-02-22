● 파일->새로만들기->데이터베이스 계층-> 데이터베이스 파일
  ->파일명 : 202302022_04where.sql
  ->저장위치 : i:\java202301\database
  //////////////////////////////////////////////////

● [where 조건절]
  - 조건을 만족하는 행들에 대해서  
  - 조건에 만족하는 레코드만 대상으로 조회(select), 수정(update), 삭제(delete)하기 위해서
  
select * from sungjuk;
commit;
  
--문1) 국어점수가 50점이상 행을 조회하시오  
select uname, kor
from sungjuk
where kor>=50;

--문2) 영어 점수가 50점미만 행을 조회하시오  
select uname, eng
from sungjuk
where eng<50;

  
--문3) 이름이 '대한민국' 행을 조회(출력)하시오
select uname, kor, eng, mat
from sungjuk
where uname='대한민국'

  
--문4) 이름이 '대한민국' 아닌 행을 조회하시오