drop sequence mem_seq;
drop sequence des_seq;
drop sequence mn_seq;
drop sequence ord_seq;
drop sequence pro_seq;
drop sequence res_seq;
drop sequence rev_seq;
drop sequence order_seq;

create sequence mem_seq
    start with 1
    increment by 1
    minvalue 1
    maxvalue 9999;
    
create sequence des_seq
    start with 1
    increment by 1
    minvalue 1
    maxvalue 9999;
    
create sequence mn_seq
    start with 1
    increment by 1
    minvalue 1
    maxvalue 9999;
    
create sequence ord_seq
    start with 1
    increment by 1
    minvalue 1
    maxvalue 9999;
    
create sequence pro_seq
    start with 1
    increment by 1
    minvalue 1
    maxvalue 9999;
    
create sequence res_seq
    start with 1
    increment by 1
    maxvalue 9999;    
    
create sequence rev_seq
    start with 1
    increment by 1
    maxvalue 9999;
    
create sequence order_seq
    start with 1
    increment by 1
    minvalue 1
    maxvalue 9999;