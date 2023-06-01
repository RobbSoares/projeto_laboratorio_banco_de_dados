select 
    h.hom_id,
    l.loc_id,
    p.pes_tipo,
    p.pes_idade,
    p.pes_cor_pele,
    p.pes_profissao,
    p.pes_dt_nascimento,
    l.loc_latitude,
    l.loc_longitude,
    l.loc_numero_logradouro,
    l.loc_logradouro,
    de.des_delegacia_especializada,
    dp.dep_departamento,
    h.hom_ano
from 
    homicidios h 
    join delegacias_homicidios dh on (dh.dho_hom_id = h.hom_id)
    join delegacias d on (dh.dho_del_id = d.del_id)
    join delegacias_especializadas_homicidios dhe on (dhe.deh_hom_id = h.hom_id)
    join delegacias_especializadas de on  (dhe.deh_des_id = de.des_id)
    join locais_homicidios lh on (lh.lho_hom_id = h.hom_id)
    join locais l on (lh.lho_loc_id = l.loc_id)
    join delegacias_departamentos dd on (dd.dds_del_id = d.del_id)
    join departamentos dp on (dd.dds_dep_id = dp.dep_id)
    join pessoas p on (h.hom_pes_id = p.pes_id)
group by
    h.hom_id,
    l.loc_id,
    p.pes_tipo,
    p.pes_idade,
    p.pes_cor_pele,
    p.pes_profissao,
    p.pes_dt_nascimento,
    l.loc_latitude,
    l.loc_longitude,
    l.loc_numero_logradouro,
    l.loc_logradouro,
    de.des_delegacia_especializada,
    dp.dep_departamento,
    h.hom_ano
order by h.hom_id
