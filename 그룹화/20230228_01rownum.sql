●  -파일->새로만들기->데이터베이스 계층-> 데이터베이스 파일
    ->파일명 : 20230228_01rownum.sql
    ->저장위치 : i:\java202301\database
///////////////////////////////////////////////////////

select * from sungjuk;

● 모조 칼럼
  - Oracle  DBMS에서 제공해 준다
  - rownum  행번호
  - rowid   행의 주소값
  
select sno, uname, addr, rownum, rowid
from sungjuk;

select sno, uname, addr, rownum
from sungjuk
where rownum>=1 and rownum<=5;

select sno, uname, addr, rownum
from sungjuk
where addr='Seoul';
    
select sno, uname, kor, rownum
from sungjuk
where kor between 80 and 89;

-- 자신의 행번호를 포함해서 정렬됨
-- rownum을 추가하는 시점도 고려해야함
select sno, uname, addr, rownum
from sungjuk
order by uname;













  
  
  
  
  
  
  
  
  
  