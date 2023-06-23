-- -- View ou visões: é uma consulta armazenada no banco de dados que se comporta como uma tabela
-- -- View dinâmica: o banco de dados armazena APENAS o sql que busca nas tabelas de origem e esses dados
-- -- ficam em memória a partir do momento em que a view é consultada pela 1a vez
-- -- Vantagens:
-- 	-- Rapidez no acesso aos dados
-- 	-- Reduzir a complexidade do SQL dentro da aplicação
-- 	-- Ela é atualizada em tempo real
-- 	-- Segurança

-- create view visao_empregados as (select 
-- 	first_name || ' ' || last_name as Nome,
-- 	email as Email,
-- 	hire_date as Contratacao,
-- 	job_title as Cargo,
-- 	department_name as Departamento,
-- 	city as Cidade,
-- 	state_province as Estado,
-- 	country_name as Pais,
-- 	region_name as Regiao
-- from 
-- 	hr.employees
-- 	inner join hr.jobs using (job_id)
-- 	left join hr.departments using (department_id)
-- 	left join hr.locations using(location_id)
-- 	left join hr.countries using (country_id)
-- 	left join hr.regions using (region_id)
-- );

-- select * from visao_empregados

-- -- pelo menos 5 transformações em uma única view gigante

-- -- view

-- create view visao_empregados as (

--     select

--         first_name || ' ' || last_name as Nome,

--         email as Email,

--         hire_date as Contratacao,

--         job_title as Cargo,

--         department_name as Departamento,

--         city as Cidade,

--         state_province as Estado,

--         country_name as Pais,

--         region_name

--     from

--         hr.employees

--         inner join hr.jobs using (job_id)

--         left join hr.departments using(department_id)

--         left join hr.locations using(location_id)

--         left join hr.countries using(country_id)

--         left join hr.regions using(region_id)

-- );

-- -- view materializada
-- create materialized view visao_mat_empregados as (

--     select

--         first_name || ' ' || last_name as Nome,

--         email as Email,

--         hire_date as Contratacao,

--         job_title as Cargo,

--         department_name as Departamento,

--         city as Cidade,

--         state_province as Estado,

--         country_name as Pais,

--         region_name

--     from

--         hr.employees

--         inner join hr.jobs using (job_id)

--         left join hr.departments using(department_id)

--         left join hr.locations using(location_id)

--         left join hr.countries using(country_id)

--         left join hr.regions using(region_id)

-- );


-- Atualizar view:

EXECUTE DBMS_MVIEW.REFRESH('visao_mat_empregados');

-- Dar acesso para criar view

grant create materialized view to app;




create materialized view dados_homicidios as (
SELECT
    d.del_delegacia_policia,
    c.cir_municipio,
    de.des_delegacia_especializada || ' ' || '-' || ' ' || de.des_numero_delegacia,
    p.pes_cor_pele,
    p.pes_dt_nascimento,
    p.pes_sexo,
    p.pes_tipo,
    h.hom_data_fato,
    l.loc_logradouro,
    l.loc_numero_logradouro,
    tp.tip_desc_local,
    SUBSTR(h.hom_hora_fato, 1, 5) AS "Horário",
    NVL(P.PES_PROFISSAO, 'PROFISSÃO NÃO INFORMADA') AS "Profissão",
    NVL(P.PES_IDADE, 0) AS "Idade",
    ROUND((COUNT(*) / (SELECT COUNT(*) FROM HOMICIDIOS)) * 100, 2) || '%' AS "Porcentagem de homicídios",
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
    LEFT JOIN TIPOS_LOCAIS TPS ON (tps.til_loc_id = L.LOC_ID)
    LEFT JOIN TIPO_LOCAL TP ON (TPS.TIL_TIP_ID = TP.TIP_ID)
GROUP BY
    d.del_delegacia_policia,
    c.cir_municipio,
    de.des_delegacia_especializada,
    de.des_numero_delegacia,
    p.pes_cor_pele,
    p.pes_dt_nascimento,
    p.pes_idade,
    p.pes_sexo,
    p.pes_profissao,
    p.pes_tipo,l.loc_logradouro,
    l.loc_numero_logradouro,
    tp.tip_desc_local,
    h.hom_data_fato,
    h.hom_hora_fato,
    h.hom_mes,
    h.hom_natureza_apurada,
    h.hom_id
);