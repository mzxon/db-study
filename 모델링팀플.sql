--������ ����
create sequence ���̺��_seq;
--������ �ο�
���̺��_seq.nextval;
-- sungjuk_seq ������ ����
drop sequence ���̺��_seq;

-- �ֹ�������ٱ���

-- ��ٱ���
--���̺����
create table kbe_cart(
     pcode      char(13)        NOT NULL        --��ǰ�ڵ�
    ,id         varchar2(80)    NOT NULL        --ȸ�����̵�
    ,price     varchar2(50)    NOT NULL        --��ǰ����
    ,num        number          PRIMARY KEY     --�Ϸù�ȣ
);

select * from kbe_cart;

--���̺����
drop table kbe_cart;

--������ ����
create sequence kbe_cart_seq;
--������ ����
drop sequence kbe_cart_seq;

--���߰�
insert into kbe_cart(pcode, id, price, num)
values('9788967820817',	'kim123', 10500, kbe_cart_seq.nextval);

--�����
delete from kbe_cart where num=1;





-- �ֹ���
create table kbe_order(
     listno      varchar2(50)    PRIMARY KEY    --�ֹ�����ȣ
    ,pcode       char(13)        NOT NULL       
    ,price       varchar2(50)    NOT NULL
);

select * from kbe_order;

create sequence kbe_order_seq;
drop sequence kbe_order_seq;

insert into kbe_order(listno, pcode, price)
values('114530-000'+kbe_order_seq.nextval,'9788967820817', 10500);

delete from kbe_order where listno=1001;







-- �����󼼳���
create table kbe_disorder(
     listno      varchar2(50)     NOT NULL       
    ,id          varchar2(80)     NOT NULL       
    ,price       varchar2(50)     NOT NULL       
    ,cprice      number                         --�������αݾ�
    ,pprice      number                         --����Ʈ���ݾ�
    ,eprice      number                         --eĳ�û��ݾ�
    ,dprice      number                         --�����ѱݾ�
    ,total       number                         --���������ݾ�
    ,num         number          PRIMARY KEY    --�Ϸù�ȣ
);   

drop table kbe_disorder;

select * from kbe_disorder;


create sequence kbe_disorder_seq;
drop sequence kbe_disorder_seq;

insert into kbe_disorder(listno, id, price, pprice, eprice, num)
values('114530-000'+kbe_disorder_seq.nextval, 'kim123', 10500,  300, 0, kbe_disorder_seq.nextval);


update kbe_disorder
set cprice=(price*0.1), dprice=cprice+pprice+eprice, total=(price-dprice);

delete from kbe_disorder where listno='20230307/114530-001';








-- ����Ʈ�󼼳���
create table kbe_point(
     listno     varchar2(50)
    ,id         varchar2(80)
    ,point      number
    ,num        number
);

select * from kbe_point;
drop table kbe_point;

create sequence kbe_point_seq;
drop sequence kbe_point_seq;

drop sequence kbe_point_seq;

insert into kbe_point(listno, id, num)
values('114530-000', 'kim123', kbe_point_seq.nextval);







'114530-000'+kbe_order_seq.nextval



