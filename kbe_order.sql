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
values('9788962372489',	'moon123', kbe_cart_seq.nextval);

select * from kbe_cart;


--상품 테이블에서 가격 가져와서 넣기
update kbe_cart KC
set KC.price = (select KP.price
                from kbe_product KP
                where KP.pcode = KC.pcode
                );

--상품테이블 생성
create table kbe_product(
     pcode char(13) primary key
    , price varchar2(50) not null
); 
-- 상품행추가   
insert into kbe_product( pcode, price) 
values('9788957551943',16000);

insert into kbe_product( pcode, price) 
values('9788967820817',10500 );
 
insert into kbe_product( pcode, price) 
values('9788962372489', 8400);

select * from kbe_product;




-- 주문서 테이블
create table kbe_order(
     listno      varchar2(50)                   --주문서번호
    ,pcode       char(13)        NOT NULL   
    ,price       varchar2(50)    
    ,num         number          PRIMARY KEY    --일련번호
);

select * from kbe_order;
--시퀀스 생성
create sequence kbe_order_seq;

--행추가
insert into kbe_order(listno, pcode, num)
values('114530-001', '9788957551943', kbe_order_seq.nextval);
insert into kbe_order(listno, pcode, num)
values('114530-001', '9788967820817', kbe_order_seq.nextval);
insert into kbe_order(listno, pcode, num)
values('114530-002', '9788962372489', kbe_order_seq.nextval);

--상품 테이블에서 가격 가져와서 넣기
update kbe_order KO
set KO.price = (select KP.price
                from kbe_product KP
                where KP.pcode = KO.pcode
                );





-- 결제상세내역
create table kbe_disorder(
     listno      varchar2(50)     PRIMARY KEY       
    ,id          varchar2(80)     NOT NULL       
    ,price       varchar2(50)            
    ,cprice      number                         --쿠폰할인금액
    ,pprice      number                         --포인트사용금액
    ,eprice      number                         --e캐시사용금액
    ,dprice      number                         --할인총금액
    ,total       number                         --최종결제금액
);   

select * from kbe_disorder;

--행추가
insert into kbe_disorder(listno, id, pprice, eprice)
values('114530-001','kim123', 300, 0);
insert into kbe_disorder(listno, id, pprice, eprice)
values('114530-002', 'kim123', 300, 0);

--주문서 테이블에서 해당 주문번호의 정가총액 가져와서 넣기
update kbe_disorder KDO
set KDO.price = (select SUM(KO.price)
                 from kbe_order KO
                 where KO.listno = KDO.listno
                );

--쿠폰 테이블에서 회원아이디의 쿠폰번호로 쿠폰 할인율을 가져와서 곱해서 넣기
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

-- 할인쿠폰행추가  
insert into  kbe_coupon(cno, cpercent)
values('cno001', 0.1);

insert into  kbe_coupon(cno, cpercent)
values('cno002', 0.2);

select * from kbe_coupon;

-- 쿠폰소유내역행추가    
    
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
ㅇㄹㄴㅇㅇㄹㅇㄴ

--할인 총 금액구해서 넣기
dprice=cprice+pprice+eprice, 
total=(price-dprice);
ㅇㄹㅇㄴ


-- 포인트상세내역
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



