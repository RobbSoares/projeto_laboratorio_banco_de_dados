#!/usr/bin/env python
# encoding: utf-8


import insert_de_valores
import tabelas_relacionamentos
import relacionamento_historico
import historico





# 2018
insert_de_valores.create_delegacias(False, '2017')
insert_de_valores.create_delegacias(True, '2018')
historico.migracao_de_dados("delegacias", 'del_id')

insert_de_valores.create_circunscricoes(False, '2017')
insert_de_valores.create_circunscricoes(True, '2018')
historico.migracao_de_dados("circunscricoes", 'cir_id')

insert_de_valores.create_delegacias_especializadas(False, '2017')
insert_de_valores.create_delegacias_especializadas(True, '2018')
historico.migracao_de_dados("delegacias_especializadas", 'des_id')

relacionamento_historico.relacionamento_delegacias_circunscricoes()
relacionamento_historico.relacionamento_delegacias_especializadas_homicidios()
relacionamento_historico.relacionamento_divisoes_delegacias_especializadas()

insert_de_valores.create_homicidios()
insert_de_valores.create_homicidios(True, '2018')
insert_de_valores.create_pessoas(True, '2018')
insert_de_valores.create_locais(True)
insert_de_valores.create_delegacias(True)
insert_de_valores.create_circunscricoes(True)
insert_de_valores.create_unidades_administrativas(True)
insert_de_valores.create_homicidios(True)
insert_de_valores.create_locais(True)
insert_de_valores.create_departamentos(True)
insert_de_valores.create_tipo_local(True)
insert_de_valores.create_divisoes_especializadas(True)
insert_de_valores.create_delegacias_especializadas(True)
insert_de_valores.create_municipios(True)
insert_de_valores.create_ocorrencias(True)


# insert_de_valores.create_pessoas()
# insert_de_valores.create_locais()

# insert_de_valores.create_unidades_administrativas()
# insert_de_valores.create_homicidios()
# insert_de_valores.create_locais()
# insert_de_valores.create_departamentos()
# insert_de_valores.create_tipo_local()
# insert_de_valores.create_divisoes_especializadas()
# insert_de_valores.create_delegacias_especializadas()
# insert_de_valores.create_municipios()
# insert_de_valores.create_ocorrencias()







# tabelas_relacionamentos.gera_tabela_relacionamento_locais_tipos()
# tabelas_relacionamentos.gera_tabela_relacionamento_unidades_delegacias()
# tabelas_relacionamentos.gera_tabela_relacionamento_locais_homicidios()
# tabelas_relacionamentos.gera_tabela_relacionamento_delegacias_circunscricoes()
# tabelas_relacionamentos.gera_tabela_relacionamento_delegacias_departamentos()
# tabelas_relacionamentos.gera_tabela_relacionamento_delegacias_especializadas_homicidios()
# tabelas_relacionamentos.gera_tabela_relacionamento_divisoes_delegacias_especializadas()
# tabelas_relacionamentos.gera_tabela_relacionamento_delegacias_especializadas_municipios()
# tabelas_relacionamentos.gera_tabela_relacionamento_delegacias_homicidios()
# tabelas_relacionamentos.gera_tabela_relacionamento_delegacias_ocorrencias()

