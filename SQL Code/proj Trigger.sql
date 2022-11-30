--���ຯ�� Ʈ����
create or replace trigger res_change
after update on reservation
for each row
    begin
    dbms_output.put_line('���� ��ȣ: '||:OLD.res_no);
    dbms_output.put_line('���� �ü�: '||:OLD.res_mn_no||' -> '||:NEW.res_mn_no);
    dbms_output.put_line('���� ��¥: '||:OLD.res_time||' -> '||:NEW.res_time);
    dbms_output.put_line('���� ������ ����Ǿ����ϴ�.');
    end;
/

--�űԿ��� Ʈ����
create or replace trigger res_new
after insert on reservation
for each row
    begin
    if inserting then
        dbms_output.put_line('�ű� ������ �����Ǿ����ϴ�.');
        dbms_output.put_line('���� ��ȣ: '||:NEW.res_no);
        dbms_output.put_line('�� ��ȣ: '||:NEW.res_mem_no);
        dbms_output.put_line('���� �ü�: '||:NEW.res_mn_no);
        dbms_output.put_line('��� �����̳�: '||:NEW.res_des_no);
        dbms_output.put_line('������: '||:NEW.res_time);
    end if;
    end;
/


--�ű�ȸ�� Ʈ����
create or replace trigger mem_new
after insert on membership
for each row
    begin
    if inserting then
        dbms_output.put_line('�ű� ȸ���� ��ϵǾ����ϴ�.');
        dbms_output.put_line('ȸ�� ��ȣ: '||:NEW.mem_no);
        dbms_output.put_line('�� ����: '||:NEW.mem_name);
        dbms_output.put_line('����: '||:NEW.mem_gender);
        dbms_output.put_line('����: '||:NEW.mem_bday);
        dbms_output.put_line('����ó: '||:NEW.mem_tel);
        dbms_output.put_line('��ȣ �����̳�: '||:NEW.mem_des_no);
    end if;
    end;
/


--ȸ�� ���� Ʈ����
create or replace trigger mem_del
after delete on membership
for each row
    begin
    if deleting then
        dbms_output.put_line('ȸ�������� �����Ǿ����ϴ�.');
        dbms_output.put_line('ȸ�� ��ȣ: '||:OLD.mem_no);
        dbms_output.put_line('�� ����: '||:OLD.mem_name);
        dbms_output.put_line('����: '||:OLD.mem_gender);
        dbms_output.put_line('����: '||:OLD.mem_bday);
        dbms_output.put_line('����ó: '||:OLD.mem_tel);
        dbms_output.put_line('��ȣ �����̳�: '||:OLD.mem_des_no);
    end if;
    end;
/


--���� ��� Ʈ����
create or replace trigger res_cancel
after delete on reservation
for each row
    begin
    if deleting then
        dbms_output.put_line('������ ��ҵǾ����ϴ�.');
        dbms_output.put_line('���� ��ȣ: '||:OLD.res_no);
        dbms_output.put_line('�� ��ȣ: '||:OLD.res_mem_no);
        dbms_output.put_line('���� �ü�: '||:OLD.res_mn_no);
        dbms_output.put_line('��� �����̳�: '||:OLD.res_des_no);
        dbms_output.put_line('������: '||:OLD.res_time);
    end if;
    end;
/