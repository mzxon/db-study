●  -파일->새로만들기->데이터베이스 계층-> 데이터베이스 파일
    ->파일명 : 20230227_05오라클함수.sql
    ->저장위치 : i:\java202301\database
///////////////////////////////////////////////////////

※ 참조 http://pretyimo.cafe24.com/lectureRead.do?lectureno=185

● [오라클 함수]

-- 가상테이블 : dual

1. 문자열 관련 함수

select lower('Hello World') from dual;        --전부 소문자로 변환
select upper('Hello World') from dual;        --전부 대문자로 변환
select length('Hello World') from dual;       --글자갯수
select substr('Hello World', 1, 5) from dual; --문자열 자르기 (첫번째 글자부터 5개) 'Hello'

select instr('Hello World', 'W') from dual;   --특정문자 위치 6
select lpad('SKY', 5, '*') from dual;         --5칸내에서 출력하고 왼쪽 빈칸은 *로 채움
select rpad('SKY', 5, '*') from dual;         --5칸내에서 출력하고 오른쪽 빈칸은 *로 채움
select replace ('happy', 'p', 'k') from dual; --특정문자 변환 

select chr(65) from dual;   --ASCII 문자변환 'A'
select chr(66) from dual;   --              'B'
select chr(97) from dual;   --              'a'
select chr(98) from dual;   --              'b'

--문자열 연결하기
select concat('로미오', '줄리엣') from dual;

--concat(칼럼명, '문자열')
select concat(uname, '의 평균은'), concat(aver, '입니다') from sungjuk;
select concat(uname, '의 평균은') as 이름 , concat(aver, '입니다') as 평균 from sungjuk;

-- || 결합연산자 
select uname || '의 평균은 ' || aver || '입니다' from sungjuk;
select uname || '의 평균은 ' || aver || '입니다' as str from sungjuk;
/////////////////////////////////////////////////////////////////////////////////////


2. 숫자 관련 함수

select abs(-7) from dual;               --7     절대값
select mod(5, 3) from dual;             --2     나머지 함수    
select ceil(12.4) from dual;            --13    올림함수
select trunc(13.56, 1) from dual;       --13.5  내림함수

select avg(kor) from sungjuk;           --66.363636
select ceil(avg(kor)) from sungjuk;     --67
select trunc(avg(kor),2) from sungjuk;  --66.36
select round(avg(kor),2) from sungjuk;  --66.36

-- to_number('숫자형태의 문자열')
select to_number('123')+1 from dual;    --124
select '123'+1 from dual;               --124 내부적으로 to_number()가 호출됨
/////////////////////////////////////////////////////////////////////////////////////



3. 날짜 관련 함수

select sysdate from dual;   --시스템의 현재 날짜와 시간 정보를 리턴하는 함수

--system에서 년월일 추출하기
select extract(year from sysdate) from dual;        --2023
select extract(month from sysdate) from dual;       --2
select extract(day from sysdate) from dual;         --27


--날짜데이터의 연산
select sysdate+100 from dual;   --오늘날짜 + 100일
select sysdate-100 from dual;   --오늘날짜 - 100일

--두개의 날짜데이터에서 개월 수 계산
select months_between('2023-02-27','2022-10-27') from dual;
select months_between('2023-02-27','2023-01-27') from dual;

--문자열을 날짜형으로 변환
select to_date('2023-02-27') from dual;
select to_date('2023-02-27') - to_date('2023-05-30') from dual; --92
////////////////////////////////////////////////////////////////////////

● nvl() 함수 - null값을 다른 값으로 바꿈

문제) 주소가 'Incheon'인 행의 국어점수 최대값, 인원수를 조회하시오
select max(kor), count(*)
from sungjuk
where addr = 'Incheon';       --최대값(null), 인원수(0)
    
select count(*) + 1
from sungjuk
where addr = 'Incheon';       --0+1

select max(kor)+1             --null+1  -> null값과 연산할 수 없다
from sungjuk
where addr='Incheon';
    
select nvl(max(kor), 0)       --null을 0으로 대체
from sungjuk
where addr='Incheon';
    
select nvl(max(kor), 0)+1
from sungjuk
where addr='Incheon';
    
select nvl(max(kor), 0)+1 as max_kor
from sungjuk
where addr='Incheon';
////////////////////////////////////////////////////////////////////////////////


select * from sungjuk order by sno;

문제) sungjuk테이블에 아래 데이터를 행추가 하시오

sno   : max(sno)+1
        단, max()값이 null이면 0으로 바꾼후 계산한다
uname : 손흥민
kor   : 100
eng   : 100
mat   : 100
addr  : Seoul
wdate : sysdate


--1) sno칼럼에서 가장 큰 값 가져오기
select max(sno) from sungjuk;

--2) 만일 1)결과가 null 이 나오면 0으로 바꾸기
select nvl(max(sno), 0) from sungjuk;

--3) 2)결과에 +1연산하기
select nvl(max(sno), 0)+1 from sungjuk;

--4) 행추가
insert into sungjuk(sno, uname, kor, eng, mat, addr, wdate)
values((select nvl(max(sno), 0)+1 from sungjuk), '손흥민', 100, 100, 100, 'Seoul', sysdate);

select * from sungjuk;0
delete from sungjuk where sno=52;
commit;







    
    
    