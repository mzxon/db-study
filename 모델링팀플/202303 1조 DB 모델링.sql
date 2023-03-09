202303 1�� DB �𵨸�
�հ���/��Ը�/Ȳ����/������/���ѿ�
�������� e-book �𵨸�
https://ebook.kyobobook.co.kr/dig/pnd/welcome


1. ȸ������

--���̺� ����
drop table kbe_member;

create table kbe_member (
      mname varchar2(50)  not null          --ȸ���̸�
    , id    varchar2(80)  primary key       --ȸ�����̵�
    , email varchar2(100) not null          --ȸ���̸���
    , phone varchar2(20)  not null          --ȸ����ȣ
    , addr  varchar2(100) not null          --ȸ���ּ�
    , birth varchar2(8)   not null          --ȸ������
    , mdate date          default sysdate   --ȸ�����Գ�¥ 
);

--���̺� �� �߰�
insert into kbe_member (mname, id, email, phone, addr, birth)
values('��Ը�', 'kim123', 'kim123@daum.net', '010-1234-5678', 'SEOUL', '19950625');

insert into kbe_member (mname, id, email, phone, addr, birth)
values('���ѿ�', 'kim321', 'kim321@naver.com', '010-2345-6789', 'SUWON', '19940707');

insert into kbe_member (mname, id, email, phone, addr, birth)
values('������', 'moon123', 'moon123@daum.net', '010-3456-7890', 'BUSAN', '19991210');

insert into kbe_member (mname, id, email, phone, addr, birth)
values('�հ���', 'son456', 'son456@naver.com', '010-4567-8901', 'JEJU', '19910323');

insert into kbe_member (mname, id, email, phone, addr, birth)
values('Ȳ����', 'hwang789', 'hwang789@gmail.com', '010-5678-9012', 'SEOUL', '19970810');

select * from kbe_member;
///////////////////////////////////////////////////////////////////////////////




2. ���ϱ�

--���̺� ����
drop table kbe_zzim;

--���̺� ����
create table kbe_zzim (
      zzno  number       primary key    --��ȣ
    , id    varchar2(80) not null       --ȸ�����̵�
    , pcode varchar2(100)     not null       --��ǰ�ڵ�
);

--������ ����
drop sequence kbe_member_seq;

--������ ����
create sequence kbe_member_seq;

--���̺� �� �߰�
insert into kbe_zzim (zzno, id, pcode) values(kbe_member_seq.nextval,'kim123','9788957551943');
insert into kbe_zzim (zzno, id, pcode) values(kbe_member_seq.nextval,'kim321','9788967820817');
insert into kbe_zzim (zzno, id, pcode) values(kbe_member_seq.nextval,'moon123','9788962372489');
insert into kbe_zzim (zzno, id, pcode) values(kbe_member_seq.nextval,'son456','9791188754786');
insert into kbe_zzim (zzno, id, pcode) values(kbe_member_seq.nextval,'hwang789','9791130697901');

select * from kbe_zzim;
///////////////////////////////////////////////////////////////////////////////




3. e-cash

--���̺� ����
drop table kbe_ecash;

--���̺� ����
create table kbe_ecash (
      ecno      char(8)     primary key    --ecash �ڵ��ȣ
    , ecprice   number(6)   not null       --ecash ����
);

--���̺� �� �߰�
insert into kbe_ecash (ecno, ecprice) values('ec1000', 1000);
insert into kbe_ecash (ecno, ecprice) values('ec10000', 11000);
insert into kbe_ecash (ecno, ecprice) values('ec30000', 33000);
insert into kbe_ecash (ecno, ecprice) values('ec50000', 55000);
insert into kbe_ecash (ecno, ecprice) values('ec100000', 110000);

select * from kbe_ecash;
///////////////////////////////////////////////////////////////////////////////




4. ȸ�� ���� e-cash

--���̺� ����
drop table kbe_m_ecash;

--���̺� ����
create table kbe_m_ecash (
      mecno  number         primary key     --ecash �ڵ��ȣ
    , id     varchar2(80)   not null        --ȸ�����̵�
    , ecno   char(8)        null            --ecash �ڵ��ȣ
    , ecuse  number         null        --ecash ���ݾ�
);

--������ ����
drop sequence kbe_m_ecash_seq;

--������ ����
create sequence kbe_m_ecash_seq;

--���̺� �� �߰�
insert into kbe_m_ecash (mecno, id, ecno, ecuse) values(kbe_m_ecash_seq.nextval,'kim123','ec1000', null);
insert into kbe_m_ecash (mecno, id, ecno, ecuse) values(kbe_m_ecash_seq.nextval,'kim123','', -500);
insert into kbe_m_ecash (mecno, id, ecno, ecuse) values(kbe_m_ecash_seq.nextval,'kim321','ec1000', null);
insert into kbe_m_ecash (mecno, id, ecno, ecuse) values(kbe_m_ecash_seq.nextval,'kim321','ec1000', null);
insert into kbe_m_ecash (mecno, id, ecno, ecuse) values(kbe_m_ecash_seq.nextval,'moon123','ec10000', null);

select  * from kbe_m_ecash;
///////////////////////////////////////////////////////////////////////////////




5. ��������

--���̺� ����
drop table kbe_coupon;

--���̺� ����
create table kbe_coupon (
     cno        char(6) primary key
    , cname     varchar2(50)    not null
    , cdiscount number          not null
    , cdate     date            not null
    );
    
--���̺� �� �߰�
insert into kbe_coupon(cno, cname, cdiscount, cdate) values('cno001','eBook�ֹ�����',0.1,'2023-06-30');
insert into kbe_coupon(cno, cname, cdiscount, cdate) values('cno002','eBook�ֹ�����',0.2,'2023-06-30');    
insert into kbe_coupon(cno, cname, cdiscount, cdate) values('cno003','���޻�����',1000,'2023-12-31'); 
insert into kbe_coupon(cno, cname, cdiscount, cdate) values('cno004','���޻�����', 2000,'2023-12-31'); 

select * from kbe_coupon;
///////////////////////////////////////////////////////////////////////////////




6. ȸ�� ���� ��������

--���̺� ����
drop table kbe_m_coupon;

--���̺� ����
create  table kbe_m_coupon(
     mcno  varchar2(100) primary key
   , id  varchar2 (80) not null
   , cno char(6) not null
   , mcuse char(1) not null
   );
   
--���̺� �� �߰�
insert into kbe_m_coupon(mcno, id, cno, mcuse) values('cu_001','kim123','cno001','Y');        
insert into kbe_m_coupon(mcno, id, cno, mcuse) values('cu_002','kim321','cno002','N');    
insert into kbe_m_coupon(mcno, id, cno, mcuse) values('cu_003','kim321','cno003','N');    
insert into kbe_m_coupon(mcno, id, cno, mcuse) values('cu_004','moon123','cno004','Y');    
insert into kbe_m_coupon(mcno, id, cno, mcuse) values('cu_005','son456','cno004','N');    
insert into kbe_m_coupon(mcno, id, cno, mcuse) values('cu_006','hwang789','cno002','N');    
insert into kbe_m_coupon(mcno, id, cno, mcuse) values('cu_007','hwang789','cno004','N');

select * from kbe_m_coupon;
///////////////////////////////////////////////////////////////////////////////




7. ��ǰ

--���̺� ����
drop table kbe_product;

--���̺� ����
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
    
--���̺� �� �߰�
insert into kbe_product( pcode, pname, AUCODE, pbrand, pdate, psub, einfo, esize, price, CAGROUP, ppic) 
values('9788957551943', '���˼����Ģ', 'AU00017', '�����̵��','2017-03-09','���(TTS)����:����/ ISBN:9788957551943', 'pdf','39.00MB', 160000,'PS, am','apple.png');

insert into kbe_product( pcode, pname, AUCODE, pbrand, pdate, psub, einfo, esize, price, CAGROUP, ppic)
values('9788967820817','���� ���� �� �ʸ� ��Ҵ�','AU00003','Ǫ�����','2018-07-17','���(TTS)����:����/ ISBN:9788967820817', 'epub','6.62MB',10500,'PE, es, c5','pretty.png');

insert into kbe_product( pcode, pname, AUCODE, pbrand, pdate, psub, einfo, esize, price, CAGROUP, ppic)  
values('9788962372489', '������ �ϳ����� ������ ��� ���', 'AU00016', '�����ѳ���', '2018-03-20', '���(TTS)����:����/ISBN: 9788962372489','epub', '34MB',8400, 'RL, ch, c2','bana.png');

insert into kbe_product( pcode, pname, AUCODE, pbrand, pdate, psub, einfo, esize, price, CAGROUP, ppic) 
values('9791188754786', '���������� ��2���� ���� ����', 'AU00047', '�������̵��','2023-02-20','���(TTS)����:����/ ISBN:9791188754786', 'epub','24.67MB', 12000,'EC, ge, c3','walga.png');

select * from kbe_product;
///////////////////////////////////////////////////////////////////////////////




8. �۰�   

--���̺� ����
drop table kbe_author;
    
--���̺� ����
create table kbe_author (
aucode          varchar2(7) not null,
aukorname      varchar2(30),
auengname      varchar2(1000),
dfcode      varchar2(1) not null,
aumclass      varchar2(50),
ausclass      varchar2(50)
);

--���̺� �� �߰�
insert into kbe_author (aucode, aukorname, dfcode, aumclass, ausclass) 
values ('AU00003', '������', 'K', '���а�', '���߹��а�>���信�����۰�');
insert into kbe_author (aucode, aukorname, dfcode, aumclass, ausclass) 
values ('AU00016', '�ȹΰ�', 'K', '������/�뿪��', '������/�뿪��>����');
insert into kbe_author (aucode, aukorname, dfcode, aumclass, ausclass) 
values ('AU00017', '������', 'K', '����/����/�����', '����/�ֽ�����������');

select * from kbe_author;

///////////////////////////////////////////////////////////////////////////////




8. ī�װ�

--���̺� ����
drop table kbe_category;

--���̺� ����
create table kbe_category (
cagroup varchar2(4000) not null,
caname varchar2(20) not NULL
);

--���̺� �� �߰�
insert into kbe_category (cagroup, caname) values ('PS', '��ġ/��ȸ');
insert into kbe_category (cagroup, caname) values ('am', '����/��å');
insert into kbe_category (cagroup, caname) values ('PE', '��/������');
insert into kbe_category (cagroup, caname) values ('es', '������');
insert into kbe_category (cagroup, caname) values ('c5', '�ѱ�������');
insert into kbe_category (cagroup, caname) values ('RL', '����');
insert into kbe_category (cagroup, caname) values ('ch', '�⵶��');
insert into kbe_category (cagroup, caname) values ('c2', '�⵶���Ϲ�');

select * from kbe_category;

-- �۰�/ī�װ� �� �߰�
alter table kbe_category add cacode varchar2(4);

-- �۰�/ī�װ� �� �߰�
update kbe_category set cacode='D01' where cagroup='PS';
update kbe_category set cacode='J01' where cagroup='am';
update kbe_category set cacode='D02' where cagroup='PE';
update kbe_category set cacode='J02' where cagroup='es';
update kbe_category set cacode='S01' where cagroup='c5';
update kbe_category set cacode='D03' where cagroup='RL';
update kbe_category set cacode='J03' where cagroup='ch';
update kbe_category set cacode='S02' where cagroup='c2';

alter table kbe_category modify (cacode not null);
///////////////////////////////////////////////////////////////////////////////




9. ����

--���̺� ����
drop table kbe_review;

--���̺� ����
create table kbe_review (
     rvcode     varchar2(80)    not null
    ,pcode      char(13)        not null
    ,id         varchar2(80)    not null
    ,rvdate     date            not null
    ,rvmark     number          default 0
    ,rvtag      varchar2(12)     not null
    ,rvcont     varchar2(3000)   
    ,rvpic      varchar2(100)
    ,rvgreat    number          default 0
    ,primary key(rvcode)
);

--���̺� �� �߰�
insert into kbe_review(rvcode,pcode,id,rvdate,rvmark,rvtag,rvcont,rvpic,rvgreat)
values('R1','9788967820817','kim123','2019-03-21',10,'�ְ���','ó�� �д� ���������� ����� �ʰ� ���� �� ������ å'
        ,'book.png',0);

insert into kbe_review(rvcode,pcode,id,rvdate,rvmark,rvtag,rvcont,rvpic,rvgreat)
values('R2','9788962372489','kim321','2022-06-17',10,'�����ſ�','�ϳ����� ���� �� �� �ִ� ������ å'
        ,'good.jpg',5);

insert into kbe_review(rvcode,pcode,id,rvdate,rvmark,rvtag,rvcont,rvpic,rvgreat)
values('R3','9791130697901','moon123','2023-03-06',7.5,'�ְ���','������ �����ϳ� �� ������ �����ϴ� ���� �����߽��ϴ�'
        ,'wow.png',20);

select * from kbe_review;
///////////////////////////////////////////////////////////////////////////////




9. ������

--���̺� ����
create table kbe_rvcomment (
     rvcno      number          default 1
    ,rvcode     varchar2(80)     not null
    ,id         varchar2(80)     not null
    ,rvcdate    date            not null
    ,rvccont    varchar2(3000)  not null
    ,primary key(rvcno)
);

--������ ����
create sequence rvcomment_seq;

--���̺� �� ����
insert into kbe_rvcomment(rvcno,rvcode,id,rvcdate,rvccont)
values(rvcomment_seq.nextval,'R1','moon123','2020-04-20','���� �����̴� ó���ε� ����ְ� �о����');

insert into kbe_rvcomment(rvcno,rvcode,id,rvcdate,rvccont)
values(rvcomment_seq.nextval,'R1','hwang789','2021-01-15','�۰����� �ٸ� �����̵� ��õ�帳�ϴ�');

insert into kbe_rvcomment(rvcno,rvcode,id,rvcdate,rvccont)
values(rvcomment_seq.nextval,'R2','son456','2022-07-30','���� �����մϴ�');

select * from kbe_rvcomment;
///////////////////////////////////////////////////////////////////////////////




10. ��ٱ���

--���̺� ����
create table kbe_cart(
     pcode      char(13)        NOT NULL        --��ǰ�ڵ�
    ,id         varchar2(80)    NOT NULL        --ȸ�����̵�
    ,price      varchar2(50)                    --��ǰ����
    ,num        number          PRIMARY KEY     --�Ϸù�ȣ
);

--������ ����
create sequence kbe_cart_seq;

--���̺� �� �߰�
insert into kbe_cart(pcode, id, num) values('9788957551943','kim123', kbe_cart_seq.nextval);
insert into kbe_cart(pcode, id, num) values('9788967820817','kim123', kbe_cart_seq.nextval);
insert into kbe_cart(pcode, id, num) values('9788962372489','kim123', kbe_cart_seq.nextval);
insert into kbe_cart(pcode, id, num) values('9791188754786','moon123', kbe_cart_seq.nextval);

--��ǰ ���̺��� ���� �����ͼ� �ֱ�
update kbe_cart KC
set KC.price = (select KP.price
                from kbe_product KP
                where KP.pcode = KC.pcode
                );

select * from kbe_cart;
///////////////////////////////////////////////////////////////////////////////




11. �ֹ���

--���̺� ����
drop table kbe_order;

--���̺� ����
create table kbe_order(
     listno      varchar2(50)                   --�ֹ�����ȣ
    ,pcode       char(13)        NOT NULL   
    ,price       varchar2(50)    
    ,num         number          PRIMARY KEY    --�Ϸù�ȣ
);

--������ ����
drop sequence kbe_order_seq;

--������ ����
create sequence kbe_order_seq;

--���̺� �� �߰�
insert into kbe_order(listno, pcode, num) values('114530-001', '9788957551943', kbe_order_seq.nextval);
insert into kbe_order(listno, pcode, num) values('114530-002', '9788967820817', kbe_order_seq.nextval);
insert into kbe_order(listno, pcode, num) values('114530-002', '9788962372489', kbe_order_seq.nextval);
insert into kbe_order(listno, pcode, num) values('114530-003', '9791188754786', kbe_order_seq.nextval);

--��ǰ ���̺��� ���� �����ͼ� �ֱ�
update kbe_order KO
set KO.price = (select KP.price
                from kbe_product KP
                where KP.pcode = KO.pcode
                );

select * from kbe_order;
///////////////////////////////////////////////////////////////////////////////




12. �����󼼳���

--���̺� ����
drop table kbe_disorder;

--���̺� ����
create table kbe_disorder(
     listno      varchar2(50)     PRIMARY KEY       
    ,id          varchar2(80)     NOT NULL       
    ,price       varchar2(50)            
    ,cprice      number                         --�������αݾ�
    ,pprice      number                         --����Ʈ���ݾ�
    ,eprice      number                         --eĳ�û��ݾ�
    ,total       number                         --���������ݾ�
);

--���̺� �� �߰�
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

select * from kbe_disorder;
///////////////////////////////////////////////////////////////////////////////




13. ����Ʈ�󼼳���

--���̺� ����
create table kbe_point(
     listno     varchar2(50)
    ,id         varchar2(80)
    ,point      number      
    ,num        number 
);

--������ ����
create sequence kbe_point_seq;

--���̺� �� �߰�
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

select * from kbe_point;
///////////////////////////////////////////////////////////////////////////////






-- ��ǰ ���̺� ī�װ� ���̺� ������ �ҷ�����

----- <���˼����Ģ> ī�װ� ������Ʈ ����
update kbe_product kbpr 
set kbpr.cagroup = (
    select listagg(caname, '>')
    within group(order by cacode)
    from kbe_category
    where cacode in ('D01', 'J01')
)
where pcode='9788957551943';

----- <���� ���� �� �ʸ� ��Ҵ�> ī�װ� ������Ʈ ����
update kbe_product kbpr 
set kbpr.cagroup = (
    select listagg(caname, '>')
    within group(order by cacode)
    from kbe_category
    where cacode in ('D02', 'J02', 'S01')
)
where pcode='9788967820817';

-----<������ �ϳ����� ������ ��� ���> ī�װ� ������Ʈ ����
update kbe_product kbpr 
set kbpr.cagroup = (
    select listagg(caname, '>')
    within group(order by cacode)
    from kbe_category
    where cacode in ('D03', 'J03', 'S02')
)
where pcode='9788962372489';

select * from kbe_product;


-- ��ǰ���̺� �۰� ���̺� ������ �ҷ�����
-- ��ǰ���̺� ������ ���� modify �ʿ�
alter table kbe_product modify aucode varchar2(30);
----- <���˼����Ģ> �۰� ������Ʈ ����
update kbe_product kbpr 
set kbpr.aucode = (
    select aukorname
    from kbe_author
    where aucode in ('AU00017')
)
where pcode='9788957551943';
----- <���� ���� �� �ʸ� ��Ҵ�> �۰� ������Ʈ ����
update kbe_product kbpr 
set kbpr.aucode = (
    select aukorname
    from kbe_author
    where aucode in ('AU00003')
)
where pcode='9788967820817';
-----<������ �ϳ����� ������ ��� ���> �۰� ������Ʈ ����
update kbe_product kbpr 
set kbpr.aucode = (
    select aukorname
    from kbe_author
    where aucode in ('AU00016')
)
where pcode='9788962372489';


--ȸ�� ���� ecash ���̺� ������Ʈ
update kbe_m_ecash
set kbe_m_ecash.ecuse = (
    select ecprice from kbe_ecash where ecno='ec1000'
) where ecno='ec1000';

update kbe_m_ecash
set kbe_m_ecash.ecuse = (
    select ecprice from kbe_ecash where ecno='ec10000'
) where ecno='ec10000';

update kbe_m_ecash
set kbe_m_ecash.ecuse = (
    select ecprice from kbe_ecash where ecno='ec30000'
) where ecno='ec30000';

update kbe_m_ecash
set kbe_m_ecash.ecuse = (
    select ecprice from kbe_ecash where ecno='ec50000'
) where ecno='ec50000';

update kbe_m_ecash
set kbe_m_ecash.ecuse = (
    select ecprice from kbe_ecash where ecno='ec100000'
) where ecno='ec100000';

select * from kbe_m_ecash;


--���ϱ� pcode ��ǰ �̸� ������Ʈ

update kbe_zzim
set kbe_zzim.pcode =(
    select pname from kbe_product where pcode='9788957551943'
) where pcode='9788957551943';

update kbe_zzim
set kbe_zzim.pcode =(
    select pname from kbe_product where pcode='9788967820817'
) where pcode='9788967820817';

update kbe_zzim
set kbe_zzim.pcode =(
    select pname from kbe_product where pcode='9788962372489'
) where pcode='9788962372489';

update kbe_zzim
set kbe_zzim.pcode =(
    select pname from kbe_product where pcode='9791188754786'
) where pcode='9791188754786';

commit;



















