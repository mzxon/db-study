��  -����->���θ����->�����ͺ��̽� ����-> �����ͺ��̽� ����
    ->���ϸ� : 20230227_05����Ŭ�Լ�.sql
    ->������ġ : i:\java202301\database
///////////////////////////////////////////////////////

�� ���� http://pretyimo.cafe24.com/lectureRead.do?lectureno=185

�� [����Ŭ �Լ�]

-- �������̺� : dual

1. ���ڿ� ���� �Լ�

select lower('Hello World') from dual;        --���� �ҹ��ڷ� ��ȯ
select upper('Hello World') from dual;        --���� �빮�ڷ� ��ȯ
select length('Hello World') from dual;       --���ڰ���
select substr('Hello World', 1, 5) from dual; --���ڿ� �ڸ��� (ù��° ���ں��� 5��) 'Hello'

select instr('Hello World', 'W') from dual;   --Ư������ ��ġ 6
select lpad('SKY', 5, '*') from dual;         --5ĭ������ ����ϰ� ���� ��ĭ�� *�� ä��
select rpad('SKY', 5, '*') from dual;         --5ĭ������ ����ϰ� ������ ��ĭ�� *�� ä��
select replace ('happy', 'p', 'k') from dual; --Ư������ ��ȯ 

select chr(65) from dual;   --ASCII ���ں�ȯ 'A'
select chr(66) from dual;   --              'B'
select chr(97) from dual;   --              'a'
select chr(98) from dual;   --              'b'

--���ڿ� �����ϱ�
select concat('�ι̿�', '�ٸ���') from dual;

--concat(Į����, '���ڿ�')
select concat(uname, '�� �����'), concat(aver, '�Դϴ�') from sungjuk;
select concat(uname, '�� �����') as �̸� , concat(aver, '�Դϴ�') as ��� from sungjuk;

-- || ���տ����� 
select uname || '�� ����� ' || aver || '�Դϴ�' from sungjuk;
select uname || '�� ����� ' || aver || '�Դϴ�' as str from sungjuk;
/////////////////////////////////////////////////////////////////////////////////////


2. ���� ���� �Լ�

select abs(-7) from dual;               --7     ���밪
select mod(5, 3) from dual;             --2     ������ �Լ�    
select ceil(12.4) from dual;            --13    �ø��Լ�
select trunc(13.56, 1) from dual;       --13.5  �����Լ�

select avg(kor) from sungjuk;           --66.363636
select ceil(avg(kor)) from sungjuk;     --67
select trunc(avg(kor),2) from sungjuk;  --66.36
select round(avg(kor),2) from sungjuk;  --66.36

-- to_number('���������� ���ڿ�')
select to_number('123')+1 from dual;    --124
select '123'+1 from dual;               --124 ���������� to_number()�� ȣ���
/////////////////////////////////////////////////////////////////////////////////////



3. ��¥ ���� �Լ�

select sysdate from dual;   --�ý����� ���� ��¥�� �ð� ������ �����ϴ� �Լ�

--system���� ����� �����ϱ�
select extract(year from sysdate) from dual;        --2023
select extract(month from sysdate) from dual;       --2
select extract(day from sysdate) from dual;         --27


--��¥�������� ����
select sysdate+100 from dual;   --���ó�¥ + 100��
select sysdate-100 from dual;   --���ó�¥ - 100��

--�ΰ��� ��¥�����Ϳ��� ���� �� ���
select months_between('2023-02-27','2022-10-27') from dual;
select months_between('2023-02-27','2023-01-27') from dual;

--���ڿ��� ��¥������ ��ȯ
select to_date('2023-02-27') from dual;
select to_date('2023-02-27') - to_date('2023-05-30') from dual; --92
////////////////////////////////////////////////////////////////////////

�� nvl() �Լ� - null���� �ٸ� ������ �ٲ�

����) �ּҰ� 'Incheon'�� ���� �������� �ִ밪, �ο����� ��ȸ�Ͻÿ�
select max(kor), count(*)
from sungjuk
where addr = 'Incheon';       --�ִ밪(null), �ο���(0)
    
select count(*) + 1
from sungjuk
where addr = 'Incheon';       --0+1

select max(kor)+1             --null+1  -> null���� ������ �� ����
from sungjuk
where addr='Incheon';
    
select nvl(max(kor), 0)       --null�� 0���� ��ü
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

����) sungjuk���̺� �Ʒ� �����͸� ���߰� �Ͻÿ�

sno   : max(sno)+1
        ��, max()���� null�̸� 0���� �ٲ��� ����Ѵ�
uname : �����
kor   : 100
eng   : 100
mat   : 100
addr  : Seoul
wdate : sysdate


--1) snoĮ������ ���� ū �� ��������
select max(sno) from sungjuk;

--2) ���� 1)����� null �� ������ 0���� �ٲٱ�
select nvl(max(sno), 0) from sungjuk;

--3) 2)����� +1�����ϱ�
select nvl(max(sno), 0)+1 from sungjuk;

--4) ���߰�
insert into sungjuk(sno, uname, kor, eng, mat, addr, wdate)
values((select nvl(max(sno), 0)+1 from sungjuk), '�����', 100, 100, 100, 'Seoul', sysdate);

select * from sungjuk;0
delete from sungjuk where sno=52;
commit;







    
    
    