--��ٱ��� ���̺�
create table kbe_cart(
     pcode      char(13)        NOT NULL        --��ǰ�ڵ�
    ,id         varchar2(80)    NOT NULL        --ȸ�����̵�
    ,price      varchar2(50)                    --��ǰ����
    ,num        number          PRIMARY KEY     --�Ϸù�ȣ
);

--��ٱ��� ���̺� ������ ����
create sequence kbe_cart_seq;
drop sequence kbe_cart_seq;
drop table kbe_cart;

--���߰�
insert into kbe_cart(pcode, id, num)
values('9788957551943',	'kim123', kbe_cart_seq.nextval);

insert into kbe_cart(pcode, id, num)
values('9788967820817',	'kim123', kbe_cart_seq.nextval);

insert into kbe_cart(pcode, id, num)
values('9788962372489',	'moon123', kbe_cart_seq.nextval);

select * from kbe_cart;


--��ǰ ���̺��� ���� �����ͼ� �ֱ�
update kbe_cart KC
set KC.price = (select KP.price
                from kbe_product KP
                where KP.pcode = KC.pcode
                );

--��ǰ���̺� ����
create table kbe_product(
     pcode char(13) primary key
    , price varchar2(50) not null
); 
-- ��ǰ���߰�   
insert into kbe_product( pcode, price) 
values('9788957551943',16000);

insert into kbe_product( pcode, price) 
values('9788967820817',10500 );
 
insert into kbe_product( pcode, price) 
values('9788962372489', 8400);

select * from kbe_product;




-- �ֹ��� ���̺�
create table kbe_order(
     listno      varchar2(50)                   --�ֹ�����ȣ
    ,pcode       char(13)        NOT NULL   
    ,price       varchar2(50)    
    ,num         number          PRIMARY KEY    --�Ϸù�ȣ
);

select * from kbe_order;
--������ ����
create sequence kbe_order_seq;

--���߰�
insert into kbe_order(listno, pcode, num)
values('114530-001', '9788957551943', kbe_order_seq.nextval);
insert into kbe_order(listno, pcode, num)
values('114530-001', '9788967820817', kbe_order_seq.nextval);
insert into kbe_order(listno, pcode, num)
values('114530-002', '9788962372489', kbe_order_seq.nextval);

--��ǰ ���̺��� ���� �����ͼ� �ֱ�
update kbe_order KO
set KO.price = (select KP.price
                from kbe_product KP
                where KP.pcode = KO.pcode
                );





-- �����󼼳���
create table kbe_disorder(
     listno      varchar2(50)     PRIMARY KEY       
    ,id          varchar2(80)     NOT NULL       
    ,price       varchar2(50)            
    ,cprice      number                         --�������αݾ�
    ,pprice      number                         --����Ʈ���ݾ�
    ,eprice      number                         --eĳ�û��ݾ�
    ,dprice      number                         --�����ѱݾ�
    ,total       number                         --���������ݾ�
);   

select * from kbe_disorder;

--���߰�
insert into kbe_disorder(listno, id, pprice, eprice)
values('114530-001','kim123', 300, 0);
insert into kbe_disorder(listno, id, pprice, eprice)
values('114530-002', 'kim123', 300, 0);

--�ֹ��� ���̺��� �ش� �ֹ���ȣ�� �����Ѿ� �����ͼ� �ֱ�
update kbe_disorder KDO
set KDO.price = (select SUM(KO.price)
                 from kbe_order KO
                 where KO.listno = KDO.listno
                );

--���� ���̺��� ȸ�����̵��� ������ȣ�� ���� �������� �����ͼ� ���ؼ� �ֱ�
update kbe_disorder KDO
set KDO.cprice = KDO.price*(select KCP.cpercent
                            from kbe_coupon KCP
                            where KCP.cno = (select KMCP.cno from kbe_m_coupon KMCP)
where KDO.id = (select KCP.id
                from kbe_m_coupon KCP);



create table kbe_coupon (
     cno char(6) primary key
    , cpercent number
);

drop table kbe_coupon;

create table kbe_m_coupon(
   id  varchar2 (80) not null
   , cno char(6) not null
);

drop table kbe_m_coupon;

-- �����������߰�  
insert into  kbe_coupon(cno, cpercent)
values('cno001', 0.1);

insert into  kbe_coupon(cno, cpercent)
values('cno002', 0.2);

select * from kbe_coupon;

-- ���������������߰�    
    
insert into kbe_m_coupon(id, cno) 
values('kim123','cno001');
    
insert into kbe_m_coupon(id, cno) 
values('kim321','cno002');

insert into kbe_m_coupon(id, cno) 
values('kim321','cno001');

insert into kbe_m_coupon(id, cno) 
values('moon123','cno001'); 

select * from kbe_m_coupon;

dsfdsdsfdsfd
����������������

--���� �� �ݾױ��ؼ� �ֱ�
dprice=cprice+pprice+eprice, 
total=(price-dprice);
��������


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



