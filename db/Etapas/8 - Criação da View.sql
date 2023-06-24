create materialized view dados_homicidios as (
SELECT
    d.del_delegacia_policia AS "Delegacia",
    c.cir_municipio AS "Cidade",
    h.hom_num_vit_hd AS "Número de vítimas",
    de.des_delegacia_especializada || ' ' || '-' || ' ' || de.des_numero_delegacia AS "Especializada",
    p.pes_cor_pele AS "Cor da pele",
    CASE WHEN p.pes_dt_nascimento IS NULL THEN 'DATA NÃO INFORMADA' ELSE TO_CHAR(TO_DATE(p.pes_dt_nascimento, 'MM/DD/YYYY'), 'DD/MM/YYYY') END AS "Data de nascimento",
    p.pes_sexo AS "Sexo",
    p.pes_tipo AS "Vítima/Autor",
    CASE WHEN h.hom_data_fato IS NULL THEN 'DATA NÃO INFORMADA' ELSE TO_CHAR(h.hom_data_fato, 'DD/MM/YYYY') END AS "Data do homicídio",
    l.loc_latitude AS "Latitude",
    l.loc_logradouro AS "Rua",
    l.loc_numero_logradouro AS "Número da rua",
    h.hom_hora_fato,
    CASE
        WHEN h.hom_hora_fato = 'DE MADRUGADA' THEN 'Madrugada'
        WHEN h.hom_hora_fato = 'EM HORA INCERTA' THEN 'Hora incerta'
        WHEN h.hom_hora_fato = 'PELA MANHÃ' THEN 'Manhã'
        WHEN h.hom_hora_fato = 'A NOITE' THEN 'Noite'
        WHEN h.hom_hora_fato = 'A TARDE' THEN 'Tarde'
        ELSE SUBSTR(h.hom_hora_fato, 1, 5)
    END AS "Horário",
    CASE
        WHEN h.hom_hora_fato = 'DE MADRUGADA' THEN 'Madrugada'
        WHEN h.hom_hora_fato = 'EM HORA INCERTA' THEN 'Hora incerta'
        WHEN h.hom_hora_fato = 'PELA MANHÃ' THEN 'Manhã'
        WHEN h.hom_hora_fato = 'A NOITE' THEN 'Noite'
        WHEN h.hom_hora_fato = 'A TARDE' THEN 'Tarde'
        WHEN TO_NUMBER(SUBSTR(h.hom_hora_fato, 1, 2)) >= 0 AND TO_NUMBER(SUBSTR(h.hom_hora_fato, 1, 2)) < 6 THEN 'Madrugada'
        WHEN TO_NUMBER(SUBSTR(h.hom_hora_fato, 1, 2)) >= 6 AND TO_NUMBER(SUBSTR(h.hom_hora_fato, 1, 2)) < 12 THEN 'Manhã'
        WHEN TO_NUMBER(SUBSTR(h.hom_hora_fato, 1, 2)) >= 12 AND TO_NUMBER(SUBSTR(h.hom_hora_fato, 1, 2)) < 18 THEN 'Tarde'
        ELSE 'Noite'
    END AS "Faixa de Horário",
    NVL(P.PES_PROFISSAO, 'PROFISSÃO NÃO INFORMADA') AS "Profissão",
    CASE WHEN p.pes_idade IS NULL THEN 'IDADE NÃO INFORMADA' ELSE TO_CHAR(p.pes_idade) END AS "Idade",
    CASE
        WHEN p.pes_idade < 3 THEN 'Bebê'
        WHEN p.pes_idade >= 3 AND p.pes_idade <= 12 THEN 'Criança'
        WHEN p.pes_idade >= 13 AND p.pes_idade <= 17 THEN 'Adolescente'
        WHEN p.pes_idade >= 18 AND p.pes_idade <= 24 THEN 'Jovem adulto'
        WHEN p.pes_idade >= 25 AND p.pes_idade <= 39 THEN 'Adulto jovem'
        WHEN p.pes_idade >= 40 AND p.pes_idade <= 59 THEN 'Adulto de meia-idade'
        ELSE 'Idoso'
    END AS "Faixa etária",
    h.hom_natureza_apurada AS "Causa da morte"
FROM
    HOMICIDIOS H
    LEFT JOIN DELEGACIAS_HOMICIDIOS DH ON (DH.DHO_HOM_ID = H.HOM_ID)
    LEFT JOIN DELEGACIAS D ON (DH.DHO_DEL_ID = D.DEL_ID)
    LEFT JOIN DELEGACIAS_CIRCUNSCRICOES DC ON (DC.DEC_DEL_ID = D.DEL_ID)
    LEFT JOIN DELEGACIAS_ESPECIALIZADAS_HOMICIDIOS DEH ON (DEH.DEH_HOM_ID = H.HOM_ID)
    LEFT JOIN DELEGACIAS_ESPECIALIZADAS DE ON (DEH.DEH_DES_ID = DE.DES_ID)
    LEFT JOIN CIRCUNSCRICOES C ON (DC.DEC_CIR_ID = C.CIR_ID) 
    LEFT JOIN PESSOAS P ON (H.HOM_PES_ID = P.PES_ID)
    LEFT JOIN LOCAIS_HOMICIDIOS LH ON (LH.LHO_HOM_ID = H.HOM_ID)
    LEFT JOIN LOCAIS L ON (LH.LHO_LOC_ID = L.LOC_ID)
GROUP BY
    d.del_delegacia_policia,
    c.cir_municipio,
    h.hom_num_vit_hd,
    l.loc_numero_logradouro,
    l.loc_latitude,
    l.loc_logradouro,
    l.loc_numero_logradouro,
    de.des_delegacia_especializada,
    de.des_numero_delegacia,
    p.pes_cor_pele,
    p.pes_dt_nascimento,
    p.pes_idade,
    p.pes_sexo,
    p.pes_profissao,
    p.pes_tipo,l.loc_logradouro,
    h.hom_data_fato,
    h.hom_hora_fato,
    h.hom_mes,
    h.hom_natureza_apurada,
    h.hom_id
ORDER BY
    H.HOM_ID
);