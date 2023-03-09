--장바구니 테이블
create table kbe_cart(
     pcode      char(13)        NOT NULL        --상품코드
    ,id         varchar2(80)    NOT NULL        --회원아이디
    ,price      varchar2(50)                    --상품가격
    ,num        number          PRIMARY KEY     --일련번호
);

--장바구니 테이블 시퀀스 생성
create sequence kbe_cart_seq;
drop sequence kbe_cart_seq;
drop table kbe_cart;

--행추가
insert into kbe_cart(pcode, id, num)
values('9788957551943',	'kim123', kbe_cart_seq.nextval);

insert into kbe_cart(pcode, id, num)
values('9788967820817',	'kim123', kbe_cart_seq.nextval);

insert into kbe_cart(pcode, id, num)
values('9788962372489',	'kim123', kbe_cart_seq.nextval);

insert into kbe_cart(pcode, id, num)
values('9791188754786',	'moon123', kbe_cart_seq.nextval);

select * from kbe_cart;


--상품 테이블에서 가격 가져와서 넣기
update kbe_cart KC
set KC.price = (select KP.price
                from kbe_product KP
                where KP.pcode = KC.pcode
                );

-- 상품테이블만들기
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
-- 상품행추가   
insert into kbe_product( pcode, pname, AUCODE, pbrand, pdate, psub, einfo, esize, price, CAGROUP, ppic) 
values('9788957551943', '범죄수사규칙', 'AU00017', '법률미디어',        '2017-03-09','듣기(TTS)여부:가능/ ISBN:9788957551943'        , 'pdf','39.00MB', 160000,'PS, am','apple.png');
        
insert into kbe_product( pcode, pname, AUCODE, pbrand, pdate, psub, einfo, esize, price, CAGROUP, ppic)
 values('9788967820817','예쁜 것은 다 너를 닮았다','AU00003','푸른향기',        '2018-07-17','듣기(TTS)여부:가능/ ISBN:9788967820817', 'epub','6.62MB',10500        ,'PE, es, c5','pretty.png');
         
insert into kbe_product( pcode, pname, AUCODE, pbrand, pdate, psub, einfo, esize, price, CAGROUP, ppic)  
values('9788962372489', '세미한 하나님의 음성을 듣는 방법', 'AU00016', '순전한나드', '2018-03-20', '듣기(TTS)여부:가능/ISBN: 9788962372489',        'epub', '34MB',        8400, 'RL, ch, c2','bana.png');

insert into kbe_product( pcode, pname, AUCODE, pbrand, pdate, psub, einfo, esize, price, CAGROUP, ppic) 
values('9791188754786', '월가아재의 제2라운드 투자 수업', 'AU00047', '에프엔미디어','2023-02-20','듣기(TTS)여부:가능/ ISBN:9791188754786'        , 'epub','24.67MB', 12000,'EC, ge, c3','walga.png');

select * from kbe_product;


-----------------------------------------------------------------------------------

-- 주문서 테이블
create table kbe_order(
     listno      varchar2(50)                   --주문서번호
    ,pcode       char(13)        NOT NULL   
    ,price       varchar2(50)    
    ,num         number          PRIMARY KEY    --일련번호
);
drop table kbe_order;
drop sequence kbe_order_seq;
select * from kbe_order;
--시퀀스 생성
create sequence kbe_order_seq;

--행추가
insert into kbe_order(listno, pcode, num)
values('114530-001', '9788957551943', kbe_order_seq.nextval);
insert into kbe_order(listno, pcode, num)
values('114530-002', '9788967820817', kbe_order_seq.nextval);
insert into kbe_order(listno, pcode, num)
values('114530-002', '9788962372489', kbe_order_seq.nextval);
insert into kbe_order(listno, pcode, num)
values('114530-003', '9791188754786', kbe_order_seq.nextval);

--상품 테이블에서 가격 가져와서 넣기
update kbe_order KO
set KO.price = (select KP.price
                from kbe_product KP
                where KP.pcode = KO.pcode
                );


--------------------------------------------------------------------------------------------------------------------


-- 결제상세내역 테이블
create table kbe_disorder(
     listno      varchar2(50)     PRIMARY KEY       
    ,id          varchar2(80)     NOT NULL       
    ,price       varchar2(50)            
    ,cprice      number                         --쿠폰할인금액
    ,pprice      number                         --포인트사용금액
    ,eprice      number                         --e캐시사용금액
    ,total       number                         --최종결제금액
);   

drop table kbe_disorder;
select * from kbe_disorder;

--행추가
insert into kbe_disorder(listno, id, cprice, pprice, eprice)
values('114530-001','kim123', 0, 0, 500);
insert into kbe_disorder(listno, id, cprice, pprice, eprice)
values('114530-002', 'kim123', 1890, 300, 0);
insert into kbe_disorder(listno, id, cprice, pprice, eprice)
values('114530-003', 'moon123', 2000, 0, 0);

--주문서 테이블에서 해당 주문번호의 정가총액 가져와서 넣기
update kbe_disorder KDO
set KDO.price = (select SUM(KO.price)
                 from kbe_order KO
                 where KO.listno = KDO.listno
                );

--최종결제금액 구하기 (정가총액 - 할인총금액)
update kbe_disorder KDO
set KDO.total = price-(cprice + pprice + eprice);







--쿠폰 테이블에서 회원아이디의 쿠폰번호로 쿠폰 할인율을 가져와서 곱해서 넣기
update kbe_disorder KDO
set KDO.cprice = 
case when (select KCO.cdiscount
           from kbe_coupon KCO
           where KCO.cno=(select KMCO.cno from kbe_m_coupon KMCO where KMCO.id=KDO.id)) > 0 then KDO.price-(KDO.price-KCO.cdiscount)
     when (select KCO.cdiscount
           from kbe_coupon KCO
           where KCO.cno=(select KMCO.cno from kbe_m_coupon KMCO where KMCO.id=KDO.id)) < 0 then KDO.price*KCO.cdiscount
END;

-- 할인쿠폰 테이블만들기
create table kbe_coupon (
     cno        char(6) primary key
    , cname     varchar2(50)    not null
    , cdiscount number          not null
    , cdate     date            not null
);
-- 쿠폰소유내역테이블만들기
create  table kbe_m_coupon(
     mcno  varchar2(100) primary key
   , id  varchar2 (80) not null
   , cno char(6) not null
   , mcuse char(1) not null
);
-- 할인쿠폰행추가
insert into kbe_coupon(cno, cname, cdiscount, cdate)
values('cno001','eBook주문쿠폰',0.1,'2023-06-30');
insert into  kbe_coupon( cno, cname, cdiscount, cdate)
values('cno002','eBook주문쿠폰',0.2,'2023-06-30');    
insert into  kbe_coupon( cno, cname, cdiscount, cdate)
values('cno003','제휴사쿠폰',1000,'2023-12-31'); 
insert into  kbe_coupon( cno, cname, cdiscount, cdate)
values('cno004','제휴사쿠폰', 2000,'2023-12-31');
-- 쿠폰소유내역행추가
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


-- 포인트상세내역
create table kbe_point(
     listno     varchar2(50)
    ,id         varchar2(80)
    ,point      number      
    ,num        number 
);

select * from kbe_point;
drop table kbe_point;

--시퀀스 생성
create sequence kbe_point_seq;
drop sequence kbe_point_seq;

--행추가
insert into kbe_point(listno, id, num)
values('114530-001', 'kim123', kbe_point_seq.nextval);
insert into kbe_point(listno, id, num)
values('114530-002', 'kim123', kbe_point_seq.nextval);
insert into kbe_point(listno, id, num)
values('114530-003', 'moon123', kbe_point_seq.nextval);

--포인트 적립/사용 총합
update kbe_point KP
set KP.point = --적립 *0.05
            (select KDO.price*0.05 - KDO.pprice
             from kbe_disorder KDO
             where KDO.listno = KP.listno
             );
             
