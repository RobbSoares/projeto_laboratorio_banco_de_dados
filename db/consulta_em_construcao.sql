-- Consulta para ver o número de mortos por cor de pele de cada ano

WITH TB_MORTOS AS (
    SELECT 
        p.hpes_cor_pele AS "Cor da pele",
        COUNT(*) AS "Número de mortos",
        '2017' AS "Ano",
        d.del_delegacia_policia
    FROM 
        h_pessoas p
        join h_homicidios h on (p.hpes_id = h.hhom_pes_id)
        join h_delegacias_homicidios dh on (dh.hdho_hom_id = h.hhom_id)
        join delegacias d on (dh.hdho_del_id = d.del_id)
    GROUP BY 
        p.hpes_cor_pele, p.hpes_cor_pele, '2017', d.del_delegacia_policia
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
