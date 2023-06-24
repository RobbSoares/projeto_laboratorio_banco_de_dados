
CREATE TABLE PESSOAS (
    pes_id            INTEGER,
    pes_tipo          VARCHAR2(26),
    pes_sexo          VARCHAR2(26),
    pes_idade         INTEGER,
    pes_dt_nascimento VARCHAR2(30),
    pes_cor_pele      VARCHAR2(26),
    pes_profissao     VARCHAR2(128),
    

    CONSTRAINT pes_pk PRIMARY KEY ( pes_id ),
    CONSTRAINT ck_pes_tipo CHECK (pes_tipo is not null),
    CONSTRAINT ck_pes_sexo CHECK (pes_sexo is not null)
);

CREATE TABLE HOMICIDIOS (
    hom_id               INTEGER,
    hom_hd               NUMBER,
    hom_num_vit_hd       INTEGER,
    hom_mes              INTEGER,
    hom_ano              INTEGER,
    hom_data_fato        DATE,
    hom_hora_fato        VARCHAR2(26),
    hom_natureza_apurada VARCHAR2(26),
    hom_pes_id           INTEGER,

    CONSTRAINT pk_hom PRIMARY KEY ( hom_id ),
    CONSTRAINT fk_hom_pes FOREIGN KEY (hom_pes_id) REFERENCES pessoas(pes_id),
    CONSTRAINT ck_hom_num_vit_hd CHECK (hom_num_vit_hd is not null),
    CONSTRAINT ck_hom_mes CHECK (hom_mes is not null),
    CONSTRAINT ck_hom_ano CHECK (hom_ano is not null),
    CONSTRAINT ck_hom_data_fato CHECK (hom_data_fato is not null),
    CONSTRAINT ck_hom_hora_fato CHECK (hom_hora_fato is not null),
    CONSTRAINT ck_hom_natureza_apurada CHECK (hom_natureza_apurada is not null)
);



CREATE TABLE CIRCUNSCRICOES (
    cir_id           INTEGER,
    cir_municipio    VARCHAR2(60),
    CONSTRAINT pk_cir PRIMARY KEY (cir_id),
    CONSTRAINT ck_cir_municipio CHECK (cir_municipio is not null)
);

CREATE TABLE DELEGACIAS (
    del_id                INTEGER,
    del_delegacia_policia VARCHAR2(90),

    CONSTRAINT pk_del PRIMARY KEY (del_id),
    CONSTRAINT ck_del_delegacia_policia CHECK (del_delegacia_policia is not null)
);


CREATE TABLE DELEGACIAS_HOMICIDIOS (
    dho_del_id INTEGER,
    dho_hom_id INTEGER,

    CONSTRAINT pk_del_hom PRIMARY KEY (dho_del_id, dho_hom_id),
    CONSTRAINT fk_dho_del FOREIGN KEY (dho_del_id) REFERENCES delegacias (del_id),
    CONSTRAINT fk_dho_hom FOREIGN KEY (dho_hom_id) REFERENCES homicidios (hom_id)
);



CREATE TABLE DELEGACIAS_CIRCUNSCRICOES (
    dec_del_id INTEGER,
    dec_cir_id INTEGER,

    CONSTRAINT pk_del_cir PRIMARY KEY (dec_del_id, dec_cir_id),
    CONSTRAINT fk_dec_del FOREIGN KEY (dec_del_id) REFERENCES delegacias (del_id),
    CONSTRAINT fk_dec_cir FOREIGN KEY (dec_cir_id) REFERENCES circunscricoes (cir_id)
);

CREATE TABLE UNIDADES_ADMINISTRATIVAS (
    una_id INTEGER,
    una_seccional    VARCHAR2(26),
    CONSTRAINT pk_una PRIMARY KEY (una_id),
    CONSTRAINT ck_una_seccional CHECK (una_seccional is not null)
);


CREATE TABLE UNIDADES_DELEGACIAS (
    und_una_id INTEGER,
    und_del_id INTEGER,

    CONSTRAINT pk_una_cir PRIMARY KEY (und_una_id, und_del_id),
    CONSTRAINT fk_und_una FOREIGN KEY (und_una_id) REFERENCES unidades_administrativas (una_id),
    CONSTRAINT fk_und_del FOREIGN KEY (und_del_id) REFERENCES delegacias (del_id)
);

CREATE TABLE DEPARTAMENTOS (
    dep_id INTEGER,
    dep_departamento VARCHAR2(26),
    CONSTRAINT pk_dep PRIMARY KEY (dep_id),
    CONSTRAINT ck_dep_departamento CHECK (dep_departamento is not null)
);

CREATE TABLE DELEGACIAS_DEPARTAMENTOS (
    dds_dep_id INTEGER,
    dds_del_id INTEGER,

    CONSTRAINT pk_dep_del PRIMARY KEY (dds_dep_id, dds_del_id),
    CONSTRAINT fk_dds_dep FOREIGN KEY (dds_dep_id) REFERENCES departamentos (dep_id),
    CONSTRAINT fk_dds_del FOREIGN KEY (dds_del_id) REFERENCES delegacias (del_id)
);


CREATE TABLE LOCAIS (
    loc_id                INTEGER,
    loc_logradouro        VARCHAR2(128),
    loc_numero_logradouro INTEGER,
    loc_latitude          VARCHAR2(26),
    loc_longitude         VARCHAR2(26),

    CONSTRAINT locais_pk PRIMARY KEY ( loc_id ),
    CONSTRAINT ck_loc_logradouro CHECK (loc_logradouro is not null)
);

CREATE TABLE TIPO_LOCAL (
    tip_id         INTEGER,
    tip_desc_local VARCHAR2(26),

    CONSTRAINT pk_tip PRIMARY KEY ( tip_id ),
    CONSTRAINT ck_tip_desc_local CHECK (tip_desc_local is not null)
);

CREATE TABLE TIPOS_LOCAIS (
    til_tip_id INTEGER,
    til_loc_id INTEGER,

    CONSTRAINT pk_tip_loc PRIMARY KEY (til_loc_id, til_tip_id),
    CONSTRAINT fk_til_tip FOREIGN KEY (til_tip_id) REFERENCES tipo_local (tip_id),
    CONSTRAINT fk_til_loc FOREIGN KEY (til_loc_id) REFERENCES locais (loc_id)
);


CREATE TABLE LOCAIS_HOMICIDIOS (
    lho_hom_id INTEGER,
    lho_loc_id INTEGER,

    CONSTRAINT pk_hom_loc PRIMARY KEY (lho_hom_id, lho_loc_id),
    CONSTRAINT fk_lho_hom FOREIGN KEY (lho_hom_id) REFERENCES homicidios (hom_id),
    CONSTRAINT fk_lho_loc FOREIGN KEY (lho_loc_id) REFERENCES locais (loc_id)
);


CREATE TABLE DIVISOES_ESPECIALIZADAS (
    div_id                INTEGER,
    div_divisao      VARCHAR2(60),

    CONSTRAINT pk_div PRIMARY KEY ( div_id ),
    CONSTRAINT ck_div_divisao CHECK (div_divisao is not null)
);

CREATE TABLE DELEGACIAS_ESPECIALIZADAS (
    des_id                INTEGER,
    des_delegacia_especializada      VARCHAR2(60),
    des_numero_delegacia    INTEGER,

    CONSTRAINT pk_des PRIMARY KEY ( des_id ),
    CONSTRAINT ck_des_delegacia_especializada CHECK (des_delegacia_especializada is not null),
    CONSTRAINT ck_des_numero_delegacia CHECK (des_numero_delegacia is not null)
);

CREATE TABLE DIVISOES_DELEGACIAS_ESPECIALIZADAS (
    dde_des_id INTEGER,
    dde_div_id INTEGER,

    CONSTRAINT pk_div_des PRIMARY KEY (dde_des_id, dde_div_id),
    CONSTRAINT fk_dde_des FOREIGN KEY (dde_des_id) REFERENCES delegacias_especializadas (des_id),
    CONSTRAINT fk_dde_div FOREIGN KEY (dde_div_id) REFERENCES divisoes_especializadas (div_id)
);



CREATE TABLE DELEGACIAS_ESPECIALIZADAS_HOMICIDIOS (
    deh_des_id INTEGER,
    deh_hom_id INTEGER,

    CONSTRAINT pk_des_hom PRIMARY KEY (deh_des_id, deh_hom_id),
    CONSTRAINT fk_deh_des FOREIGN KEY (deh_des_id) REFERENCES delegacias_especializadas (des_id),
    CONSTRAINT fk_deh_hom FOREIGN KEY (deh_hom_id) REFERENCES homicidios (hom_id)
);

CREATE TABLE OCORRENCIAS (
    ocr_id                   INTEGER,
    ocr_num_bo               VARCHAR2(30),
    ocr_datahora_registro_bo DATE,
    ocr_ano_bo               INTEGER,
 
    CONSTRAINT ocr_pk PRIMARY KEY ( ocr_id ),
    CONSTRAINT ck_ocr_num_bo CHECK (ocr_num_bo is not null),
    CONSTRAINT ck_ocr_datahora_registro_bo CHECK (ocr_datahora_registro_bo is not null),
    CONSTRAINT ck_ocr_ano_bo CHECK (ocr_ano_bo is not null)
);


CREATE TABLE DELEGACIAS_OCORRENCIAS (
    doc_del_id INTEGER,
    doc_ocr_id INTEGER,

    CONSTRAINT pk_ocr_del PRIMARY KEY (doc_del_id, doc_ocr_id),
    CONSTRAINT fk_doc_del FOREIGN KEY (doc_del_id) REFERENCES delegacias (del_id),
    CONSTRAINT fk_doc_ocr FOREIGN KEY (doc_ocr_id) REFERENCES ocorrencias (ocr_id)
);


