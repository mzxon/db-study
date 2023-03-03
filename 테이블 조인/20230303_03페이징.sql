��  -����->���θ����->�����ͺ��̽� ����-> �����ͺ��̽� ����
    ->���ϸ� : 20230303_03����¡.sql
    ->������ġ : i:\java202301\database
///////////////////////////////////////////////////////

�� [rownum�� Ȱ���� ����¡]

--�ٹ�ȣ
select hakno, uname, rownum from tb_student;

--�ٹ�ȣ Į���� �����ϱ�
select hakno, uname, rownum as rnum from tb_student;

--�ٹ�ȣ�� ���� �ο��ǰ� ���ĵȴ�
select hakno, uname, rownum as rnum from tb_student order by uname;

--�ٹ�ȣ 1~3���� ��ȸ
select hakno, uname, rownum from tb_student where rownum>=1 and rownum<=3;

--�ٹ�ȣ 4~6���� ��ȸ(��ȸ�ȵ�)
select hakno, uname, rownum from tb_student where rownum>=4 and rownum<=6;
////////////////////////////////////////////////////////////////////////////////

�� [rownum�� Ȱ���� ����¡]
  - rownum�� ����Į���̹Ƿ� �������� ���� ������� ����, ����Į������ �ν��� ����� ���� ��õ
  - rownumĮ���� �������� �Ŀ� �ٹ�ȣ �߰��ϰ� �������� Ȱ���Ѵ�
  - rownum�� �������� ���� �߰��ϸ� ��ȣ�� ���� �ο��� �Ǽ� ������ �� �ٲ�

��) �ٹ�ȣ(rownum)�� �̿��ؼ� �ٹ�ȣ 4~6 ��ȸ

-- 1) �̸������� ��ȸ (�ٹ�ȣ���� ���� ����)
select uname, hakno, address, rownum
from tb_student
order by uname;

-- 2) 1)�� ����� ��������(AA ���̺�)�ϰ�, �ٹ�ȣ�� �߰��Ͻÿ�
select AA.uname, AA.hakno, AA.address, rownum as rnum
from (
       select uname, hakno, address
       from tb_student
       order by uname
     ) AA;

-- AA ���̺� ��Ī�� ��������
select uname, hakno, address, rownum as rnum
from (
       select uname, hakno, address
       from tb_student
       order by uname
     ) AA;


-- 3) 2)�� ����� BB���̺�� �����, �ٹ�ȣ 4~6�� ��ȸ�Ͻÿ�
select uname, hakno, address, rnum
from (        
        select uname, hakno, address, rownum as rnum
        from (
               select uname, hakno, address
               from tb_student
               order by uname
             ) AA
      ) BB
where rnum >= 4 and rnum <= 6;








































