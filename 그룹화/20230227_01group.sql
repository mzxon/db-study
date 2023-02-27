��  -����->���θ����->�����ͺ��̽� ����-> �����ͺ��̽� ����
    ->���ϸ� : 20230227_01group.sql
    ->������ġ : i:\java202301\database
///////////////////////////////////////////////////////

select * from sungjuk order by addr;

�� [group by]
  - Į���� ���� ������� �׷�ȭ ��Ŵ
  - ����) group by Į��1, Į��2, Į��3
  
-- �ּҰ� ������ ���� �׷�ȭ��Ű�� �ּҸ� ��ȸ
select addr
from sungjuk
group by addr;  -- distinct �� ����� ����    


--��1) �ּҺ� �ο����� ��ȸ�Ͻÿ�
select addr, count(*)
from sungjuk
group by addr;

select addr, count(*) as cnt  --Į���� �ӽ� �ο�
from sungjuk
group by addr;

select addr, count(*) cnt     --as ���� ����
from sungjuk
group by addr;

--�ּҺ� �������� �����ؼ� ��ȸ
select addr
from sungjuk
group by addr
order by addr; --asc ��������

--�ּҺ� �������� �����ؼ� ��ȸ
select addr
from sungjuk
group by addr
order by addr desc;

--�ּҺ� �ο����� �������� �����ؼ� ��ȸ
select addr, count(*)
from sungjuk
group by addr
order by count(*) desc;

select addr, count(*) as cnt    --�ؼ����� 3)
from sungjuk                    --�ؼ����� 1)
group by addr                   --�ؼ����� 2)
order by cnt desc;              --�ؼ����� 4)
///////////////////////////////////////////////////////////////////////


�� [�����Լ�]

--��2) �ּҺ� ���������� ���ؼ� �����Ͻÿ�
select addr, count(*), max(kor), min(kor), sum(kor), avg(kor) --����, �ִ밪, �ּҰ�, �հ�, ���
from sungjuk
group by addr;

--�ּҼ����� ����
select addr, count(*), max(kor), min(kor), sum(kor), avg(kor)
from sungjuk
group by addr
order by addr;

--round(��, 0) �Ҽ��� ���ϰ����� �ݿø��ϰ� �Ҽ����� ����
select addr, count(*), max(kor), min(kor), sum(kor), round(avg(kor), 0)
from sungjuk
group by addr
order by addr;

--��������� �Ҽ��� ���� �ݿø��ϰ� �������� �����ؼ� ��ȸ
select addr, count(*), max(kor), min(kor), sum(kor), round(avg(kor), 0)
from sungjuk
group by addr
order by round(avg(kor),0) desc;

--Į���� �ο�
select addr
       , count(*) as cnt
       , max(kor) as max_kor
       , min(kor) as min_kor
       , sum(kor) as sum_kor
       , round(avg(kor), 0) as avg_kor
from sungjuk
group by addr
order by round(avg(kor),0) desc;

select * from sungjuk;

--��3) ����(tot), ���(aver) ���Ͻÿ�
update sungjuk set tot=kor+eng+mat, aver=(kor+eng+mat)/3;
commit;
select * from sungjuk;


--��4) ���(aver)�� 80���̻� ���� ������� �ּҺ� �ο����� �ο��������� ��ȸ�Ͻÿ�
select * from sungjuk order by aver desc, addr;

select addr, count(*) as num    --4)
from sungjuk                    --1)
where aver >=80                 --2)
group by addr                   --3)
order by num;                   --5)
///////////////////////////////////////////////////////////////////////////

�� [2�� �׷�]

--�ּҺ� ������ ��ȸ�Ͻÿ�
select addr, kor, eng, mat
from sungjuk
order by addr, kor;

--�ּҺ�(1��) �׷��� �ϰ�, �ּҰ� ���ٸ� ��������(2��)�� �׷��ϱ�
select addr, kor
from sungjuk
group by addr, kor
order by addr;

select addr, kor, count(*)
from sungjuk
group by addr, kor
order by addr;


--1���׷�(kor), 2���׷�(eng), 3���׷�(mat)
select kor, eng, mat, count(*)
from sungjuk
group by kor, eng, mat
order by kor, eng, mat;






















