set serveroutput on

--1. ���� ��ȭ��ȣ ���� �Լ�
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

--2. ���� ���� ���� �Լ�
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


--3. ���� �̸� ���� �Լ�
CREATE OR REPLACE FUNCTION RANDOM_NAME
    RETURN VARCHAR2
IS
    randname VARCHAR2(10);
begin
    select case when nvl(floor(dbms_random.value(1, 31)), 30) >= 30 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 29) >= 29 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 28) >= 28 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 27) >= 27 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 26) >= 26 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 25) >= 25 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 24) >= 24 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 23) >= 23 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 22) >= 22 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 21) >= 21 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 20) >= 20 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 19) >= 19 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 18) >= 18 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 17) >= 17 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 16) >= 16 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 15) >= 15 then 'Ȳ'
                when nvl(floor(dbms_random.value(1, 31)), 14) >= 14 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 13) >= 13 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 12) >= 12 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 11) >= 11 then 'ȫ'
                when nvl(floor(dbms_random.value(1, 31)), 10) >= 10 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 9) >= 9 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 8) >= 8 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 7) >= 7 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 6) >= 6 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 5) >= 5 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 4) >= 4 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 3) >= 3 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 2) >= 2 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 1) >= 1 then '��'
                end||
           case when nvl(floor(dbms_random.value(1, 31)), 30) >= 30 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 29) >= 29 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 28) >= 28 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 27) >= 27 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 26) >= 26 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 25) >= 25 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 24) >= 24 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 23) >= 23 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 22) >= 22 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 21) >= 21 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 20) >= 20 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 19) >= 19 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 18) >= 18 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 17) >= 17 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 16) >= 16 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 15) >= 15 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 14) >= 14 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 13) >= 13 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 12) >= 12 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 11) >= 11 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 10) >= 10 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 9) >= 9 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 8) >= 8 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 7) >= 7 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 6) >= 6 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 5) >= 5 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 4) >= 4 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 3) >= 3 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 2) >= 2 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 1) >= 1 then 'ȫ'
                end||
           case when nvl(floor(dbms_random.value(1, 31)), 30) >= 30 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 29) >= 29 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 28) >= 28 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 27) >= 27 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 26) >= 26 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 25) >= 25 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 24) >= 24 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 23) >= 23 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 22) >= 22 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 21) >= 21 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 20) >= 20 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 19) >= 19 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 18) >= 18 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 17) >= 17 then 'ȣ'
                when nvl(floor(dbms_random.value(1, 31)), 16) >= 16 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 15) >= 15 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 14) >= 14 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 13) >= 13 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 12) >= 12 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 11) >= 11 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 10) >= 10 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 9) >= 9 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 8) >= 8 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 7) >= 7 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 6) >= 6 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 5) >= 5 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 4) >= 4 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 3) >= 3 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 2) >= 2 then '��'
                when nvl(floor(dbms_random.value(1, 31)), 1) >= 1 then '��'
                end
        into randname
        from dual;
    return randname;
end;
/

--1~3�� ���
select random_name() �����̸�, random_phone() ������ȭ��ȣ, random_birth() �������� from dual;


----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------


--4. �ű� ȸ����ȣ ���� �Լ�
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

--5. �ű�ȸ�� ����ϴ� ���ν���
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
            dbms_output.put_line('�Է��Ͻ� ������ �߸��Ǿ����ϴ�.');
            dbms_output.put_line('ȸ�� ��Ͽ� �����߽��ϴ�.');
        end;
end;
/

--6. ȸ�� �����ϴ� ���ν���
create or replace procedure delete_mem(
    p_mno membership.mem_no%type)
is
begin
    delete from membership where mem_no in (select mem_no from membership where mem_no = p_mno);
    exception
    when others then
        dbms_output.put_line('�Է��Ͻ� ������ �߸��Ǿ����ϴ�.');
end;
/


--6. ���ν����� �� ȸ�� ���, �����ϱ�
exec new_member('ȫ�浿', 'M', '10-11-12', '010-1234-1235', '������');
exec delete_mem('M0301');


----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------


--7. �����ȣ ���� �Լ�
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


--8. �ű� ���� ���ν���
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
            dbms_output.put_line('�Է��Ͻ� ������ �߸��Ǿ����ϴ�.');
            dbms_output.put_line('���࿡ �����߽��ϴ�.');
        end;
end;
/

--9. ���� ��¥ ���� ���ν���
create or replace procedure change_res_date(
    p_rno reservation.res_no%type,
    p_date reservation.res_time%type)
is
begin
    update reservation set res_time = p_date where res_no in (select res_no from reservation where res_no = p_rno);
    exception
    when others then
        dbms_output.put_line('�Է��Ͻ� ������ �߸��Ǿ����ϴ�.');
end;
/

--10. ���� ��� ���ν���
create or replace procedure cancel_res(
    p_rno reservation.res_no%type)
is
begin
    delete from reservation where res_no in (select res_no from reservation where res_no = p_rno);
    exception
    when others then
        dbms_output.put_line('�Է��Ͻ� ������ �߸��Ǿ����ϴ�.');
end;
/

--11. ���ν����� ����, ����, ����ϱ�
exec new_res('M0001', 'H0001', '22/11/30');
exec change_res_date('RB401', '22/12/01');
exec cancel_res('RB401');


----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------


--11. �����̳ʵ��� ������ ��� ���������� �����ִ� ��
create or replace view ranking as
select designer.des_name �̸�, designer.des_position ����, designer.des_salary ����, trunc(avg(review.rev_score), 2) �������
    from designer
    inner join reservation
        on reservation.res_des_no = designer.des_no
    inner join review
        on review.rev_no = reservation.res_no
    group by designer.des_name, designer.des_position, designer.des_salary
    order by ������� desc;

select * from ranking; --�� ����
select * from ranking where rownum = 1; --�ֻ��� 1�� ��ȸ
select * from (select * from ranking order by rownum desc) where rownum = 1; --������ 1�� ��ȸ

--12. �ֻ��� 1��� ������ 1���� �̸��� ������ ����ϴ� ���ν���
create or replace procedure good_bad
is
    good designer.des_name%type;
    good_pos designer.des_position%type;
    bad designer.des_name%type;
    bad_pos designer.des_position%type;
begin
    select �̸�, ���� into good, good_pos from ranking where rownum = 1;
    select �̸�, ���� into bad, bad_pos from (select * from ranking order by rownum desc) where rownum = 1;
    dbms_output.put_line('���� ����� ������ '||good||' '||good_pos||'�Դϴ�.');
    dbms_output.put_line('���� ������ �ʿ��� ������ '||bad||' '||bad_pos||'�Դϴ�.');
end;
/

--���ν����� ��ȸ�ϱ�
exec good_bad;


----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------


--13. ������ �������� ����� ��ȸ�ϴ� ��
create or replace view reserv as
select reservation.res_no �����ȣ, reservation.res_time ��������, membership.mem_name ���̸�, menu.mn_name �ü���, designer.des_name �������̳�, menu.mn_price ����
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

--14. ������ �������� ������� ���ڸ� �߼��ϴ� ���ν���
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
        dbms_output.put_line(p_memname||' ����! KB�̿�ǿ� �����Ͻ� ��¥�� �ӹ��߽��ϴ�.');
        dbms_output.put_line('�������� : '||p_restime);
        dbms_output.put_line('�����ȣ : '||p_resno);
        dbms_output.put_line('�����Ͻ� �ü� : '||p_mnname);
        dbms_output.put_line('��� �����̳� : '||p_desname||' '||p_despos);
        dbms_output.put_line('���� : '||p_price||'��');
        dbms_output.put_line(' ');
    end loop;
    close cur;
end;
/

--���ν����� ���� ������
exec res_message;


----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------


--15. ȸ������ �˻� ���ν���
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
    select mem_name ����, mem_no ȸ����ȣ, mem_gender ����, mem_bday ����, mem_tel ��ȭ��ȣ, mem_des_no "��ȣ �����̳�" into r_name, r_no, r_gender, r_bday, r_tel, r_des
        from membership
        where mem_no = p_mno;
    dbms_output.put_line('�˻� ���');
    dbms_output.put_line('�� ��ȣ: '||r_no);
    dbms_output.put_line('����: '||r_name);
    dbms_output.put_line('����: '||r_gender);
    dbms_output.put_line('����: '||r_bday);
    dbms_output.put_line('��ȭ��ȣ: '||r_tel);
    dbms_output.put_line('��ȣ �����̳�: '||r_des);
    exception
        when others then
        begin
            dbms_output.put_line('�Է��Ͻ� ������ �߸��Ǿ����ϴ�.');
        end;
end;
/

--���ν����� �˻��ϱ�
exec find_member('M0001');

--16. �Է��� �����̳ʰ� ��ȣ �����̳��� ȸ���� ������ �湮 ������ ����ϴ� ���ν���
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
    select ȸ����ȣ, ȸ���̸�, ��¥, �ü�, ��������
        from (
            select distinct m.mem_no ȸ����ȣ, m.mem_name ȸ���̸�, r.res_time ��¥, n.mn_name �ü�, v.rev_score ��������, rank() over(partition by m.mem_no order by r.res_time desc) ����
                from reservation r
                inner join membership m
                    on r.res_mem_no = m.mem_no    
                inner join menu n
                    on r.res_mn_no = n.mn_no
                inner join review v
                    on r.res_no = v.rev_no
                where m.mem_des_no = r_dno
                order by m.mem_no)
                where ���� = 1;
begin
    select des_no into r_dno from designer where des_name = p_name;
    dbms_output.put_line(p_name||' �����̳ʸ� ��ȣ �����̳ʷ� ����� �� ����');
    dbms_output.put_line('');
    open cur;
    loop
        fetch cur into r_mno, r_mname, r_date, r_menu, r_score;
        exit when cur%notfound;
        dbms_output.put_line('ȸ����ȣ: '||r_mno);
        dbms_output.put_line('����: '||r_mname);
        dbms_output.put_line('������ �湮��: '||r_date);
        dbms_output.put_line('���� �ü�: '||r_menu);
        dbms_output.put_line('���� ����: '||r_score);
        dbms_output.put_line('');
        counter := counter+1;
    end loop;
    dbms_output.put_line('�� '||counter||'���� ȸ���� �˻��Ǿ����ϴ�.');
end;
/

--���ν����� �˻��ϱ�
exec des_mem('������');


----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------


--17. ���ð� ������ ���� ������ ��ȸ
create or replace view today_tomorrow as
select r.res_time ��¥, r.res_no �����ȣ, m.mem_no ȸ����ȣ, m.mem_name ����, m.mem_gender ����, n.mn_name �ü�, d.des_name "��� �����̳�", to_char(n.mn_price, 'L999,999') ����
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
    
--18. ���� �����, �����, ����, ����, �������� ��ȸ
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
    
select * from revenue;
    
--���� �Ҹ�ǰ �ֹ��� ���ϴ� ��
create or replace view expense as
select extract(month from ord_date) ��, sum(ord_price) ����
    from orderlist
    group by extract(month from ord_date)
    order by extract(month from ord_date);
    
select * from expense;

--���� ���ް� ����(�ӽ�)�� ���ϴ� ��
create or replace view fixed_expense as
select * from (
    select distinct 7 as ��, (select sum(des_salary) from designer) ����, 7500000 as ���� from designer union
    select distinct 8 as ��, (select sum(des_salary) from designer) ����, 7500000 as ���� from designer union
    select distinct 9 as ��, (select sum(des_salary) from designer) ����, 7500000 as ���� from designer union
    select distinct 10 as ��, (select sum(des_salary) from designer) ����, 7500000 as ���� from designer
);

select * from fixed_expense;

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
        

----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------


--19. �� �����̳ʺ� �޸��� ���� �Ǽ�, ���� �ð�, �����, ��� ���������� ��ȸ�ϴ� ��
create or replace view designer_work as
select * from(
select extract(month from reservation.res_time) ��, designer.des_name �����̳�, count(*) �Ǽ�, sum(menu.mn_hours) "���� �ð�", to_char(sum(menu.mn_price), 'L999,999,999') ����, trunc(avg(review.rev_score), 2) ��ո�������
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
select extract(month from reservation.res_time) ��, designer.des_name �����̳�, count(*) �Ǽ�, sum(menu.mn_hours) "���� �ð�", to_char(sum(menu.mn_price), 'L999,999,999') ����, trunc(avg(review.rev_score), 2) ��ո�������
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
select extract(month from reservation.res_time) ��, designer.des_name �����̳�, count(*) �Ǽ�, sum(menu.mn_hours) "���� �ð�", to_char(sum(menu.mn_price), 'L999,999,999') ����, trunc(avg(review.rev_score), 2) ��ո�������
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
    where extract(month from reservation.res_time) = 11
    group by extract(month from reservation.res_time), designer.des_name
    )
    order by �����̳�, ��;
    
--�� ��ȸ�ϱ�
select * from designer_work;

