ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;

CREATE USER AUDITORIA IDENTIFIED BY 123
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP
QUOTA UNLIMITED ON USERS;

GRANT CONNECT, RESOURCE TO AUDITORIA;
  

CREATE SEQUENCE  "SEQ_AUD"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;

  CREATE TABLE "AUDITORIA" 
  (	
    "AUD_ID" NUMBER(6,0), 
    "AUD_TABELA" VARCHAR2(30), 
    "AUD_ROWID" VARCHAR2(20), 
    "AUD_OPERACAO" CHAR(1), 
    "AUD_COLUNA" VARCHAR2(30), 
    "AUD_VALOR_ANTIGO" VARCHAR2(255), 
    "AUD_VALOR_NOVO" VARCHAR2(255), 
    "AUD_USU_BD" VARCHAR2(30), 
    "AUD_USU_SO" VARCHAR2(255), 
    "AUD_DATA" DATE
   ) ;
REM INSERTING into AUDITORIA
SET DEFINE OFF;

CREATE OR REPLACE NONEDITIONABLE TRIGGER "TG_SEQ_AUD" 
BEFORE INSERT ON AUDITORIA
FOR EACH ROW
BEGIN
    :NEW.AUD_ID := SEQ_AUD.NEXTVAL;
END;
/
ALTER TRIGGER "TG_SEQ_AUD" ENABLE;

CREATE OR REPLACE NONEDITIONABLE TRIGGER "TG_SEQ_AUD" 
BEFORE INSERT ON AUDITORIA
FOR EACH ROW
BEGIN
    :NEW.AUD_ID := SEQ_AUD.NEXTVAL;
END;
/
ALTER TRIGGER "TG_SEQ_AUD" ENABLE;

set define off;
  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_AUDITORIA" (
    P_AUD_TABELA IN VARCHAR,
    P_AUD_ROWID IN VARCHAR,
    P_AUD_OPERACAO IN CHAR,
    P_AUD_COLUNA IN VARCHAR,
    P_AUD_VALOR_ANTIGO IN VARCHAR,
    P_AUD_VALOR_NOVO IN VARCHAR,
    P_AUD_USU_BD IN VARCHAR, 
	P_AUD_USU_SO IN VARCHAR, 
	P_AUD_DATA IN DATE
)
IS
BEGIN
  INSERT INTO AUDITORIA VALUES (null,P_AUD_TABELA,P_AUD_ROWID,P_AUD_OPERACAO,P_AUD_COLUNA,P_AUD_VALOR_ANTIGO,P_AUD_VALOR_NOVO,P_AUD_USU_BD,P_AUD_USU_SO,P_AUD_DATA);
END;

/

ALTER TABLE "AUDITORIA" ADD CONSTRAINT "PK_AUD" PRIMARY KEY ("AUD_ID")
USING INDEX  ENABLE;


GRANT EXECUTE ON PROC_AUDITORIA TO APP;