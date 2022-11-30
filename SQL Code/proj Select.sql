--1. 예약관리(오늘 내일 예약한 손님 조회)
select r.res_time 날짜, r.res_no 예약번호, m.mem_no 회원번호, m.mem_name 성함, m.mem_gender 성별, n.mn_name 시술, d.des_name "담당 디자이너", to_char(n.mn_price, 'L999,999') 가격
    from reservation r
    inner join membership m
        on r.res_mem_no = m.mem_no
    inner join menu n
        on r.res_mn_no = n.mn_no
    inner join designer d
        on r.res_des_no = d.des_no
    where to_char(r.res_time, 'YY/MM/DD') = to_char(sysdate, 'YY/MM/DD') or to_char(r.res_time, 'YY/MM/DD') = to_char(sysdate + 1, 'YY/MM/DD')
    order by r.res_time, r.res_no;
    
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------    

--2. 월매출 지출 순수익 조회
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
    
--월별 소모품 주문비를 구하는 뷰
create or replace view expense as
select extract(month from ord_date) 월, sum(ord_price) 지출
    from orderlist
    group by extract(month from ord_date)
    order by extract(month from ord_date);
    
select to_char(sum(des_salary), 'L999,999,999') from designer;

--월별 월급과 월세(임시)를 구하는 뷰
create or replace view fixed_expense as
select * from (
select distinct 7 as 월, (select sum(des_salary) from designer) 월급, 7500000 as 월세 from designer union
select distinct 8 as 월, (select sum(des_salary) from designer) 월급, 7500000 as 월세 from designer union
select distinct 9 as 월, (select sum(des_salary) from designer) 월급, 7500000 as 월세 from designer union
select distinct 10 as 월, (select sum(des_salary) from designer) 월급, 7500000 as 월세 from designer);

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

--직급별 차등 가격 버전
create or replace view revenue_position as
select * from (
select extract(month from reservation.res_time) 월,
       sum(case when reservation.res_des_no = 'D0001' or reservation.res_des_no = 'D0002' then menu.mn_price*1.1 else menu.mn_price end) 매출
    from reservation
    inner join menu
        on reservation.res_mn_no = menu.mn_no
    inner join designer
        on reservation.res_des_no = designer.des_no
    where extract(month from reservation.res_time) = 7
    group by extract(month from reservation.res_time)
union
select extract(month from reservation.res_time) 월,
       sum(case when reservation.res_des_no = 'D0001' or reservation.res_des_no = 'D0002' then menu.mn_price*1.1 else menu.mn_price end) 매출
    from reservation
    inner join menu
        on reservation.res_mn_no = menu.mn_no
    inner join designer
        on reservation.res_des_no = designer.des_no
    where extract(month from reservation.res_time) = 8
    group by extract(month from reservation.res_time)
union
select extract(month from reservation.res_time) 월,
       sum(case when reservation.res_des_no = 'D0001' or reservation.res_des_no = 'D0002' then menu.mn_price*1.1 else menu.mn_price end) 매출
    from reservation
    inner join menu
        on reservation.res_mn_no = menu.mn_no
    inner join designer
        on reservation.res_des_no = designer.des_no
    where extract(month from reservation.res_time) = 9
    group by extract(month from reservation.res_time)
union
select extract(month from reservation.res_time) 월,
       sum(case when reservation.res_des_no = 'D0001' or reservation.res_des_no = 'D0002' then menu.mn_price*1.1 else menu.mn_price end) 매출
    from reservation
    inner join menu
        on reservation.res_mn_no = menu.mn_no
    inner join designer
        on reservation.res_des_no = designer.des_no
    where extract(month from reservation.res_time) = 10
    group by extract(month from reservation.res_time)) 
    order by 월;

--직급별 차등 가격 적용한 순수익
create or replace view finance_position as
select m.월, to_char(m.매출, 'L999,999,999') 매출,
             to_char(e.지출, 'L999,999,999') 지출,
             to_char(f.월급, 'L999,999,999') 월급,
             to_char(f.월세, 'L999,999,999') 월세,
             to_char((m.매출)-(e.지출)-(f.월급)-(f.월세), 'L999,999,999') 순수익
    from revenue_position m
    inner join expense e
        on m.월 = e.월
    inner join fixed_expense f
        on m.월 = f.월;
        
select * from finance_position;
        
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--3. 일별로 각 디자이너가 얼마나 일했나 확인하는 뷰
create or replace view work_time as
select reservation.res_time 날짜, designer.des_name 디자이너, count(*) 건수, sum(menu.mn_hours) "일한 시간", sum(menu.mn_price) 매출
    from designer
    inner join reservation
        on designer.des_no = reservation.res_des_no
    inner join menu
        on reservation.res_mn_no = menu.mn_no
    where extract(month from reservation.res_time) = extract(month from sysdate)
    group by designer.des_name, reservation.res_time
    order by reservation.res_time;
    
select * from work_time;

--월별로 각 디자이너가 얼마나 일했는지, 점수는 어떻게 받았는지
select * from(
select extract(month from reservation.res_time) 월, designer.des_name 디자이너, count(*) 건수, sum(menu.mn_hours) "일한 시간", to_char(sum(menu.mn_price), 'L999,999,999') 실적, count(case when rev_score = 5 then 1 end) as "5점리뷰", count(case when rev_score = 4 then 1 end) "4점리뷰", count(case when rev_score = 3 then 1 end) "3점리뷰", count(case when rev_score = 2 then 1 end) "2점리뷰", count(case when rev_score = 1 then 1 end) "1점리뷰"
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
select extract(month from reservation.res_time) 월, designer.des_name 디자이너, count(*) 건수, sum(menu.mn_hours) "일한 시간", to_char(sum(menu.mn_price), 'L999,999,999') 실적, count(case when rev_score = 5 then 1 end) as "5점리뷰", count(case when rev_score = 4 then 1 end) "4점리뷰", count(case when rev_score = 3 then 1 end) "3점리뷰", count(case when rev_score = 2 then 1 end) "2점리뷰", count(case when rev_score = 1 then 1 end) "1점리뷰"
    from designer
    inner join reservation
        on designer.des_no = reservation.res_des_no
    inner join menu
        on reservation.res_mn_no = menu.mn_no
    inner join review
        on reservation.res_no = review.rev_no
    where extract(month from reservation.res_time) = extract(month from sysdate)
    group by extract(month from reservation.res_time), designer.des_name
    )
    order by 월, 디자이너;
    
    
select * from(
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
    where extract(month from reservation.res_time) = extract(month from sysdate)
    group by extract(month from reservation.res_time), designer.des_name
    )
    order by 월, 디자이너;