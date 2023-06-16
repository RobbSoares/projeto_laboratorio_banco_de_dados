-- Consulta para ver o número de mortos por cor de pele de cada ano

WITH TB_MORTOS AS (
    SELECT 
        hpes_cor_pele AS "Cor da pele",
        COUNT(*) AS "Número de mortos",
        '2017' AS "Ano"
    FROM 
        h_pessoas
    GROUP BY 
        hpes_cor_pele, hpes_cor_pele, '2017'
    UNION ALL
    SELECT 
        pes_cor_pele AS "Cor da pele",
        COUNT(*) AS "Número de mortos",
        '2018' AS "Ano"
    FROM 
        pessoas
    GROUP BY 
        pes_cor_pele, '2018'
)
SELECT 
    "Cor da pele" || ' (' || "Ano" || ')' AS "Cor da Pele",
    "Número de mortos"
FROM 
    TB_MORTOS
ORDER BY
    "Cor da pele";

-- Consulta para analisar o número de profissionais mortos de cada ano

WITH TB_PESSOA AS (
    SELECT 
        p.pes_idade AS "Idade",
        p.PES_PROFISSAO AS "Profissao",
        h.hom_ano "Ano"
    FROM 
        PESSOAS p
        JOIN HOMICIDIOS H ON (p.pes_id = h.hom_pes_id)
    UNION ALL
    SELECT
        p.hpes_idade AS "Idade",
        p.hpes_profissao "Profissao",
        h.hhom_ano "Ano"
    FROM 
        H_PESSOAS p
        JOIN H_HOMICIDIOS H ON (p.hpes_id = h.hhom_pes_id)
)
SELECT 
    "Profissao" || ' (' || "Ano" || ')' AS "Profissão",
    COUNT(*) AS "Número de profissionais",
    ROUND(AVG("Idade")) as "Média de idade das vítimas"
FROM 
    TB_PESSOA 
GROUP BY
    "Profissao", "Ano"
ORDER BY
      "Profissao"
    