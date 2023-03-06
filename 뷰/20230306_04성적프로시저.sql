●  -파일->새로만들기->데이터베이스 계층-> 데이터베이스 파일
    ->파일명 : 20230306_04성적프로시저.sql
    ->저장위치 : i:\java202301\database
///////////////////////////////////////////////////////

● 참조 http://pretyimo.cafe24.com/lectureRead.do?lectureno=192

● sungjuk 테이블에서 Create/Read/Update/Delete 관련 프로시저

1) 행추가 프로시저 (Create)
create or replace procedure sungjukInsert
(
    --매개변수(parameter) 선언
    --in 입력매개변수
    v_uname in sungjuk.uname%type   --성적테이블의 uname 칼럼이랑 같은 데이터타입으로 변수 선언  
    ,v_kor  in sungjuk.kor%type
    ,v_eng  in sungjuk.eng%type
    ,v_mat  in sungjuk.mat%type
    ,v_addr in sungjuk.addr%type
)
is
begin
    insert into sungjuk(sno, uname, kor, eng, mat, tot, aver, addr)
    values(sungjuk_seq.nextval, v_uname, v_kor, v_eng, v_mat,
          (v_kor+v_eng+v_mat), (v_kor+v_eng+v_mat)/3, v_addr);
    commit;
end;

--sungjukInsert 프로시저 실행
execute sungjukInsert('오필승', 100, 99, 95, 'Seoul');

--결과확인
select * from sungjuk order by sno desc;
////////////////////////////////////////////////////////////////////////////////

2) 행수정 프로시저 (Update)
--문) sno=61 행을 아래 값으로 이름, 국, 영, 수, 주소, 총점, 평균을 수정하는 프로시저를 생성하시오
execute sungjukUpdate('코리아', 50, 60, 90, 'Jeju', 61);

create or replace procedure sungjukUpdate
(
    v_uname in sungjuk.uname%type
    ,v_kor  in sungjuk.kor%type
    ,v_eng  in sungjuk.eng%type
    ,v_mat  in sungjuk.mat%type
    ,v_addr in sungjuk.addr%type
    ,v_sno  in sungjuk.sno%type
)
is
begin
    update sungjuk
    set uname=v_uname, kor=v_kor, eng=v_eng, mat=v_mat, aver=(v_kor+v_eng+v_mat)/3, addr=v_addr
    where sno=v_sno;
    commit;
end;
////////////////////////////////////////////////////////////////////////////////

3) 행삭제 프로시저 (Delete)
--문) sno=61 행 삭제
execute sungjukDelete(61);

create or replace procedure sungjukDelete
(
    v_sno   in sungjuk.sno%type
)
is
begin
    delete from sungjuk where sno=v_sno;
    commit;
end;

--결과확인
select * from sungjuk order by sno desc;
////////////////////////////////////////////////////////////////////////////////

4) 상세보기 (Read)
create or replace procedure sungjukRead
(
    v_cursor out sys_refcursor    -- out 출력매개변수
   ,v_sno sungjuk.sno%type
)
is
begin
    open v_cursor for 
    select * from sungjuk where sno=v_sno;
    -- close v_cursor; 커서반납
end;

//////////////////////////////////////////////////////////////////////////////

5) 전체목록 (Read)
create or replace procedure sungjukList
(
    v_cursor out sys_refcursor
)
is
begin
    open v_cursor for 
    select * from sungjuk order by sno desc;
    -- close v_cursor; 커서반납
    loop
        fetch v_cursor into rec;
        exit when v_cursor%NOTFOUND;
    end loop;
end;

