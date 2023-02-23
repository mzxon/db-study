��  -����->���θ����->�����ͺ��̽� ����-> �����ͺ��̽� ����
    ->���ϸ� : 20230223_01where.sql
    ->������ġ : i:\java202301\database
///////////////////////////////////////////////////////

select * from sungjuk;
alter table sungjuk rename column korea to kor;


�� [between A and B] ������
-- ���������� 80 ~ 89�� ���� ���� ��ȸ�Ͻÿ�
select uname, kor
from sungjuk
where kor between 80 and 89;


�� [in] ������ - ��Ͽ��� ã��
-- �̸��� '����ȭ', '����ȭ'�� ��ȸ�Ͻÿ�
select uname
from sungjuk
where uname in ('����ȭ', '����ȭ');

-- �������� 10, 30, 50���� ��ȸ�Ͻÿ�
select uname, kor
from sungjuk
where kor in (10, 30, 50);


�� [LIKE] ������
    - ���ڿ� �����Ϳ��� ����� ������ �˻�, ��ȸ�� ��
    - %     ���� ������ �������
    - _     ���� �������� ��ġ�ؾ���
    
select uname
from sungjuk
where uname='���ѹα�';


-- ��1) �̸����� 'ȫ'���� �����ϴ� �̸��� ��ȸ�Ͻÿ�
select uname
from sungjuk
where uname LIKE 'ȫ%';

--��2) �̸����� 'ȭ'�� ������ �̸��� ��ȸ�Ͻÿ�
select uname
from sungjuk
where uname LIKE '%ȭ';


--��3) �̸��� '��' ���ڰ� �ִ� �̸��� ��ȸ�Ͻÿ�
select uname
from sungjuk
where uname LIKE '%��%';

--��4) �α��� �̸����� 'ȭ'�� ������ �̸��� ��ȸ�Ͻÿ�
select uname
from sungjuk
where uname LIKE '_ȭ';

--��5) �̸� ������ �߿��� ��� ���ڰ� '��' �ִ� ���� ��ȸ�Ͻÿ�
select count(uname)
from sungjuk
where uname LIKE '_��_';

--��6) ����+������ �����ϰ� �˻�� '�Ľ�Ÿ'�� ��
where subject LIKE '%�Ľ�Ÿ%' or content LIKE '%�Ľ�Ÿ%'

--��7) ���� ������ 50�� �̻��� �࿡ ���ؼ� ������ ����� ���Ͻÿ�
select * from sungjuk where kor>=50;

update sungjuk  --update ���̺�� set Į��
set tot=kor+eng+mat, aver=(kor+eng+mat)/3
where kor>=50;

rollback; --��ɾ� ���

select * from sungjuk;
///////////////////////////////////////////////////////////

�� [NULL] - ��� �ִ� ��

-- ������ ������ ���Ͻÿ�
select count(tot) from sungjuk;     --null���� ī��Ʈ ���� ����

-- ������ NULL�� �ִ� ���� ������ ���Ͻÿ�
select count(*) from sungjuk where tot=null; -- null�� Ȯ�� ����. 0
select count(*) from sungjuk where tot is null; --null�� Ȯ���ؾ��ϴ� ���. 5

-- ��տ� ������� ���� ���� ������ ���Ͻÿ� (null�� �ƴ� ��
select count(*) from sungjuk where aver is not null;

--��6) ����ִ� ������ ����� ��� ���Ͻÿ�SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS

update sungjuk
set tot=kor+eng+mat, aver=(kor+eng+mat)/3
where tot is null or aver is null;

select * from sungjuk;

commit;






