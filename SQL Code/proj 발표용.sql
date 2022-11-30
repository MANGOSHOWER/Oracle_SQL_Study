set serveroutput on

--1. 랜덤 전화번호 생성 함수
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

--2. 랜덤 생일 생성 함수
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


--3. 랜덤 이름 생성 함수
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
                when nvl(floor(dbms_random.value(1, 31)), 25) >= 25 then '찬'
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

--1~3번 결과
select random_name() 랜덤이름, random_phone() 랜덤전화번호, random_birth() 랜덤생일 from dual;


----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------


--4. 신규 회원번호 생성 함수
create or replace function new_mno
    return varchar2
is 
    f_mno number;
begin
    select ltrim(mem_no, 'M')+1 into f_mno
    from(
        select mem_no from membership order by mem_no desc
    ) where rownum = 1;
    return 'M'||lpad(f_mno, 4, 0);
end;
/

--5. 신규회원 등록하는 프로시저
create or replace procedure new_member(
    p_name membership.mem_name%type,
    p_gender membership.mem_gender%type,
    p_bday membership.mem_bday%type,
    p_tel membership.mem_tel%type,
    p_des varchar2)
is
    r_des membership.mem_des_no%type;
begin
    select des_no into r_des from(
    select des_no from designer where des_name = p_des
    union all
    select case when floor(dbms_random.value(1, 6)) >= 5 then 'D0001'
                when floor(dbms_random.value(1, 6)) >= 4 then 'D0002'
                when floor(dbms_random.value(1, 6)) >= 3 then 'D0003'
                when floor(dbms_random.value(1, 6)) >= 2 then 'D0004'
                when floor(dbms_random.value(1, 6)) >= 1 then 'D0005'
                end
            from dual
            where not exists (select des_no from designer where des_name = p_des));
    insert into membership values (new_mno(), p_name, p_gender, p_bday, p_tel, r_des);
    exception
        when others then
        begin
            dbms_output.put_line('입력하신 정보가 잘못되었습니다.');
            dbms_output.put_line('회원 등록에 실패했습니다.');
        end;
end;
/

--6. 회원 삭제하는 프로시저
create or replace procedure delete_mem(
    p_mno membership.mem_no%type)
is
begin
    delete from membership where mem_no in (select mem_no from membership where mem_no = p_mno);
    exception
    when others then
        dbms_output.put_line('입력하신 정보가 잘못되었습니다.');
end;
/


--6. 프로시저로 새 회원 등록, 삭제하기
exec new_member('홍길동', 'M', '10-11-12', '010-1234-1235', '정연아');
exec delete_mem('M0301');


----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------


--7. 예약번호 생성 함수
create or replace function new_rno
    return varchar2
is 
    f_rno number;
begin
    select substr(res_no, 3)+1 into f_rno
    from(
        select res_no from reservation order by res_no desc
    ) where rownum = 1;
    return case when extract(month from sysdate) = 1 then 'R1'||lpad(f_rno, 3, 0)
                when extract(month from sysdate) = 2 then 'R2'||lpad(f_rno, 3, 0)
                when extract(month from sysdate) = 3 then 'R3'||lpad(f_rno, 3, 0)
                when extract(month from sysdate) = 4 then 'R4'||lpad(f_rno, 3, 0)
                when extract(month from sysdate) = 5 then 'R5'||lpad(f_rno, 3, 0)
                when extract(month from sysdate) = 6 then 'R6'||lpad(f_rno, 3, 0)
                when extract(month from sysdate) = 7 then 'R7'||lpad(f_rno, 3, 0)
                when extract(month from sysdate) = 8 then 'R8'||lpad(f_rno, 3, 0)
                when extract(month from sysdate) = 9 then 'R9'||lpad(f_rno, 3, 0)
                when extract(month from sysdate) = 10 then 'RA'||lpad(f_rno, 3, 0)
                when extract(month from sysdate) = 11 then 'RB'||lpad(f_rno, 3, 0)
                when extract(month from sysdate) = 12 then 'RC'||lpad(f_rno, 3, 0) end;
end;
/

select substr(res_no, 3)+1
    from(
        select res_no from reservation order by res_no desc
    ) where rownum = 1;


--8. 신규 예약 프로시저
create or replace procedure new_res(
    p_mem reservation.res_mem_no%type,
    p_mn reservation.res_mn_no%type,
    p_time reservation.res_time%type)
is
    r_des varchar2(5);
begin
    select mem_des_no into r_des from membership where mem_no = p_mem;
    insert into reservation values (new_rno(), p_mem, r_des, p_mn, p_time, 'N');
    exception
        when others then
        begin
            dbms_output.put_line('입력하신 정보가 잘못되었습니다.');
            dbms_output.put_line('예약에 실패했습니다.');
        end;
end;
/

--9. 예약 날짜 변경 프로시저
create or replace procedure change_res_date(
    p_rno reservation.res_no%type,
    p_date reservation.res_time%type)
is
begin
    update reservation set res_time = p_date where res_no in (select res_no from reservation where res_no = p_rno);
    exception
    when others then
        dbms_output.put_line('입력하신 정보가 잘못되었습니다.');
end;
/

--10. 예약 취소 프로시저
create or replace procedure cancel_res(
    p_rno reservation.res_no%type)
is
begin
    delete from reservation where res_no in (select res_no from reservation where res_no = p_rno);
    exception
    when others then
        dbms_output.put_line('입력하신 정보가 잘못되었습니다.');
end;
/

--11. 프로시저로 예약, 변경, 취소하기
exec new_res('M0001', 'H0001', '22/11/30');
exec change_res_date('RB401', '22/12/01');
exec cancel_res('RB401');


----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------


--11. 디자이너들의 정보와 평균 리뷰점수를 보여주는 뷰
create or replace view ranking as
select designer.des_name 이름, designer.des_position 직급, designer.des_salary 월급, trunc(avg(review.rev_score), 2) 평균점수
    from designer
    inner join reservation
        on reservation.res_des_no = designer.des_no
    inner join review
        on review.rev_no = reservation.res_no
    group by designer.des_name, designer.des_position, designer.des_salary
    order by 평균점수 desc;

select * from ranking; --뷰 내용
select * from ranking where rownum = 1; --최상위 1명 조회
select * from (select * from ranking order by rownum desc) where rownum = 1; --최하위 1명 조회

--12. 최상위 1명과 최하위 1명의 이름과 직급을 출력하는 프로시저
create or replace procedure good_bad
is
    good designer.des_name%type;
    good_pos designer.des_position%type;
    bad designer.des_name%type;
    bad_pos designer.des_position%type;
begin
    select 이름, 직급 into good, good_pos from ranking where rownum = 1;
    select 이름, 직급 into bad, bad_pos from (select * from ranking order by rownum desc) where rownum = 1;
    dbms_output.put_line('가장 우수한 직원은 '||good||' '||good_pos||'입니다.');
    dbms_output.put_line('실적 개선이 필요한 직원은 '||bad||' '||bad_pos||'입니다.');
end;
/

--프로시저로 조회하기
exec good_bad;


----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------


--13. 내일이 예약일인 사람을 조회하는 뷰
create or replace view reserv as
select reservation.res_no 예약번호, reservation.res_time 예약일자, membership.mem_name 고객이름, menu.mn_name 시술명, designer.des_name 담당디자이너, menu.mn_price 가격
    from reservation
        inner join membership
            on reservation.res_mem_no = membership.mem_no
        inner join menu
            on reservation.res_mn_no = menu.mn_no
        inner join designer
            on reservation.res_des_no = designer.des_no
        where reservation.res_time = to_date(sysdate + 1, 'YY/MM/DD');
        
select sysdate+interval '1' day from dual;
select * from reserv;

--14. 내일이 예약일인 사람에게 문자를 발송하는 프로시저
create or replace procedure res_message
is
    p_resno reservation.res_no%type;
    p_restime reservation.res_time%type;
    p_memname membership.mem_name%type;
    p_mnname menu.mn_name%type;
    p_desname designer.des_name%type;
    p_price menu.mn_price%type;
    p_despos designer.des_position%type;
    cursor cur is select reservation.res_no, reservation.res_time, membership.mem_name, menu.mn_name, designer.des_name, menu.mn_price, designer.des_position
                    from reservation
                    inner join membership
                        on reservation.res_mem_no = membership.mem_no
                    inner join menu
                        on reservation.res_mn_no = menu.mn_no
                    inner join designer
                        on reservation.res_des_no = designer.des_no
                    where reservation.res_time = to_date(sysdate + 1, 'YY/MM/DD');
BEGIN
    open cur;
    loop
        fetch cur into p_resno, p_restime, p_memname, p_mnname, p_desname, p_price, p_despos;
        exit when cur%notfound;
        dbms_output.put_line(p_memname||' 고객님! KB미용실에 예약하신 날짜가 임박했습니다.');
        dbms_output.put_line('예약일자 : '||p_restime);
        dbms_output.put_line('예약번호 : '||p_resno);
        dbms_output.put_line('예약하신 시술 : '||p_mnname);
        dbms_output.put_line('담당 디자이너 : '||p_desname||' '||p_despos);
        dbms_output.put_line('가격 : '||p_price||'원');
        dbms_output.put_line(' ');
    end loop;
    close cur;
end;
/

--프로시저로 문자 보내기
exec res_message;


----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------


--15. 회원정보 검색 프로시저
create or replace procedure find_member(
    p_mno membership.mem_no%type
    )
is
    r_name membership.mem_name%type;
    r_no membership.mem_no%type;
    r_gender membership.mem_gender%type;
    r_bday membership.mem_bday%type;
    r_tel membership.mem_tel%type;
    r_des membership.mem_des_no%type;
begin
    select mem_name 성함, mem_no 회원번호, mem_gender 성별, mem_bday 생일, mem_tel 전화번호, mem_des_no "선호 디자이너" into r_name, r_no, r_gender, r_bday, r_tel, r_des
        from membership
        where mem_no = p_mno;
    dbms_output.put_line('검색 결과');
    dbms_output.put_line('고객 번호: '||r_no);
    dbms_output.put_line('성함: '||r_name);
    dbms_output.put_line('성별: '||r_gender);
    dbms_output.put_line('생일: '||r_bday);
    dbms_output.put_line('전화번호: '||r_tel);
    dbms_output.put_line('선호 디자이너: '||r_des);
    exception
        when others then
        begin
            dbms_output.put_line('입력하신 정보가 잘못되었습니다.');
        end;
end;
/

--프로시저로 검색하기
exec find_member('M0001');

--16. 입력한 디자이너가 선호 디자이너인 회원의 마지막 방문 정보를 출력하는 프로시저
create or replace procedure des_mem(
    p_name designer.des_name%type
    )
is
    counter number := 0;
    r_dno designer.des_name%type;
    r_mno membership.mem_no%type;
    r_mname membership.mem_name%type;
    r_date reservation.res_time%type;
    r_menu menu.mn_name%type;
    r_score review.rev_score%type;
    cursor cur is
    select 회원번호, 회원이름, 날짜, 시술, 리뷰점수
        from (
            select distinct m.mem_no 회원번호, m.mem_name 회원이름, r.res_time 날짜, n.mn_name 시술, v.rev_score 리뷰점수, rank() over(partition by m.mem_no order by r.res_time desc) 순번
                from reservation r
                inner join membership m
                    on r.res_mem_no = m.mem_no    
                inner join menu n
                    on r.res_mn_no = n.mn_no
                inner join review v
                    on r.res_no = v.rev_no
                where m.mem_des_no = r_dno
                order by m.mem_no)
                where 순번 = 1;
begin
    select des_no into r_dno from designer where des_name = p_name;
    dbms_output.put_line(p_name||' 디자이너를 선호 디자이너로 등록한 고객 정보');
    dbms_output.put_line('');
    open cur;
    loop
        fetch cur into r_mno, r_mname, r_date, r_menu, r_score;
        exit when cur%notfound;
        dbms_output.put_line('회원번호: '||r_mno);
        dbms_output.put_line('성함: '||r_mname);
        dbms_output.put_line('마지막 방문일: '||r_date);
        dbms_output.put_line('받은 시술: '||r_menu);
        dbms_output.put_line('리뷰 점수: '||r_score);
        dbms_output.put_line('');
        counter := counter+1;
    end loop;
    dbms_output.put_line('총 '||counter||'명의 회원이 검색되었습니다.');
end;
/

--프로시저로 검색하기
exec des_mem('강동현');


----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------


--17. 오늘과 내일의 예약 정보를 조회
create or replace view today_tomorrow as
select r.res_time 날짜, r.res_no 예약번호, m.mem_no 회원번호, m.mem_name 성함, m.mem_gender 성별, n.mn_name 시술, d.des_name "담당 디자이너", to_char(n.mn_price, 'L999,999') 가격
    from reservation r
    inner join membership m
        on r.res_mem_no = m.mem_no
    inner join menu n
        on r.res_mn_no = n.mn_no
    inner join designer d
        on r.res_des_no = d.des_no
    where to_char(r.res_time, 'YY/MM/DD') = to_char(sysdate, 'YY/MM/DD') or to_char(r.res_time, 'YY/MM/DD') = to_char(sysdate + interval '1' day, 'YY/MM/DD')
    order by r.res_time, r.res_no;
    
select * from today_tomorrow;
    
--18. 월별 매출액, 지출액, 월급, 월세, 순수익을 조회
--월별 매출액을 구하는 뷰
create or replace view revenue as
select * from (
select extract(month from reservation.res_time) 월, sum(menu.mn_price) 매출
    from reservation
    inner join menu
        on reservation.res_mn_no = menu.mn_no
    inner join designer
        on reservation.res_des_no = designer.des_no
    where extract(month from reservation.res_time) = 7
    group by extract(month from reservation.res_time)
union
select extract(month from reservation.res_time) 월, sum(menu.mn_price) 매출
    from reservation
    inner join menu
        on reservation.res_mn_no = menu.mn_no
    inner join designer
        on reservation.res_des_no = designer.des_no
    where extract(month from reservation.res_time) = 8
    group by extract(month from reservation.res_time)
union
select extract(month from reservation.res_time) 월, sum(menu.mn_price) 매출
    from reservation
    inner join menu
        on reservation.res_mn_no = menu.mn_no
    inner join designer
        on reservation.res_des_no = designer.des_no
    where extract(month from reservation.res_time) = 9
    group by extract(month from reservation.res_time)
union
select extract(month from reservation.res_time) 월, sum(menu.mn_price) 매출
    from reservation
    inner join menu
        on reservation.res_mn_no = menu.mn_no
    inner join designer
        on reservation.res_des_no = designer.des_no
    where extract(month from reservation.res_time) = 10
    group by extract(month from reservation.res_time)) 
    order by 월;
    
select * from revenue;
    
--월별 소모품 주문비를 구하는 뷰
create or replace view expense as
select extract(month from ord_date) 월, sum(ord_price) 지출
    from orderlist
    group by extract(month from ord_date)
    order by extract(month from ord_date);
    
select * from expense;

--월별 월급과 월세(임시)를 구하는 뷰
create or replace view fixed_expense as
select * from (
    select distinct 7 as 월, (select sum(des_salary) from designer) 월급, 7500000 as 월세 from designer union
    select distinct 8 as 월, (select sum(des_salary) from designer) 월급, 7500000 as 월세 from designer union
    select distinct 9 as 월, (select sum(des_salary) from designer) 월급, 7500000 as 월세 from designer union
    select distinct 10 as 월, (select sum(des_salary) from designer) 월급, 7500000 as 월세 from designer
);

select * from fixed_expense;

--세 뷰를 조인한 다음 순수익을 추가한 뷰 생성
create or replace view finance as
select m.월, to_char(m.매출, 'L999,999,999') 매출,
             to_char(e.지출, 'L999,999,999') 지출,
             to_char(f.월급, 'L999,999,999') 월급,
             to_char(f.월세, 'L999,999,999') 월세,
             to_char((m.매출)-(e.지출)-(f.월급)-(f.월세), 'L999,999,999') 순수익
    from revenue m
    inner join expense e
        on m.월 = e.월
    inner join fixed_expense f
        on m.월 = f.월;

--결과 조회
select * from finance;
        

----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------


--19. 각 디자이너별 달마다 일한 건수, 일한 시간, 매출액, 평균 리뷰점수를 조회하는 뷰
create or replace view designer_work as
select * from(
select extract(month from reservation.res_time) 월, designer.des_name 디자이너, count(*) 건수, sum(menu.mn_hours) "일한 시간", to_char(sum(menu.mn_price), 'L999,999,999') 실적, trunc(avg(review.rev_score), 2) 평균리뷰점수
    from designer
    inner join reservation
        on designer.des_no = reservation.res_des_no
    inner join menu
        on reservation.res_mn_no = menu.mn_no
    inner join review
        on reservation.res_no = review.rev_no
    where extract(month from reservation.res_time) = 7
    group by extract(month from reservation.res_time), designer.des_name
union
select extract(month from reservation.res_time) 월, designer.des_name 디자이너, count(*) 건수, sum(menu.mn_hours) "일한 시간", to_char(sum(menu.mn_price), 'L999,999,999') 실적, trunc(avg(review.rev_score), 2) 평균리뷰점수
    from designer
    inner join reservation
        on designer.des_no = reservation.res_des_no
    inner join menu
        on reservation.res_mn_no = menu.mn_no
    inner join review
        on reservation.res_no = review.rev_no
    where extract(month from reservation.res_time) = 8
    group by extract(month from reservation.res_time), designer.des_name
union
select extract(month from reservation.res_time) 월, designer.des_name 디자이너, count(*) 건수, sum(menu.mn_hours) "일한 시간", to_char(sum(menu.mn_price), 'L999,999,999') 실적, trunc(avg(review.rev_score), 2) 평균리뷰점수
    from designer
    inner join reservation
        on designer.des_no = reservation.res_des_no
    inner join menu
        on reservation.res_mn_no = menu.mn_no
    inner join review
        on reservation.res_no = review.rev_no
    where extract(month from reservation.res_time) = 9
    group by extract(month from reservation.res_time), designer.des_name
union
select extract(month from reservation.res_time) 월, designer.des_name 디자이너, count(*) 건수, sum(menu.mn_hours) "일한 시간", to_char(sum(menu.mn_price), 'L999,999,999') 실적, trunc(avg(review.rev_score), 2) 평균리뷰점수
    from designer
    inner join reservation
        on designer.des_no = reservation.res_des_no
    inner join menu
        on reservation.res_mn_no = menu.mn_no
    inner join review
        on reservation.res_no = review.rev_no
    where extract(month from reservation.res_time) = 10
    group by extract(month from reservation.res_time), designer.des_name
union
select extract(month from reservation.res_time) 월, designer.des_name 디자이너, count(*) 건수, sum(menu.mn_hours) "일한 시간", to_char(sum(menu.mn_price), 'L999,999,999') 실적, trunc(avg(review.rev_score), 2) 평균리뷰점수
    from designer
    inner join reservation
        on designer.des_no = reservation.res_des_no
    inner join menu
        on reservation.res_mn_no = menu.mn_no
    inner join review
        on reservation.res_no = review.rev_no
    where extract(month from reservation.res_time) = 11
    group by extract(month from reservation.res_time), designer.des_name
    )
    order by 디자이너, 월;
    
--뷰 조회하기
select * from designer_work;

