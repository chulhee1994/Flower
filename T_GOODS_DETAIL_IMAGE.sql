--------------------------------------------------------
--  파일이 생성됨 - 토요일-2월-25-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table T_GOODS_DETAIL_IMAGE
--------------------------------------------------------

  CREATE TABLE "C##SCOTT"."T_GOODS_DETAIL_IMAGE" 
   (	"IMAGE_ID" NUMBER(20,0), 
	"GOODS_ID" NUMBER(20,0), 
	"FILENAME" VARCHAR2(50 BYTE), 
	"REG_ID" VARCHAR2(20 BYTE), 
	"FILETYPE" VARCHAR2(40 BYTE), 
	"CREDATE" DATE DEFAULT sysdate
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into C##SCOTT.T_GOODS_DETAIL_IMAGE
SET DEFINE OFF;
Insert into C##SCOTT.T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values (346,394,'무작정 따라가기 홍콩 마카오.jpg','admin','main_image',to_date('18/10/16 00:00:00','RR/MM/DD HH24:MI:SS'));
Insert into C##SCOTT.T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values (347,394,'무작정 따라가기 홍콩 마카오_상세.jpg','admin','detail_image1',to_date('18/10/16 00:00:00','RR/MM/DD HH24:MI:SS'));
Insert into C##SCOTT.T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values (348,394,'detail2.jpg','admin','detail_image2',to_date('18/10/16 00:00:00','RR/MM/DD HH24:MI:SS'));
Insert into C##SCOTT.T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values (349,395,'image2.jpg','admin','main_image',to_date('18/10/16 00:00:00','RR/MM/DD HH24:MI:SS'));
Insert into C##SCOTT.T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values (350,395,'모두의 파이선상세이미지1.jpg','admin','detail_image1',to_date('18/10/16 00:00:00','RR/MM/DD HH24:MI:SS'));
Insert into C##SCOTT.T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values (351,397,'main_react.jpg','admin','main_image',to_date('18/10/16 00:00:00','RR/MM/DD HH24:MI:SS'));
Insert into C##SCOTT.T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values (352,397,'react_detail1.jpg','admin','detail_image1',to_date('18/10/16 00:00:00','RR/MM/DD HH24:MI:SS'));
Insert into C##SCOTT.T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values (353,398,'헬로자바스크립트_메인.jpg','admin','main_image',to_date('18/10/16 00:00:00','RR/MM/DD HH24:MI:SS'));
Insert into C##SCOTT.T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values (354,398,'헬로자바스크립트_상세1.jpg','admin','detail_image1',to_date('18/10/16 00:00:00','RR/MM/DD HH24:MI:SS'));
Insert into C##SCOTT.T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values (299,334,'포토샵 무작정 따라하기_메인.jpg','admin','main_image',to_date('18/10/16 00:00:00','RR/MM/DD HH24:MI:SS'));
Insert into C##SCOTT.T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values (300,334,'포토샵 무작정 따라하기_상세1.jpg','admin','detail_image1',to_date('18/10/16 00:00:00','RR/MM/DD HH24:MI:SS'));
Insert into C##SCOTT.T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values (301,335,'차트분석 무작정 따라하기_메인.jpg','admin','main_image',to_date('18/10/16 00:00:00','RR/MM/DD HH24:MI:SS'));
Insert into C##SCOTT.T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values (302,335,'차트분석 무작정 따라하기_상세1.jpg','admin','detail_image1',to_date('18/10/16 00:00:00','RR/MM/DD HH24:MI:SS'));
Insert into C##SCOTT.T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values (303,336,'짠테그 가계부_메인.jpg','admin','main_image',to_date('18/10/17 00:00:00','RR/MM/DD HH24:MI:SS'));
Insert into C##SCOTT.T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values (304,336,'짠테그 가계부_상세1.jpg','admin','detail_image1',to_date('18/10/17 00:00:00','RR/MM/DD HH24:MI:SS'));
Insert into C##SCOTT.T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values (305,337,'케라시_메인.jpg','admin','main_image',to_date('18/10/17 00:00:00','RR/MM/DD HH24:MI:SS'));
Insert into C##SCOTT.T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values (306,337,'케라시_상세1.jpg','admin','detail_image1',to_date('18/10/17 00:00:00','RR/MM/DD HH24:MI:SS'));
Insert into C##SCOTT.T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values (307,338,'컴퓨터 활용능력 2급 실기_메인.jpg','admin','main_image',to_date('18/10/17 00:00:00','RR/MM/DD HH24:MI:SS'));
Insert into C##SCOTT.T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values (308,338,'컴퓨터 활용능력 2급 실기_상세1.jpg','admin','detail_image1',to_date('18/10/17 00:00:00','RR/MM/DD HH24:MI:SS'));
Insert into C##SCOTT.T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values (309,339,'시나공 워드프로세서 실기_메인.jpg','admin','main_image',to_date('18/10/17 00:00:00','RR/MM/DD HH24:MI:SS'));
Insert into C##SCOTT.T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values (310,339,'시나공 워드프로세서 실기_상세1.jpg','admin','detail_image1',to_date('18/10/17 00:00:00','RR/MM/DD HH24:MI:SS'));
Insert into C##SCOTT.T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values (311,340,'엑셀실무_메인.pg.jpg','admin','main_image',to_date('18/10/17 00:00:00','RR/MM/DD HH24:MI:SS'));
Insert into C##SCOTT.T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values (312,340,'엑셀실무_상세1.jpg','admin','detail_image1',to_date('18/10/17 00:00:00','RR/MM/DD HH24:MI:SS'));
Insert into C##SCOTT.T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values (313,341,'헬로자바스크립트_메인.jpg','admin','main_image',to_date('18/10/17 00:00:00','RR/MM/DD HH24:MI:SS'));
Insert into C##SCOTT.T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values (314,341,'모두의 파이선상세이미지1.jpg','admin','detail_image1',to_date('18/10/17 00:00:00','RR/MM/DD HH24:MI:SS'));
Insert into C##SCOTT.T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values (315,342,'부동상 상식사전_메인.jpg','admin','main_image',to_date('18/10/17 00:00:00','RR/MM/DD HH24:MI:SS'));
Insert into C##SCOTT.T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values (316,342,'부동상 상식사전_상세1.jpg','admin','detail_image1',to_date('18/10/17 00:00:00','RR/MM/DD HH24:MI:SS'));
Insert into C##SCOTT.T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values (317,343,'기적적 계산법_메인.jpg','admin','main_image',to_date('18/10/17 00:00:00','RR/MM/DD HH24:MI:SS'));
Insert into C##SCOTT.T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values (339,343,'good1_detail_image3.jpg','admin','uploadFile',to_date('18/10/21 00:00:00','RR/MM/DD HH24:MI:SS'));
Insert into C##SCOTT.T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values (319,344,'image1.jpg','admin','main_image',to_date('18/10/17 00:00:00','RR/MM/DD HH24:MI:SS'));
Insert into C##SCOTT.T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values (320,344,'react_detail1.jpg','admin','detail_image1',to_date('18/10/17 00:00:00','RR/MM/DD HH24:MI:SS'));
Insert into C##SCOTT.T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values (321,345,'main_react.jpg','admin','main_image',to_date('18/10/17 00:00:00','RR/MM/DD HH24:MI:SS'));
Insert into C##SCOTT.T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values (322,345,'detail3.jpg','admin','detail_image1',to_date('18/10/17 00:00:00','RR/MM/DD HH24:MI:SS'));
Insert into C##SCOTT.T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values (323,346,'여행 일본어_메인.jpg','admin','main_image',to_date('18/10/17 00:00:00','RR/MM/DD HH24:MI:SS'));
Insert into C##SCOTT.T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values (324,346,'여행 일본어_상세.jpg','admin','detail_image1',to_date('18/10/17 00:00:00','RR/MM/DD HH24:MI:SS'));
Insert into C##SCOTT.T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values (325,347,'가장 빨리 만나는 자바_메인.jpg','admin','main_image',to_date('18/10/20 00:00:00','RR/MM/DD HH24:MI:SS'));
Insert into C##SCOTT.T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values (326,347,'가장 빨리 만나는 자바_상세1.jpg','admin','detail_image1',to_date('18/10/20 00:00:00','RR/MM/DD HH24:MI:SS'));
Insert into C##SCOTT.T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values (327,348,'Java EE 디자이 패턴_메인.jpg','admin','main_image',to_date('18/10/20 00:00:00','RR/MM/DD HH24:MI:SS'));
Insert into C##SCOTT.T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values (328,348,'Java EE 디자이 패턴_상세1.jpg','admin','detail_image1',to_date('18/10/20 00:00:00','RR/MM/DD HH24:MI:SS'));
Insert into C##SCOTT.T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values (330,349,'자바 리팩토링_메인.jpg','admin','main_image',to_date('18/10/20 00:00:00','RR/MM/DD HH24:MI:SS'));
Insert into C##SCOTT.T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values (331,349,'자바 리팩토링_상세1.jpg','admin','detail_image1',to_date('18/10/20 00:00:00','RR/MM/DD HH24:MI:SS'));
Insert into C##SCOTT.T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values (334,350,'유지보수자바_메인.jpg','admin','main_image',to_date('18/10/20 00:00:00','RR/MM/DD HH24:MI:SS'));
Insert into C##SCOTT.T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values (341,350,'유지보수자바_상세1.jpg','admin','uploadFile',to_date('18/10/21 00:00:00','RR/MM/DD HH24:MI:SS'));
Insert into C##SCOTT.T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values (337,343,'기적적 계산법_상세1.jpg','admin','uploadFile',to_date('18/10/21 00:00:00','RR/MM/DD HH24:MI:SS'));
Insert into C##SCOTT.T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values (338,343,'good1_detail_image2.jpg','admin','uploadFile',to_date('18/10/21 00:00:00','RR/MM/DD HH24:MI:SS'));
Insert into C##SCOTT.T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values (342,354,'모두의 딥러닝_메인.jpg','admin','main_image',to_date('18/10/23 00:00:00','RR/MM/DD HH24:MI:SS'));
Insert into C##SCOTT.T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values (343,354,'모두의 딥러닝_상세.jpg','admin','detail_image1',to_date('18/10/23 00:00:00','RR/MM/DD HH24:MI:SS'));
Insert into C##SCOTT.T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values (345,356,'마인_메인.jpg','admin','main_image',to_date('18/10/23 00:00:00','RR/MM/DD HH24:MI:SS'));
--------------------------------------------------------
--  DDL for Index SYS_C008388
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##SCOTT"."SYS_C008388" ON "C##SCOTT"."T_GOODS_DETAIL_IMAGE" ("IMAGE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table T_GOODS_DETAIL_IMAGE
--------------------------------------------------------

  ALTER TABLE "C##SCOTT"."T_GOODS_DETAIL_IMAGE" ADD PRIMARY KEY ("IMAGE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
