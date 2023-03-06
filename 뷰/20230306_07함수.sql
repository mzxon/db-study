●  -파일->새로만들기->데이터베이스 계층-> 데이터베이스 파일
    ->파일명 : 20230306_07함수.sql
    ->저장위치 : i:\java202301\database
///////////////////////////////////////////////////////


● function 함수

select * from sungjuk order by sno desc;

--연습) sno=81의 국어점수를 5점 더하고 수정된 국어점수 반환하는 함수를 생성하시오
create or replace function fn_update(v_sno number)
    return number  --반환되는 자료형
is
    v_kor number;
begin
    update sungjuk set kor=kor+5 where sno=v_sno;
    select kor into v_kor from sungjuk where sno=v_sno;
    return v_kor;
end;

--위의 fn_update함수는 명령프롬프트에서 테스트
돋보기검색
-> cmd 명령프롬프트
-> sqlplus system/1234
SQL>var korea number;
SQL>execute :korea := fn_update(81);
SQL>print korea;


