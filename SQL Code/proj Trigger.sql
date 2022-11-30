--예약변경 트리거
create or replace trigger res_change
after update on reservation
for each row
    begin
    dbms_output.put_line('예약 번호: '||:OLD.res_no);
    dbms_output.put_line('예약 시술: '||:OLD.res_mn_no||' -> '||:NEW.res_mn_no);
    dbms_output.put_line('예약 날짜: '||:OLD.res_time||' -> '||:NEW.res_time);
    dbms_output.put_line('예약 정보가 변경되었습니다.');
    end;
/

--신규예약 트리거
create or replace trigger res_new
after insert on reservation
for each row
    begin
    if inserting then
        dbms_output.put_line('신규 예약이 접수되었습니다.');
        dbms_output.put_line('예약 번호: '||:NEW.res_no);
        dbms_output.put_line('고객 번호: '||:NEW.res_mem_no);
        dbms_output.put_line('예약 시술: '||:NEW.res_mn_no);
        dbms_output.put_line('담당 디자이너: '||:NEW.res_des_no);
        dbms_output.put_line('예약일: '||:NEW.res_time);
    end if;
    end;
/


--신규회원 트리거
create or replace trigger mem_new
after insert on membership
for each row
    begin
    if inserting then
        dbms_output.put_line('신규 회원이 등록되었습니다.');
        dbms_output.put_line('회원 번호: '||:NEW.mem_no);
        dbms_output.put_line('고객 성함: '||:NEW.mem_name);
        dbms_output.put_line('성별: '||:NEW.mem_gender);
        dbms_output.put_line('생일: '||:NEW.mem_bday);
        dbms_output.put_line('연락처: '||:NEW.mem_tel);
        dbms_output.put_line('선호 디자이너: '||:NEW.mem_des_no);
    end if;
    end;
/


--회원 삭제 트리거
create or replace trigger mem_del
after delete on membership
for each row
    begin
    if deleting then
        dbms_output.put_line('회원정보가 삭제되었습니다.');
        dbms_output.put_line('회원 번호: '||:OLD.mem_no);
        dbms_output.put_line('고객 성함: '||:OLD.mem_name);
        dbms_output.put_line('성별: '||:OLD.mem_gender);
        dbms_output.put_line('생일: '||:OLD.mem_bday);
        dbms_output.put_line('연락처: '||:OLD.mem_tel);
        dbms_output.put_line('선호 디자이너: '||:OLD.mem_des_no);
    end if;
    end;
/


--예약 취소 트리거
create or replace trigger res_cancel
after delete on reservation
for each row
    begin
    if deleting then
        dbms_output.put_line('예약이 취소되었습니다.');
        dbms_output.put_line('예약 번호: '||:OLD.res_no);
        dbms_output.put_line('고객 번호: '||:OLD.res_mem_no);
        dbms_output.put_line('예약 시술: '||:OLD.res_mn_no);
        dbms_output.put_line('담당 디자이너: '||:OLD.res_des_no);
        dbms_output.put_line('예약일: '||:OLD.res_time);
    end if;
    end;
/