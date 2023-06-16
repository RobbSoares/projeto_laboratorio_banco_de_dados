CREATE OR REPLACE NONEDITIONABLE TRIGGER "TG_AUD_HOM" 
AFTER UPDATE OR DELETE ON H_HOMICIDIOS
FOR EACH ROW
DECLARE
    V_USU_BD VARCHAR(30);
    V_USU_SO VARCHAR(255) := SYS_CONTEXT('USERENV','OS_USER');
    V_TP_OPERACAO CHAR(1);
    V_ROWID VARCHAR(20);
    V_TABELA VARCHAR(30) := 'H_HOMICIDIOS';
BEGIN
    SELECT USER INTO V_USU_BD FROM DUAL;
    V_ROWID := :OLD.ROWID;
    IF DELETING THEN
        V_TP_OPERACAO := 'D';
        AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,NULL,NULL,NULL,V_USU_BD,V_USU_SO,SYSDATE);
    ELSE
        V_TP_OPERACAO := 'U';
        IF (:NEW.HHOM_ID <> :OLD.HHOM_ID) THEN
            AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,'HHOM_ID',:OLD.HHOM_ID,:NEW.HHOM_ID,V_USU_BD,V_USU_SO,SYSDATE);
        END IF;
        IF (:NEW.HHOM_HD <> :OLD.HHOM_HD) THEN
            AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,'HHOM_HD',:OLD.HHOM_HD,:NEW.HHOM_HD,V_USU_BD,V_USU_SO,SYSDATE);
        END IF;
        IF (:NEW.HHOM_NUM_VIT_HD <> :OLD.HHOM_NUM_VIT_HD) THEN
            AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,'HHOM_NUM_VIT_HD',:OLD.HHOM_NUM_VIT_HD,:NEW.HHOM_NUM_VIT_HD,V_USU_BD,V_USU_SO,SYSDATE);
        END IF;
        IF (:NEW.HHOM_MES <> :OLD.HHOM_MES) THEN
            AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,'HHOM_MES',:OLD.HHOM_MES,:NEW.HHOM_MES,V_USU_BD,V_USU_SO,SYSDATE);
        END IF;
        IF (:NEW.HHOM_ANO <> :OLD.HHOM_ANO) THEN
            AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,'HHOM_ANO',:OLD.HHOM_ANO,:NEW.HHOM_ANO,V_USU_BD,V_USU_SO,SYSDATE);
        END IF;
        IF (:NEW.HHOM_DATA_FATO <> :OLD.HHOM_DATA_FATO) THEN
            AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,'HHOM_DATA_FATO',:OLD.HHOM_DATA_FATO,:NEW.HHOM_DATA_FATO,V_USU_BD,V_USU_SO,SYSDATE);
        END IF;
        IF (:NEW.HHOM_HORA_FATO <> :OLD.HHOM_HORA_FATO) THEN
            AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,'HHOM_HORA_DATA_FATO',:OLD.HHOM_HORA_FATO,:NEW.HHOM_HORA_FATO,V_USU_BD,V_USU_SO,SYSDATE);
        END IF;
        IF (:NEW.HHOM_NATUREZA_APURADA <> :OLD.HHOM_NATUREZA_APURADA) THEN
            AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,'HHOM_NATUREZA_APURADA',:OLD.HHOM_NATUREZA_APURADA,:NEW.HHOM_NATUREZA_APURADA,V_USU_BD,V_USU_SO,SYSDATE);
        END IF;
        IF (:NEW.HHOM_PES_ID <> :OLD.HHOM_PES_ID) THEN
            AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,'HHOM_PES_ID',:OLD.HHOM_PES_ID,:NEW.HHOM_PES_ID,V_USU_BD,V_USU_SO,SYSDATE);
        END IF;
        IF (:NEW.HHOM_DATAHORA <> :OLD.HHOM_DATAHORA) THEN
            AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,'HHOM_DATAHORA',:OLD.HHOM_DATAHORA,:NEW.HHOM_DATAHORA,V_USU_BD,V_USU_SO,SYSDATE);
        END IF;
    END IF;
END;

/
ALTER TRIGGER "TG_AUD_HOM" ENABLE;

CREATE OR REPLACE NONEDITIONABLE TRIGGER "TG_AUD_PES" 
AFTER UPDATE OR DELETE ON H_PESSOAS
FOR EACH ROW
DECLARE
    V_USU_BD VARCHAR(30);
    V_USU_SO VARCHAR(255) := SYS_CONTEXT('USERENV','OS_USER');
    V_TP_OPERACAO CHAR(1);
    V_ROWID VARCHAR(20);
    V_TABELA VARCHAR(30) := 'H_PESSOAS';
BEGIN
    SELECT USER INTO V_USU_BD FROM DUAL;
    V_ROWID := :OLD.ROWID;
    IF DELETING THEN
        V_TP_OPERACAO := 'D';
        AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,NULL,NULL,NULL,V_USU_BD,V_USU_SO,SYSDATE);
    ELSE
        V_TP_OPERACAO := 'U';
        IF (:NEW.HPES_ID <> :OLD.HPES_ID) THEN
            AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,'HPES_ID',:OLD.HPES_ID,:NEW.HPES_ID,V_USU_BD,V_USU_SO,SYSDATE);
        END IF;
        IF (:NEW.HPES_TIPO <> :OLD.HPES_TIPO) THEN
            AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,'HPES_TIPO',:OLD.HPES_TIPO,:NEW.HPES_TIPO,V_USU_BD,V_USU_SO,SYSDATE);
        END IF;
        IF (:NEW.HPES_SEXO <> :OLD.HPES_SEXO) THEN
            AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,'HPES_SEXO',:OLD.HPES_SEXO,:NEW.HPES_SEXO,V_USU_BD,V_USU_SO,SYSDATE);
        END IF;
        IF (:NEW.HPES_IDADE <> :OLD.HPES_IDADE) THEN
            AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,'HPES_IDADE',:OLD.HPES_IDADE,:NEW.HPES_IDADE,V_USU_BD,V_USU_SO,SYSDATE);
        END IF;
        IF (:NEW.HPES_DT_NASCIMENTO <> :OLD.HPES_DT_NASCIMENTO) THEN
            AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,'HPES_DT_NASCIMENTO',:OLD.HPES_DT_NASCIMENTO,:NEW.HPES_DT_NASCIMENTO,V_USU_BD,V_USU_SO,SYSDATE);
        END IF;
        IF (:NEW.HPES_COR_PELE <> :OLD.HPES_COR_PELE) THEN
            AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,'HPES_COR_PELE',:OLD.HPES_COR_PELE,:NEW.HPES_COR_PELE,V_USU_BD,V_USU_SO,SYSDATE);
        END IF;
        IF (:NEW.HPES_PROFISSAO <> :OLD.HPES_PROFISSAO) THEN
            AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,'HPES_PROFISSAO',:OLD.HPES_PROFISSAO,:NEW.HPES_PROFISSAO,V_USU_BD,V_USU_SO,SYSDATE);
        END IF;
        IF (:NEW.HPES_DATAHORA <> :OLD.HPES_DATAHORA) THEN
            AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,'HPES_DATAHORA',:OLD.HPES_DATAHORA,:NEW.HPES_DATAHORA,V_USU_BD,V_USU_SO,SYSDATE);
        END IF;
    END IF;
END;
/
ALTER TRIGGER "TG_AUD_PES" ENABLE;


CREATE OR REPLACE NONEDITIONABLE TRIGGER "TG_AUD_CIR" 
AFTER UPDATE OR DELETE ON H_CIRCUNSCRICOES
FOR EACH ROW
DECLARE
    V_USU_BD VARCHAR(30);
    V_USU_SO VARCHAR(255) := SYS_CONTEXT('USERENV','OS_USER');
    V_TP_OPERACAO CHAR(1);
    V_ROWID VARCHAR(20);
    V_TABELA VARCHAR(30) := 'H_CIRCUNSCRICOES';
BEGIN
    SELECT USER INTO V_USU_BD FROM DUAL;
    V_ROWID := :OLD.ROWID;
    IF DELETING THEN
        V_TP_OPERACAO := 'D';
        AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,NULL,NULL,NULL,V_USU_BD,V_USU_SO,SYSDATE);
    ELSE
        V_TP_OPERACAO := 'U';
        IF (:NEW.HCIR_ID <> :OLD.HCIR_ID) THEN
            AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,'HCIR_ID',:OLD.HCIR_ID,:NEW.HCIR_ID,V_USU_BD,V_USU_SO,SYSDATE);
        END IF;
        IF (:NEW.HCIR_MUNICIPIO <> :OLD.HCIR_MUNICIPIO) THEN
            AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,'HCIR_MUNICIPIO',:OLD.HCIR_MUNICIPIO,:NEW.HCIR_MUNICIPIO,V_USU_BD,V_USU_SO,SYSDATE);
        END IF;
        IF (:NEW.HCIR_DATAHORA <> :OLD.HCIR_DATAHORA) THEN
            AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,'HCIR_DATAHORA',:OLD.HCIR_DATAHORA,:NEW.HCIR_DATAHORA,V_USU_BD,V_USU_SO,SYSDATE);
        END IF;
    END IF;
END;
/
ALTER TRIGGER "TG_AUD_CIR" ENABLE;

CREATE OR REPLACE NONEDITIONABLE TRIGGER "TG_AUD_DEL" 
AFTER UPDATE OR DELETE ON H_DELEGACIAS
FOR EACH ROW
DECLARE
    V_USU_BD VARCHAR(30);
    V_USU_SO VARCHAR(255) := SYS_CONTEXT('USERENV','OS_USER');
    V_TP_OPERACAO CHAR(1);
    V_ROWID VARCHAR(20);
    V_TABELA VARCHAR(30) := 'H_DELEGACIAS';
BEGIN
    SELECT USER INTO V_USU_BD FROM DUAL;
    V_ROWID := :OLD.ROWID;
    IF DELETING THEN
        V_TP_OPERACAO := 'D';
        AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,NULL,NULL,NULL,V_USU_BD,V_USU_SO,SYSDATE);
    ELSE
        V_TP_OPERACAO := 'U';
        IF (:NEW.HDEL_ID <> :OLD.HDEL_ID) THEN
            AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,'HDEL_ID',:OLD.HDEL_ID,:NEW.HDEL_ID,V_USU_BD,V_USU_SO,SYSDATE);
        END IF;
        IF (:NEW.HDEL_DELEGACIA_POLICIA <> :OLD.HDEL_DELEGACIA_POLICIA) THEN
            AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,'HDEL_DELEGACIA_POLICIA',:OLD.HDEL_DELEGACIA_POLICIA,:NEW.HDEL_DELEGACIA_POLICIA,V_USU_BD,V_USU_SO,SYSDATE);
        END IF;
        IF (:NEW.HDEL_DATAHORA <> :OLD.HDEL_DATAHORA) THEN
            AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,'HDEL_DATAHORA',:OLD.HDEL_DATAHORA,:NEW.HDEL_DATAHORA,V_USU_BD,V_USU_SO,SYSDATE);
        END IF;
    END IF;
END;
/
ALTER TRIGGER "TG_AUD_DEL" ENABLE;

CREATE OR REPLACE NONEDITIONABLE TRIGGER "TG_AUD_UNA" 
AFTER UPDATE OR DELETE ON H_UNIDADES_ADMINISTRATIVAS
FOR EACH ROW
DECLARE
    V_USU_BD VARCHAR(30);
    V_USU_SO VARCHAR(255) := SYS_CONTEXT('USERENV','OS_USER');
    V_TP_OPERACAO CHAR(1);
    V_ROWID VARCHAR(20);
    V_TABELA VARCHAR(30) := 'H_UNIDADES_ADMINISTRATIVAS';
BEGIN
    SELECT USER INTO V_USU_BD FROM DUAL;
    V_ROWID := :OLD.ROWID;
    IF DELETING THEN
        V_TP_OPERACAO := 'D';
        AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,NULL,NULL,NULL,V_USU_BD,V_USU_SO,SYSDATE);
    ELSE
        V_TP_OPERACAO := 'U';
        IF (:NEW.HUNA_ID <> :OLD.HUNA_ID) THEN
            AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,'HUNA_ID',:OLD.HUNA_ID,:NEW.HUNA_ID,V_USU_BD,V_USU_SO,SYSDATE);
        END IF;
        IF (:NEW.HUNA_SECCIONAL <> :OLD.HUNA_SECCIONAL) THEN
            AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,'HUNA_SECCIONAL',:OLD.HUNA_SECCIONAL,:NEW.HUNA_SECCIONAL,V_USU_BD,V_USU_SO,SYSDATE);
        END IF;
        IF (:NEW.HUNA_DATAHORA <> :OLD.HUNA_DATAHORA) THEN
            AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,'HUNA_DATAHORA',:OLD.HUNA_DATAHORA,:NEW.HUNA_DATAHORA,V_USU_BD,V_USU_SO,SYSDATE);
        END IF;
    END IF;
END;
/
ALTER TRIGGER "TG_AUD_UNA" ENABLE;

CREATE OR REPLACE NONEDITIONABLE TRIGGER "TG_AUD_DEP" 
AFTER UPDATE OR DELETE ON H_DEPARTAMENTOS
FOR EACH ROW
DECLARE
    V_USU_BD VARCHAR(30);
    V_USU_SO VARCHAR(255) := SYS_CONTEXT('USERENV','OS_USER');
    V_TP_OPERACAO CHAR(1);
    V_ROWID VARCHAR(20);
    V_TABELA VARCHAR(30) := 'H_DEPARTAMENTOS';
BEGIN
    SELECT USER INTO V_USU_BD FROM DUAL;
    V_ROWID := :OLD.ROWID;
    IF DELETING THEN
        V_TP_OPERACAO := 'D';
        AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,NULL,NULL,NULL,V_USU_BD,V_USU_SO,SYSDATE);
    ELSE
        V_TP_OPERACAO := 'U';
        IF (:NEW.HDEP_ID <> :OLD.HDEP_ID) THEN
            AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,'HDEP_ID',:OLD.HDEP_ID,:NEW.HDEP_ID,V_USU_BD,V_USU_SO,SYSDATE);
        END IF;
        IF (:NEW.HDEP_DEPARTAMENTO <> :OLD.HDEP_DEPARTAMENTO) THEN
            AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,'HDEP_DEPARTAMENTO',:OLD.HDEP_DEPARTAMENTO,:NEW.HDEP_DEPARTAMENTO,V_USU_BD,V_USU_SO,SYSDATE);
        END IF;
        IF (:NEW.HDEP_DATAHORA <> :OLD.HDEP_DATAHORA) THEN
            AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,'HDEP_DATAHORA',:OLD.HDEP_DATAHORA,:NEW.HDEP_DATAHORA,V_USU_BD,V_USU_SO,SYSDATE);
        END IF;
    END IF;
END;
/
ALTER TRIGGER "TG_AUD_DEP" ENABLE;

CREATE OR REPLACE NONEDITIONABLE TRIGGER "TG_AUD_LOC" 
AFTER UPDATE OR DELETE ON H_LOCAIS
FOR EACH ROW
DECLARE
    V_USU_BD VARCHAR(30);
    V_USU_SO VARCHAR(255) := SYS_CONTEXT('USERENV','OS_USER');
    V_TP_OPERACAO CHAR(1);
    V_ROWID VARCHAR(20);
    V_TABELA VARCHAR(30) := 'H_LOCAIS';
BEGIN
    SELECT USER INTO V_USU_BD FROM DUAL;
    V_ROWID := :OLD.ROWID;
    IF DELETING THEN
        V_TP_OPERACAO := 'D';
        AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,NULL,NULL,NULL,V_USU_BD,V_USU_SO,SYSDATE);
    ELSE
        V_TP_OPERACAO := 'U';
        IF (:NEW.HLOC_ID <> :OLD.HLOC_ID) THEN
            AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,'HLOC_ID',:OLD.HLOC_ID,:NEW.HLOC_ID,V_USU_BD,V_USU_SO,SYSDATE);
        END IF;
        IF (:NEW.HLOC_LOGRADOURO <> :OLD.HLOC_LOGRADOURO) THEN
            AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,'HLOC_LOGRADOURO',:OLD.HLOC_LOGRADOURO,:NEW.HLOC_LOGRADOURO,V_USU_BD,V_USU_SO,SYSDATE);
        END IF;
        IF (:NEW.HLOC_NUMERO_LOGRADOURO <> :OLD.HLOC_NUMERO_LOGRADOURO) THEN
            AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,'HLOC_NUMERO_LOGRADOURO',:OLD.HLOC_NUMERO_LOGRADOURO,:NEW.HLOC_NUMERO_LOGRADOURO,V_USU_BD,V_USU_SO,SYSDATE);
        END IF;
        IF (:NEW.HLOC_LATITUDE <> :OLD.HLOC_LATITUDE) THEN
            AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,'HLOC_LATITUDE',:OLD.HLOC_LATITUDE,:NEW.HLOC_LATITUDE,V_USU_BD,V_USU_SO,SYSDATE);
        END IF;
        IF (:NEW.HLOC_LONGITUDE <> :OLD.HLOC_LONGITUDE) THEN
            AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,'HLOC_LONGITUDE',:OLD.HLOC_LONGITUDE,:NEW.HLOC_LONGITUDE,V_USU_BD,V_USU_SO,SYSDATE);
        END IF;
        IF (:NEW.HLOC_DATAHORA <> :OLD.HLOC_DATAHORA) THEN
            AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,'HLOC_DATAHORA',:OLD.HLOC_DATAHORA,:NEW.HLOC_DATAHORA,V_USU_BD,V_USU_SO,SYSDATE);
        END IF;
    END IF;
END;
/
ALTER TRIGGER "TG_AUD_LOC" ENABLE;


CREATE OR REPLACE NONEDITIONABLE TRIGGER "TG_AUD_TIP" 
AFTER UPDATE OR DELETE ON H_TIPO_LOCAL
FOR EACH ROW
DECLARE
    V_USU_BD VARCHAR(30);
    V_USU_SO VARCHAR(255) := SYS_CONTEXT('USERENV','OS_USER');
    V_TP_OPERACAO CHAR(1);
    V_ROWID VARCHAR(20);
    V_TABELA VARCHAR(30) := 'H_TIPO_LOCAL';
BEGIN
    SELECT USER INTO V_USU_BD FROM DUAL;
    V_ROWID := :OLD.ROWID;
    IF DELETING THEN
        V_TP_OPERACAO := 'D';
        AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,NULL,NULL,NULL,V_USU_BD,V_USU_SO,SYSDATE);
    ELSE
        V_TP_OPERACAO := 'U';
        IF (:NEW.HTIP_ID <> :OLD.HTIP_ID) THEN
            AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,'HTIP_ID',:OLD.HTIP_ID,:NEW.HTIP_ID,V_USU_BD,V_USU_SO,SYSDATE);
        END IF;
        IF (:NEW.HTIP_DESC_LOCAL <> :OLD.HTIP_DESC_LOCAL) THEN
            AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,'HTIP_DESC_LOCAL',:OLD.HTIP_DESC_LOCAL,:NEW.HTIP_DESC_LOCAL,V_USU_BD,V_USU_SO,SYSDATE);
        END IF;
        IF (:NEW.HTIP_DATAHORA <> :OLD.HTIP_DATAHORA) THEN
            AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,'HTIP_DATAHORA',:OLD.HTIP_DATAHORA,:NEW.HTIP_DATAHORA,V_USU_BD,V_USU_SO,SYSDATE);
        END IF;
    END IF;
END;
/
ALTER TRIGGER "TG_AUD_TIP" ENABLE;

CREATE OR REPLACE NONEDITIONABLE TRIGGER "TG_AUD_DIV" 
AFTER UPDATE OR DELETE ON H_DIVISOES_ESPECIALIZADAS
FOR EACH ROW
DECLARE
    V_USU_BD VARCHAR(30);
    V_USU_SO VARCHAR(255) := SYS_CONTEXT('USERENV','OS_USER');
    V_TP_OPERACAO CHAR(1);
    V_ROWID VARCHAR(20);
    V_TABELA VARCHAR(30) := 'H_DIVISOES_ESPECIALIZADAS';
BEGIN
    SELECT USER INTO V_USU_BD FROM DUAL;
    V_ROWID := :OLD.ROWID;
    IF DELETING THEN
        V_TP_OPERACAO := 'D';
        AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,NULL,NULL,NULL,V_USU_BD,V_USU_SO,SYSDATE);
    ELSE
        V_TP_OPERACAO := 'U';
        IF (:NEW.HDIV_ID <> :OLD.HDIV_ID) THEN
            AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,'HDIV_ID',:OLD.HDIV_ID,:NEW.HDIV_ID,V_USU_BD,V_USU_SO,SYSDATE);
        END IF;
        IF (:NEW.HDIV_DIVISAO <> :OLD.HDIV_DIVISAO) THEN
            AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,'HDIV_DIVISAO',:OLD.HDIV_DIVISAO,:NEW.HDIV_DIVISAO,V_USU_BD,V_USU_SO,SYSDATE);
        END IF;
        IF (:NEW.HDIV_DATAHORA <> :OLD.HDIV_DATAHORA) THEN
            AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,'HDIV_DATAHORA',:OLD.HDIV_DATAHORA,:NEW.HDIV_DATAHORA,V_USU_BD,V_USU_SO,SYSDATE);
        END IF;
    END IF;
END;
/
ALTER TRIGGER "TG_AUD_DIV" ENABLE;

CREATE OR REPLACE NONEDITIONABLE TRIGGER "TG_AUD_DES" 
AFTER UPDATE OR DELETE ON H_DELEGACIAS_ESPECIALIZADAS
FOR EACH ROW
DECLARE
    V_USU_BD VARCHAR(30);
    V_USU_SO VARCHAR(255) := SYS_CONTEXT('USERENV','OS_USER');
    V_TP_OPERACAO CHAR(1);
    V_ROWID VARCHAR(20);
    V_TABELA VARCHAR(30) := 'H_DELEGACIAS_ESPECIALIZADAS';
BEGIN
    SELECT USER INTO V_USU_BD FROM DUAL;
    V_ROWID := :OLD.ROWID;
    IF DELETING THEN
        V_TP_OPERACAO := 'D';
        AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,NULL,NULL,NULL,V_USU_BD,V_USU_SO,SYSDATE);
    ELSE
        V_TP_OPERACAO := 'U';
        IF (:NEW.HDES_ID <> :OLD.HDES_ID) THEN
            AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,'HDES_ID',:OLD.HDES_ID,:NEW.HDES_ID,V_USU_BD,V_USU_SO,SYSDATE);
        END IF;
        IF (:NEW.HDES_DELEGACIA_ESPECIALIZADA <> :OLD.HDES_DELEGACIA_ESPECIALIZADA) THEN
            AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,'HDES_DELEGACIA_ESPECIALIZADA',:OLD.HDES_DELEGACIA_ESPECIALIZADA,:NEW.HDES_DELEGACIA_ESPECIALIZADA,V_USU_BD,V_USU_SO,SYSDATE);
        END IF;
        IF (:NEW.HDES_NUMERO_DELEGACIA <> :OLD.HDES_NUMERO_DELEGACIA) THEN
            AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,'HDES_NUMERO_DELEGACIA',:OLD.HDES_NUMERO_DELEGACIA,:NEW.HDES_NUMERO_DELEGACIA,V_USU_BD,V_USU_SO,SYSDATE);
        END IF;
        IF (:NEW.HDES_DATAHORA <> :OLD.HDES_DATAHORA) THEN
            AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,'HDES_DATAHORA',:OLD.HDES_DATAHORA,:NEW.HDES_DATAHORA,V_USU_BD,V_USU_SO,SYSDATE);
        END IF;
    END IF;
END;
/
ALTER TRIGGER "TG_AUD_DES" ENABLE;

CREATE OR REPLACE NONEDITIONABLE TRIGGER "TG_AUD_OCR" 
AFTER UPDATE OR DELETE ON H_OCORRENCIAS
FOR EACH ROW
DECLARE
    V_USU_BD VARCHAR(30);
    V_USU_SO VARCHAR(255) := SYS_CONTEXT('USERENV','OS_USER');
    V_TP_OPERACAO CHAR(1);
    V_ROWID VARCHAR(20);
    V_TABELA VARCHAR(30) := 'H_OCORRENCIAS';
BEGIN
    SELECT USER INTO V_USU_BD FROM DUAL;
    V_ROWID := :OLD.ROWID;
    IF DELETING THEN
        V_TP_OPERACAO := 'D';
        AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,NULL,NULL,NULL,V_USU_BD,V_USU_SO,SYSDATE);
    ELSE
        V_TP_OPERACAO := 'U';
        IF (:NEW.HOCR_ID <> :OLD.HOCR_ID) THEN
            AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,'HOCR_ID',:OLD.HOCR_ID,:NEW.HOCR_ID,V_USU_BD,V_USU_SO,SYSDATE);
        END IF;
        IF (:NEW.HOCR_NUM_BO <> :OLD.HOCR_NUM_BO) THEN
            AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,'HOCR_NUM_BO',:OLD.HOCR_NUM_BO,:NEW.HOCR_NUM_BO,V_USU_BD,V_USU_SO,SYSDATE);
        END IF;
        IF (:NEW.HOCR_DATAHORA_REGISTRO_BO <> :OLD.HOCR_DATAHORA_REGISTRO_BO) THEN
            AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,'HOCR_DATAHORA_REGISTRO_BO',:OLD.HOCR_DATAHORA_REGISTRO_BO,:NEW.HOCR_DATAHORA_REGISTRO_BO,V_USU_BD,V_USU_SO,SYSDATE);
        END IF;
        IF (:NEW.HOCR_ANO_BO <> :OLD.HOCR_ANO_BO) THEN
            AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,'HOCR_ANO_BO',:OLD.HOCR_ANO_BO,:NEW.HOCR_ANO_BO,V_USU_BD,V_USU_SO,SYSDATE);
        END IF;
        IF (:NEW.HOCR_DATAHORA <> :OLD.HOCR_DATAHORA) THEN
            AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,'HOCR_DATAHORA',:OLD.HOCR_DATAHORA,:NEW.HOCR_DATAHORA,V_USU_BD,V_USU_SO,SYSDATE);
        END IF;
    END IF;
END;
/
ALTER TRIGGER "TG_AUD_OCR" ENABLE;

CREATE OR REPLACE NONEDITIONABLE TRIGGER "TG_AUD_DHO" 
AFTER UPDATE OR DELETE ON H_DELEGACIAS_HOMICIDIOS
FOR EACH ROW
DECLARE
    V_USU_BD VARCHAR(30);
    V_USU_SO VARCHAR(255) := SYS_CONTEXT('USERENV','OS_USER');
    V_TP_OPERACAO CHAR(1);
    V_ROWID VARCHAR(20);
    V_TABELA VARCHAR(30) := 'H_DELEGACIAS_HOMICIDIOS';
BEGIN
    SELECT USER INTO V_USU_BD FROM DUAL;
    V_ROWID := :OLD.ROWID;
    IF DELETING THEN
        V_TP_OPERACAO := 'D';
        AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,NULL,NULL,NULL,V_USU_BD,V_USU_SO,SYSDATE);
    ELSE
        V_TP_OPERACAO := 'U';
        IF (:NEW.HDHO_DEL_ID <> :OLD.HDHO_DEL_ID) THEN
            AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,'HDHO_DEL_ID',:OLD.HDHO_DEL_ID,:NEW.HDHO_DEL_ID,V_USU_BD,V_USU_SO,SYSDATE);
        END IF;
        IF (:NEW.HDHO_HOM_ID <> :OLD.HDHO_HOM_ID) THEN
            AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,'HDHO_HOM_ID',:OLD.HDHO_HOM_ID,:NEW.HDHO_HOM_ID,V_USU_BD,V_USU_SO,SYSDATE);
        END IF;
        IF (:NEW.HDOC_DATAHORA <> :OLD.HDOC_DATAHORA) THEN
            AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,'HDOC_DATAHORA',:OLD.HDOC_DATAHORA,:NEW.HDOC_DATAHORA,V_USU_BD,V_USU_SO,SYSDATE);
        END IF;
        
    END IF;
END;
/
ALTER TRIGGER "TG_AUD_DHO" ENABLE;

CREATE OR REPLACE NONEDITIONABLE TRIGGER "TG_AUD_DOC" 
AFTER UPDATE OR DELETE ON H_DELEGACIAS_OCORRENCIAS
FOR EACH ROW
DECLARE
    V_USU_BD VARCHAR(30);
    V_USU_SO VARCHAR(255) := SYS_CONTEXT('USERENV','OS_USER');
    V_TP_OPERACAO CHAR(1);
    V_ROWID VARCHAR(20);
    V_TABELA VARCHAR(30) := 'H_DELEGACIAS_OCORRENCIAS';
BEGIN
    SELECT USER INTO V_USU_BD FROM DUAL;
    V_ROWID := :OLD.ROWID;
    IF DELETING THEN
        V_TP_OPERACAO := 'D';
        AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,NULL,NULL,NULL,V_USU_BD,V_USU_SO,SYSDATE);
    ELSE
        V_TP_OPERACAO := 'U';
        IF (:NEW.HDOC_DEL_ID <> :OLD.HDOC_DEL_ID) THEN
            AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,'HDOC_DEL_ID',:OLD.HDOC_DEL_ID,:NEW.HDOC_DEL_ID,V_USU_BD,V_USU_SO,SYSDATE);
        END IF;
        IF (:NEW.HDOC_OCR_ID <> :OLD.HDOC_OCR_ID) THEN
            AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,'HDOC_OCR_ID',:OLD.HDOC_OCR_ID,:NEW.HDOC_OCR_ID,V_USU_BD,V_USU_SO,SYSDATE);
        END IF;
        IF (:NEW.HDHO_DATAHORA <> :OLD.HDOC_DATAHORA) THEN
            AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,'HDOC_DATAHORA',:OLD.HDOC_DATAHORA,:NEW.HDOC_DATAHORA,V_USU_BD,V_USU_SO,SYSDATE);
        END IF;
        
    END IF;
END;
/
ALTER TRIGGER "TG_AUD_DOC" ENABLE;

CREATE OR REPLACE NONEDITIONABLE TRIGGER "TG_AUD_DEH" 
AFTER UPDATE OR DELETE ON H_DELEGACIAS_ESPECIALIZADAS_HOMICIDIOS
FOR EACH ROW
DECLARE
    V_USU_BD VARCHAR(30);
    V_USU_SO VARCHAR(255) := SYS_CONTEXT('USERENV','OS_USER');
    V_TP_OPERACAO CHAR(1);
    V_ROWID VARCHAR(20);
    V_TABELA VARCHAR(30) := 'H_DELEGACIAS_ESPECIALIZADAS_HOMICIDIOS';
BEGIN
    SELECT USER INTO V_USU_BD FROM DUAL;
    V_ROWID := :OLD.ROWID;
    IF DELETING THEN
        V_TP_OPERACAO := 'D';
        AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,NULL,NULL,NULL,V_USU_BD,V_USU_SO,SYSDATE);
    ELSE
        V_TP_OPERACAO := 'U';
        IF (:NEW.HDEH_DES_ID <> :OLD.HDEH_DES_ID) THEN
            AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,'HDEH_DES_ID',:OLD.HDEH_DES_ID,:NEW.HDEH_DES_ID,V_USU_BD,V_USU_SO,SYSDATE);
        END IF;
        IF (:NEW.HDEH_HOM_ID <> :OLD.HDEH_HOM_ID) THEN
            AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,'HDEH_HOM_ID',:OLD.HDEH_HOM_ID,:NEW.HDEH_HOM_ID,V_USU_BD,V_USU_SO,SYSDATE);
        END IF;
        IF (:NEW.HDEH_DATAHORA <> :OLD.HDEH_DATAHORA) THEN
            AUDITORIA.PROC_AUDITORIA(V_TABELA,V_ROWID,V_TP_OPERACAO,'HDEH_DATAHORA',:OLD.HDEH_DATAHORA,:NEW.HDEH_DATAHORA,V_USU_BD,V_USU_SO,SYSDATE);
        END IF;
        
    END IF;
END;
/
ALTER TRIGGER "TG_AUD_DEH" ENABLE;

