#!/usr/bin/env python
# encoding: utf-8


import insert_de_valores
import tabelas_relacionamentos
import relacionamento_historico
import historico




def insercao_valores_2017():
    insert_de_valores.create_delegacias(False, '2017')
    insert_de_valores.create_homicidios(False, '2017')
    insert_de_valores.create_pessoas(False, '2017')
    insert_de_valores.create_locais(False, '2017')
    insert_de_valores.create_circunscricoes(False, '2017')
    insert_de_valores.create_unidades_administrativas(False, '2017')
    insert_de_valores.create_departamentos(False, '2017')
    insert_de_valores.create_tipo_local(False, '2017')
    insert_de_valores.create_divisoes_especializadas(False, '2017')
    insert_de_valores.create_delegacias_especializadas(False, '2017')
    insert_de_valores.create_ocorrencias(False, '2017')

def insercao_valores_2018():
    insert_de_valores.create_delegacias(True, '2018')
    insert_de_valores.create_homicidios(True, '2018')
    insert_de_valores.create_pessoas(True, '2018')
    insert_de_valores.create_locais(True, '2018')
    insert_de_valores.create_circunscricoes(True, '2018')
    insert_de_valores.create_unidades_administrativas(True, '2018')
    insert_de_valores.create_departamentos(True, '2018')
    insert_de_valores.create_tipo_local(True, '2018')
    insert_de_valores.create_divisoes_especializadas(True, '2018')
    insert_de_valores.create_delegacias_especializadas(True, '2018')
    insert_de_valores.create_ocorrencias(True, '2018')

def insercao_valores_historico():
    historico.migracao_de_dados("delegacias", 'del_id')
    historico.migracao_de_dados("circunscricoes", 'cir_id')
    historico.migracao_de_dados("delegacias_especializadas", 'des_id')


def insercao_valores_relacionamento():
    tabelas_relacionamentos.gera_tabela_relacionamento_locais_tipos()
    tabelas_relacionamentos.gera_tabela_relacionamento_locais_homicidios()
    tabelas_relacionamentos.gera_tabela_relacionamento_delegacias_circunscricoes()
    tabelas_relacionamentos.gera_tabela_relacionamento_delegacias_departamentos()
    tabelas_relacionamentos.gera_tabela_relacionamento_delegacias_especializadas_homicidios()
    tabelas_relacionamentos.gera_tabela_relacionamento_divisoes_delegacias_especializadas()
    tabelas_relacionamentos.gera_tabela_relacionamento_delegacias_homicidios()
    tabelas_relacionamentos.gera_tabela_relacionamento_delegacias_ocorrencias()
    

def insercao_valores_relacionamento_historico():
    relacionamento_historico.relacionamento_delegacias_circunscricoes()
    relacionamento_historico.relacionamento_delegacias_especializadas_homicidios()
    relacionamento_historico.relacionamento_divisoes_delegacias_especializadas()

# insercao_valores_2017()
# insercao_valores_2018()
insercao_valores_relacionamento()