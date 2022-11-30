set serveroutput on

--1. ���� ���� ���ϴ� ����� ���� ���ϴ� ��� ���ϱ�
--������ ������ �����̳ʵ��� ������ ��� ���������� �����ִ� ��
create or replace view ranking as
select designer.des_name �̸�, designer.des_position ����, designer.des_salary ����, trunc(avg(review.rev_score), 2) �������
    from designer
    inner join reservation
        on reservation.res_des_no = designer.des_no
    inner join review
        on review.rev_no = reservation.res_no
    group by designer.des_name, designer.des_position, designer.des_salary
    order by ������� desc;
    
select * from ranking;

--�ֻ��� 1��
select * from ranking where rownum = 1;
--������ 1��
select * from (select * from ranking order by rownum desc) where rownum = 1;

--�ֻ��� 1���� �̸��� ����, ������ 1���� �̸��� ������ ����ϴ� ���ν���
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

exec good_bad;


----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------


--2. ������ �������� ������� ���� �˸� ���ڸ� �߼��ϴ� ���ν���
--������ �������� ����� ��ȸ�ϴ� ��
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
        
select * from reserv;

--���ڸ� �߼��ϴ� ���ν���
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

exec res_message;


----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------


--3. ������ ���� �ʴ� �ü��� ������ ����� ���� ������ �ϰ� �����ϴ� ���ν���
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


--4. �������� ������ ȸ������ �������� ������ �߼��ϴ� ���ν���
--�������� ������ ȸ���� ���ϴ� sql��
select mem_no ȸ����ȣ, mem_name �̸�, mem_bday ����
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
        dbms_output.put_line(p_mname||' ����! ');
        dbms_output.put_line(extract(month from sysdate+interval '1' month)||'�� �� �޵��� ��� ������ ���� ������ �߱޵Ǿ����ϴ�!');
        dbms_output.put_line('������ ������ �������� ���ϵ帳�ϴ�.');
        dbms_output.put_line('���� ����: �ü� ��� 10% ����');
        dbms_output.put_line('');
    end loop;
end;
/

exec bday_message;

----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------

--5. ȸ��, �����̳� �˻� ���ν���
--ȸ�� �˻�
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

--exec find_member(ȸ����ȣ);
exec find_member('M0001');


--�����̳� �˻�
--�� ȸ���� ���������� �� ��¥�� �ü� ����
select ȸ����ȣ, ȸ���̸�, ��¥, �ü�, �������� from (
select distinct m.mem_no ȸ����ȣ, m.mem_name ȸ���̸�, r.res_time ��¥, n.mn_name �ü�, v.rev_score ��������, rank() over(partition by m.mem_no order by r.res_time desc) ����
    from reservation r
    inner join membership m
        on r.res_mem_no = m.mem_no    
    inner join menu n
        on r.res_mn_no = n.mn_no
    inner join review v
        on r.res_no = v.rev_no
    order by m.mem_no)
    where ���� = 1;
    
--�� ������ ���ʴ�� ����ϴ� ���ν���
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

--exec des_mem(�����̳��̸�);
exec des_mem('������');

----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------

--6. �ű�ȸ�� ��� ���ν���
--�� ȸ����ȣ ����� �Լ�
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

--ȸ�� ����ϴ� ���ν���
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

--���ν����� �� ȸ�� ����ϱ�
--exec new_member(�̸�, ����, ����, ��ȭ��ȣ, �����̳��̸�);
exec new_member('��â��', 'M', '70-01-01', '010-1234-1235', '������');


--ȸ�� �����ϴ� ���ν���
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

--exec delete_mem(ȸ����ȣ);
exec delete_mem('M0301');

----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------

--7. �ű� ���� ���ν���
--�� �����ȣ ����� �Լ�
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

--�ű� �����ϴ� ���ν���
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

--���ν����� �����ϱ�
--exec new_res(ȸ����ȣ, �ü���ȣ, ��¥);
exec new_res('M0001', 'H0001', '22-11-30');


----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------

--8. ���� ���� ���ν���
--�ü� ����
create or replace procedure change_res_menu(
    p_rno reservation.res_no%type,
    p_mn reservation.res_mn_no%type)
is
begin
    update reservation set res_mn_no = p_mn where res_no in (select res_no from reservation where res_no = p_rno);
    exception
    when others then
        dbms_output.put_line('�Է��Ͻ� ������ �߸��Ǿ����ϴ�.');
end;
/

--exec change_res_menu(�����ȣ, �ü���ȣ);
exec change_res_menu('R0001', 'H0002');


--��¥ ����
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

--exec change_res_date(�����ȣ, ��¥);
exec change_res_date('R0001', '22/10/01');


----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------

--9. ���� ��� ���ν���
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

--exec cancel_res(�����ȣ);
exec cancel_res('R0813');