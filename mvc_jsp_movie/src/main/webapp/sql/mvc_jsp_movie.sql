-- 6. 계정생성(System 계정에서) 1. ~ 2.
-- 오라클 설치(SYSTEM/ORACLE) 
-- SYSTEM계정에서 계정 생성
-- hr : sql developer-system_01계정에서 계정생성안해도 되고, 3.락해제 5.비밀번호변경만 한다.

-- 1. 계정생성 : mvc_jsp_movie 계정생성
-- create user <계정이름> identified by <계정암호> default tablespace users;
create user  mvc_jsp_movie identified by tiger default tablespace users;

-- 2. 사용자 권한 부여
-- grant [시스템 권한] to [계정];
grant connect, resource, create view to mvc_jsp_movie;


-- 3. 락 해제
-- alter user <계정이름> account unlock;
alter user mvc_jsp_movie account unlock;

-- 4. 계정 잘못만든 경우 계정, 객체 삭제하기 
-- drop user <계정이름> cascade;
--drop user jsp_pj_ict04 cascade; 
--
---- 5. 패스워드 변경
----alter user <계정이름> identified by <패스워드>;
--alter user jsp_pj_ict04 identified by tiger; 

----------------------------------------------------------------------------------
-- 7. 테이블 생성
-- mvc_jsp_movie 계정에서 작업
-- 회원정보 테이블
DROP TABLE movie_customer_tb  CASCADE CONSTRAINTS;
CREATE TABLE movie_customer_tb(
    user_id         VARCHAR2(20)    PRIMARY KEY,       -- ID
	user_pwd   		VARCHAR2(20)    NOT NULL,          -- 비밀번호
	user_name   	VARCHAR2(30)    NOT NULL,          -- 이름
	user_birth   	DATE            NOT NULL,          -- 생년월일   
    user_phone      VARCHAR2(13)    NOT NULL,          -- 핸드폰  
	user_address    VARCHAR2(70)    NOT NULL,           -- 주소
	user_email      VARCHAR2(30),                      -- 이메일
    user_tel        VARCHAR2(13),                      -- 지역 전화번호
    user_no         VARCHAR2(20),                      -- 유저 고유 번호 
	user_regDate    TIMESTAMP       DEFAULT sysdate,   -- 가입일
    login_session   VARCHAR2(1)     DEFAULT 'C'        -- 로그인 권한 (어드민과 구분)
);

ALTER TABLE movie_customer_tb
MODIFY user_address VARCHAR2(100);

SELECT * FROM movie_customer_tb;
DESC movie_customer_tb;

COMMIT;

--==================================== 아이디, 비번 순차 생성 (다건) ====================================
-- BEGIN ... END : SQL문의 그룹을 실행 할 수 있도록 일련의 그룹화를 한 것
-- BEGIN으로 시작하고 END로 끝내는 흐름 제어 언어 (중첩으로 사용 가능)
/*
-- 1번 방식 
BEGIN
DBMS_SCHEDULER.DROP_JOB (
job_name => 'MYJOB');
COMMIT;
END;

-- 2번 방식 
BEGIN
DBMS_SCHEDULER.DROP_JOB (
job_name => 'MYJOB');    
END;
/
*/

-- 중첩 while 불가 i 변수를 pk로 설정해서 i 증가하면 j의 시작순 +1로 함께 증가 
DECLARE -- SQL 프로시저의 변수는 DECLARE문을 사용하여 정의
    i  NUMBER := 1; -- 변수 i에 1을 대입
    j  NUMBER := 1111;   -- 비밀번호 
BEGIN
    WHILE i <= 10 LOOP    
        INSERT INTO movie_customer_tb(user_id, user_pwd, user_name, user_birth, user_address, user_phone, user_email, user_tel, user_no, user_regdate, login_session)
        VALUES('user_id'||i, 'pwd_' || j, '사용자' || i, sysdate, '서울시 마포구, 101동 102호','010-1234-1234', 'user_'||i||'@gmail.com', '031-1234-1234','userNo_'||i, sysdate, default);
        i := i + 1;
        j := j + 1;   
    END LOOP;
END;
/
COMMIT;

ROLLBACK;
COMMIT;
DELETE FROM movie_customer_tb;
SELECT * FROM movie_customer_tb;

--==================================== 회원가입 DAO SQL 구문 삽입 예시 ====================================
INSERT INTO movie_customer_tb(user_id, user_pwd, user_name, user_birth, user_address, user_phone, user_email, user_tel, user_no, user_regdate, login_session)
        VALUES('hong', 'hong1234', '홍길동', sysdate, '서울시 마포구, 101동 102호','010-1234-1234', 'hong@gmail.com', '031-1234-1234','userNo_'||(SELECT NVL(MAX(TO_NUMBER(substr(user_no, 8)))+1, 1) FROM movie_customer_tb),  SYSDATE, DEFAULT);

-- ==================================== 관리자 로그인 ====================================
 -- 고객 로그인 'C' => 관리자 로그인 'A'인것만 조회 

INSERT INTO movie_customer_tb(user_id, user_pwd, user_name, user_birth, user_address, user_phone,user_email, user_tel, user_regdate, user_no, login_session)
    VALUES ('admin', 'admin1234', '관리자', '2024/12/01', '서울시 마포구, 302동 901호', '010-9876-5432', 'admin@gmail.com','02-9876-5432', 'user_no'||i, sysdate, 'A');

SELECT *
FROM (
    SELECT user_id, user_pwd,
        CASE WHEN login_session = 'C' THEN '일반 회원'
             WHEN login_session = 'A' THEN '관리자'
        END AS user_type
    FROM movie_customer_tb
) 
WHERE user_id = 'admin' AND user_pwd = 'admin1234';
DESC movie_customer_tb;

