202303 1조 DB 모델링
손경은/김규리/황영리/문지오/김한울
교보문고 e-book 모델링
https://ebook.kyobobook.co.kr/dig/pnd/welcome


1. 회원정보

--테이블 생성
drop table kbe_member;

create table kbe_member (
      mname varchar2(50)  not null          --회원이름
    , id    varchar2(80)  primary key       --회원아이디
    , email varchar2(100) not null          --회원이메일
    , phone varchar2(20)  not null          --회원번호
    , addr  varchar2(100) not null          --회원주소
    , birth varchar2(8)   not null          --회원생일
    , mdate date          default sysdate   --회원가입날짜 
);

--테이블 행 추가
insert into kbe_member (mname, id, email, phone, addr, birth)
values('김규리', 'kim123', 'kim123@daum.net', '010-1234-5678', 'SEOUL', '19950625');

insert into kbe_member (mname, id, email, phone, addr, birth)
values('김한울', 'kim321', 'kim321@naver.com', '010-2345-6789', 'SUWON', '19940707');

insert into kbe_member (mname, id, email, phone, addr, birth)
values('문지오', 'moon123', 'moon123@daum.net', '010-3456-7890', 'BUSAN', '19991210');

insert into kbe_member (mname, id, email, phone, addr, birth)
values('손경은', 'son456', 'son456@naver.com', '010-4567-8901', 'JEJU', '19910323');

insert into kbe_member (mname, id, email, phone, addr, birth)
values('황영리', 'hwang789', 'hwang789@gmail.com', '010-5678-9012', 'SEOUL', '19970810');

select * from kbe_member;
///////////////////////////////////////////////////////////////////////////////




2. 찜하기

--테이블 삭제
drop table kbe_zzim;

--테이블 생성
create table kbe_zzim (
      zzno  number       primary key    --번호
    , id    varchar2(80) not null       --회원아이디
    , pcode varchar2(100)     not null       --상품코드
);

--시퀀스 삭제
drop sequence kbe_member_seq;

--시퀀스 생성
create sequence kbe_member_seq;

--테이블 행 추가
insert into kbe_zzim (zzno, id, pcode) values(kbe_member_seq.nextval,'kim123','9788957551943');
insert into kbe_zzim (zzno, id, pcode) values(kbe_member_seq.nextval,'kim321','9788967820817');
insert into kbe_zzim (zzno, id, pcode) values(kbe_member_seq.nextval,'moon123','9788962372489');
insert into kbe_zzim (zzno, id, pcode) values(kbe_member_seq.nextval,'son456','9791188754786');
insert into kbe_zzim (zzno, id, pcode) values(kbe_member_seq.nextval,'hwang789','9791130697901');

select * from kbe_zzim;
///////////////////////////////////////////////////////////////////////////////




3. e-cash

--테이블 삭제
drop table kbe_ecash;

--테이블 생성
create table kbe_ecash (
      ecno      char(8)     primary key    --ecash 코드번호
    , ecprice   number(6)   not null       --ecash 가격
);

--테이블 행 추가
insert into kbe_ecash (ecno, ecprice) values('ec1000', 1000);
insert into kbe_ecash (ecno, ecprice) values('ec10000', 11000);
insert into kbe_ecash (ecno, ecprice) values('ec30000', 33000);
insert into kbe_ecash (ecno, ecprice) values('ec50000', 55000);
insert into kbe_ecash (ecno, ecprice) values('ec100000', 110000);

select * from kbe_ecash;
///////////////////////////////////////////////////////////////////////////////




4. 회원 소유 e-cash

--테이블 삭제
drop table kbe_m_ecash;

--테이블 생성
create table kbe_m_ecash (
      mecno  number         primary key     --ecash 코드번호
    , id     varchar2(80)   not null        --회원아이디
    , ecno   char(8)        null            --ecash 코드번호
    , ecuse  number         null        --ecash 사용금액
);

--시퀀스 삭제
drop sequence kbe_m_ecash_seq;

--시퀀스 생성
create sequence kbe_m_ecash_seq;

--테이블 행 추가
insert into kbe_m_ecash (mecno, id, ecno, ecuse) values(kbe_m_ecash_seq.nextval,'kim123','ec1000', null);
insert into kbe_m_ecash (mecno, id, ecno, ecuse) values(kbe_m_ecash_seq.nextval,'kim123','', -500);
insert into kbe_m_ecash (mecno, id, ecno, ecuse) values(kbe_m_ecash_seq.nextval,'kim321','ec1000', null);
insert into kbe_m_ecash (mecno, id, ecno, ecuse) values(kbe_m_ecash_seq.nextval,'kim321','ec1000', null);
insert into kbe_m_ecash (mecno, id, ecno, ecuse) values(kbe_m_ecash_seq.nextval,'moon123','ec10000', null);

select  * from kbe_m_ecash;
///////////////////////////////////////////////////////////////////////////////




5. 할인쿠폰

--테이블 삭제
drop table kbe_coupon;

--테이블 생성
create table kbe_coupon (
     cno        char(6) primary key
    , cname     varchar2(50)    not null
    , cdiscount number          not null
    , cdate     date            not null
    );
    
--테이블 행 추가
insert into kbe_coupon(cno, cname, cdiscount, cdate) values('cno001','eBook주문쿠폰',0.1,'2023-06-30');
insert into kbe_coupon(cno, cname, cdiscount, cdate) values('cno002','eBook주문쿠폰',0.2,'2023-06-30');    
insert into kbe_coupon(cno, cname, cdiscount, cdate) values('cno003','제휴사쿠폰',1000,'2023-12-31'); 
insert into kbe_coupon(cno, cname, cdiscount, cdate) values('cno004','제휴사쿠폰', 2000,'2023-12-31'); 

select * from kbe_coupon;
///////////////////////////////////////////////////////////////////////////////




6. 회원 소유 할인쿠폰

--테이블 삭제
drop table kbe_m_coupon;

--테이블 생성
create  table kbe_m_coupon(
     mcno  varchar2(100) primary key
   , id  varchar2 (80) not null
   , cno char(6) not null
   , mcuse char(1) not null
   );
   
--테이블 행 추가
insert into kbe_m_coupon(mcno, id, cno, mcuse) values('cu_001','kim123','cno001','Y');        
insert into kbe_m_coupon(mcno, id, cno, mcuse) values('cu_002','kim321','cno002','N');    
insert into kbe_m_coupon(mcno, id, cno, mcuse) values('cu_003','kim321','cno003','N');    
insert into kbe_m_coupon(mcno, id, cno, mcuse) values('cu_004','moon123','cno004','Y');    
insert into kbe_m_coupon(mcno, id, cno, mcuse) values('cu_005','son456','cno004','N');    
insert into kbe_m_coupon(mcno, id, cno, mcuse) values('cu_006','hwang789','cno002','N');    
insert into kbe_m_coupon(mcno, id, cno, mcuse) values('cu_007','hwang789','cno004','N');

select * from kbe_m_coupon;
///////////////////////////////////////////////////////////////////////////////




7. 상품

--테이블 삭제
drop table kbe_product;

--테이블 생성
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
    
--테이블 행 추가
insert into kbe_product( pcode, pname, AUCODE, pbrand, pdate, psub, einfo, esize, price, CAGROUP, ppic) 
values('9788957551943', '범죄수사규칙', 'AU00017', '법률미디어','2017-03-09','듣기(TTS)여부:가능/ ISBN:9788957551943', 'pdf','39.00MB', 160000,'PS, am','apple.png');

insert into kbe_product( pcode, pname, AUCODE, pbrand, pdate, psub, einfo, esize, price, CAGROUP, ppic)
values('9788967820817','예쁜 것은 다 너를 닮았다','AU00003','푸른향기','2018-07-17','듣기(TTS)여부:가능/ ISBN:9788967820817', 'epub','6.62MB',10500,'PE, es, c5','pretty.png');

insert into kbe_product( pcode, pname, AUCODE, pbrand, pdate, psub, einfo, esize, price, CAGROUP, ppic)  
values('9788962372489', '세미한 하나님의 음성을 듣는 방법', 'AU00016', '순전한나드', '2018-03-20', '듣기(TTS)여부:가능/ISBN: 9788962372489','epub', '34MB',8400, 'RL, ch, c2','bana.png');

insert into kbe_product( pcode, pname, AUCODE, pbrand, pdate, psub, einfo, esize, price, CAGROUP, ppic) 
values('9791188754786', '월가아재의 제2라운드 투자 수업', 'AU00047', '에프엔미디어','2023-02-20','듣기(TTS)여부:가능/ ISBN:9791188754786', 'epub','24.67MB', 12000,'EC, ge, c3','walga.png');

select * from kbe_product;
///////////////////////////////////////////////////////////////////////////////




8. 작가   

--테이블 삭제
drop table kbe_author;
    
--테이블 생성
create table kbe_author (
aucode          varchar2(7) not null,
aukorname      varchar2(30),
auengname      varchar2(1000),
dfcode      varchar2(1) not null,
aumclass      varchar2(50),
ausclass      varchar2(50)
);

--테이블 행 추가
insert into kbe_author (aucode, aukorname, dfcode, aumclass, ausclass) 
values ('AU00003', '김지영', 'K', '문학가', '대중문학가>포토에세이작가');
insert into kbe_author (aucode, aukorname, dfcode, aumclass, ausclass) 
values ('AU00016', '안민경', 'K', '번역가/통역사', '번역가/통역사>영어');
insert into kbe_author (aucode, aukorname, dfcode, aumclass, ausclass) 
values ('AU00017', '신현덕', 'K', '경제/금융/기업인', '증권/주식투자전문가');

select * from kbe_author;

///////////////////////////////////////////////////////////////////////////////




8. 카테고리

--테이블 삭제
drop table kbe_category;

--테이블 생성
create table kbe_category (
cagroup varchar2(4000) not null,
caname varchar2(20) not NULL
);

--테이블 행 추가
insert into kbe_category (cagroup, caname) values ('PS', '정치/사회');
insert into kbe_category (cagroup, caname) values ('am', '행정/정책');
insert into kbe_category (cagroup, caname) values ('PE', '시/에세이');
insert into kbe_category (cagroup, caname) values ('es', '에세이');
insert into kbe_category (cagroup, caname) values ('c5', '한국에세이');
insert into kbe_category (cagroup, caname) values ('RL', '종교');
insert into kbe_category (cagroup, caname) values ('ch', '기독교');
insert into kbe_category (cagroup, caname) values ('c2', '기독교일반');

select * from kbe_category;

-- 작가/카테고리 열 추가
alter table kbe_category add cacode varchar2(4);

-- 작가/카테고리 열 추가
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




9. 리뷰

--테이블 삭제
drop table kbe_review;

--테이블 생성
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

--테이블 행 추가
insert into kbe_review(rvcode,pcode,id,rvdate,rvmark,rvtag,rvcont,rvpic,rvgreat)
values('R1','9788967820817','kim123','2019-03-21',10,'최고예요','처음 읽는 에세이지만 어렵지 않고 술술 잘 읽히는 책'
        ,'book.png',0);

insert into kbe_review(rvcode,pcode,id,rvdate,rvmark,rvtag,rvcont,rvpic,rvgreat)
values('R2','9788962372489','kim321','2022-06-17',10,'힐링돼요','하나님의 뜻을 알 수 있는 유용한 책'
        ,'good.jpg',5);

insert into kbe_review(rvcode,pcode,id,rvdate,rvmark,rvtag,rvcont,rvpic,rvgreat)
values('R3','9791130697901','moon123','2023-03-06',7.5,'최고예요','내용이 참신하나 그 과정을 설명하는 것이 부족했습니다'
        ,'wow.png',20);

select * from kbe_review;
///////////////////////////////////////////////////////////////////////////////




9. 리뷰댓글

--테이블 생성
create table kbe_rvcomment (
     rvcno      number          default 1
    ,rvcode     varchar2(80)     not null
    ,id         varchar2(80)     not null
    ,rvcdate    date            not null
    ,rvccont    varchar2(3000)  not null
    ,primary key(rvcno)
);

--시퀀스 생성
create sequence rvcomment_seq;

--테이블 행 생성
insert into kbe_rvcomment(rvcno,rvcode,id,rvcdate,rvccont)
values(rvcomment_seq.nextval,'R1','moon123','2020-04-20','저도 에세이는 처음인데 재미있게 읽었어요');

insert into kbe_rvcomment(rvcno,rvcode,id,rvcdate,rvccont)
values(rvcomment_seq.nextval,'R1','hwang789','2021-01-15','작가님의 다른 에세이도 추천드립니다');

insert into kbe_rvcomment(rvcno,rvcode,id,rvcdate,rvccont)
values(rvcomment_seq.nextval,'R2','son456','2022-07-30','저도 공감합니다');

select * from kbe_rvcomment;
///////////////////////////////////////////////////////////////////////////////




10. 장바구니

--테이블 생성
create table kbe_cart(
     pcode      char(13)        NOT NULL        --상품코드
    ,id         varchar2(80)    NOT NULL        --회원아이디
    ,price      varchar2(50)                    --상품가격
    ,num        number          PRIMARY KEY     --일련번호
);

--시퀀스 생성
create sequence kbe_cart_seq;

--테이블 행 추가
insert into kbe_cart(pcode, id, num) values('9788957551943','kim123', kbe_cart_seq.nextval);
insert into kbe_cart(pcode, id, num) values('9788967820817','kim123', kbe_cart_seq.nextval);
insert into kbe_cart(pcode, id, num) values('9788962372489','kim123', kbe_cart_seq.nextval);
insert into kbe_cart(pcode, id, num) values('9791188754786','moon123', kbe_cart_seq.nextval);

--상품 테이블에서 가격 가져와서 넣기
update kbe_cart KC
set KC.price = (select KP.price
                from kbe_product KP
                where KP.pcode = KC.pcode
                );

select * from kbe_cart;
///////////////////////////////////////////////////////////////////////////////




11. 주문서

--테이블 삭제
drop table kbe_order;

--테이블 생성
create table kbe_order(
     listno      varchar2(50)                   --주문서번호
    ,pcode       char(13)        NOT NULL   
    ,price       varchar2(50)    
    ,num         number          PRIMARY KEY    --일련번호
);

--시퀀스 삭제
drop sequence kbe_order_seq;

--시퀀스 생성
create sequence kbe_order_seq;

--테이블 행 추가
insert into kbe_order(listno, pcode, num) values('114530-001', '9788957551943', kbe_order_seq.nextval);
insert into kbe_order(listno, pcode, num) values('114530-002', '9788967820817', kbe_order_seq.nextval);
insert into kbe_order(listno, pcode, num) values('114530-002', '9788962372489', kbe_order_seq.nextval);
insert into kbe_order(listno, pcode, num) values('114530-003', '9791188754786', kbe_order_seq.nextval);

--상품 테이블에서 가격 가져와서 넣기
update kbe_order KO
set KO.price = (select KP.price
                from kbe_product KP
                where KP.pcode = KO.pcode
                );

select * from kbe_order;
///////////////////////////////////////////////////////////////////////////////




12. 결제상세내역

--테이블 삭제
drop table kbe_disorder;

--테이블 생성
create table kbe_disorder(
     listno      varchar2(50)     PRIMARY KEY       
    ,id          varchar2(80)     NOT NULL       
    ,price       varchar2(50)            
    ,cprice      number                         --쿠폰할인금액
    ,pprice      number                         --포인트사용금액
    ,eprice      number                         --e캐시사용금액
    ,total       number                         --최종결제금액
);

--테이블 행 추가
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

select * from kbe_disorder;
///////////////////////////////////////////////////////////////////////////////




13. 포인트상세내역

--테이블 생성
create table kbe_point(
     listno     varchar2(50)
    ,id         varchar2(80)
    ,point      number      
    ,num        number 
);

--시퀀스 생성
create sequence kbe_point_seq;

--테이블 행 추가
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

select * from kbe_point;
///////////////////////////////////////////////////////////////////////////////






-- 상품 테이블에 카테고리 테이블 데이터 불러오기

----- <범죄수사규칙> 카테고리 업데이트 쿼리
update kbe_product kbpr 
set kbpr.cagroup = (
    select listagg(caname, '>')
    within group(order by cacode)
    from kbe_category
    where cacode in ('D01', 'J01')
)
where pcode='9788957551943';

----- <예쁜 것은 다 너를 닮았다> 카테고리 업데이트 쿼리
update kbe_product kbpr 
set kbpr.cagroup = (
    select listagg(caname, '>')
    within group(order by cacode)
    from kbe_category
    where cacode in ('D02', 'J02', 'S01')
)
where pcode='9788967820817';

-----<세미한 하나님의 음성을 듣는 방법> 카테고리 업데이트 쿼리
update kbe_product kbpr 
set kbpr.cagroup = (
    select listagg(caname, '>')
    within group(order by cacode)
    from kbe_category
    where cacode in ('D03', 'J03', 'S02')
)
where pcode='9788962372489';

select * from kbe_product;


-- 상품테이블에 작가 테이블 데이터 불러오기
-- 상품테이블 데이터 길이 modify 필요
alter table kbe_product modify aucode varchar2(30);
----- <범죄수사규칙> 작가 업데이트 쿼리
update kbe_product kbpr 
set kbpr.aucode = (
    select aukorname
    from kbe_author
    where aucode in ('AU00017')
)
where pcode='9788957551943';
----- <예쁜 것은 다 너를 닮았다> 작가 업데이트 쿼리
update kbe_product kbpr 
set kbpr.aucode = (
    select aukorname
    from kbe_author
    where aucode in ('AU00003')
)
where pcode='9788967820817';
-----<세미한 하나님의 음성을 듣는 방법> 작가 업데이트 쿼리
update kbe_product kbpr 
set kbpr.aucode = (
    select aukorname
    from kbe_author
    where aucode in ('AU00016')
)
where pcode='9788962372489';


--회원 소유 ecash 테이블 업데이트
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


--찜하기 pcode 상품 이름 업데이트

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



















