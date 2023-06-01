-- (1) Dias da semana contabilizando o ano de 2017 e 2018 em que ocorrem mais homícidios dolosos no estado de São Paulo

WITH TB_DIA AS (
    SELECT 
        hom_ano AS ANO,
        hom_data_fato as DATA,
        hom_hora_fato AS HORA,
        hom_mes AS MES,
        hom_natureza_apurada AS "CAUSA DA MORTE"
    FROM 
        HOMICIDIOS
    UNION ALL
    SELECT 
        hhom_ano AS ANO,
        hhom_data_fato as DATA,
        hhom_hora_fato AS HORA,
        hhom_mes AS MES,
        hhom_natureza_apurada AS "CAUSA DA MORTE"
    FROM 
        H_HOMICIDIOS
)
SELECT 
    TO_CHAR(DATA, 'DAY') AS "Dia da Semana", 
    COUNT(*) AS "Número de Homicídios"
FROM 
    TB_DIA 
WHERE
    TO_CHAR(DATA, 'DAY') LIKE '%SÁBADO%'
GROUP BY
    TO_CHAR(DATA, 'DAY') 
ORDER BY
    "Número de Homicídios"

-- (2) 

WITH TB_PESSOA AS (
    SELECT 
        pes_cor_pele AS "Cor da pele",
        pes_idade AS "Idade",
        pes_dt_nascimento,
        PES_PROFISSAO, 
        PES_SEXO, 
        PES_TIPO
    FROM 
        PESSOAS
    WHERE pes_tipo = 'Vítima'
    UNION ALL
    SELECT
        hpes_cor_pele AS "Cor da pele",
        hpes_idade AS "Idade",
        hpes_dt_nascimento,
        hpes_profissao, 
        hpes_sexo, 
        hPES_TIPO
    FROM 
        H_PESSOAS
    WHERE hpes_tipo = 'Vítima'
)
SELECT 
    "Cor da pele" AS "Número de vítimas",
    COUNT(*),
    ROUND(AVG("Idade")) as "Média de idade das vítimas"
FROM 
    TB_PESSOA 
    group by "Cor da pele"



-- (3)

WITH TB_PESSOA AS (
    SELECT 
        p.pes_idade AS "Idade",
        p.PES_PROFISSAO AS "Profissao"
    FROM 
        PESSOAS p
        JOIN HOMICIDIOS H ON (p.pes_id = h.hom_pes_id)
    WHERE p.pes_profissao = 'PEDREIRO'
    UNION ALL
    SELECT
        p.hpes_idade AS "Idade",
        p.hpes_profissao "Profissao"
    FROM 
        H_PESSOAS p
        JOIN H_HOMICIDIOS H ON (p.hpes_id = h.hhom_pes_id)
    WHERE hpes_profissao = 'PEDREIRO'
)
SELECT 
    "Profissao" AS "Número de profissionais pedreiros",
    COUNT(*),
    ROUND(AVG("Idade")) as "Média de idade das vítimas"
FROM 
    TB_PESSOA 
    group by "Profissao"


-- (4)


WITH TB_PESSOA AS (
    SELECT 
        p.pes_idade AS "Idade",
        p.pes_profissao AS "Profissao",
        p.pes_sexo AS "Sexo"
    FROM 
        PESSOAS p
        JOIN HOMICIDIOS H ON (p.pes_id = h.hom_pes_id)
    WHERE
        p.pes_profissao IS NOT NULL
    UNION
    SELECT
        p.hpes_idade AS "Idade",
        p.hpes_profissao "Profissao",
        p.hpes_sexo "Sexo"
    FROM 
        H_PESSOAS p
        JOIN H_HOMICIDIOS H ON (p.hpes_id = h.hhom_pes_id)
    WHERE
        p.hpes_profissao IS NOT NULL
)
SELECT 
    "Profissao",
    "Sexo" AS "Sexo da vítima",
    COUNT(*),
    ROUND(AVG("Idade")) as "Média de idade das vítimas"
FROM 
    TB_PESSOA 
    group by "Sexo", "Profissao"







