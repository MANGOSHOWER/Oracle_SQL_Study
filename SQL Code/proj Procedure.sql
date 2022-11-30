set serveroutput on

--1. 일을 제일 잘하는 사람과 제일 못하는 사람 구하기
--원장을 제외한 디자이너들의 정보와 평균 리뷰점수를 보여주는 뷰
create or replace view ranking as
select designer.des_name 이름, designer.des_position 직급, designer.des_salary 월급, trunc(avg(review.rev_score), 2) 평균점수
    from designer
    inner join reservation
        on reservation.res_des_no = designer.des_no
    inner join review
        on review.rev_no = reservation.res_no
    group by designer.des_name, designer.des_position, designer.des_salary
    order by 평균점수 desc;
    
select * from ranking;

--최상위 1명
select * from ranking where rownum = 1;
--최하위 1명
select * from (select * from ranking order by rownum desc) where rownum = 1;

--최상위 1명의 이름과 직급, 최하위 1명의 이름과 직급을 출력하는 프로시저
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

exec good_bad;


----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------


--2. 내일이 예약일인 사람에게 예약 알림 문자를 발송하는 프로시저
--내일이 예약일인 사람을 조회하는 뷰
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
        
select * from reserv;

--문자를 발송하는 프로시저
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

exec res_message;


----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------


--3. 성별에 맞지 않는 시술을 예약한 사람의 예약 정보를 일괄 수정하는 프로시저
create or replace procedure menu_change
is
begin
    update reservation set res_mn_no = 'H0001' where res_no in (select reservation.res_no
                                                                    from reservation
                                                                    inner join membership
                                                                        on reservation.res_mem_no = membership.mem_no
                                                                    inner join menu
                                                                        on reservation.res_mn_no = menu.mn_no
                                                                    where membership.mem_gender = 'F' and reservation.res_mn_no = 'H0002');
    update reservation set res_mn_no = 'H0001' where res_no in (select reservation.res_no
                                                                    from reservation
                                                                    inner join membership
                                                                        on reservation.res_mem_no = membership.mem_no
                                                                    inner join menu
                                                                        on reservation.res_mn_no = menu.mn_no
                                                                    where membership.mem_gender = 'F' and reservation.res_mn_no = 'H0003');
    update reservation set res_mn_no = 'H0007' where res_no in (select reservation.res_no
                                                                    from reservation
                                                                    inner join membership
                                                                        on reservation.res_mem_no = membership.mem_no
                                                                    inner join menu
                                                                        on reservation.res_mn_no = menu.mn_no
                                                                    where membership.mem_gender = 'F' and reservation.res_mn_no = 'H0005');
    update reservation set res_mn_no = 'H0007' where res_no in (select reservation.res_no
                                                                    from reservation
                                                                    inner join membership
                                                                        on reservation.res_mem_no = membership.mem_no
                                                                    inner join menu
                                                                        on reservation.res_mn_no = menu.mn_no
                                                                    where membership.mem_gender = 'F' and reservation.res_mn_no = 'H0006');
    update reservation set res_mn_no = 'H0018' where res_no in (select reservation.res_no
                                                                    from reservation
                                                                    inner join membership
                                                                        on reservation.res_mem_no = membership.mem_no
                                                                    inner join menu
                                                                        on reservation.res_mn_no = menu.mn_no
                                                                    where membership.mem_gender = 'F' and reservation.res_mn_no = 'H0017');
                                                                    
                                                                    
    update reservation set res_mn_no = 'H0002' where res_no in (select reservation.res_no
                                                                    from reservation
                                                                    inner join membership
                                                                        on reservation.res_mem_no = membership.mem_no
                                                                    inner join menu
                                                                        on reservation.res_mn_no = menu.mn_no    
                                                                    where membership.mem_gender = 'M' and reservation.res_mn_no = 'H0001');
    update reservation set res_mn_no = 'H0003' where res_no in (select reservation.res_no
                                                                    from reservation
                                                                    inner join membership
                                                                        on reservation.res_mem_no = membership.mem_no
                                                                    inner join menu
                                                                        on reservation.res_mn_no = menu.mn_no
                                                                    where membership.mem_gender = 'M' and reservation.res_mn_no = 'H0004');
    update reservation set res_mn_no = 'H0006' where res_no in (select reservation.res_no
                                                                    from reservation
                                                                    inner join membership
                                                                        on reservation.res_mem_no = membership.mem_no
                                                                    inner join menu
                                                                        on reservation.res_mn_no = menu.mn_no
                                                                    where membership.mem_gender = 'M' and reservation.res_mn_no = 'H0007');
    update reservation set res_mn_no = 'H0017' where res_no in (select reservation.res_no
                                                                    from reservation
                                                                    inner join membership
                                                                        on reservation.res_mem_no = membership.mem_no
                                                                    inner join menu
                                                                        on reservation.res_mn_no = menu.mn_no
                                                                    where membership.mem_gender = 'M' and reservation.res_mn_no = 'H0018');
    update reservation set res_mn_no = 'H0017' where res_no in (select reservation.res_no
                                                                    from reservation
                                                                    inner join membership
                                                                        on reservation.res_mem_no = membership.mem_no
                                                                    inner join menu
                                                                        on reservation.res_mn_no = menu.mn_no
                                                                    where membership.mem_gender = 'M' and reservation.res_mn_no = 'H0019');
end;
/

exec menu_change;

----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------


--4. 다음달이 생일인 회원에게 생일축하 쿠폰을 발송하는 프로시저
--다음달이 생일인 회원을 구하는 sql문
select mem_no 회원번호, mem_name 이름, mem_bday 생일
    from membership
    where extract(month from mem_bday) = extract(month from sysdate+interval '1' month);
    
create or replace procedure bday_message
is
    p_mname membership.mem_name%type;
    cursor cur is select mem_name
                    from membership
                    where extract(month from mem_bday) = extract(month from sysdate+interval '1' month);
begin
    open cur;
    loop
        fetch cur into p_mname;
        exit when cur%notfound;
        dbms_output.put_line(p_mname||' 고객님! ');
        dbms_output.put_line(extract(month from sysdate+interval '1' month)||'월 한 달동안 사용 가능한 생일 쿠폰이 발급되었습니다!');
        dbms_output.put_line('고객님의 생일을 진심으로 축하드립니다.');
        dbms_output.put_line('쿠폰 내용: 시술 비용 10% 할인');
        dbms_output.put_line('');
    end loop;
end;
/

exec bday_message;

----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------

--5. 회원, 디자이너 검색 프로시저
--회원 검색
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

--exec find_member(회원번호);
exec find_member('M0001');


--디자이너 검색
--각 회원이 마지막으로 온 날짜의 시술 정보
select 회원번호, 회원이름, 날짜, 시술, 리뷰점수 from (
select distinct m.mem_no 회원번호, m.mem_name 회원이름, r.res_time 날짜, n.mn_name 시술, v.rev_score 리뷰점수, rank() over(partition by m.mem_no order by r.res_time desc) 순번
    from reservation r
    inner join membership m
        on r.res_mem_no = m.mem_no    
    inner join menu n
        on r.res_mn_no = n.mn_no
    inner join review v
        on r.res_no = v.rev_no
    order by m.mem_no)
    where 순번 = 1;
    
--위 정보를 차례대로 출력하는 프로시저
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

--exec des_mem(디자이너이름);
exec des_mem('강동현');

----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------

--6. 신규회원 등록 프로시저
--새 회원번호 만드는 함수
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

--회원 등록하는 프로시저
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

--프로시저로 새 회원 등록하기
--exec new_member(이름, 성별, 생일, 전화번호, 디자이너이름);
exec new_member('김창식', 'M', '70-01-01', '010-1234-1235', '정연이');


--회원 삭제하는 프로시저
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

--exec delete_mem(회원번호);
exec delete_mem('M0301');

----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------

--7. 신규 예약 프로시저
--새 예약번호 만드는 함수
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

--신규 예약하는 프로시저
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

--프로시저로 예약하기
--exec new_res(회원번호, 시술번호, 날짜);
exec new_res('M0001', 'H0001', '22-11-30');


----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------

--8. 예약 변경 프로시저
--시술 변경
create or replace procedure change_res_menu(
    p_rno reservation.res_no%type,
    p_mn reservation.res_mn_no%type)
is
begin
    update reservation set res_mn_no = p_mn where res_no in (select res_no from reservation where res_no = p_rno);
    exception
    when others then
        dbms_output.put_line('입력하신 정보가 잘못되었습니다.');
end;
/

--exec change_res_menu(예약번호, 시술번호);
exec change_res_menu('R0001', 'H0002');


--날짜 변경
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

--exec change_res_date(예약번호, 날짜);
exec change_res_date('R0001', '22/10/01');


----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------

--9. 예약 취소 프로시저
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

--exec cancel_res(예약번호);
exec cancel_res('R0813');