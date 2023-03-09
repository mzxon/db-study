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
values('9788962372489',	'kim123', kbe_cart_seq.nextval);

insert into kbe_cart(pcode, id, num)
values('9791188754786',	'moon123', kbe_cart_seq.nextval);

select * from kbe_cart;


--��ǰ ���̺��� ���� �����ͼ� �ֱ�
update kbe_cart KC
set KC.price = (select KP.price
                from kbe_product KP
                where KP.pcode = KC.pcode
                );

-- ��ǰ���̺����
create table kbe_product(
     pcode char(13) primary key
    , pname varchar2(100) not null
    , AUCODE varchar2(7) not null
    , pbrand varchar2(50) not null
    , pdate date  not null
    , psub long not null
    , einfo varchar2(50) not null
    , esize varchar2(50) not null
    , price varchar2(50) not null
    , CAGROUP varchar2(400) not null
    , ppic varchar2(100) not null
);

drop table kbe_product;
-- ��ǰ���߰�   
insert into kbe_product( pcode, pname, AUCODE, pbrand, pdate, psub, einfo, esize, price, CAGROUP, ppic) 
values('9788957551943', '���˼����Ģ', 'AU00017', '�����̵��',        '2017-03-09','���(TTS)����:����/ ISBN:9788957551943'        , 'pdf','39.00MB', 160000,'PS, am','apple.png');
        
insert into kbe_product( pcode, pname, AUCODE, pbrand, pdate, psub, einfo, esize, price, CAGROUP, ppic)
 values('9788967820817','���� ���� �� �ʸ� ��Ҵ�','AU00003','Ǫ�����',        '2018-07-17','���(TTS)����:����/ ISBN:9788967820817', 'epub','6.62MB',10500        ,'PE, es, c5','pretty.png');
         
insert into kbe_product( pcode, pname, AUCODE, pbrand, pdate, psub, einfo, esize, price, CAGROUP, ppic)  
values('9788962372489', '������ �ϳ����� ������ ��� ���', 'AU00016', '�����ѳ���', '2018-03-20', '���(TTS)����:����/ISBN: 9788962372489',        'epub', '34MB',        8400, 'RL, ch, c2','bana.png');

insert into kbe_product( pcode, pname, AUCODE, pbrand, pdate, psub, einfo, esize, price, CAGROUP, ppic) 
values('9791188754786', '���������� ��2���� ���� ����', 'AU00047', '�������̵��','2023-02-20','���(TTS)����:����/ ISBN:9791188754786'        , 'epub','24.67MB', 12000,'EC, ge, c3','walga.png');

select * from kbe_product;


-----------------------------------------------------------------------------------

-- �ֹ��� ���̺�
create table kbe_order(
     listno      varchar2(50)                   --�ֹ�����ȣ
    ,pcode       char(13)        NOT NULL   
    ,price       varchar2(50)    
    ,num         number          PRIMARY KEY    --�Ϸù�ȣ
);
drop table kbe_order;
drop sequence kbe_order_seq;
select * from kbe_order;
--������ ����
create sequence kbe_order_seq;

--���߰�
insert into kbe_order(listno, pcode, num)
values('114530-001', '9788957551943', kbe_order_seq.nextval);
insert into kbe_order(listno, pcode, num)
values('114530-002', '9788967820817', kbe_order_seq.nextval);
insert into kbe_order(listno, pcode, num)
values('114530-002', '9788962372489', kbe_order_seq.nextval);
insert into kbe_order(listno, pcode, num)
values('114530-003', '9791188754786', kbe_order_seq.nextval);

--��ǰ ���̺��� ���� �����ͼ� �ֱ�
update kbe_order KO
set KO.price = (select KP.price
                from kbe_product KP
                where KP.pcode = KO.pcode
                );


--------------------------------------------------------------------------------------------------------------------


-- �����󼼳��� ���̺�
create table kbe_disorder(
     listno      varchar2(50)     PRIMARY KEY       
    ,id          varchar2(80)     NOT NULL       
    ,price       varchar2(50)            
    ,cprice      number                         --�������αݾ�
    ,pprice      number                         --����Ʈ���ݾ�
    ,eprice      number                         --eĳ�û��ݾ�
    ,total       number                         --���������ݾ�
);   

drop table kbe_disorder;
select * from kbe_disorder;

--���߰�
insert into kbe_disorder(listno, id, cprice, pprice, eprice)
values('114530-001','kim123', 0, 0, 500);
insert into kbe_disorder(listno, id, cprice, pprice, eprice)
values('114530-002', 'kim123', 1890, 300, 0);
insert into kbe_disorder(listno, id, cprice, pprice, eprice)
values('114530-003', 'moon123', 2000, 0, 0);

--�ֹ��� ���̺��� �ش� �ֹ���ȣ�� �����Ѿ� �����ͼ� �ֱ�
update kbe_disorder KDO
set KDO.price = (select SUM(KO.price)
                 from kbe_order KO
                 where KO.listno = KDO.listno
                );

--���������ݾ� ���ϱ� (�����Ѿ� - �����ѱݾ�)
update kbe_disorder KDO
set KDO.total = price-(cprice + pprice + eprice);







--���� ���̺��� ȸ�����̵��� ������ȣ�� ���� �������� �����ͼ� ���ؼ� �ֱ�
update kbe_disorder KDO
set KDO.cprice = 
case when (select KCO.cdiscount
           from kbe_coupon KCO
           where KCO.cno=(select KMCO.cno from kbe_m_coupon KMCO where KMCO.id=KDO.id)) > 0 then KDO.price-(KDO.price-KCO.cdiscount)
     when (select KCO.cdiscount
           from kbe_coupon KCO
           where KCO.cno=(select KMCO.cno from kbe_m_coupon KMCO where KMCO.id=KDO.id)) < 0 then KDO.price*KCO.cdiscount
END;

-- �������� ���̺����
create table kbe_coupon (
     cno        char(6) primary key
    , cname     varchar2(50)    not null
    , cdiscount number          not null
    , cdate     date            not null
);
-- ���������������̺����
create  table kbe_m_coupon(
     mcno  varchar2(100) primary key
   , id  varchar2 (80) not null
   , cno char(6) not null
   , mcuse char(1) not null
);
-- �����������߰�
insert into kbe_coupon(cno, cname, cdiscount, cdate)
values('cno001','eBook�ֹ�����',0.1,'2023-06-30');
insert into  kbe_coupon( cno, cname, cdiscount, cdate)
values('cno002','eBook�ֹ�����',0.2,'2023-06-30');    
insert into  kbe_coupon( cno, cname, cdiscount, cdate)
values('cno003','���޻�����',1000,'2023-12-31'); 
insert into  kbe_coupon( cno, cname, cdiscount, cdate)
values('cno004','���޻�����', 2000,'2023-12-31');
-- ���������������߰�
insert into  kbe_m_coupon(mcno, id, cno, mcuse) 
values('cu_001','kim123','cno001','Y');
insert into  kbe_m_coupon( mcno, id, cno, mcuse) 
values('cu_002','kim321','cno002','N');
insert into kbe_m_coupon( mcno, id, cno, mcuse) 
values('cu_003','kim321','cno003','N');
insert into kbe_m_coupon( mcno, id, cno, mcuse) 
values('cu_004','moon123','cno004','Y');
insert into kbe_m_coupon( mcno, id, cno, mcuse) 
values('cu_005','son456','cno004','N');
insert into kbe_m_coupon( mcno, id, cno, mcuse) 
values('cu_006','hwang789','cno002','N');
insert into kbe_m_coupon( mcno, id, cno, mcuse) 
values('cu_007','hwang789','cno004','N');



---------------------------------------------------------------------------------------


-- ����Ʈ�󼼳���
create table kbe_point(
     listno     varchar2(50)
    ,id         varchar2(80)
    ,point      number      
    ,num        number 
);

select * from kbe_point;
drop table kbe_point;

--������ ����
create sequence kbe_point_seq;
drop sequence kbe_point_seq;

--���߰�
insert into kbe_point(listno, id, num)
values('114530-001', 'kim123', kbe_point_seq.nextval);
insert into kbe_point(listno, id, num)
values('114530-002', 'kim123', kbe_point_seq.nextval);
insert into kbe_point(listno, id, num)
values('114530-003', 'moon123', kbe_point_seq.nextval);

--����Ʈ ����/��� ����
update kbe_point KP
set KP.point = --���� *0.05
            (select KDO.price*0.05 - KDO.pprice
             from kbe_disorder KDO
             where KDO.listno = KP.listno
             );
             
