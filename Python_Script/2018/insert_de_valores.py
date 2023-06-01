#!/usr/bin/env python
# encoding: utf-8
import armazena_valores


def create_unidades_administrativas(atualizacao = False, nome_json = '2017'):
    unidades_administrativas = {}
    colunas_unidades_administrativas = ['SECCIONAL_CIRCUNSCRICAO']

    armazena_valores.armazena_valores(unidades_administrativas, colunas_unidades_administrativas,
                                      'unidades_administrativas', atualizacao, True, nome_json)


def create_tipo_local(atualizacao = False):
    tipo_local = {}
    colunas_tipo_local = ['DESC_TIPOLOCAL']

    armazena_valores.armazena_valores(tipo_local, colunas_tipo_local, 'tipo_local', atualizacao)


def create_pessoas(atualizacao = False):
    pessoas = {}
    colunas_pessoas = ['TIPO_PESSOA', 'SEXO_PESSOA', 'IDADE_PESSOA', 'DATA_NASCIMENTO_PESSOA', 'COR_PELE', 'PROFISSAO']

    armazena_valores.armazena_valores(pessoas, colunas_pessoas, 'pessoas', False, atualizacao)


def create_ocorrencias(atualizacao = False):
    ocorrencias = {}
    colunas_ocorrencias = ['NUM_BO', 'DATAHORA_REGISTRO_BO', 'ANO_BO']

    armazena_valores.armazena_valores(ocorrencias, colunas_ocorrencias, 'ocorrencias', atualizacao)


def create_locais(atualizacao = False):
    locais = {}
    colunas_locais = ['LOGRADOURO', 'NUMERO_LOGRADOURO', 'LATITUDE', 'LONGITUDE']

    armazena_valores.armazena_valores(locais, colunas_locais, 'locais', atualizacao)


def create_homicidios(atualizacao = False):
    homicidios = {}
    colunas_homicidios = ['HD', 'Nº DE VÍT HD', 'MÊS ESTATISTICA', 'ANO ESTATISTICA', 'DATA_FATO', 'HORA_FATO',
                          'NATUREZA_APURADA', 'DATA_FATO', 'HORA_FATO', 'MÊS ESTATISTICA',
                          'NUMERO_LOGRADOURO', 'LATITUDE',
                          'LONGITUDE', 'DP_ELABORACAO', 'ID_DELEGACIA']

    armazena_valores.armazena_valores(homicidios, colunas_homicidios, 'homicidios', atualizacao, False)


def create_elaboracoes(atualizacao = False):
    elaboracoes = {}
    colunas_elaboracoes = ['MUNICIPIO_ELABORACAO', 'DP_ELABORACAO', 'DP_ELABORACAO', 'DEP_ELABORACAO']

    armazena_valores.armazena_valores(elaboracoes, colunas_elaboracoes, 'elaboracoes', atualizacao)


def create_departamentos(atualizacao = False, nome_json = '2017'):
    departamentos = {}
    colunas_departamentos = ['DEPARTAMENTO_CIRCUNSCRICAO']

    armazena_valores.armazena_valores(departamentos, colunas_departamentos, 'departamentos', atualizacao, nome_json)


def create_delegacias(atualizacao = False, nome_json = '2017'):
    delegacias = {}
    colunas_delegacias = ['DP_CIRCUNSCRICAO ']

    armazena_valores.armazena_valores(delegacias, colunas_delegacias, 'delegacias', atualizacao, True, nome_json)


def create_circunscricoes(atualizacao = False, nome_json = '2017'):
    circunscricoes = {}
    colunas_circunscricoes = ['MUNICIPIO_CIRCUNSCRICAO']

    armazena_valores.armazena_valores(circunscricoes, colunas_circunscricoes, 'circunscricoes', atualizacao, True, nome_json)


def create_locais(atualizacao = False):
    locais = {}
    colunas_locais = ['LOGRADOURO', 'NUMERO_LOGRADOURO', 'LATITUDE', 'LONGITUDE']

    armazena_valores.armazena_valores(locais, colunas_locais, 'locais', atualizacao)


def create_divisoes_especializadas(atualizacao = False, nome_json = '2017'):
    divisoes_especializadas = {}
    colunas_divisoes_especializadas = ['DEP_ELABORACAO']

    armazena_valores.armazena_valores(divisoes_especializadas, colunas_divisoes_especializadas,
                                      'divisoes_especializadas', atualizacao, True, nome_json)


def create_delegacias_especializadas(atualizacao = False, nome_json = '2017'):
    delegacias_especializadas = {}
    colunas_delegacias_especializadas = ['DP_ELABORACAO', 'ID_DELEGACIA']

    armazena_valores.armazena_valores(delegacias_especializadas, colunas_delegacias_especializadas,
                                      'delegacias_especializadas', atualizacao, True, nome_json)


def create_municipios(atualizacao = False):
    municipios = {}
    colunas_municipios = ['MUNICIPIO_ELABORACAO']

    armazena_valores.armazena_valores(municipios, colunas_municipios, 'municipios', atualizacao)


def create_ocorrencias(atualizacao = False):
    ocorrencias = {}
    colunas_ocorrencias = ['NUM_BO', 'DATAHORA_REGISTRO_BO', 'ANO_BO']

    armazena_valores.armazena_valores(ocorrencias, colunas_ocorrencias, 'ocorrencias', atualizacao)
