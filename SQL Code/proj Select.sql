--1. �������(���� ���� ������ �մ� ��ȸ)
select r.res_time ��¥, r.res_no �����ȣ, m.mem_no ȸ����ȣ, m.mem_name ����, m.mem_gender ����, n.mn_name �ü�, d.des_name "��� �����̳�", to_char(n.mn_price, 'L999,999') ����
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

--2. ������ ���� ������ ��ȸ
--���� ������� ���ϴ� ��
create or replace view revenue as
select * from (
select extract(month from reservation.res_time) ��, sum(menu.mn_price) ����
    from reservation
    inner join menu
        on reservation.res_mn_no = menu.mn_no
    inner join designer
        on reservation.res_des_no = designer.des_no
    where extract(month from reservation.res_time) = 7
    group by extract(month from reservation.res_time)
union
select extract(month from reservation.res_time) ��, sum(menu.mn_price) ����
    from reservation
    inner join menu
        on reservation.res_mn_no = menu.mn_no
    inner join designer
        on reservation.res_des_no = designer.des_no
    where extract(month from reservation.res_time) = 8
    group by extract(month from reservation.res_time)
union
select extract(month from reservation.res_time) ��, sum(menu.mn_price) ����
    from reservation
    inner join menu
        on reservation.res_mn_no = menu.mn_no
    inner join designer
        on reservation.res_des_no = designer.des_no
    where extract(month from reservation.res_time) = 9
    group by extract(month from reservation.res_time)
union
select extract(month from reservation.res_time) ��, sum(menu.mn_price) ����
    from reservation
    inner join menu
        on reservation.res_mn_no = menu.mn_no
    inner join designer
        on reservation.res_des_no = designer.des_no
    where extract(month from reservation.res_time) = 10
    group by extract(month from reservation.res_time)) 
    order by ��;
    
--���� �Ҹ�ǰ �ֹ��� ���ϴ� ��
create or replace view expense as
select extract(month from ord_date) ��, sum(ord_price) ����
    from orderlist
    group by extract(month from ord_date)
    order by extract(month from ord_date);
    
select to_char(sum(des_salary), 'L999,999,999') from designer;

--���� ���ް� ����(�ӽ�)�� ���ϴ� ��
create or replace view fixed_expense as
select * from (
select distinct 7 as ��, (select sum(des_salary) from designer) ����, 7500000 as ���� from designer union
select distinct 8 as ��, (select sum(des_salary) from designer) ����, 7500000 as ���� from designer union
select distinct 9 as ��, (select sum(des_salary) from designer) ����, 7500000 as ���� from designer union
select distinct 10 as ��, (select sum(des_salary) from designer) ����, 7500000 as ���� from designer);

--�� �並 ������ ���� �������� �߰��� �� ����
create or replace view finance as
select m.��, to_char(m.����, 'L999,999,999') ����,
             to_char(e.����, 'L999,999,999') ����,
             to_char(f.����, 'L999,999,999') ����,
             to_char(f.����, 'L999,999,999') ����,
             to_char((m.����)-(e.����)-(f.����)-(f.����), 'L999,999,999') ������
    from revenue m
    inner join expense e
        on m.�� = e.��
    inner join fixed_expense f
        on m.�� = f.��;

--��� ��ȸ
select * from finance;

--���޺� ���� ���� ����
create or replace view revenue_position as
select * from (
select extract(month from reservation.res_time) ��,
       sum(case when reservation.res_des_no = 'D0001' or reservation.res_des_no = 'D0002' then menu.mn_price*1.1 else menu.mn_price end) ����
    from reservation
    inner join menu
        on reservation.res_mn_no = menu.mn_no
    inner join designer
        on reservation.res_des_no = designer.des_no
    where extract(month from reservation.res_time) = 7
    group by extract(month from reservation.res_time)
union
select extract(month from reservation.res_time) ��,
       sum(case when reservation.res_des_no = 'D0001' or reservation.res_des_no = 'D0002' then menu.mn_price*1.1 else menu.mn_price end) ����
    from reservation
    inner join menu
        on reservation.res_mn_no = menu.mn_no
    inner join designer
        on reservation.res_des_no = designer.des_no
    where extract(month from reservation.res_time) = 8
    group by extract(month from reservation.res_time)
union
select extract(month from reservation.res_time) ��,
       sum(case when reservation.res_des_no = 'D0001' or reservation.res_des_no = 'D0002' then menu.mn_price*1.1 else menu.mn_price end) ����
    from reservation
    inner join menu
        on reservation.res_mn_no = menu.mn_no
    inner join designer
        on reservation.res_des_no = designer.des_no
    where extract(month from reservation.res_time) = 9
    group by extract(month from reservation.res_time)
union
select extract(month from reservation.res_time) ��,
       sum(case when reservation.res_des_no = 'D0001' or reservation.res_des_no = 'D0002' then menu.mn_price*1.1 else menu.mn_price end) ����
    from reservation
    inner join menu
        on reservation.res_mn_no = menu.mn_no
    inner join designer
        on reservation.res_des_no = designer.des_no
    where extract(month from reservation.res_time) = 10
    group by extract(month from reservation.res_time)) 
    order by ��;

--���޺� ���� ���� ������ ������
create or replace view finance_position as
select m.��, to_char(m.����, 'L999,999,999') ����,
             to_char(e.����, 'L999,999,999') ����,
             to_char(f.����, 'L999,999,999') ����,
             to_char(f.����, 'L999,999,999') ����,
             to_char((m.����)-(e.����)-(f.����)-(f.����), 'L999,999,999') ������
    from revenue_position m
    inner join expense e
        on m.�� = e.��
    inner join fixed_expense f
        on m.�� = f.��;
        
select * from finance_position;
        
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--3. �Ϻ��� �� �����̳ʰ� �󸶳� ���߳� Ȯ���ϴ� ��
create or replace view work_time as
select reservation.res_time ��¥, designer.des_name �����̳�, count(*) �Ǽ�, sum(menu.mn_hours) "���� �ð�", sum(menu.mn_price) ����
    from designer
    inner join reservation
        on designer.des_no = reservation.res_des_no
    inner join menu
        on reservation.res_mn_no = menu.mn_no
    where extract(month from reservation.res_time) = extract(month from sysdate)
    group by designer.des_name, reservation.res_time
    order by reservation.res_time;
    
select * from work_time;

--������ �� �����̳ʰ� �󸶳� ���ߴ���, ������ ��� �޾Ҵ���
select * from(
select extract(month from reservation.res_time) ��, designer.des_name �����̳�, count(*) �Ǽ�, sum(menu.mn_hours) "���� �ð�", to_char(sum(menu.mn_price), 'L999,999,999') ����, count(case when rev_score = 5 then 1 end) as "5������", count(case when rev_score = 4 then 1 end) "4������", count(case when rev_score = 3 then 1 end) "3������", count(case when rev_score = 2 then 1 end) "2������", count(case when rev_score = 1 then 1 end) "1������"
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
select extract(month from reservation.res_time) ��, designer.des_name �����̳�, count(*) �Ǽ�, sum(menu.mn_hours) "���� �ð�", to_char(sum(menu.mn_price), 'L999,999,999') ����, count(case when rev_score = 5 then 1 end) as "5������", count(case when rev_score = 4 then 1 end) "4������", count(case when rev_score = 3 then 1 end) "3������", count(case when rev_score = 2 then 1 end) "2������", count(case when rev_score = 1 then 1 end) "1������"
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
    order by ��, �����̳�;
    
    
select * from(
select extract(month from reservation.res_time) ��, designer.des_name �����̳�, count(*) �Ǽ�, sum(menu.mn_hours) "���� �ð�", to_char(sum(menu.mn_price), 'L999,999,999') ����, trunc(avg(review.rev_score), 2) ��ո�������
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
select extract(month from reservation.res_time) ��, designer.des_name �����̳�, count(*) �Ǽ�, sum(menu.mn_hours) "���� �ð�", to_char(sum(menu.mn_price), 'L999,999,999') ����, trunc(avg(review.rev_score), 2) ��ո�������
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
    order by ��, �����̳�;