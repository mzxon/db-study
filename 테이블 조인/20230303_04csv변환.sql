��  -����->���θ����->�����ͺ��̽� ����-> �����ͺ��̽� ����
    ->���ϸ� : 20230303_04CSV��ȯ.sql
    ->������ġ : i:\java202301\database
///////////////////////////////////////////////////////

�� [CSV ����]
  - ��� �����Ͱ� , �� ���еǾ� �ִ� ����
  
�� [CSV ������ �����ͺ��̽��� ��������]
  - �������������� https://www.data.go.kr/ Ȱ��
////////////////////////////////////////////////////////////////////////////////

��1) ���θ� �����ȣ ���̺� �����ϱ�

-- 1) zipdoro.csv �غ� (258267��)

-- 2) zipdoro.csv ������ �����ϴ� zipdoro ���̺� ����
create table zipdoro(
    zipno       char(5)         --�����ȣ
   ,zipaddress  varchar(1000)   --�ּ�
);

commit;
drop table school_loaction;             --���̺� ����


-- 3) ��������� ��������
- zipdoro ���̺� ��Ŭ�� -> ������ ����Ʈ (��������)
- zipdoro ���̺� ��Ŭ�� -> export       (��������)

-- 4) ��ü �� ���� ��ȸ�ϱ�
select count(*) from zipdoro;    --258267
////////////////////////////////////////////////////////////////////////////////

��2) �ѱ��������б�_���ߵ��б���ġ.csv�� ��ȯ�ؼ� ���̺� �����Ͻÿ� (11873��)
create table school_location (
    scid          varchar(10)
   ,scname        varchar(100)
   ,scgrd         varchar(12)
   ,scaddress     varchar(1000)
   ,credate       varchar(50)
   ,editdate      varchar(50)
   ,latitude      char(50)
   ,longitude     char(50)
);

commit;
select * from school_location;
select count(*) from school_location;

-- ����1) ����ִ� ��(null)�� ã���ÿ�

select *
from school_location
where scid is NULL or scname is NULL or scgrd is NULL
      or scaddress is NULL or credate is NULL or editdate is NULL
      or latitude is NULL or longitude is NULL;






