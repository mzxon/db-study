��  -����->���θ����->�����ͺ��̽� ����-> �����ͺ��̽� ����
    ->���ϸ� : 20230306_01��������.sql
    ->������ġ : i:\java202301\database
///////////////////////////////////////////////////////

�� [����Ŭ ���� ����]

///////////////////////////////////////////////////////

--���� ������ ���� �����ؾ� ��
alter session set "_ORACLE_SCRIPT"=true;

--����� ���� ���
select username from all_users;


--���̺����̽�(���̺��� ���� ����) ����
����) create tablespace ���̺����̽��̸�
      datafile '���������ϰ��' size �ʱ������
      autoextend on
      next �ڵ�����������
      maxsize �ִ������;
      
      
      
����)
create tablespace java202301
datafile 'I:\java202301\database\java202301.dbf' size 50m
autoextend on
next 10m
maxsize unlimited;
      
      
--���̺����̽� ���� Ȯ��
����)
select tablespace_name, contents from dba_tablespaces;
/////////////////////////////////////////////////////////////////      
      
      
--����� ���� ����
����) create user ���̵� identified by ���
      default tablespace ���̺����̽��̸�;
      
����)
create user itwill identified by 1234
default tablespace java202301;


--����� ���� ���
select username from all_users;


--��� ���� �ο�
grant connect, resource, dba to itwill;

commit;



--���������Ʈ���� ���� �ο��� itwill �α��� �ϱ�
>sqlplus itwill/1234
/////////////////////////////////////////////


--����� ���� ����
drop user itwill cascade;
commit;


--���̺����̽� ����
����) drop tablespace ���̺����̽���
      including contents and datafiles
      cascade constraints;
      

����)
drop tablespace java202301
including contents and datafiles
cascade constraints;

commit;










      







      
      
      
