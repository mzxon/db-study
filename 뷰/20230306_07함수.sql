��  -����->���θ����->�����ͺ��̽� ����-> �����ͺ��̽� ����
    ->���ϸ� : 20230306_07�Լ�.sql
    ->������ġ : i:\java202301\database
///////////////////////////////////////////////////////


�� function �Լ�

select * from sungjuk order by sno desc;

--����) sno=81�� ���������� 5�� ���ϰ� ������ �������� ��ȯ�ϴ� �Լ��� �����Ͻÿ�
create or replace function fn_update(v_sno number)
    return number  --��ȯ�Ǵ� �ڷ���
is
    v_kor number;
begin
    update sungjuk set kor=kor+5 where sno=v_sno;
    select kor into v_kor from sungjuk where sno=v_sno;
    return v_kor;
end;

--���� fn_update�Լ��� ���������Ʈ���� �׽�Ʈ
������˻�
-> cmd ���������Ʈ
-> sqlplus system/1234
SQL>var korea number;
SQL>execute :korea := fn_update(81);
SQL>print korea;


