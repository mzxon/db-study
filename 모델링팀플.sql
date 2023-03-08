--시퀀스 생성
create sequence 테이블명_seq;
--시퀀스 부여
테이블명_seq.nextval;
-- sungjuk_seq 시퀀스 삭제
drop sequence 테이블명_seq;

-- 주문결제장바구니

-- 장바구니
--테이블생성
create table kbe_cart(
     pcode      char(13)        NOT NULL        --상품코드
    ,id         varchar2(80)    NOT NULL        --회원아이디
    ,price     varchar2(50)    NOT NULL        --상품가격
    ,num        number          PRIMARY KEY     --일련번호
);

select * from kbe_cart;

--테이블삭제
drop table kbe_cart;

--시퀀스 생성
create sequence kbe_cart_seq;
--시퀀스 삭제
drop sequence kbe_cart_seq;

--행추가
insert into kbe_cart(pcode, id, price, num)
values('9788967820817',	'kim123', 10500, kbe_cart_seq.nextval);

--행삭제
delete from kbe_cart where num=1;





-- 주문서
create table kbe_order(
     listno      varchar2(50)    PRIMARY KEY    --주문서번호
    ,pcode       char(13)        NOT NULL       
    ,price       varchar2(50)    NOT NULL
);

select * from kbe_order;

create sequence kbe_order_seq;
drop sequence kbe_order_seq;

insert into kbe_order(listno, pcode, price)
values('114530-000'+kbe_order_seq.nextval,'9788967820817', 10500);

delete from kbe_order where listno=1001;







-- 결제상세내역
create table kbe_disorder(
     listno      varchar2(50)     NOT NULL       
    ,id          varchar2(80)     NOT NULL       
    ,price       varchar2(50)     NOT NULL       
    ,cprice      number                         --쿠폰할인금액
    ,pprice      number                         --포인트사용금액
    ,eprice      number                         --e캐시사용금액
    ,dprice      number                         --할인총금액
    ,total       number                         --최종결제금액
    ,num         number          PRIMARY KEY    --일련번호
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



