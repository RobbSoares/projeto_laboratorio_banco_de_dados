-- Tabela DELEGACIAS

COMMENT ON COLUMN CIRCUNSCRICOES.cir_id  IS
    'Esta coluna é a PK da relação.';

COMMENT ON COLUMN CIRCUNSCRICOES.cir_departamento  IS
    'Esta coluna armazena o nome do departamento ao qual a circunscrição pertence.';

COMMENT ON COLUMN CIRCUNSCRICOES.cir_seccional  IS
    'Esta coluna armazena o nome da seccional à qual a circunscrição está associada.';

COMMENT ON COLUMN CIRCUNSCRICOES.cir_municipio  IS
    'Esta coluna armazena o nome do município onde a circunscrição está localizada. ';

-- Tabela CIRCUNSCRICOES_HOMICIDIOS

COMMENT ON COLUMN CIRCUNSCRICOES_HOMICIDIOS.cho_cir_id   IS
    'Forma a PK da relação.';

COMMENT ON COLUMN CIRCUNSCRICOES_HOMICIDIOS.cho_hom_id   IS
    'Forma a PK da relação.';


-- Tabela DELEGACIAS

COMMENT ON COLUMN DELEGACIAS.del_id    IS
    'Esta coluna é a PK da relação.';

COMMENT ON COLUMN DELEGACIAS.del_cir_id  IS
    'Esta coluna é a FK.';

COMMENT ON COLUMN DELEGACIAS.cho_hom_id   IS
    'Esta coluna armazena o nome da delegacia de polícia.';

COMMENT ON COLUMN DELEGACIAS.del_num   IS
    'Esta coluna armazena o numero da delegacia';

-- Tabela ELABORACOES

COMMENT ON COLUMN ELABORACOES.elb_id    IS
    'Esta coluna é a PK da relação.';

COMMENT ON COLUMN ELABORACOES.elb_municipio   IS
    'Esta coluna armazena o nome do município associado à elaboração. ';

COMMENT ON COLUMN ELABORACOES.elb_delegacia_policia    IS
    'Esta coluna armazena o nome da delegacia de polícia associada à elaboração.';

COMMENT ON COLUMN ELABORACOES.elb_seccional    IS
    'Esta coluna armazena o nome da seccional associada à elaboração.';

COMMENT ON COLUMN ELABORACOES.elb_departamento     IS
    'Esta coluna armazena o nome do departamento associado à elaboração.';

-- Tabela ELABORACOES_HOMICIDIOS

COMMENT ON COLUMN ELABORACOES.elb_seccional    IS
    'Forma a PK da relação.';

COMMENT ON COLUMN ELABORACOES.elb_departamento     IS
    'Forma a PK da relação.';

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


-- Tabela HOMICIDIOS_PESSOAS

COMMENT ON COLUMN HOMICIDIOS_PESSOAS.elb_seccional    IS
    'Forma a PK da relação.';

COMMENT ON COLUMN HOMICIDIOS_PESSOAS.elb_departamento     IS
    'Forma a PK da relação.';

-- Tabela LOCAIS

COMMENT ON COLUMN LOCAIS.loc_id    IS
    'Forma a PK da relação.';

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

-- Tabela OCORRENCIAS

COMMENT ON COLUMN OCORRENCIAS.ocr_id     IS
    'Esta coluna é a PK da relação.';

COMMENT ON COLUMN OCORRENCIAS.ocr_del_id   IS
    'Esta coluna é a FK.';

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

COMMENT ON COLUMN TIPO_LOCAL.tip_id     IS
    'Esta coluna é a PK da relação.';

COMMENT ON COLUMN TIPO_LOCAL.tip_loc_id   IS
    'Esta coluna é a FK.).';

COMMENT ON COLUMN TIPO_LOCAL.tip_desc_local   IS
    'Esta coluna armazena a descrição do tipo de local.';
