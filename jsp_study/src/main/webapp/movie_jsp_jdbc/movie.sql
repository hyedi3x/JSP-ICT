-------------------------------------------------------------------------------
-- [회원 정보] 
DROP TABLE movie_member;   -- 테이블 존재할 수 있으니 drop으로 시작 
CREATE TABLE movie_member ( 
    user_id          VARCHAR2(30)    PRIMARY KEY,  -- 아이디
    user_pwd         VARCHAR2(30)    NOT NULL,     -- 비번 
    user_name        VARCHAR2(30)    NOT NULL,     -- 이름
    user_birth       VARCHAR2(20)    NOT NULL,     -- 생년월일
    user_phone       VARCHAR2(20)    NOT NULL,     -- 핸드폰 번호
    user_email       VARCHAR2(50)    UNIQUE,       -- 이메일
    user_address     VARCHAR2(100)   NOT NULL     -- 주소
);
-- Table MOVIE_MEMBER이(가) 생성되었습니다.

-- 삽입
INSERT INTO movie_member (user_id, user_pwd, user_name, user_birth, user_phone, user_email, user_address)
        VALUES('leesunsin', 'lee1234', '이순신', '1545년 4월 28일', '010-1234-5678'
             , 'leesunsin@gmail.com', '조선국 한성부');
INSERT INTO movie_member (user_id, user_pwd, user_name, user_birth, user_phone, user_email, user_address)
        VALUES('yoo12', 'yoo1234', '유재석', '1972년 8월 14일', '010-5678-1234'
             , 'YuJaeseok@gmail.com', '서울특별시 강남구 논현동');
INSERT INTO movie_member (user_id, user_pwd, user_name, user_birth, user_phone, user_email, user_address)
        VALUES('leeJion', 'jion1234', '이지은', '1993년 5월 16일', '010-1212-5656'
             , 'leeJion93@gmail.com', '서울특별시 강남구 청담동');
INSERT INTO movie_member (user_id, user_pwd, user_name, user_birth, user_phone, user_email, user_address)
        VALUES('young02', 'young0910', '이영지', '2002년 9월 10일', '010-2424-2424'
             , 'youngji@gmail.com', '서울특별시 영등포구 양평동');
INSERT INTO movie_member (user_id, user_pwd, user_name, user_birth, user_phone, user_email, user_address)
        VALUES('Seokjin6602', 'ji6602', '지석진', '1966년 2월 10일', '010-3434-3434'
             , 'jin6602@gmail.com', '서울특별시 서초구 잠원동');

-- 조회
SELECT * FROM movie_member;

-- 데이터 삭제 
DELETE movie_member;

-- 영구저장
COMMIT;

-- 데이터 구조
DESC movie_member;

-------------------------------------------------------------------------------
-- [상영관 테이블]
DROP TABLE cinema;
CREATE TABLE cinema ( 
       cinema_id      varchar2(10)    PRIMARY KEY, 
       cinema_city    varchar2(30)    NOT NULL,
       cinema_area    varchar2(30)    NOT NULL,
       cinema_loc     varchar2(100)   UNIQUE,
       cinema_tel     varchar2(10)    DEFAULT '1544-1122',
       cinema_room    varchar2(20)    NOT NULL,
       cinema_seat    varchar2(30)    NOT NULL       
);

INSERT INTO cinema (cinema_id, cinema_city,  cinema_area, cinema_loc, cinema_tel, cinema_room, cinema_seat)
       VALUES ('c_01', '서울', 'CGV강남', '서울특별시 강남구 역삼동 814-6 스타플렉스', default, '6관','874석');

INSERT INTO cinema (cinema_id, cinema_city,  cinema_area, cinema_loc, cinema_tel, cinema_room, cinema_seat)
       VALUES ('c_02', '서울', 'CGV강변', '서울특별시 광진구 구의동 546-4 테크노마트 10층', default, '11관','1466석');

INSERT INTO cinema (cinema_id, cinema_city,  cinema_area, cinema_loc, cinema_tel, cinema_room, cinema_seat)
       VALUES ('c_03', '서울', 'CGV건대입구', '서울시 광진구 자양동 9-4 몰오브케이 3층', default, '5관','754석');
       
COMMIT;

SELECT * FROM cinema;
