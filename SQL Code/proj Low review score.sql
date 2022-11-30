--������ �����̳ʰ� ����� �ü� ��������
select review.rev_no
    from review
    inner join reservation
        on reservation.res_no = review.rev_no
    where reservation.res_des_no = 'D0004';
    
--�����ϸ� ���� ������ ������ ���� �������� ���� �Լ�
create or replace function random_review_low
    return number
is
    randscore number(1, 0);
begin
    select case when floor(dbms_random.value(1, 11)) >= 8 then case when floor(dbms_random.value(1, 6)) >= 6 then 5 when floor(dbms_random.value(1, 6)) >= 1 then 4 end
                when floor(dbms_random.value(1, 11)) >= 6 then case when floor(dbms_random.value(1, 6)) >= 3 then 5 when floor(dbms_random.value(1, 6)) >= 1 then 3 end
                when floor(dbms_random.value(1, 11)) >= 1 then case when floor(dbms_random.value(1, 6)) >= 7 then 2 when floor(dbms_random.value(1, 6)) >= 1 then 1 end
                end
    into randscore from dual;
    return randscore;
end;
/

--������ �����̳��� ���� ������ ��� UPDATE��
update review set rev_score = random_review_low() where rev_no in (select review.rev_no
                                                                        from review
                                                                        inner join reservation
                                                                            on reservation.res_no = review.rev_no
                                                                        where reservation.res_des_no = 'D0004');