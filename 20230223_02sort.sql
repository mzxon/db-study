��  -����->���θ����->�����ͺ��̽� ����-> �����ͺ��̽� ����
    ->���ϸ� : 20230223_02sort.sql
    ->������ġ : i:\java202301\database
///////////////////////////////////////////////////////

�� [Sort ����]
   - Ư����(keyfield)�� �������� ������� ���ġ
  - �������� Ascending Sort   ASC  �����ϸ� �⺻��  1->10  A->Z  a->z  ��->��
  - �������� Descending Sort  DESC
  - ����) order b��  Į����2, �÷���3. �÷���3, ....~
  
  
sungjuck ���̺��� ��ȸ�Ͻÿ�
select * from sungjuk;

-- ��ü ���ڵ带 �̸������� �����ؼ� ��ȸȭ�ÿ�
select uname
from sungjuk
order by uname asc; --�������� ����

select uname
from sungjuk
order by uname; --asc ��������

select uname
from sungjuk
order by uname desc; --�������� ����

-- �������������� �����ؼ� ��ȸ�Ͻÿ�
select uname, kor
from sungjuk
order by kor;

--1������ : �������������� ����
--2�� ���� : ���������� ���ٸ� �̸��� �������� �������� ����
 select uname, kor
 from sungjuk
 order by kor, uname desc;


--1��(kor), 2��(eng), 3��(mat) �������� ����

select uname, kor, eng, mat
from sungjuk
order by kor desc, eng desc, mat desc

select * from sungjuk;

--����) ��� 70�� ���� ���� �̸������� ��ȸ�Ͻÿ�
select uname, aver
from sungjuk
where aver <=70
order by uname asc;

select uname, aver
from sungjuk
order by uname      -- ������ ����������
where aver<=70;     -- ORA-00933 ���� �߻� 















