set define off;

create sequence sq_hom nocache;
create sequence sq_cir nocache;
create sequence sq_del nocache;
create sequence sq_dep nocache;
create sequence sq_una nocache;
create sequence sq_des nocache;
create sequence sq_div nocache;
create sequence sq_loc nocache;
create sequence sq_mun nocache;
create sequence sq_pes nocache;
create sequence sq_ocr nocache;
create sequence sq_tip nocache;


create trigger tg_sq_hom
before insert on homicidios
for each row
begin
    :new.hom_id := sq_hom.nextval;
end;
/

create trigger tg_sq_cir
before insert on circunscricoes
for each row
begin
    :new.cir_id := sq_cir.nextval;
end;
/

create trigger tg_sq_del
before insert on delegacias
for each row
begin
    :new.del_id := sq_del.nextval;
end;
/

create trigger tg_sq_dep
before insert on departamentos
for each row
begin
    :new.dep_id := sq_dep.nextval;
end;
/

create trigger tg_sq_una
before insert on unidades_administrativas
for each row
begin
    :new.una_id := sq_una.nextval;
end;
/

create trigger tg_sq_des
before insert on delegacias_especializadas
for each row
begin
    :new.des_id := sq_des.nextval;
end;
/

create trigger tg_sq_div
before insert on divisoes_especializadas
for each row
begin
    :new.div_id := sq_div.nextval;
end;
/

create trigger tg_sq_mun
before insert on municipios
for each row
begin
    :new.mun_id := sq_mun.nextval;
end;
/


create trigger tg_sq_loc
before insert on locais
for each row
begin
    :new.loc_id := sq_loc.nextval;
end;
/

create trigger tg_sq_pes
before insert on pessoas
for each row
begin
    :new.pes_id := sq_pes.nextval;
end;
/


create trigger tg_sq_sq_ocr
before insert on ocorrencias
for each row
begin
    :new.ocr_id := sq_ocr.nextval;
end;
/

create trigger tg_sq_tip_loc
before insert on tipo_local
for each row
begin
    :new.tip_id := sq_tip.nextval;
end;
/


-- Tabela DELEGACIAS

COMMENT ON COLUMN CIRCUNSCRICOES.cir_id  IS
    'Esta coluna é a PK.';

COMMENT ON COLUMN CIRCUNSCRICOES.cir_municipio  IS
    'Esta coluna armazena o nome do município onde a circunscrição está localizada. ';

-- Tabela DELEGACIAS_CIRCUNSCRICOES


COMMENT ON COLUMN DELEGACIAS_CIRCUNSCRICOES.dec_del_id   IS
    'Forma a PK da relação.';

COMMENT ON COLUMN DELEGACIAS_CIRCUNSCRICOES.dec_del_id   IS
    'Forma a PK da relação.';

-- Tabela DELEGACIAS

COMMENT ON COLUMN DELEGACIAS.del_id    IS
    'Esta coluna é a PK.';

COMMENT ON COLUMN DELEGACIAS.del_delegacia_policia   IS
    'Esta coluna armazena o nome da delegacia de polícia.';

-- Tabela DEPARTAMENTOS

COMMENT ON COLUMN DEPARTAMENTOS.dep_id    IS
    'Esta coluna é a PK.';

COMMENT ON COLUMN DEPARTAMENTOS.dep_departamento  IS
    'Esta coluna armazena o nome do departamento.';

-- Tabela DELEGACIAS_DEPARTAMENTOS

COMMENT ON COLUMN DELEGACIAS_DEPARTAMENTOS.dds_dep_id   IS
    'Forma a PK da relação.';

COMMENT ON COLUMN DELEGACIAS_DEPARTAMENTOS.dds_del_id   IS
    'Forma a PK da relação.';


-- Tabela DELEGACIAS_ESPECIALIZADAS

COMMENT ON COLUMN DELEGACIAS_ESPECIALIZADAS.des_id    IS
    'Esta coluna é a PK.';

COMMENT ON COLUMN DELEGACIAS_ESPECIALIZADAS.des_delegacia_especializada   IS
    'Esta coluna armazena o nome da delegacia de polícia especializada.';

COMMENT ON COLUMN DELEGACIAS_ESPECIALIZADAS.des_numero_delegacia   IS
    'Esta coluna armazena o número da delegacia de polícia especializada.';

-- Tabela DELEGACIAS_ESPECIALIZADAS_HOMICIDIOS

COMMENT ON COLUMN DELEGACIAS_ESPECIALIZADAS_HOMICIDIOS.deh_des_id   IS
    'Forma a PK da relação.';

COMMENT ON COLUMN DELEGACIAS_ESPECIALIZADAS_HOMICIDIOS.deh_hom_id   IS
    'Forma a PK da relação.';

-- Tabela DELEGACIAS_ESPECIALIZADAS_MUNICIPIOS

COMMENT ON COLUMN DELEGACIAS_ESPECIALIZADAS_MUNICIPIOS.dem_des_id   IS
    'Forma a PK da relação.';

COMMENT ON COLUMN DELEGACIAS_ESPECIALIZADAS_MUNICIPIOS.dem_mun_id   IS
    'Forma a PK da relação.';


-- Tabela DELEGACIAS_HOMICIDIOS

COMMENT ON COLUMN DELEGACIAS_HOMICIDIOS.dho_hom_id   IS
    'Forma a PK da relação.';

COMMENT ON COLUMN DELEGACIAS_HOMICIDIOS.dho_del_id   IS
    'Forma a PK da relação.';

-- Tabela DELEGACIAS_OCORRENCIAS

COMMENT ON COLUMN DELEGACIAS_OCORRENCIAS.doc_ocr_id   IS
    'Forma a PK da relação.';

COMMENT ON COLUMN DELEGACIAS_OCORRENCIAS.doc_del_id   IS
    'Forma a PK da relação.';


-- Tabela DIVISOES_DELEGACIAS_ESPECIALIZADAS

COMMENT ON COLUMN DIVISOES_DELEGACIAS_ESPECIALIZADAS.dde_des_id   IS
    'Forma a PK da relação.';

COMMENT ON COLUMN DIVISOES_DELEGACIAS_ESPECIALIZADAS.dde_div_id   IS
    'Forma a PK da relação.';

-- Tabela DIVISOES_ESPECIALIZADAS

COMMENT ON COLUMN DIVISOES_ESPECIALIZADAS.div_id    IS
    'Esta coluna é a PK.';

COMMENT ON COLUMN DIVISOES_ESPECIALIZADAS.div_divisao  IS
    'Esta coluna armazena o nome da divisão especializada.';


-- Tabela HOMICIDIOS

COMMENT ON COLUMN HOMICIDIOS.hom_id      IS
    'Esta coluna é a PK da relação.';

COMMENT ON COLUMN HOMICIDIOS.hom_hd    IS
    'Esta coluna armazena se é homicídio ou não.';

COMMENT ON COLUMN HOMICIDIOS.hom_num_vit_hd     IS
    'Esta coluna armazena o número de vítimas do homicídio.';

COMMENT ON COLUMN HOMICIDIOS.hom_mes     IS
    'Esta coluna armazena o mês em que ocorreu o homicídio.';

COMMENT ON COLUMN HOMICIDIOS.hom_ano      IS
    'Esta coluna armazena o ano em que ocorreu o homicídio.';

COMMENT ON COLUMN HOMICIDIOS.hom_data_fato      IS
    'Esta coluna armazena a data em que o fato ocorreu.';

COMMENT ON COLUMN HOMICIDIOS.hom_hora_fato      IS
    'Esta coluna armazena a hora em que o fato ocorreu.';

COMMENT ON COLUMN HOMICIDIOS.hom_natureza_apurada     IS
    'Esta coluna armazena a natureza do homicídio.';



-- Tabela LOCAIS

COMMENT ON COLUMN LOCAIS.loc_id    IS
    'Esta é a PK';

COMMENT ON COLUMN LOCAIS.loc_logradouro  IS
    'Esta coluna armazena o nome do logradouro.';

COMMENT ON COLUMN LOCAIS.loc_numero_logradouro    IS
    'Esta coluna armazena o número do logradouro.';

COMMENT ON COLUMN LOCAIS.loc_latitude  IS
    'Esta coluna armazena a latitude do local.';

COMMENT ON COLUMN LOCAIS.loc_longitude  IS
    'Esta coluna armazena a longitude do local.';


-- Tabela LOCAIS_HOMICIDIOS

COMMENT ON COLUMN LOCAIS_HOMICIDIOS.lho_hom_id    IS
    'Forma a PK da relação.';

COMMENT ON COLUMN LOCAIS_HOMICIDIOS.lho_loc_id      IS
    'Forma a PK da relação.';


-- Tabela MUNICIPIOS

COMMENT ON COLUMN MUNICIPIOS.mun_id    IS
    'Esta é a PK';

COMMENT ON COLUMN MUNICIPIOS.mun_municipio  IS
    'Esta coluna armazena o nome do municipio.';


-- Tabela OCORRENCIAS

COMMENT ON COLUMN OCORRENCIAS.ocr_id     IS
    'Esta coluna é a PK da relação.';

COMMENT ON COLUMN OCORRENCIAS.ocr_num_bo  IS
    'Esta coluna armazena o número do boletim de ocorrência.';

COMMENT ON COLUMN OCORRENCIAS.ocr_datahora_registro_bo   IS
    'Esta coluna armazena a data e hora do registro do boletim de ocorrência.';

COMMENT ON COLUMN OCORRENCIAS.ocr_ano_bo  IS
    'Esta coluna armazena o ano do boletim de ocorrência.';

-- Tabela PESSOAS

COMMENT ON COLUMN PESSOAS.pes_id     IS
    'Esta coluna é a PK da relação.';

COMMENT ON COLUMN PESSOAS.pes_tipo    IS
    'Esta coluna armazena o tipo da pessoa (vítima/autor).';

COMMENT ON COLUMN PESSOAS.pes_sexo   IS
    'Esta coluna armazena o sexo da pessoa.';

COMMENT ON COLUMN PESSOAS.pes_idade   IS
    'Esta coluna armazena a idade da pessoa.';

COMMENT ON COLUMN PESSOAS.pes_cor_pele   IS
    'Esta coluna armazena a cor da pele da pessoa.';

COMMENT ON COLUMN PESSOAS.pes_profissao   IS
    'Esta coluna armazena a profissão da pessoa.';

COMMENT ON COLUMN PESSOAS.pes_dt_nascimento    IS
    'Esta coluna armazena a data de nascimento da pessoa.';

-- TIPO_LOCAL

COMMENT ON COLUMN TIPO_LOCAL.tip_id   IS
    'Esta coluna é a FK.).';

COMMENT ON COLUMN TIPO_LOCAL.tip_desc_local   IS
    'Esta coluna armazena a descrição do tipo de local.';

-- UNIDADES_ADMINISTRATIVAS

COMMENT ON COLUMN UNIDADES_ADMINISTRATIVAS.una_id     IS
    'Esta coluna é a PK da relação.';

COMMENT ON COLUMN UNIDADES_ADMINISTRATIVAS.una_seccional   IS
    'Esta coluna armazena o nome da seccional de polícia especializada';


-- UNIDADES_DELEGACIAS

COMMENT ON COLUMN UNIDADES_DELEGACIAS.und_una_id     IS
    'Forma a PK da relação.';

COMMENT ON COLUMN UNIDADES_DELEGACIAS.und_del_id   IS
    'Forma a PK da relação.';

