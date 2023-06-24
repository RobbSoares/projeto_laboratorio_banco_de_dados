CREATE TABLE H_PESSOAS (
    hpes_id            INTEGER,
    hpes_tipo          VARCHAR2(26),
    hpes_sexo          VARCHAR2(26),
    hpes_idade         INTEGER,
    hpes_dt_nascimento VARCHAR2(30),
    hpes_cor_pele      VARCHAR2(26),
    hpes_profissao     VARCHAR2(128),
    hpes_datahora DATE,

    CONSTRAINT hpes_pk PRIMARY KEY ( hpes_id, hpes_datahora )
);

create trigger tg_hpes 
before update or delete on PESSOAS
for each row
begin
	insert into H_PESSOAS values (
        :old.pes_id,
        :old.pes_tipo,
        :old.pes_sexo,
        :old.pes_idade,
        :old.pes_dt_nascimento,
        :old.pes_cor_pele,
        :old.pes_profissao,
        sysdate        
        );
end;
/


CREATE TABLE H_HOMICIDIOS (
    hhom_id               INTEGER,
    hhom_hd               NUMBER,
    hhom_num_vit_hd       INTEGER,
    hhom_mes              INTEGER,
    hhom_ano              INTEGER,
    hhom_data_fato        DATE,
    hhom_hora_fato        VARCHAR2(26),
    hhom_natureza_apurada VARCHAR2(26),
    hhom_pes_id           INTEGER,
    hhom_datahora DATE,

    CONSTRAINT pk_hhom PRIMARY KEY ( hhom_id,  hhom_datahora)
);

create trigger tg_hhom 
before update or delete on HOMICIDIOS
for each row
begin
	insert into H_HOMICIDIOS values (
        :old.hom_id,
        :old.hom_hd,
        :old.hom_num_vit_hd,
        :old.hom_mes,
        :old.hom_ano,
        :old.hom_data_fato,
        :old.hom_hora_fato,
        :old.hom_natureza_apurada,
        :old.hom_pes_id,
        sysdate        
        );
end;
/

CREATE TABLE H_CIRCUNSCRICOES (
    hcir_id           INTEGER,
    hcir_municipio    VARCHAR2(60),
    hcir_datahora DATE,

    CONSTRAINT pk_hcir PRIMARY KEY (hcir_id, hcir_datahora)
);

create trigger tg_hcir 
before update or delete on CIRCUNSCRICOES
for each row
begin
	insert into H_CIRCUNSCRICOES values (
        :old.cir_id,
        :old.cir_municipio,
        sysdate        
        );
end;
/

CREATE TABLE H_DELEGACIAS (
    hdel_id                INTEGER,
    hdel_delegacia_policia VARCHAR2(90),
    hdel_datahora DATE,

    CONSTRAINT pk_hdel PRIMARY KEY (hdel_id, hdel_datahora)
);

create trigger tg_hdel 
before update or delete on DELEGACIAS
for each row
begin
	insert into H_DELEGACIAS values (
        :old.del_id,  
        :old.del_delegacia_policia,
        sysdate        
        );
end;
/

CREATE TABLE H_UNIDADES_ADMINISTRATIVAS (
    huna_id             INTEGER,
    huna_seccional      VARCHAR2(26),
    huna_datahora       DATE,

    CONSTRAINT pk_huna PRIMARY KEY (huna_id, huna_datahora)
);

create trigger tg_huna 
before update or delete on UNIDADES_ADMINISTRATIVAS
for each row
begin
	insert into H_UNIDADES_ADMINISTRATIVAS values (
        :old.una_id,
        :old.una_seccional,
        sysdate        
        );
end;
/

CREATE TABLE H_DEPARTAMENTOS (
    hdep_id INTEGER,
    hdep_departamento VARCHAR2(26),
    hdep_datahora DATE,

    CONSTRAINT pk_hdep PRIMARY KEY (hdep_id, hdep_datahora)
);

create trigger tg_hdep 
before update or delete on DEPARTAMENTOS
for each row
begin
	insert into H_DEPARTAMENTOS values (
        :old.dep_id,
        :old.dep_departamento,
        sysdate        
        );
end;
/

CREATE TABLE H_LOCAIS (
    hloc_id                INTEGER,
    hloc_logradouro        VARCHAR2(128),
    hloc_numero_logradouro INTEGER,
    hloc_latitude          VARCHAR2(26),
    hloc_longitude         VARCHAR2(26),
    hloc_datahora DATE,

    CONSTRAINT hlocais_pk PRIMARY KEY ( hloc_id, hloc_datahora )
);

create trigger tg_hloc 
before update or delete on LOCAIS
for each row
begin
	insert into H_LOCAIS values (
        :old.loc_id,
        :old.loc_logradouro,
        :old.loc_numero_logradouro,
        :old.loc_latitude,
        :old.loc_longitude,
        sysdate        
        );
end;
/

CREATE TABLE H_TIPO_LOCAL (
    htip_id         INTEGER,
    htip_desc_local VARCHAR2(26),
    htip_datahora DATE,

    CONSTRAINT pk_htip PRIMARY KEY ( htip_id, htip_datahora )
);

create trigger tg_htip 
before update or delete on TIPO_LOCAL
for each row
begin
	insert into H_TIPO_LOCAL values (
        :old.tip_id,
        :old.tip_desc_local,
        sysdate        
        );
end;
/

-- CREATE TABLE H_DIVISOES_ESPECIALIZADAS (
--     hdiv_id                INTEGER,
--     hdiv_divisao      VARCHAR2(60),
--     hdiv_datahora DATE,

--     CONSTRAINT pk_hdiv PRIMARY KEY ( hdiv_id, hdiv_datahora )
-- );

-- create trigger tg_hdiv 
-- before update or delete on DIVISOES_ESPECIALIZADAS
-- for each row
-- begin
-- 	insert into H_DIVISOES_ESPECIALIZADAS values (
--         :old.div_id,
--         :old.div_divisao,
--         sysdate        
--         );
-- end;
-- /

CREATE TABLE H_DELEGACIAS_ESPECIALIZADAS (
    hdes_id                INTEGER,
    hdes_delegacia_especializada      VARCHAR2(60),
    hdes_numero_delegacia    INTEGER,
    hdes_datahora DATE,

    CONSTRAINT pk_hdes PRIMARY KEY ( hdes_id, hdes_datahora )
);

create trigger tg_hdes 
before update or delete on DELEGACIAS_ESPECIALIZADAS
for each row
begin
	insert into H_DELEGACIAS_ESPECIALIZADAS values (
        :old.des_id,
        :old.des_delegacia_especializada,
        :old.des_numero_delegacia,
        sysdate        
        );
end;
/

-- CREATE TABLE H_MUNICIPIOS (
--     hmun_id                INTEGER,
--     hmun_municipio      VARCHAR2(60),
--     hmun_datahora DATE,

--     CONSTRAINT pk_hmun PRIMARY KEY ( hmun_id, hmun_datahora )
-- );

-- create trigger tg_hmun 
-- before update or delete on MUNICIPIOS
-- for each row
-- begin
-- 	insert into H_MUNICIPIOS values (
--         :old.mun_id,
--         :old.mun_municipio,
--         sysdate        
--         );
-- end;
-- /

CREATE TABLE H_OCORRENCIAS (
    hocr_id                   INTEGER,
    hocr_num_bo               VARCHAR2(30),
    hocr_datahora_registro_bo DATE,
    hocr_ano_bo               INTEGER,
    hocr_datahora             DATE,
 
    CONSTRAINT hocr_pk PRIMARY KEY ( hocr_id, hocr_datahora )
);

create trigger tg_hocr 
before update or delete on OCORRENCIAS
for each row
begin
	insert into H_OCORRENCIAS values (
        :old.ocr_id,
        :old.ocr_num_bo,
        :old.ocr_datahora_registro_bo,
        :old.ocr_ano_bo,
        sysdate        
        );
end;
/

-- Tabelas de relacionamento

-- CREATE TABLE H_DELEGACIAS_HOMICIDIOS (
--     hdho_del_id INTEGER,
--     hdho_hom_id INTEGER,
--     hdho_datahora DATE,

--     CONSTRAINT hdho_pk PRIMARY KEY ( hdho_del_id, hdho_hom_id, hdho_datahora )
-- );


-- create trigger tg_hdho
-- before update or delete on DELEGACIAS_HOMICIDIOS
-- for each row
-- begin
-- 	insert into H_DELEGACIAS_HOMICIDIOS values (
--         :old.dho_del_id,
--         :old.dho_hom_id,
--         sysdate        
--         );
-- end;
-- /

CREATE TABLE H_DELEGACIAS_CIRCUNSCRICOES (
    hdec_del_id INTEGER,
    hdec_cir_id INTEGER,
    hdec_datahora DATE,

    CONSTRAINT hdec_pk PRIMARY KEY ( hdec_del_id, hdec_cir_id, hdec_datahora )
);

create trigger tg_hdec
before update or delete on DELEGACIAS_CIRCUNSCRICOES
for each row
begin
	insert into H_DELEGACIAS_CIRCUNSCRICOES values (
        :old.dec_del_id,
        :old.dec_cir_id,
        sysdate        
        );
end;
/

CREATE TABLE H_UNIDADES_DELEGACIAS (
    hund_una_id INTEGER,
    hund_del_id INTEGER,
    hund_datahora DATE,

    CONSTRAINT hund_pk PRIMARY KEY ( hund_una_id, hund_del_id, hund_datahora )
);

create trigger tg_hund
before update or delete on UNIDADES_DELEGACIAS
for each row
begin
	insert into H_UNIDADES_DELEGACIAS values (
        :old.und_una_id,
        :old.und_del_id,
        sysdate        
        );
end;
/

CREATE TABLE H_TIPOS_LOCAIS (
    htil_tip_id INTEGER,
    htil_loc_id INTEGER,
    htil_datahora DATE,

    CONSTRAINT htil_pk PRIMARY KEY ( htil_tip_id, htil_loc_id, htil_datahora )

);

create trigger tg_htil
before update or delete on TIPOS_LOCAIS
for each row
begin
	insert into H_TIPOS_LOCAIS values (
        :old.til_tip_id,
        :old.til_loc_id,
        sysdate        
        );
end;
/

CREATE TABLE H_LOCAIS_HOMICIDIOS (
    hlho_hom_id INTEGER,
    hlho_loc_id INTEGER,
    hlho_datahora DATE,

    CONSTRAINT hlho_pk PRIMARY KEY ( hlho_hom_id, hlho_loc_id, hlho_datahora )

);

create trigger tg_hlho
before update or delete on LOCAIS_HOMICIDIOS
for each row
begin
	insert into H_LOCAIS_HOMICIDIOS values (
        :old.lho_hom_id,
        :old.lho_loc_id,
        sysdate        
        );
end;
/

CREATE TABLE H_DIVISOES_DELEGACIAS_ESPECIALIZADAS (
    hdde_des_id INTEGER,
    hdde_div_id INTEGER,
    hdde_datahora DATE,

    CONSTRAINT hdde_pk PRIMARY KEY ( hdde_des_id, hdde_div_id, hdde_datahora )

);

create trigger tg_hdde
before update or delete on DIVISOES_DELEGACIAS_ESPECIALIZADAS
for each row
begin
	insert into H_DIVISOES_DELEGACIAS_ESPECIALIZADAS values (
        :old.dde_des_id,
        :old.dde_div_id,
        sysdate        
        );
end;
/

CREATE TABLE H_DELEGACIAS_ESPECIALIZADAS_MUNICIPIOS (
    hdem_des_id INTEGER,
    hdem_mun_id INTEGER,
    hdem_datahora DATE,

    CONSTRAINT hdem_pk PRIMARY KEY ( hdem_des_id, hdem_mun_id, hdem_datahora )
);

create trigger tg_hdem
before update or delete on DELEGACIAS_ESPECIALIZADAS_MUNICIPIOS
for each row
begin
	insert into H_DELEGACIAS_ESPECIALIZADAS_MUNICIPIOS values (
        :old.dem_des_id,
        :old.dem_mun_id,
        sysdate        
        );
end;
/


CREATE TABLE H_DELEGACIAS_ESPECIALIZADAS_HOMICIDIOS (
    hdeh_des_id INTEGER,
    hdeh_hom_id INTEGER,
    hdeh_datahora DATE,

    CONSTRAINT hdeh_pk PRIMARY KEY ( hdeh_des_id, hdeh_hom_id, hdeh_datahora )
);

create trigger tg_hdeh
before update or delete on DELEGACIAS_ESPECIALIZADAS_HOMICIDIOS
for each row
begin
	insert into H_DELEGACIAS_ESPECIALIZADAS_HOMICIDIOS values (
        :old.deh_des_id,
        :old.deh_hom_id,
        sysdate        
        );
end;
/

CREATE TABLE H_DELEGACIAS_OCORRENCIAS (
    hdoc_del_id INTEGER,
    hdoc_ocr_id INTEGER,
    hdoc_datahora DATE,

    CONSTRAINT hdoc_pk PRIMARY KEY ( hdoc_del_id, hdoc_ocr_id, hdoc_datahora )
);

create trigger tg_hdoc
before update or delete on DELEGACIAS_OCORRENCIAS
for each row
begin
	insert into H_DELEGACIAS_OCORRENCIAS values (
        :old.doc_del_id,
        :old.doc_ocr_id,
        sysdate        
        );
end;
/