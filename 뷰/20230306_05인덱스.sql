��  -����->���θ����->�����ͺ��̽� ����-> �����ͺ��̽� ����
    ->���ϸ� : 20230306_05��.sql
    ->������ġ : i:\java202301\database
///////////////////////////////////////////////////////

�� [index ����]

�� [�ε��� ����]   
- ����) create index �ε����� on ���̺��(Į����)
  
  
�� [�ε��� ����]  
- ����) drop index �ε�����


�� [���� 1] - PK�� ���� ���̺�
--���̺����
create table emp2(
  id        number(5)    
  ,name     varchar2(25)
  ,salary   number(7, 2)
  ,phone    varchar2(15)
  ,dept_id  number(7)
);

--���߰�
insert into emp2(id, name) values(10,'kim');
insert into emp2(id, name) values(20,'park');
insert into emp2(id, name) values(30,'hong');
commit;

--�ε��� ���� ��
select * from emp2 where name='hong';   --Ŀ�� ���⿡ ���� F10

--�ε��� ���� �� (������������ ������ ������)
create index emp2_name_idx on emp2(name);

--�ε��� ����

select * from emp2 where name='kim';    --Ŀ�� ���⿡ ���� F10
--F10 ��ȹ���� ���� -> full scan cost 2
///////////////////////////////////////////////////////////////////////////////

�� [���� 2] - PK�� �ִ� ���̺�

--PK�� �ε����� �ڵ����� �����Ǹ鼭 ���ĵȴ�.
create table emp3 (
   no    number       primary key
  ,name varchar2(10)
  ,sal  number
);

select * from emp3 where no=3;  --Ŀ�� ���⿡ ���� F10
--F10 ��ȹ���� ���� -> unique scan, cost 1
///////////////////////////////////////////////////////////////////////////////

�� ����3) 100������ ���ڵ� ������� cost ��

create table emp4(
   no     number
  ,name   varchar2(10)
  ,sal    number
);

drop table emp4;

���ν����� �̿��ؼ� 100���� �߰��ϱ� ######################################
declare  --����
    --��������
    i     number      := 1;      --i������ 1 ���� := ������
    name  varchar(20) := 'kim';
    sal   number      := 0;
begin
    --T-SQL��
    while i<=1000000 loop
        if i mod 2 = 0 then
            name := 'kim'  || to_char(i);
            sal  := 300;
        elsif i mod 3 = 0 then
            name := 'park' || to_char(i);
            sal  := 400;
        elsif i mod 5 = 0 then
            name := 'hong' || to_char(i);
            sal  := 500;
        else
            name := 'shin' || to_char(i);
            sal  := 250;
        end if;
        
        insert into emp4(no, name, sal) values (i, name, sal); --���߰�
        i := i+1;
    end loop;
end;
#######################################################################

select count(*) from emp4;
commit;
select * from emp4;

--1) �ε����� ������� ���� ���
select * from emp4 where name='kim466'; --FULL SCAN, COST 903

select * from emp4 where no=466;        --FULL SCAN, COST 902

select * from emp4 where sal>300;       --FULL SCAN, COST 905

--2) �ε����� ����� ���
create index emp4_name_idx on emp4(name);

select * from emp4 where name='kim466'; --RANGE SCAN, 3

--nameĮ���� salĮ���� �������� �ε��� ����
create index emp4_name_sal_idx on emp4(name, sal);

select* from emp4 where name='kim466' and sal>200; --RANGE SCAN, 3

--�ε��� ������ ����
select * from user_indexes;
select * from user_indexes where index_name like 'EMP4%';
























