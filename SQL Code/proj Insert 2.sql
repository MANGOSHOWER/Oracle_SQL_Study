--예약번호 삽입

drop sequence rev_seq;
create sequence rev_seq
    start with 1
    increment by 1
    maxvalue 9999;

declare
    i number := 0;
    res number := 0;
begin
    for i in 1..420 loop
        insert into review values ('R7'||lpad(rev_seq.nextval, 3, 0),
                                random_review()
                                );
    end loop;
end;
/

drop sequence rev_seq;
create sequence rev_seq
    start with 1
    increment by 1
    maxvalue 9999;
    
declare
    i number := 0;
    res number := 0;
begin
    for i in 1..420 loop
        insert into review values ('R8'||lpad(rev_seq.nextval, 3, 0),
                                random_review()
                                );
    end loop;
end;
/

drop sequence rev_seq;
create sequence rev_seq
    start with 1
    increment by 1
    maxvalue 9999;
    
declare
    i number := 0;
    res number := 0;
begin
    for i in 1..400 loop
        insert into review values ('R9'||lpad(rev_seq.nextval, 3, 0),
                                random_review()
                                );
    end loop;
end;
/

drop sequence rev_seq;
create sequence rev_seq
    start with 1
    increment by 1
    maxvalue 9999;
declare
    i number := 0;
    res number := 0;
begin
    for i in 1..410 loop
        insert into review values ('RA'||lpad(rev_seq.nextval, 3, 0),
                                random_review()
                                );
    end loop;
end;
/

drop sequence rev_seq;
create sequence rev_seq
    start with 1
    increment by 1
    maxvalue 9999;
declare
    i number := 0;
    res number := 0;
begin
    for i in 1..280 loop
        insert into review values ('RB'||lpad(rev_seq.nextval, 3, 0),
                                random_review()
                                );
    end loop;
end;
/