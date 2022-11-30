--강동현 디자이너가 담당한 시술 리뷰점수
select review.rev_no
    from review
    inner join reservation
        on reservation.res_no = review.rev_no
    where reservation.res_des_no = 'D0004';
    
--웬만하면 낮은 점수가 나오는 랜덤 리뷰점수 생성 함수
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

--강동현 디자이너의 리뷰 점수를 까는 UPDATE문
update review set rev_score = random_review_low() where rev_no in (select review.rev_no
                                                                        from review
                                                                        inner join reservation
                                                                            on reservation.res_no = review.rev_no
                                                                        where reservation.res_des_no = 'D0004');