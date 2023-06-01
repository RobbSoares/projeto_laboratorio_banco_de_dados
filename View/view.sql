-- View ou visões: é uma consulta armazenada no banco de dados que se comporta como uma tabela
-- View dinâmica: o banco de dados armazena APENAS o sql que busca nas tabelas de origem e esses dados
-- ficam em memória a partir do momento em que a view é consultada pela 1a vez
-- Vantagens:
	-- Rapidez no acesso aos dados
	-- Reduzir a complexidade do SQL dentro da aplicação
	-- Ela é atualizada em tempo real
	-- Segurança

create view visao_empregados as (select 
	first_name || ' ' || last_name as Nome,
	email as Email,
	hire_date as Contratacao,
	job_title as Cargo,
	department_name as Departamento,
	city as Cidade,
	state_province as Estado,
	country_name as Pais,
	region_name as Regiao
from 
	hr.employees
	inner join hr.jobs using (job_id)
	left join hr.departments using (department_id)
	left join hr.locations using(location_id)
	left join hr.countries using (country_id)
	left join hr.regions using (region_id)
);

select * from visao_empregados

-- pelo menos 5 transformações em uma única view gigante

-- view

create view visao_empregados as (

    select

        first_name || ' ' || last_name as Nome,

        email as Email,

        hire_date as Contratacao,

        job_title as Cargo,

        department_name as Departamento,

        city as Cidade,

        state_province as Estado,

        country_name as Pais,

        region_name

    from

        hr.employees

        inner join hr.jobs using (job_id)

        left join hr.departments using(department_id)

        left join hr.locations using(location_id)

        left join hr.countries using(country_id)

        left join hr.regions using(region_id)

);

-- view materializada
create materialized view visao_mat_empregados as (

    select

        first_name || ' ' || last_name as Nome,

        email as Email,

        hire_date as Contratacao,

        job_title as Cargo,

        department_name as Departamento,

        city as Cidade,

        state_province as Estado,

        country_name as Pais,

        region_name

    from

        hr.employees

        inner join hr.jobs using (job_id)

        left join hr.departments using(department_id)

        left join hr.locations using(location_id)

        left join hr.countries using(country_id)

        left join hr.regions using(region_id)

);


-- Atualizar view:

EXECUTE DBMS_MVIEW.REFRESH('visao_mat_empregados');

-- Dar acesso para criar view

grant create materialized view to app;