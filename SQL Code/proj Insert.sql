--�����̳� ������
insert into designer values ('D'||lpad(des_seq.nextval, 4, 0),
                             random_name(), random_gender(),
                             random_phone(), '14-12-13', '����',
                             random_holiday(), 0);
insert into designer values ('D'||lpad(des_seq.nextval, 4, 0),
                             random_name(), random_gender(),
                             random_phone(), random_date(), '����',
                             random_holiday(), 3000000);
insert into designer values ('D'||lpad(des_seq.nextval, 4, 0),
                             random_name(), random_gender(),
                             random_phone(), random_date(), '�����̳�',
                             random_holiday(), 2500000);
insert into designer values ('D'||lpad(des_seq.nextval, 4, 0), 
                             random_name(), random_gender(),
                             random_phone(), random_date(), '�����̳�',
                             random_holiday(), 2500000);
insert into designer values ('D'||lpad(des_seq.nextval, 4, 0),
                             random_name(), random_gender(),
                             random_phone(), random_date(), '�����̳�',
                             random_holiday(), 2500000);

--�� ������
declare
    i number := 0;
    res number := 0;
begin
    for i in 1..300 loop
        insert into membership values
                ('M'||lpad(mem_seq.nextval, 4, 0),
                random_name(),
                random_gender(),
                random_birth(),
                random_phone(),
                'D'||lpad(floor(dbms_random.value(1, 6)), 4, '0')
                );
    end loop;
end;
/


--�Ҹ�ǰ ������
insert into product values ('P'||lpad(pro_seq.nextval, 4, 0), '��Ǫ', 12000, 30);
insert into product values ('P'||lpad(pro_seq.nextval, 4, 0), 'Ʈ��Ʈ��Ʈ', 20000, 30);
insert into product values ('P'||lpad(pro_seq.nextval, 4, 0), '������', 8000, 5);
insert into product values ('P'||lpad(pro_seq.nextval, 4, 0), '�ٿ��߾�', 7000, 5);
insert into product values ('P'||lpad(pro_seq.nextval, 4, 0), '�Ϲ��߾�', 8000, 5);
insert into product values ('P'||lpad(pro_seq.nextval, 4, 0), '����������', 18000, 5);
insert into product values ('P'||lpad(pro_seq.nextval, 4, 0), '��Ÿ���߾�', 7000, 2);
insert into product values ('P'||lpad(pro_seq.nextval, 4, 0), '���úν���', 7000, 4);


--�ü� ������
insert into menu values ('H'||lpad(mn_seq.nextval, 4, 0), '���� ��', 20000, NULL, 1);
insert into menu values ('H'||lpad(mn_seq.nextval, 4, 0), '���� ��', 15000, NULL, 1);
insert into menu values ('H'||lpad(mn_seq.nextval, 4, 0), '���� ��+�ٿ���', 35000, 'P0004', 2);
insert into menu values ('H'||lpad(mn_seq.nextval, 4, 0), '���� �ոӸ���', 3000, NULL, 1);
insert into menu values ('H'||lpad(mn_seq.nextval, 4, 0), '���� �Ϲ� ��', 65000, 'P0005', 2);
insert into menu values ('H'||lpad(mn_seq.nextval, 4, 0), '���� ��Ÿ�� ��', 70000, 'P0007', 3);
insert into menu values ('H'||lpad(mn_seq.nextval, 4, 0), '���� ��', 70000, 'P0005', 2);
insert into menu values ('H'||lpad(mn_seq.nextval, 4, 0), '�Ѹ�����', 90000, 'P0006', 2);
insert into menu values ('H'||lpad(mn_seq.nextval, 4, 0), '��������', 140000, 'P0006', 4);
insert into menu values ('H'||lpad(mn_seq.nextval, 4, 0), '��������', 120000, 'P0007', 3);
insert into menu values ('H'||lpad(mn_seq.nextval, 4, 0), '��ߺν���Ŭ����', 50000, 'P0008', 1);
insert into menu values ('H'||lpad(mn_seq.nextval, 4, 0), '�ü��ν���Ŭ����', 30000, 'P0008', 1);
insert into menu values ('H'||lpad(mn_seq.nextval, 4, 0), '��Ǫ�����', 10000, NULL, 1);
insert into menu values ('H'||lpad(mn_seq.nextval, 4, 0), '��Ÿ�ϸ� �����', 25000, NULL, 1);
insert into menu values ('H'||lpad(mn_seq.nextval, 4, 0), '���̷� �����', 35000, NULL, 1);
insert into menu values ('H'||lpad(mn_seq.nextval, 4, 0), '�Ѹ�����', 45000, 'P0003', 1);
insert into menu values ('H'||lpad(mn_seq.nextval, 4, 0), '���� ����', 50000, 'P0003', 1);
insert into menu values ('H'||lpad(mn_seq.nextval, 4, 0), '���� ����(�ܹ�)', 60000, 'P0003', 1);
insert into menu values ('H'||lpad(mn_seq.nextval, 4, 0), '���� ����(���)', 90000, 'P0003', 2);
insert into menu values ('H'||lpad(mn_seq.nextval, 4, 0), '���̶���Ʈ�÷�', 100000, 'P0003', 3);

--�ֹ���� ���ϱ�
select product.pro_no ��ǰ��ȣ, ceil(count(*)/product.pro_stock) �ֹ�����, product.pro_price*(ceil(count(*)/product.pro_stock)) �ֹ����
    from reservation
    inner join menu
        on reservation.res_mn_no = menu.mn_no
    inner join product  
        on menu.mn_pro_no = product.pro_no
    where extract(month from reservation.res_time) = 7
    group by product.pro_no, product.pro_stock, product.pro_price
    ORDER BY PRODUCT.PRO_NO;
    
insert into orderlist values ('O7001', '22-07-01', 'P0003', 22, 176000);
insert into orderlist values ('O7002', '22-07-01', 'P0004', 6, 42000);
insert into orderlist values ('O7003', '22-07-01', 'P0005', 9, 72000);
insert into orderlist values ('O7004', '22-07-01', 'P0006', 7, 126000);
insert into orderlist values ('O7005', '22-07-01', 'P0007', 21, 147000);
insert into orderlist values ('O7006', '22-07-01', 'P0008', 11, 77000);

insert into orderlist values ('O8001', '22-08-01', 'P0003', 22, 176000);
insert into orderlist values ('O8002', '22-08-01', 'P0004', 4, 28000);
insert into orderlist values ('O8003', '22-08-01', 'P0005', 10, 80000);
insert into orderlist values ('O8004', '22-08-01', 'P0006', 7, 126000);
insert into orderlist values ('O8005', '22-08-01', 'P0007', 19, 133000);
insert into orderlist values ('O8006', '22-08-01', 'P0008', 11, 77000);

insert into orderlist values ('O9001', '22-09-01', 'P0003', 26, 208000);
insert into orderlist values ('O9002', '22-09-01', 'P0004', 4, 28000);
insert into orderlist values ('O9003', '22-09-01', 'P0005', 8, 64000);
insert into orderlist values ('O9004', '22-09-01', 'P0006', 9, 162000);
insert into orderlist values ('O9005', '22-09-01', 'P0007', 20, 140000);
insert into orderlist values ('O9006', '22-09-01', 'P0008', 12, 84000);

insert into orderlist values ('OA001', '22-10-01', 'P0003', 19, 152000);
insert into orderlist values ('OA002', '22-10-01', 'P0004', 3, 21000);
insert into orderlist values ('OA003', '22-10-01', 'P0005', 9, 72000);
insert into orderlist values ('OA004', '22-10-01', 'P0006', 8, 144000);
insert into orderlist values ('OA005', '22-10-01', 'P0007', 25, 175000);
insert into orderlist values ('OA006', '22-10-01', 'P0008', 11, 77000);


--���� ������
declare
    i number := 0;
    res number := 0;
begin
    for i in 1..20 loop
        insert into reservation values ('R'||lpad(res_seq.nextval, 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 301)), 4, 0),
                                'D'||lpad(floor(dbms_random.value(1, 6)), 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 21)), 4, 0),
                                '22-10-01',
                                'Y');
    end loop;
end;
/
declare
    i number := 0;
    res number := 0;
begin
    for i in 1..20 loop
        insert into reservation values ('R'||lpad(res_seq.nextval, 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 301)), 4, 0),
                                'D'||lpad(floor(dbms_random.value(1, 6)), 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 21)), 4, 0),
                                '22-10-02',
                                'Y');
    end loop;
end;
/
declare
    i number := 0;
    res number := 0;
begin
    for i in 1..10 loop
        insert into reservation values ('R'||lpad(res_seq.nextval, 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 301)), 4, 0),
                                'D'||lpad(floor(dbms_random.value(1, 6)), 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 21)), 4, 0),
                                '22-10-03',
                                'Y');
    end loop;
end;
/
declare
    i number := 0;
    res number := 0;
begin
    for i in 1..10 loop
        insert into reservation values ('R'||lpad(res_seq.nextval, 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 301)), 4, 0),
                                'D'||lpad(floor(dbms_random.value(1, 6)), 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 21)), 4, 0),
                                '22-10-04',
                                'Y');
    end loop;
end;
/
declare
    i number := 0;
    res number := 0;
begin
    for i in 1..10 loop
        insert into reservation values ('R'||lpad(res_seq.nextval, 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 301)), 4, 0),
                                'D'||lpad(floor(dbms_random.value(1, 6)), 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 21)), 4, 0),
                                '22-10-05',
                                'Y');
    end loop;
end;
/
declare
    i number := 0;
    res number := 0;
begin
    for i in 1..10 loop
        insert into reservation values ('R'||lpad(res_seq.nextval, 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 301)), 4, 0),
                                'D'||lpad(floor(dbms_random.value(1, 6)), 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 21)), 4, 0),
                                '22-10-06',
                                'Y');
    end loop;
end;
/
declare
    i number := 0;
    res number := 0;
begin
    for i in 1..10 loop
        insert into reservation values ('R'||lpad(res_seq.nextval, 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 301)), 4, 0),
                                'D'||lpad(floor(dbms_random.value(1, 6)), 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 21)), 4, 0),
                                '22-10-07',
                                'Y');
    end loop;
end;
/
declare
    i number := 0;
    res number := 0;
begin
    for i in 1..20 loop
        insert into reservation values ('R'||lpad(res_seq.nextval, 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 301)), 4, 0),
                                'D'||lpad(floor(dbms_random.value(1, 6)), 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 21)), 4, 0),
                                '22-10-08',
                                'Y');
    end loop;
end;
/
declare
    i number := 0;
    res number := 0;
begin
    for i in 1..20 loop
        insert into reservation values ('R'||lpad(res_seq.nextval, 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 301)), 4, 0),
                                'D'||lpad(floor(dbms_random.value(1, 6)), 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 21)), 4, 0),
                                '22-10-09',
                                'Y');
    end loop;
end;
/
declare
    i number := 0;
    res number := 0;
begin
    for i in 1..10 loop
        insert into reservation values ('R'||lpad(res_seq.nextval, 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 301)), 4, 0),
                                'D'||lpad(floor(dbms_random.value(1, 6)), 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 21)), 4, 0),
                                '22-10-10',
                                'Y');
    end loop;
end;
/
declare
    i number := 0;
    res number := 0;
begin
    for i in 1..10 loop
        insert into reservation values ('R'||lpad(res_seq.nextval, 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 301)), 4, 0),
                                'D'||lpad(floor(dbms_random.value(1, 6)), 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 21)), 4, 0),
                                '22-10-11',
                                'Y');
    end loop;
end;
/
declare
    i number := 0;
    res number := 0;
begin
    for i in 1..10 loop
        insert into reservation values ('R'||lpad(res_seq.nextval, 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 301)), 4, 0),
                                'D'||lpad(floor(dbms_random.value(1, 6)), 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 21)), 4, 0),
                                '22-10-12',
                                'Y');
    end loop;
end;
/
declare
    i number := 0;
    res number := 0;
begin
    for i in 1..10 loop
        insert into reservation values ('R'||lpad(res_seq.nextval, 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 301)), 4, 0),
                                'D'||lpad(floor(dbms_random.value(1, 6)), 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 21)), 4, 0),
                                '22-10-13',
                                'Y');
    end loop;
end;
/
declare
    i number := 0;
    res number := 0;
begin
    for i in 1..10 loop
        insert into reservation values ('R'||lpad(res_seq.nextval, 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 301)), 4, 0),
                                'D'||lpad(floor(dbms_random.value(1, 6)), 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 21)), 4, 0),
                                '22-10-14',
                                'Y');
    end loop;
end;
/
declare
    i number := 0;
    res number := 0;
begin
    for i in 1..20 loop
        insert into reservation values ('R'||lpad(res_seq.nextval, 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 301)), 4, 0),
                                'D'||lpad(floor(dbms_random.value(1, 6)), 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 21)), 4, 0),
                                '22-10-15',
                                'Y');
    end loop;
end;
/
declare
    i number := 0;
    res number := 0;
begin
    for i in 1..20 loop
        insert into reservation values ('R'||lpad(res_seq.nextval, 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 301)), 4, 0),
                                'D'||lpad(floor(dbms_random.value(1, 6)), 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 21)), 4, 0),
                                '22-10-16',
                                'Y');
    end loop;
end;
/
declare
    i number := 0;
    res number := 0;
begin
    for i in 1..10 loop
        insert into reservation values ('R'||lpad(res_seq.nextval, 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 301)), 4, 0),
                                'D'||lpad(floor(dbms_random.value(1, 6)), 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 21)), 4, 0),
                                '22-10-17',
                                'Y');
    end loop;
end;
/
declare
    i number := 0;
    res number := 0;
begin
    for i in 1..10 loop
        insert into reservation values ('R'||lpad(res_seq.nextval, 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 301)), 4, 0),
                                'D'||lpad(floor(dbms_random.value(1, 6)), 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 21)), 4, 0),
                                '22-10-18',
                                'Y');
    end loop;
end;
/
declare
    i number := 0;
    res number := 0;
begin
    for i in 1..10 loop
        insert into reservation values ('R'||lpad(res_seq.nextval, 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 301)), 4, 0),
                                'D'||lpad(floor(dbms_random.value(1, 6)), 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 21)), 4, 0),
                                '22-10-19',
                                'Y');
    end loop;
end;
/
declare
    i number := 0;
    res number := 0;
begin
    for i in 1..10 loop
        insert into reservation values ('R'||lpad(res_seq.nextval, 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 301)), 4, 0),
                                'D'||lpad(floor(dbms_random.value(1, 6)), 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 21)), 4, 0),
                                '22-10-20',
                                'Y');
    end loop;
end;
/
declare
    i number := 0;
    res number := 0;
begin
    for i in 1..10 loop
        insert into reservation values ('R'||lpad(res_seq.nextval, 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 301)), 4, 0),
                                'D'||lpad(floor(dbms_random.value(1, 6)), 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 21)), 4, 0),
                                '22-10-21',
                                'Y');
    end loop;
end;
/
declare
    i number := 0;
    res number := 0;
begin
    for i in 1..20 loop
        insert into reservation values ('R'||lpad(res_seq.nextval, 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 301)), 4, 0),
                                'D'||lpad(floor(dbms_random.value(1, 6)), 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 21)), 4, 0),
                                '22-10-22',
                                'Y');
    end loop;
end;
/
declare
    i number := 0;
    res number := 0;
begin
    for i in 1..20 loop
        insert into reservation values ('R'||lpad(res_seq.nextval, 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 301)), 4, 0),
                                'D'||lpad(floor(dbms_random.value(1, 6)), 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 21)), 4, 0),
                                '22-10-23',
                                'Y');
    end loop;
end;
/
declare
    i number := 0;
    res number := 0;
begin
    for i in 1..10 loop
        insert into reservation values ('R'||lpad(res_seq.nextval, 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 301)), 4, 0),
                                'D'||lpad(floor(dbms_random.value(1, 6)), 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 21)), 4, 0),
                                '22-10-24',
                                'Y');
    end loop;
end;
/
declare
    i number := 0;
    res number := 0;
begin
    for i in 1..10 loop
        insert into reservation values ('R'||lpad(res_seq.nextval, 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 301)), 4, 0),
                                'D'||lpad(floor(dbms_random.value(1, 6)), 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 21)), 4, 0),
                                '22-10-25',
                                'Y');
    end loop;
end;
/
declare
    i number := 0;
    res number := 0;
begin
    for i in 1..10 loop
        insert into reservation values ('R'||lpad(res_seq.nextval, 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 301)), 4, 0),
                                'D'||lpad(floor(dbms_random.value(1, 6)), 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 21)), 4, 0),
                                '22-10-26',
                                'Y');
    end loop;
end;
/
declare
    i number := 0;
    res number := 0;
begin
    for i in 1..10 loop
        insert into reservation values ('R'||lpad(res_seq.nextval, 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 301)), 4, 0),
                                'D'||lpad(floor(dbms_random.value(1, 6)), 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 21)), 4, 0),
                                '22-10-27',
                                'Y');
    end loop;
end;
/
declare
    i number := 0;
    res number := 0;
begin
    for i in 1..10 loop
        insert into reservation values ('R'||lpad(res_seq.nextval, 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 301)), 4, 0),
                                'D'||lpad(floor(dbms_random.value(1, 6)), 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 21)), 4, 0),
                                '22-10-28',
                                'Y');
    end loop;
end;
/
declare
    i number := 0;
    res number := 0;
begin
    for i in 1..20 loop
        insert into reservation values ('R'||lpad(res_seq.nextval, 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 301)), 4, 0),
                                'D'||lpad(floor(dbms_random.value(1, 6)), 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 21)), 4, 0),
                                '22-10-29',
                                'Y');
    end loop;
end;
/
declare
    i number := 0;
    res number := 0;
begin
    for i in 1..20 loop
        insert into reservation values ('R'||lpad(res_seq.nextval, 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 301)), 4, 0),
                                'D'||lpad(floor(dbms_random.value(1, 6)), 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 21)), 4, 0),
                                '22-10-30',
                                'Y');
    end loop;
end;
/
declare
    i number := 0;
    res number := 0;
begin
    for i in 1..10 loop
        insert into reservation values ('R'||lpad(res_seq.nextval, 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 301)), 4, 0),
                                'D'||lpad(floor(dbms_random.value(1, 6)), 4, 0),
                                'M'||lpad(floor(dbms_random.value(1, 21)), 4, 0),
                                '22-10-31',
                                'Y');
    end loop;
end;
/



declare
    i number := 0;
    res number := 0;
begin
    for i in 1..810 loop
        insert into review values ('R'||lpad(rev_seq.nextval, 4, 0), random_review());
    end loop;
end;
/
