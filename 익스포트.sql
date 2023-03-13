--------------------------------------------------------
--  ������ ������ - ������-2��-27-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table T_SHOPPING_GOODS
--------------------------------------------------------

  CREATE TABLE "SCOTT"."T_SHOPPING_GOODS" 
   (	"GOODS_ID" NUMBER(20,0), 
	"GOODS_SORT" VARCHAR2(50 BYTE), 
	"GOODS_TITLE" VARCHAR2(100 BYTE), 
	"GOODS_WRITER" VARCHAR2(50 BYTE), 
	"GOODS_PUBLISHER" VARCHAR2(50 BYTE), 
	"GOODS_PRICE" NUMBER(10,0), 
	"GOODS_SALES_PRICE" NUMBER(10,0), 
	"GOODS_POINT" NUMBER(10,0), 
	"GOODS_PUBLISHED_DATE" DATE, 
	"GOODS_TOTAL_PAGE" NUMBER(5,0), 
	"GOODS_ISBN" VARCHAR2(50 BYTE), 
	"GOODS_DELIVERY_PRICE" NUMBER(10,0), 
	"GOODS_DELIVERY_DATE" DATE, 
	"GOODS_STATUS" VARCHAR2(50 BYTE), 
	"GOODS_INTRO" VARCHAR2(2000 BYTE), 
	"GOODS_WRITER_INTRO" VARCHAR2(2000 BYTE), 
	"GOODS_PUBLISHER_COMMENT" VARCHAR2(2000 BYTE), 
	"GOODS_RECOMMENDATION" VARCHAR2(2000 BYTE), 
	"GOODS_CONTENTS_ORDER" CLOB, 
	"GOODS_CREDATE" DATE DEFAULT sysdate
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" 
 LOB ("GOODS_CONTENTS_ORDER") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
REM INSERTING into SCOTT.T_SHOPPING_GOODS
SET DEFINE OFF;
Insert into SCOTT.T_SHOPPING_GOODS (GOODS_ID,GOODS_SORT,GOODS_TITLE,GOODS_WRITER,GOODS_PUBLISHER,GOODS_PRICE,GOODS_SALES_PRICE,GOODS_POINT,GOODS_PUBLISHED_DATE,GOODS_TOTAL_PAGE,GOODS_ISBN,GOODS_DELIVERY_PRICE,GOODS_DELIVERY_DATE,GOODS_STATUS,GOODS_INTRO,GOODS_WRITER_INTRO,GOODS_PUBLISHER_COMMENT,GOODS_RECOMMENDATION,GOODS_CREDATE) values (398,'���þȼŽ�','���þȼŽ� �κ�����ũ','admin','admin',30000,27000,1000,to_date('23/02/27','RR/MM/DD'),1000,'121212',2000,to_date('23/02/27','RR/MM/DD'),'bestseller','��ũ���� ���� ���þȼŽ�','��ũ���� ���� ���þȼŽ�','��ũ���� ���� ���þȼŽ�','��ũ���� ���� ���þȼŽ�',to_date('23/02/27','RR/MM/DD'));
Insert into SCOTT.T_SHOPPING_GOODS (GOODS_ID,GOODS_SORT,GOODS_TITLE,GOODS_WRITER,GOODS_PUBLISHER,GOODS_PRICE,GOODS_SALES_PRICE,GOODS_POINT,GOODS_PUBLISHED_DATE,GOODS_TOTAL_PAGE,GOODS_ISBN,GOODS_DELIVERY_PRICE,GOODS_DELIVERY_DATE,GOODS_STATUS,GOODS_INTRO,GOODS_WRITER_INTRO,GOODS_PUBLISHER_COMMENT,GOODS_RECOMMENDATION,GOODS_CREDATE) values (334,'���þȼŽ�','���þȼŽ� ��ũ','admin','admin',30000,27000,1000,to_date('23/02/27','RR/MM/DD'),1000,'121212',2000,to_date('23/02/27','RR/MM/DD'),'steadyseller','ȭ���� ��ũ���� ���þȼŽ�','ȭ���� ��ũ���� ���þȼŽ�','ȭ���� ��ũ���� ���þȼŽ�','ȭ���� ��ũ���� ���þȼŽ�',to_date('23/02/27','RR/MM/DD'));
Insert into SCOTT.T_SHOPPING_GOODS (GOODS_ID,GOODS_SORT,GOODS_TITLE,GOODS_WRITER,GOODS_PUBLISHER,GOODS_PRICE,GOODS_SALES_PRICE,GOODS_POINT,GOODS_PUBLISHED_DATE,GOODS_TOTAL_PAGE,GOODS_ISBN,GOODS_DELIVERY_PRICE,GOODS_DELIVERY_DATE,GOODS_STATUS,GOODS_INTRO,GOODS_WRITER_INTRO,GOODS_PUBLISHER_COMMENT,GOODS_RECOMMENDATION,GOODS_CREDATE) values (335,'�̴ϰź���','�̴ϰź��� �ڶ���ũ','admin','admin',29000,25000,1000,to_date('23/02/27','RR/MM/DD'),1000,'121212',2000,to_date('23/02/27','RR/MM/DD'),'newbook','�ź���� �ٸ� �ɵ���� �ٸ� ����ִ� �ɸ��� ������ �־��. �ź�, ��������, ��� �ñ��� ���� �ź�ο� ���濡�� �ɸ����� �ŷ����� �ź��� �Ȱ� �ּ���.','�ź���� �ٸ� �ɵ���� �ٸ� ����ִ� �ɸ��� ������ �־��. �ź�, ��������, ��� �ñ��� ���� �ź�ο� ���濡�� �ɸ����� �ŷ����� �ź��� �Ȱ� �ּ���.','�ź���� �ٸ� �ɵ���� �ٸ� ����ִ� �ɸ��� ������ �־��. �ź�, ��������, ��� �ñ��� ���� �ź�ο� ���濡�� �ɸ����� �ŷ����� �ź��� �Ȱ� �ּ���.','�ź���� �ٸ� �ɵ���� �ٸ� ����ִ� �ɸ��� ������ �־��. �ź�, ��������, ��� �ñ��� ���� �ź�ο� ���濡�� �ɸ����� �ŷ����� �ź��� �Ȱ� �ּ���.',to_date('23/02/27','RR/MM/DD'));
Insert into SCOTT.T_SHOPPING_GOODS (GOODS_ID,GOODS_SORT,GOODS_TITLE,GOODS_WRITER,GOODS_PUBLISHER,GOODS_PRICE,GOODS_SALES_PRICE,GOODS_POINT,GOODS_PUBLISHED_DATE,GOODS_TOTAL_PAGE,GOODS_ISBN,GOODS_DELIVERY_PRICE,GOODS_DELIVERY_DATE,GOODS_STATUS,GOODS_INTRO,GOODS_WRITER_INTRO,GOODS_PUBLISHER_COMMENT,GOODS_RECOMMENDATION,GOODS_CREDATE) values (336,'�̴ϵ��Ǵ�','�̴ϵ��Ǵ� �����','admin','admin',29000,25000,1000,to_date('23/02/27','RR/MM/DD'),1000,'121212',2000,to_date('23/02/27','RR/MM/DD'),'bestseller','����� �� ���� �̿��ϳ���,���, ����, ���� ����ġ �ʰ� �����Ӱ� ��ư��� ���� ����','����� �� ���� �̿��ϳ���,���, ����, ���� ����ġ �ʰ� �����Ӱ� ��ư��� ���� ����','����� �� ���� �̿��ϳ���,���, ����, ���� ����ġ �ʰ� �����Ӱ� ��ư��� ���� ����','����� �� ���� �̿��ϳ���,���, ����, ���� ����ġ �ʰ� �����Ӱ� ��ư��� ���� ����',to_date('23/02/27','RR/MM/DD'));
Insert into SCOTT.T_SHOPPING_GOODS (GOODS_ID,GOODS_SORT,GOODS_TITLE,GOODS_WRITER,GOODS_PUBLISHER,GOODS_PRICE,GOODS_SALES_PRICE,GOODS_POINT,GOODS_PUBLISHED_DATE,GOODS_TOTAL_PAGE,GOODS_ISBN,GOODS_DELIVERY_PRICE,GOODS_DELIVERY_DATE,GOODS_STATUS,GOODS_INTRO,GOODS_WRITER_INTRO,GOODS_PUBLISHER_COMMENT,GOODS_RECOMMENDATION,GOODS_CREDATE) values (337,'�����ö���','�����ö��� ���ο�','admin','admin',30000,27000,1000,to_date('23/02/27','RR/MM/DD'),1000,'121212',2000,to_date('23/02/27','RR/MM/DD'),'bestseller','�ŷ�, ��Ȥ �׸��� ��..','�ŷ�, ��Ȥ �׸��� ��..','�ŷ�, ��Ȥ �׸��� ��..','�ŷ�, ��Ȥ �׸��� ��..',to_date('23/02/27','RR/MM/DD'));
Insert into SCOTT.T_SHOPPING_GOODS (GOODS_ID,GOODS_SORT,GOODS_TITLE,GOODS_WRITER,GOODS_PUBLISHER,GOODS_PRICE,GOODS_SALES_PRICE,GOODS_POINT,GOODS_PUBLISHED_DATE,GOODS_TOTAL_PAGE,GOODS_ISBN,GOODS_DELIVERY_PRICE,GOODS_DELIVERY_DATE,GOODS_STATUS,GOODS_INTRO,GOODS_WRITER_INTRO,GOODS_PUBLISHER_COMMENT,GOODS_RECOMMENDATION,GOODS_CREDATE) values (338,'�����ö��� ','�����ö��� ����ũ','admin','admin',33000,28000,1000,to_date('23/02/27','RR/MM/DD'),1000,'121212',2000,to_date('23/02/27','RR/MM/DD'),'bestseller','�ŷ�, ��Ȥ �׸��� ��..','�ŷ�, ��Ȥ �׸��� ��..','�ŷ�, ��Ȥ �׸��� ��..','�ŷ�, ��Ȥ �׸��� ��..',to_date('23/02/27','RR/MM/DD'));
Insert into SCOTT.T_SHOPPING_GOODS (GOODS_ID,GOODS_SORT,GOODS_TITLE,GOODS_WRITER,GOODS_PUBLISHER,GOODS_PRICE,GOODS_SALES_PRICE,GOODS_POINT,GOODS_PUBLISHED_DATE,GOODS_TOTAL_PAGE,GOODS_ISBN,GOODS_DELIVERY_PRICE,GOODS_DELIVERY_DATE,GOODS_STATUS,GOODS_INTRO,GOODS_WRITER_INTRO,GOODS_PUBLISHER_COMMENT,GOODS_RECOMMENDATION,GOODS_CREDATE) values (339,'����','���� ��ũ','admin','admin',33000,28000,1000,to_date('23/02/27','RR/MM/DD'),1000,'121212',2000,to_date('23/02/27','RR/MM/DD'),'steadyseller','������ �ɸ��� ����, ���ɰ� ���� �ǹ̸� ���ϰ� �ֱ⵵ �մϴ�..','������ �ɸ��� ����, ���ɰ� ���� �ǹ̸� ���ϰ� �ֱ⵵ �մϴ�..','������ �ɸ��� ����, ���ɰ� ���� �ǹ̸� ���ϰ� �ֱ⵵ �մϴ�..','������ �ɸ��� ����, ���ɰ� ���� �ǹ̸� ���ϰ� �ֱ⵵ �մϴ�..',to_date('23/02/27','RR/MM/DD'));
Insert into SCOTT.T_SHOPPING_GOODS (GOODS_ID,GOODS_SORT,GOODS_TITLE,GOODS_WRITER,GOODS_PUBLISHER,GOODS_PRICE,GOODS_SALES_PRICE,GOODS_POINT,GOODS_PUBLISHED_DATE,GOODS_TOTAL_PAGE,GOODS_ISBN,GOODS_DELIVERY_PRICE,GOODS_DELIVERY_DATE,GOODS_STATUS,GOODS_INTRO,GOODS_WRITER_INTRO,GOODS_PUBLISHER_COMMENT,GOODS_RECOMMENDATION,GOODS_CREDATE) values (340,'�ɺ���','�ɺ��� ��ũ','admin','admin',30000,27000,1000,to_date('23/02/27','RR/MM/DD'),1000,'121212',2000,to_date('23/02/27','RR/MM/DD'),'steadyseller','�ɺ����� �ź��� ���ų� ����� ���� ������ ������ ���ϴ� �ͺ����̶�� �ɸ��� ������ �ֽ��ϴ�','�ɺ����� �ź��� ���ų� ����� ���� ������ ������ ���ϴ� �ͺ����̶�� �ɸ��� ������ �ֽ��ϴ�','�ɺ����� �ź��� ���ų� ����� ���� ������ ������ ���ϴ� �ͺ����̶�� �ɸ��� ������ �ֽ��ϴ�','�ɺ����� �ź��� ���ų� ����� ���� ������ ������ ���ϴ� �ͺ����̶�� �ɸ��� ������ �ֽ��ϴ�',to_date('23/02/27','RR/MM/DD'));
Insert into SCOTT.T_SHOPPING_GOODS (GOODS_ID,GOODS_SORT,GOODS_TITLE,GOODS_WRITER,GOODS_PUBLISHER,GOODS_PRICE,GOODS_SALES_PRICE,GOODS_POINT,GOODS_PUBLISHED_DATE,GOODS_TOTAL_PAGE,GOODS_ISBN,GOODS_DELIVERY_PRICE,GOODS_DELIVERY_DATE,GOODS_STATUS,GOODS_INTRO,GOODS_WRITER_INTRO,GOODS_PUBLISHER_COMMENT,GOODS_RECOMMENDATION,GOODS_CREDATE) values (341,'�ƽ�ƿ��','�ƽ�ƿ�� ȭ��Ʈ','admin','admin',30000,27000,1000,to_date('23/02/27','RR/MM/DD'),1000,'121212',2000,to_date('23/02/27','RR/MM/DD'),'steadyseller','���� ������ ����� ��ٸ��ϴ� ��� ��Ÿ�� ������, ��� ���� ����� �ǹ��մϴ�.','���� ������ ����� ��ٸ��ϴ� ��� ��Ÿ�� ������, ��� ���� ����� �ǹ��մϴ�.','���� ������ ����� ��ٸ��ϴ� ��� ��Ÿ�� ������, ��� ���� ����� �ǹ��մϴ�.','���� ������ ����� ��ٸ��ϴ� ��� ��Ÿ�� ������, ��� ���� ����� �ǹ��մϴ�.',to_date('23/02/27','RR/MM/DD'));
Insert into SCOTT.T_SHOPPING_GOODS (GOODS_ID,GOODS_SORT,GOODS_TITLE,GOODS_WRITER,GOODS_PUBLISHER,GOODS_PRICE,GOODS_SALES_PRICE,GOODS_POINT,GOODS_PUBLISHED_DATE,GOODS_TOTAL_PAGE,GOODS_ISBN,GOODS_DELIVERY_PRICE,GOODS_DELIVERY_DATE,GOODS_STATUS,GOODS_INTRO,GOODS_WRITER_INTRO,GOODS_PUBLISHER_COMMENT,GOODS_RECOMMENDATION,GOODS_CREDATE) values (342,'���','��� ���δ�','admin','admin',24000,20000,1000,to_date('23/02/27','RR/MM/DD'),1000,'121212',2000,to_date('23/02/27','RR/MM/DD'),'newbook','����� ����,���� ���� �ɸ��� �ٸ��ϴ�.','����� ����,���� ���� �ɸ��� �ٸ��ϴ�.','����� ����,���� ���� �ɸ��� �ٸ��ϴ�.','����� ����,���� ���� �ɸ��� �ٸ��ϴ�.',to_date('23/02/27','RR/MM/DD'));
Insert into SCOTT.T_SHOPPING_GOODS (GOODS_ID,GOODS_SORT,GOODS_TITLE,GOODS_WRITER,GOODS_PUBLISHER,GOODS_PRICE,GOODS_SALES_PRICE,GOODS_POINT,GOODS_PUBLISHED_DATE,GOODS_TOTAL_PAGE,GOODS_ISBN,GOODS_DELIVERY_PRICE,GOODS_DELIVERY_DATE,GOODS_STATUS,GOODS_INTRO,GOODS_WRITER_INTRO,GOODS_PUBLISHER_COMMENT,GOODS_RECOMMENDATION,GOODS_CREDATE) values (343,'���','��� ��ҿ�','admin','admin',27000,24000,1000,to_date('23/02/27','RR/MM/DD'),1000,'121212',2000,to_date('23/02/27','RR/MM/DD'),'newbook','����� ����,���� ���� �ɸ��� �ٸ��ϴ�.','����� ����,���� ���� �ɸ��� �ٸ��ϴ�.','����� ����,���� ���� �ɸ��� �ٸ��ϴ�.','����� ����,���� ���� �ɸ��� �ٸ��ϴ�.',to_date('23/02/27','RR/MM/DD'));
Insert into SCOTT.T_SHOPPING_GOODS (GOODS_ID,GOODS_SORT,GOODS_TITLE,GOODS_WRITER,GOODS_PUBLISHER,GOODS_PRICE,GOODS_SALES_PRICE,GOODS_POINT,GOODS_PUBLISHED_DATE,GOODS_TOTAL_PAGE,GOODS_ISBN,GOODS_DELIVERY_PRICE,GOODS_DELIVERY_DATE,GOODS_STATUS,GOODS_INTRO,GOODS_WRITER_INTRO,GOODS_PUBLISHER_COMMENT,GOODS_RECOMMENDATION,GOODS_CREDATE) values (344,'���','��� �θ�Ʈ','admin','admin',22000,19000,1000,to_date('23/02/27','RR/MM/DD'),1000,'121212',2000,to_date('23/02/27','RR/MM/DD'),'newbook','����� ����,���� ���� �ɸ��� �ٸ��ϴ�.','����� ����,���� ���� �ɸ��� �ٸ��ϴ�.','����� ����,���� ���� �ɸ��� �ٸ��ϴ�.','����� ����,���� ���� �ɸ��� �ٸ��ϴ�.',to_date('23/02/27','RR/MM/DD'));
Insert into SCOTT.T_SHOPPING_GOODS (GOODS_ID,GOODS_SORT,GOODS_TITLE,GOODS_WRITER,GOODS_PUBLISHER,GOODS_PRICE,GOODS_SALES_PRICE,GOODS_POINT,GOODS_PUBLISHED_DATE,GOODS_TOTAL_PAGE,GOODS_ISBN,GOODS_DELIVERY_PRICE,GOODS_DELIVERY_DATE,GOODS_STATUS,GOODS_INTRO,GOODS_WRITER_INTRO,GOODS_PUBLISHER_COMMENT,GOODS_RECOMMENDATION,GOODS_CREDATE) values (345,'���','��� ���̴�ī','admin','admin',30000,27000,1000,to_date('23/02/27','RR/MM/DD'),1000,'121212',2000,to_date('23/02/27','RR/MM/DD'),'bestseller','����� ����,���� ���� �ɸ��� �ٸ��ϴ�.','����� ����,���� ���� �ɸ��� �ٸ��ϴ�.','����� ����,���� ���� �ɸ��� �ٸ��ϴ�.','����� ����,���� ���� �ɸ��� �ٸ��ϴ�.',to_date('23/02/27','RR/MM/DD'));
Insert into SCOTT.T_SHOPPING_GOODS (GOODS_ID,GOODS_SORT,GOODS_TITLE,GOODS_WRITER,GOODS_PUBLISHER,GOODS_PRICE,GOODS_SALES_PRICE,GOODS_POINT,GOODS_PUBLISHED_DATE,GOODS_TOTAL_PAGE,GOODS_ISBN,GOODS_DELIVERY_PRICE,GOODS_DELIVERY_DATE,GOODS_STATUS,GOODS_INTRO,GOODS_WRITER_INTRO,GOODS_PUBLISHER_COMMENT,GOODS_RECOMMENDATION,GOODS_CREDATE) values (346,'���','��� ����̴�','admin','admin',30000,27000,1000,to_date('23/02/27','RR/MM/DD'),1000,'121212',2000,to_date('23/02/27','RR/MM/DD'),'steadyseller','����� ����,���� ���� �ɸ��� �ٸ��ϴ�.','����� ����,���� ���� �ɸ��� �ٸ��ϴ�.','����� ����,���� ���� �ɸ��� �ٸ��ϴ�.','����� ����,���� ���� �ɸ��� �ٸ��ϴ�.',to_date('23/02/27','RR/MM/DD'));
Insert into SCOTT.T_SHOPPING_GOODS (GOODS_ID,GOODS_SORT,GOODS_TITLE,GOODS_WRITER,GOODS_PUBLISHER,GOODS_PRICE,GOODS_SALES_PRICE,GOODS_POINT,GOODS_PUBLISHED_DATE,GOODS_TOTAL_PAGE,GOODS_ISBN,GOODS_DELIVERY_PRICE,GOODS_DELIVERY_DATE,GOODS_STATUS,GOODS_INTRO,GOODS_WRITER_INTRO,GOODS_PUBLISHER_COMMENT,GOODS_RECOMMENDATION,GOODS_CREDATE) values (347,'�÷���','�÷���','admin','admin',32000,26000,1000,to_date('23/02/27','RR/MM/DD'),1000,'121212',2000,to_date('23/02/27','RR/MM/DD'),'newbook','�÷��� �� ī�θ��ϾƳ� �ɸ��� �̷�..','�÷��� �� ī�θ��ϾƳ� �ɸ��� �̷�..','�÷��� �� ī�θ��ϾƳ� �ɸ��� �̷�..','�÷��� �� ī�θ��ϾƳ� �ɸ��� �̷�..',to_date('23/02/27','RR/MM/DD'));
--------------------------------------------------------
--  DDL for Index SYS_C007231
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."SYS_C007231" ON "SCOTT"."T_SHOPPING_GOODS" ("GOODS_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table T_SHOPPING_GOODS
--------------------------------------------------------

  ALTER TABLE "SCOTT"."T_SHOPPING_GOODS" ADD PRIMARY KEY ("GOODS_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
