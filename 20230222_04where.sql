�� ����->���θ����->�����ͺ��̽� ����-> �����ͺ��̽� ����
  ->���ϸ� : 202302022_04where.sql
  ->������ġ : i:\java202301\database
  //////////////////////////////////////////////////

�� [where ������]
  - ������ �����ϴ� ��鿡 ���ؼ�  
  - ���ǿ� �����ϴ� ���ڵ常 ������� ��ȸ(select), ����(update), ����(delete)�ϱ� ���ؼ�
  
select * from sungjuk;
commit;
  
--��1) ���������� 50���̻� ���� ��ȸ�Ͻÿ�  
select uname, kor
from sungjuk
where kor>=50;

--��2) ���� ������ 50���̸� ���� ��ȸ�Ͻÿ�  
select uname, eng
from sungjuk
where eng<50;

  
--��3) �̸��� '���ѹα�' ���� ��ȸ(���)�Ͻÿ�
select uname, kor, eng, mat
from sungjuk
where uname='���ѹα�'

  
--��4) �̸��� '���ѹα�' �ƴ� ���� ��ȸ�Ͻÿ�