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
where uname='���ѹα�';

  
--��4) �̸��� '���ѹα�' �ƴ� ���� ��ȸ�Ͻÿ�
select uname, kor, eng, mat
from sungjuk
where uname != '���ѹα�'; --�¿찡 ���� ���� �ʴ�


--��5) ����, ����, ���� �������� ������ ��� 90�̻� ���� ��ȸ�Ͻÿ�
select uname, kor, eng, mat
from sungjuk
where kor>=90 and eng>=90 and mat >=90;

--��6) ����, ����, ���� �߿��� �Ѱ����̶� 40�̸� ���� ��ȸ�Ͻÿ�
select uname, kor, eng, mat
from sungjuk
where kor<40 or eng<40 or mat <40;

--��7) ���������� 80 ~ 89�� ���� ���� ��ȸ�Ͻÿ�
select uname, kor
from sungjuk
where kor between 80 and 89;

--��8) �̸��� '����ȭ', '����ȭ'�� ��ȸ�Ͻÿ�
select uname, kor, eng, mat
from sungjuk
where uname='����ȭ' or uname='����ȭ';

-- ��9) ��, ��, �� ��� 100�� �ƴ� ���� ��ȸ�Ͻÿ�
select uname, kor, eng, mat
from sungjuk
where not (kor=100 or eng=100 or mat=100);

--where kor!=100 and eng!=100 and mat !=100;









