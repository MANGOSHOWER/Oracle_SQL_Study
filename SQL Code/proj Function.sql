--���� ��ȭ��ȣ ���� �Լ�
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

--���� ��¥ ���� �Լ�
CREATE OR REPLACE FUNCTION RANDOM_DATE
    RETURN VARCHAR2
IS
    RANDDATE VARCHAR2(20);
BEGIN
    SELECT replace(to_char(TO_DATE(trunc(dbms_random.value(to_char(DATE '2015-01-01', 'J'),
                                                       to_char(DATE '2020-12-31', 'J'))), 'J')), '-', '/') INTO RANDDATE
    FROM dual;
    RETURN RANDDATE;
END;
/

--���� ���� ���� �Լ�
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


--���� �̸� ���� �Լ�
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


--���� ���� ���� �Լ�
create or replace function random_gender
    return varchar2
is
    randgen varchar2(1);
begin
    select case when floor(dbms_random.value(1, 3)) >= 2 then 'F'
                when floor(dbms_random.value(1, 3)) >= 1 then 'M'
                end
            into randgen
            from dual;
       return randgen;
end;
/


--���� ���� ���� �Լ�
create or replace function random_holiday
    return varchar2
is
    randholi varchar2(10);
begin
    select case when floor(dbms_random.value(1, 8)) >= 7 then '������'
                when floor(dbms_random.value(1, 8)) >= 6 then 'ȭ����'
                when floor(dbms_random.value(1, 8)) >= 5 then '������'
                when floor(dbms_random.value(1, 8)) >= 4 then '�����'
                when floor(dbms_random.value(1, 8)) >= 3 then '�ݿ���'
                when floor(dbms_random.value(1, 8)) >= 2 then '�����'
                when floor(dbms_random.value(1, 8)) >= 1 then '�Ͽ���'
                end
    into randholi from dual;
    return randholi;
end;
/

--���� �������� �Լ�
create or replace function random_review
    return number
is
    randscore number(1, 0);
begin
    select case when floor(dbms_random.value(1, 11)) >= 3 then case when floor(dbms_random.value(1, 6)) >= 3 then 5 when floor(dbms_random.value(1, 6)) >= 1 then 4 end
                when floor(dbms_random.value(1, 11)) >= 2 then case when floor(dbms_random.value(1, 6)) >= 3 then 5 when floor(dbms_random.value(1, 6)) >= 1 then 3 end
                when floor(dbms_random.value(1, 11)) >= 1 then case when floor(dbms_random.value(1, 6)) >= 5 then 3 when floor(dbms_random.value(1, 6)) >= 1 then 1 end
                end
    into randscore from dual;
    return randscore;
end;
/

--�Ϻη� ���� ���������� ������ �ϴ� �Լ�
create or replace function random_review_low
    return number
is
    randscore number(1, 0);
begin
    select case when floor(dbms_random.value(1, 11)) >= 8 then case when floor(dbms_random.value(1, 6)) >= 6 then 5 when floor(dbms_random.value(1, 6)) >= 1 then 4 end
                when floor(dbms_random.value(1, 11)) >= 6 then case when floor(dbms_random.value(1, 6)) >= 3 then 5 when floor(dbms_random.value(1, 6)) >= 1 then 3 end
                when floor(dbms_random.value(1, 11)) >= 1 then case when floor(dbms_random.value(1, 6)) >= 6 then 2 when floor(dbms_random.value(1, 6)) >= 1 then 1 end
                end
    into randscore from dual;
    return randscore;
end;
/