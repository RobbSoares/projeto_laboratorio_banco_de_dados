-- Consulta para analisar o número e o percentual de vítimas de acordo com o sexo.

SELECT 
    COUNT(*) AS "Número de homicídios", 
    ROUND(AVG(p.pes_idade)) AS "Média de idade", 
    
    SUM(CASE WHEN p.pes_sexo = 'Feminino' AND p.pes_tipo = 'Vítima' THEN 1 ELSE 0 END) AS "Vítimas femininas",
    SUM(CASE WHEN p.pes_sexo = 'Masculino' AND p.pes_tipo = 'Vítima' THEN 1 ELSE 0 END) AS "Vítimas masculinas",
    SUM(CASE WHEN p.pes_sexo != 'Masculino' AND p.pes_sexo != 'Feminino' AND p.pes_tipo = 'Vítima' THEN 1 ELSE 0 END) AS "Sexo indefinido",

    ROUND(100 * SUM(CASE WHEN p.pes_sexo = 'Feminino' AND p.pes_tipo = 'Vítima' THEN 1 ELSE 0 END) / COUNT(*), 2) || '%' AS "Percentual de vítimas femininas",
    ROUND(100 * SUM(CASE WHEN p.pes_sexo = 'Masculino' AND p.pes_tipo = 'Vítima' THEN 1 ELSE 0 END) / COUNT(*), 2) || '%' AS "Percentual de vítimas masculinas",
    ROUND(100 * SUM(CASE WHEN p.pes_sexo != 'Masculino' AND p.pes_sexo != 'Feminino' AND p.pes_tipo = 'Vítima' THEN 1 ELSE 0 END) / COUNT(*), 2) || '%' AS "Percentual de vítimas de sexo indefinido"
FROM 
    homicidios h
    join pessoas p on (h.hom_pes_id = p.pes_id) 

-- Consulta para analisar o número e o percentual de autores de homícidios de acordo com o sexo.

SELECT 
    COUNT(*) AS "Número de homicídios", 
    ROUND(AVG(CASE WHEN p.pes_tipo <> 'Vítima' THEN p.pes_idade END)) AS "Média de idade de homicidas", 
    
    SUM(CASE WHEN p.pes_sexo = 'Feminino' AND p.pes_tipo = 'Autor/Vitima' THEN 1 ELSE 0 END) AS "Autores femininos",
    SUM(CASE WHEN p.pes_sexo = 'Masculino' AND p.pes_tipo = 'Autor/Vitima' THEN 1 ELSE 0 END) AS "Autores masculinos",
    
    ROUND(100 * SUM(CASE WHEN p.pes_sexo = 'Feminino' AND p.pes_tipo = 'Autor/Vitima' THEN 1 ELSE 0 END) / COUNT(*), 2) || '%'  AS "Percentual de autores femininas",
    ROUND(100 * SUM(CASE WHEN p.pes_sexo = 'Masculino' AND p.pes_tipo = 'Autor/Vitima' THEN 1 ELSE 0 END) / COUNT(*), 2) || '%' AS "Percentual de autores masculinos",
    
    ROUND(100 * SUM(CASE WHEN p.pes_sexo = 'Masculino' AND p.pes_tipo <> 'Autor/Vitima' AND p.pes_tipo <> 'Vítima' THEN 1 ELSE 0 END) / COUNT(*), 2) || '%' AS "Outros - masculinos",
    ROUND(100 * SUM(CASE WHEN p.pes_sexo = 'Feminino' AND p.pes_tipo <> 'Autor/Vitima' AND p.pes_tipo <> 'Vítima' THEN 1 ELSE 0 END) / COUNT(*), 2) || '%' AS "Outros - femininos"
FROM 
    homicidios h
    join pessoas p on (h.hom_pes_id = p.pes_id) 
ORDER BY 
    "Número de homicídios" DESC;


-- Consulta para analisar os números de ocorrência das delegacias de polícia do Estado de SP

SELECT 
    COUNT(*) AS "Número de ocorrências",
    ROUND(100 * COUNT(*) / (SELECT COUNT(*) FROM ocorrencias), 2) || '%' AS "Percentual de ocorrências",
    d.del_delegacia_policia AS "Delegacia de polícia"
FROM 
    delegacias d
    join delegacias_ocorrencias do on (do.doc_del_id = d.del_id)
    join ocorrencias o on (do.doc_ocr_id = o.ocr_id) 
GROUP BY
    d.del_delegacia_policia
ORDER BY
    "Número de ocorrências" DESC


-- índice de homícidios por local

SELECT DISTINCT
    l.loc_logradouro as "Local do homícidio",
    ROUND(100 * COUNT(*) / (SELECT COUNT(*) FROM LOCAIS), 2) || '%' AS "Percentual de homícidios ocorridos neste local",
    COUNT(*) as "Número de homícidios"
FROM
    HOMICIDIOS H
    JOIN LOCAIS_HOMICIDIOS LH ON (LH.LHO_HOM_ID = H.HOM_ID)
    JOIN LOCAIS L ON (LH.LHO_LOC_ID = L.LOC_ID) 
GROUP BY
    l.loc_logradouro
ORDER BY
   "Número de homícidios" DESC


-- Consulta para analisar os indíces de homícios registrados em municípios de SP e a cor da pele das vítimas


SELECT
    c.cir_municipio,
    COUNT(*) as "Número de homícidios",
    ROUND(100 * COUNT(CASE WHEN p.pes_cor_pele = 'Branca' THEN 1 END) / COUNT(*), 2) || '%' AS "Vítimas brancas",
    ROUND(100 * COUNT(CASE WHEN p.pes_cor_pele = 'Preta' THEN 1 END) / COUNT(*), 2) || '%' AS "Vítimas pretas",
    ROUND(100 * COUNT(CASE WHEN p.pes_cor_pele = 'Parda' THEN 1 END) / COUNT(*), 2) || '%' AS "Vítimas pardas",
    ROUND(100 * COUNT(CASE WHEN p.pes_cor_pele = 'Amarela' THEN 1 END) / COUNT(*), 2) || '%' AS "Vítimas amarelas",
    ROUND(100 * COUNT(CASE WHEN p.pes_cor_pele = 'Vermelha' THEN 1 END) / COUNT(*), 2) || '%' AS "Vítimas indígenas",
    ROUND(100 * COUNT(CASE WHEN p.pes_cor_pele = 'Outros' THEN 1 END)/ COUNT(*), 2) || '%' AS "Cor da pele não identificada"
FROM
    HOMICIDIOS H
    JOIN DELEGACIAS_HOMICIDIOS DH ON (DH.DHO_HOM_ID = H.HOM_ID)
    JOIN DELEGACIAS D ON (DH.DHO_DEL_ID = D.DEL_ID)
    JOIN DELEGACIAS_CIRCUNSCRICOES DC ON (DC.DEC_DEL_ID = D.DEL_ID)
    JOIN CIRCUNSCRICOES C ON (DC.DEC_CIR_ID = C.CIR_ID) 
    JOIN PESSOAS P ON (H.HOM_PES_ID = P.PES_ID)
GROUP BY
    c.cir_municipio
ORDER BY
   "Número de homícidios" DESC


-- Consulta de índice de homícidios por profissão e média de idade

SELECT
    COUNT(*) AS "Número de homicídios",
    NVL(P.PES_PROFISSAO, 'PROFISSÃO NÃO INFORMADA') AS "Profissão",
    ROUND(AVG(P.PES_IDADE)),
    ROUND((COUNT(*) / (SELECT COUNT(*) FROM HOMICIDIOS)) * 100, 2) || '%' AS "Porcentagem de homicídios" 
FROM
    PESSOAS P
    JOIN HOMICIDIOS H ON (P.PES_ID = H.HOM_PES_ID)
GROUP BY
    NVL(PES_PROFISSAO, 'PROFISSÃO NÃO INFORMADA') 
ORDER BY
    "Número de homicídios" DESC