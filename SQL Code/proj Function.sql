--랜덤 전화번호 생성 함수
create or replace function random_phone
    return varchar2
is
    phone varchar2(20);
begin
    select '010-'||lpad(to_char(trunc(dbms_random.value(0000, 9999))), 4, '0')||'-'||lpad(to_char(trunc(dbms_random.value(0000, 9999))), 4, '0') into phone
        from dual;
    return phone;
end;
/

--랜덤 날짜 생성 함수
CREATE OR REPLACE FUNCTION RANDOM_DATE
    RETURN VARCHAR2
IS
    RANDDATE VARCHAR2(20);
BEGIN
    SELECT replace(to_char(TO_DATE(trunc(dbms_random.value(to_char(DATE '2015-01-01', 'J'),
                                                       to_char(DATE '2020-12-31', 'J'))), 'J')), '-', '/') INTO RANDDATE
    FROM dual;
    RETURN RANDDATE;
END;
/

--랜덤 생일 생성 함수
CREATE OR REPLACE FUNCTION RANDOM_BIRTH
    RETURN VARCHAR2
IS
    RANDDATE VARCHAR2(20);
BEGIN
    SELECT replace(to_char(TO_DATE(trunc(dbms_random.value(to_char(DATE '1990-01-01', 'J'),
                                                       to_char(DATE '2005-12-31', 'J'))), 'J')), '/', '-') INTO RANDDATE
    FROM dual;
    RETURN RANDDATE;
END;
/


--랜덤 이름 생성 함수
CREATE OR REPLACE FUNCTION RANDOM_NAME
    RETURN VARCHAR2
IS
    randname VARCHAR2(10);
begin
    select case when nvl(floor(dbms_random.value(1, 31)), 30) >= 30 then '김'
                when nvl(floor(dbms_random.value(1, 31)), 29) >= 29 then '이'
                when nvl(floor(dbms_random.value(1, 31)), 28) >= 28 then '박'
                when nvl(floor(dbms_random.value(1, 31)), 27) >= 27 then '최'
                when nvl(floor(dbms_random.value(1, 31)), 26) >= 26 then '정'
                when nvl(floor(dbms_random.value(1, 31)), 25) >= 25 then '강'
                when nvl(floor(dbms_random.value(1, 31)), 24) >= 24 then '조'
                when nvl(floor(dbms_random.value(1, 31)), 23) >= 23 then '윤'
                when nvl(floor(dbms_random.value(1, 31)), 22) >= 22 then '장'
                when nvl(floor(dbms_random.value(1, 31)), 21) >= 21 then '임'
                when nvl(floor(dbms_random.value(1, 31)), 20) >= 20 then '오'
                when nvl(floor(dbms_random.value(1, 31)), 19) >= 19 then '한'
                when nvl(floor(dbms_random.value(1, 31)), 18) >= 18 then '신'
                when nvl(floor(dbms_random.value(1, 31)), 17) >= 17 then '서'
                when nvl(floor(dbms_random.value(1, 31)), 16) >= 16 then '권'
                when nvl(floor(dbms_random.value(1, 31)), 15) >= 15 then '황'
                when nvl(floor(dbms_random.value(1, 31)), 14) >= 14 then '안'
                when nvl(floor(dbms_random.value(1, 31)), 13) >= 13 then '송'
                when nvl(floor(dbms_random.value(1, 31)), 12) >= 12 then '유'
                when nvl(floor(dbms_random.value(1, 31)), 11) >= 11 then '홍'
                when nvl(floor(dbms_random.value(1, 31)), 10) >= 10 then '전'
                when nvl(floor(dbms_random.value(1, 31)), 9) >= 9 then '고'
                when nvl(floor(dbms_random.value(1, 31)), 8) >= 8 then '문'
                when nvl(floor(dbms_random.value(1, 31)), 7) >= 7 then '손'
                when nvl(floor(dbms_random.value(1, 31)), 6) >= 6 then '양'
                when nvl(floor(dbms_random.value(1, 31)), 5) >= 5 then '배'
                when nvl(floor(dbms_random.value(1, 31)), 4) >= 4 then '조'
                when nvl(floor(dbms_random.value(1, 31)), 3) >= 3 then '백'
                when nvl(floor(dbms_random.value(1, 31)), 2) >= 2 then '허'
                when nvl(floor(dbms_random.value(1, 31)), 1) >= 1 then '남'
                end||
           case when nvl(floor(dbms_random.value(1, 31)), 30) >= 30 then '민'
                when nvl(floor(dbms_random.value(1, 31)), 29) >= 29 then '현'
                when nvl(floor(dbms_random.value(1, 31)), 28) >= 28 then '동'
                when nvl(floor(dbms_random.value(1, 31)), 27) >= 27 then '인'
                when nvl(floor(dbms_random.value(1, 31)), 26) >= 26 then '현'
                when nvl(floor(dbms_random.value(1, 31)), 25) >= 25 then '지'
                when nvl(floor(dbms_random.value(1, 31)), 24) >= 24 then '재'
                when nvl(floor(dbms_random.value(1, 31)), 23) >= 23 then '우'
                when nvl(floor(dbms_random.value(1, 31)), 22) >= 22 then '건'
                when nvl(floor(dbms_random.value(1, 31)), 21) >= 21 then '준'
                when nvl(floor(dbms_random.value(1, 31)), 20) >= 20 then '정'
                when nvl(floor(dbms_random.value(1, 31)), 19) >= 19 then '수'
                when nvl(floor(dbms_random.value(1, 31)), 18) >= 18 then '광'
                when nvl(floor(dbms_random.value(1, 31)), 17) >= 17 then '영'
                when nvl(floor(dbms_random.value(1, 31)), 16) >= 16 then '예'
                when nvl(floor(dbms_random.value(1, 31)), 15) >= 15 then '승'
                when nvl(floor(dbms_random.value(1, 31)), 14) >= 14 then '성'
                when nvl(floor(dbms_random.value(1, 31)), 13) >= 13 then '연'
                when nvl(floor(dbms_random.value(1, 31)), 12) >= 12 then '아'
                when nvl(floor(dbms_random.value(1, 31)), 11) >= 11 then '윤'
                when nvl(floor(dbms_random.value(1, 31)), 10) >= 10 then '은'
                when nvl(floor(dbms_random.value(1, 31)), 9) >= 9 then '상'
                when nvl(floor(dbms_random.value(1, 31)), 8) >= 8 then '우'
                when nvl(floor(dbms_random.value(1, 31)), 7) >= 7 then '강'
                when nvl(floor(dbms_random.value(1, 31)), 6) >= 6 then '시'
                when nvl(floor(dbms_random.value(1, 31)), 5) >= 5 then '훈'
                when nvl(floor(dbms_random.value(1, 31)), 4) >= 4 then '은'
                when nvl(floor(dbms_random.value(1, 31)), 3) >= 3 then '명'
                when nvl(floor(dbms_random.value(1, 31)), 2) >= 2 then '형'
                when nvl(floor(dbms_random.value(1, 31)), 1) >= 1 then '홍'
                end||
           case when nvl(floor(dbms_random.value(1, 31)), 30) >= 30 then '석'
                when nvl(floor(dbms_random.value(1, 31)), 29) >= 29 then '민'
                when nvl(floor(dbms_random.value(1, 31)), 28) >= 28 then '하'
                when nvl(floor(dbms_random.value(1, 31)), 27) >= 27 then '수'
                when nvl(floor(dbms_random.value(1, 31)), 26) >= 26 then '원'
                when nvl(floor(dbms_random.value(1, 31)), 25) >= 25 then '유'
                when nvl(floor(dbms_random.value(1, 31)), 24) >= 24 then '건'
                when nvl(floor(dbms_random.value(1, 31)), 23) >= 23 then '현'
                when nvl(floor(dbms_random.value(1, 31)), 22) >= 22 then '자'
                when nvl(floor(dbms_random.value(1, 31)), 21) >= 21 then '도'
                when nvl(floor(dbms_random.value(1, 31)), 20) >= 20 then '상'
                when nvl(floor(dbms_random.value(1, 31)), 19) >= 19 then '성'
                when nvl(floor(dbms_random.value(1, 31)), 18) >= 18 then '남'
                when nvl(floor(dbms_random.value(1, 31)), 17) >= 17 then '호'
                when nvl(floor(dbms_random.value(1, 31)), 16) >= 16 then '혜'
                when nvl(floor(dbms_random.value(1, 31)), 15) >= 15 then '영'
                when nvl(floor(dbms_random.value(1, 31)), 14) >= 14 then '준'
                when nvl(floor(dbms_random.value(1, 31)), 13) >= 13 then '희'
                when nvl(floor(dbms_random.value(1, 31)), 12) >= 12 then '서'
                when nvl(floor(dbms_random.value(1, 31)), 11) >= 11 then '빈'
                when nvl(floor(dbms_random.value(1, 31)), 10) >= 10 then '지'
                when nvl(floor(dbms_random.value(1, 31)), 9) >= 9 then '안'
                when nvl(floor(dbms_random.value(1, 31)), 8) >= 8 then '영'
                when nvl(floor(dbms_random.value(1, 31)), 7) >= 7 then '연'
                when nvl(floor(dbms_random.value(1, 31)), 6) >= 6 then '훈'
                when nvl(floor(dbms_random.value(1, 31)), 5) >= 5 then '선'
                when nvl(floor(dbms_random.value(1, 31)), 4) >= 4 then '진'
                when nvl(floor(dbms_random.value(1, 31)), 3) >= 3 then '아'
                when nvl(floor(dbms_random.value(1, 31)), 2) >= 2 then '윤'
                when nvl(floor(dbms_random.value(1, 31)), 1) >= 1 then '린'
                end
        into randname
        from dual;
    return randname;
end;
/


--랜덤 성별 선택 함수
create or replace function random_gender
    return varchar2
is
    randgen varchar2(1);
begin
    select case when floor(dbms_random.value(1, 3)) >= 2 then 'F'
                when floor(dbms_random.value(1, 3)) >= 1 then 'M'
                end
            into randgen
            from dual;
       return randgen;
end;
/


--랜덤 휴일 선택 함수
create or replace function random_holiday
    return varchar2
is
    randholi varchar2(10);
begin
    select case when floor(dbms_random.value(1, 8)) >= 7 then '월요일'
                when floor(dbms_random.value(1, 8)) >= 6 then '화요일'
                when floor(dbms_random.value(1, 8)) >= 5 then '수요일'
                when floor(dbms_random.value(1, 8)) >= 4 then '목요일'
                when floor(dbms_random.value(1, 8)) >= 3 then '금요일'
                when floor(dbms_random.value(1, 8)) >= 2 then '토요일'
                when floor(dbms_random.value(1, 8)) >= 1 then '일요일'
                end
    into randholi from dual;
    return randholi;
end;
/

--랜덤 리뷰점수 함수
create or replace function random_review
    return number
is
    randscore number(1, 0);
begin
    select case when floor(dbms_random.value(1, 11)) >= 3 then case when floor(dbms_random.value(1, 6)) >= 3 then 5 when floor(dbms_random.value(1, 6)) >= 1 then 4 end
                when floor(dbms_random.value(1, 11)) >= 2 then case when floor(dbms_random.value(1, 6)) >= 3 then 5 when floor(dbms_random.value(1, 6)) >= 1 then 3 end
                when floor(dbms_random.value(1, 11)) >= 1 then case when floor(dbms_random.value(1, 6)) >= 5 then 3 when floor(dbms_random.value(1, 6)) >= 1 then 1 end
                end
    into randscore from dual;
    return randscore;
end;
/

--일부러 낮은 리뷰점수가 나오게 하는 함수
create or replace function random_review_low
    return number
is
    randscore number(1, 0);
begin
    select case when floor(dbms_random.value(1, 11)) >= 8 then case when floor(dbms_random.value(1, 6)) >= 6 then 5 when floor(dbms_random.value(1, 6)) >= 1 then 4 end
                when floor(dbms_random.value(1, 11)) >= 6 then case when floor(dbms_random.value(1, 6)) >= 3 then 5 when floor(dbms_random.value(1, 6)) >= 1 then 3 end
                when floor(dbms_random.value(1, 11)) >= 1 then case when floor(dbms_random.value(1, 6)) >= 6 then 2 when floor(dbms_random.value(1, 6)) >= 1 then 1 end
                end
    into randscore from dual;
    return randscore;
end;
/