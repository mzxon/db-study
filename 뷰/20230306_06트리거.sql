●  -파일->새로만들기->데이터베이스 계층-> 데이터베이스 파일
    ->파일명 : 20230306_06트리거.sql
    ->저장위치 : i:\java202301\database
///////////////////////////////////////////////////////

● 트리거 Trigger

--콘솔창 출력 dbms_output.put_line를 사용함
set serveroutput on;


////////////////////////////////////////////////////////////////////////////////

-- 연습)
-- sungjuk테이블에서 국어점수의 평균을 구하시오
select avg(kor) from sungjuk;   --69.16

--국어점수가 추가, 수정, 삭제가 되면 전체 국어평균도 달라지며
--바뀐 국어평균 값을 출력한다
create or replace trigger kor_trigger
after
    insert or update or delete on sungjuk
declare
    avg_kor number;
begin
    select avg(kor) into avg_kor from sungjuk;
    dbms_output.put_line('국어 평균 : ' || avg_kor);
end;

select * from sungjuk order by sno desc;

--행수정
update sungjuk set kor=0 where sno=52;

--행삭제
delete from sungjuk where sno=52;

--행추가
insert into sungjuk(sno, uname, kor, eng, mat, addr, wdate)
values(sungjuk_seq.nextval, '이순신', 100, 100, 100, 'Seoul', sysdate);
////////////////////////////////////////////////////////////////////////////////














