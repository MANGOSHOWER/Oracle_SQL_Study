-- ���̺� ������ ���踦 ����Ͽ� �� ���� �����ص� ������ �߻����� �ʰ� ���ĵǾ����ϴ�.

-- Product Table Create SQL
CREATE TABLE Product
(
    PRO_NO       VARCHAR2(5)     NOT NULL, 
    PRO_NAME     VARCHAR2(40)    NOT NULL, 
    PRO_PRICE    NUMBER(7, 0)    NOT NULL, 
    PRO_STOCK    NUMBER(5, 0)    NOT NULL, 
     PRIMARY KEY (PRO_NO)
)
/

COMMENT ON TABLE Product IS '��ǰ����'
/

COMMENT ON COLUMN Product.PRO_NO IS '�����ǰ��ȣ'
/

COMMENT ON COLUMN Product.PRO_NAME IS '��ǰ��'
/

COMMENT ON COLUMN Product.PRO_PRICE IS '��ǰ����'
/

COMMENT ON COLUMN Product.PRO_STOCK IS '���'
/


-- Designer Table Create SQL
CREATE TABLE Designer
(
    DES_NO          VARCHAR2(5)      NOT NULL, 
    DES_NAME        VARCHAR2(20)     NOT NULL, 
    DES_GENDER      VARCHAR2(1)      NOT NULL, 
    DES_TEL         VARCHAR2(20)     NOT NULL, 
    DES_HIREDATE    DATE             NOT NULL, 
    DES_POSITION    VARCHAR2(20)     NOT NULL, 
    DES_HOLIDAY     VARCHAR2(10)     NOT NULL, 
    DES_SALARY      NUMBER(15, 0)    NOT NULL, 
     PRIMARY KEY (DES_NO)
)
/

COMMENT ON TABLE Designer IS '�������̳�'
/

COMMENT ON COLUMN Designer.DES_NO IS '�����̳ʹ�ȣ'
/

COMMENT ON COLUMN Designer.DES_NAME IS '�����̳��̸�'
/

COMMENT ON COLUMN Designer.DES_GENDER IS '����'
/

COMMENT ON COLUMN Designer.DES_TEL IS '����ó'
/

COMMENT ON COLUMN Designer.DES_HIREDATE IS '�Ի���'
/

COMMENT ON COLUMN Designer.DES_POSITION IS '����'
/

COMMENT ON COLUMN Designer.DES_HOLIDAY IS '�޹���'
/

COMMENT ON COLUMN Designer.DES_SALARY IS '�޿�'
/


-- Membership Table Create SQL
CREATE TABLE Membership
(
    MEM_NO        VARCHAR2(5)     NOT NULL, 
    MEM_NAME      VARCHAR2(20)    NOT NULL, 
    MEM_GENDER    VARCHAR2(1)     NOT NULL, 
    MEM_BDAY      DATE            NOT NULL, 
    MEM_TEL       VARCHAR2(20)    NOT NULL, 
    MEM_DES_NO    VARCHAR2(5)     NOT NULL, 
     PRIMARY KEY (MEM_NO)
)
/

COMMENT ON TABLE Membership IS 'ȸ��'
/

COMMENT ON COLUMN Membership.MEM_NO IS 'ȸ����ȣ'
/

COMMENT ON COLUMN Membership.MEM_NAME IS 'ȸ���̸�'
/

COMMENT ON COLUMN Membership.MEM_GENDER IS '����'
/

COMMENT ON COLUMN Membership.MEM_BDAY IS '����'
/

COMMENT ON COLUMN Membership.MEM_TEL IS '����ó'
/

COMMENT ON COLUMN Membership.MEM_DES_NO IS '��ȣ�����̳�'
/

ALTER TABLE Membership
    ADD CONSTRAINT FK_Membership_MEM_DES_NO_Designer_DES_NO FOREIGN KEY (MEM_DES_NO)
        REFERENCES Designer (DES_NO) 
/


-- Menu Table Create SQL
CREATE TABLE Menu
(
    MN_NO        VARCHAR2(5)     NOT NULL, 
    MN_NAME      VARCHAR2(40)    NOT NULL, 
    MN_PRICE     NUMBER(6, 0)    NOT NULL, 
    MN_PRO_NO    VARCHAR2(5)     NOT NULL, 
    MN_HOURS     NUMBER(1, 0)    NOT NULL, 
     PRIMARY KEY (MN_NO)
)
/

COMMENT ON TABLE Menu IS '�ü��޴�'
/

COMMENT ON COLUMN Menu.MN_NO IS '�ü���ȣ'
/

COMMENT ON COLUMN Menu.MN_NAME IS '�ü���'
/

COMMENT ON COLUMN Menu.MN_PRICE IS '�ü�����'
/

COMMENT ON COLUMN Menu.MN_PRO_NO IS '�����ǰ��ȣ'
/

COMMENT ON COLUMN Menu.MN_HOURS IS '�ҿ�ð�'
/

ALTER TABLE Menu
    ADD CONSTRAINT FK_Menu_MN_PRO_NO_Product_PRO_NO FOREIGN KEY (MN_PRO_NO)
        REFERENCES Product (PRO_NO) 
/


-- Reservation Table Create SQL
CREATE TABLE Reservation
(
    RES_NO          VARCHAR2(5)    NOT NULL, 
    RES_MEM_NO      VARCHAR2(5)    NOT NULL, 
    RES_DES_NO      VARCHAR2(5)    NOT NULL, 
    RES_MN_NO       VARCHAR2(5)    NOT NULL, 
    RES_TIME        TIMESTAMP      NOT NULL, 
    RES_COMPLETE    VARCHAR2(1)    NOT NULL, 
     PRIMARY KEY (RES_NO)
)
/

COMMENT ON TABLE Reservation IS '���ฮ��Ʈ'
/

COMMENT ON COLUMN Reservation.RES_NO IS '�����ȣ'
/

COMMENT ON COLUMN Reservation.RES_MEM_NO IS 'ȸ����ȣ'
/

COMMENT ON COLUMN Reservation.RES_DES_NO IS '�����̳ʹ�ȣ'
/

COMMENT ON COLUMN Reservation.RES_MN_NO IS '�ü���ȣ'
/

COMMENT ON COLUMN Reservation.RES_TIME IS '��������'
/

COMMENT ON COLUMN Reservation.RES_COMPLETE IS '�ü�����'
/

ALTER TABLE Reservation
    ADD CONSTRAINT FK_Reservation_RES_MEM_NO_Membership_MEM_NO FOREIGN KEY (RES_MEM_NO)
        REFERENCES Membership (MEM_NO) 
/

ALTER TABLE Reservation
    ADD CONSTRAINT FK_Reservation_RES_DES_NO_Designer_DES_NO FOREIGN KEY (RES_DES_NO)
        REFERENCES Designer (DES_NO) 
/

ALTER TABLE Reservation
    ADD CONSTRAINT FK_Reservation_RES_MN_NO_Menu_MN_NO FOREIGN KEY (RES_MN_NO)
        REFERENCES Menu (MN_NO) 
/


-- Review Table Create SQL
CREATE TABLE Review
(
    REV_NO       VARCHAR2(5)     NOT NULL, 
    REV_SCORE    NUMBER(1, 0)    NOT NULL, 
     PRIMARY KEY (REV_NO)
)
/

COMMENT ON TABLE Review IS '�ı�'
/

COMMENT ON COLUMN Review.REV_NO IS '�ı��ȣ'
/

COMMENT ON COLUMN Review.REV_SCORE IS '����'
/

ALTER TABLE Review
    ADD CONSTRAINT FK_Review_REV_NO_Reservation_RES_NO FOREIGN KEY (REV_NO)
        REFERENCES Reservation (RES_NO) 
/


-- Orderlist Table Create SQL
CREATE TABLE Orderlist
(
    ORD_NO          VARCHAR2(5)      NOT NULL, 
    ORD_PRO_NO      VARCHAR2(5)      NOT NULL, 
    ORD_QUANTITY    NUMBER(3, 0)     NOT NULL, 
    ORD_PRICE       NUMBER(15, 0)    NOT NULL, 
     PRIMARY KEY (ORD_NO)
)
/

COMMENT ON TABLE Orderlist IS '����'
/

COMMENT ON COLUMN Orderlist.ORD_NO IS '�ֹ���ȣ'
/

COMMENT ON COLUMN Orderlist.ORD_PRO_NO IS '��ǰ��ȣ'
/

COMMENT ON COLUMN Orderlist.ORD_QUANTITY IS '�ֹ�����'
/

COMMENT ON COLUMN Orderlist.ORD_PRICE IS '�ֹ�����'
/

ALTER TABLE Orderlist
    ADD CONSTRAINT FK_Orderlist_ORD_PRO_NO_Product_PRO_NO FOREIGN KEY (ORD_PRO_NO)
        REFERENCES Product (PRO_NO) 
/


alter table designer
    add constraint designer_gender_check_in_f_or_m check(des_gender in ('F', 'M'));
    
alter table membership
    add constraint member_gender_check_in_f_or_m check(mem_gender in ('F', 'M'));
    
alter table reservation
    modify (res_complete default 'N');
    
alter table reservation
    add constraint reservation_complete_check_in_y_or_n check(res_complete in ('Y', 'N'));