#!/usr/bin/env python
# encoding: utf-8
import armazena_valores


def create_unidades_administrativas():
    unidades_administrativas = {}
    colunas_unidades_administrativas = ['SECCIONAL_CIRCUNSCRICAO']

    armazena_valores.armazena_valores(unidades_administrativas, colunas_unidades_administrativas,
                                      'unidades_administrativas')


def create_tipo_local():
    tipo_local = {}
    colunas_tipo_local = ['DESC_TIPOLOCAL']

    armazena_valores.armazena_valores(tipo_local, colunas_tipo_local, 'tipo_local')


def create_pessoas():
    pessoas = {}
    colunas_pessoas = ['TIPO_PESSOA', 'SEXO_PESSOA', 'IDADE_PESSOA', 'DATA_NASCIMENTO_PESSOA', 'COR_PELE', 'PROFISSAO']

    armazena_valores.armazena_valores(pessoas, colunas_pessoas, 'pessoas', False)


def create_ocorrencias():
    ocorrencias = {}
    colunas_ocorrencias = ['NUM_BO', 'DATAHORA_REGISTRO_BO', 'ANO_BO']

    armazena_valores.armazena_valores(ocorrencias, colunas_ocorrencias, 'ocorrencias')


def create_locais():
    locais = {}
    colunas_locais = ['LOGRADOURO', 'NUMERO_LOGRADOURO', 'LATITUDE', 'LONGITUDE']

    armazena_valores.armazena_valores(locais, colunas_locais, 'locais')


def create_homicidios():
    homicidios = {}
    colunas_homicidios = ['HD', 'Nº DE VÍT HD', 'MÊS ESTATISTICA', 'ANO ESTATISTICA', 'DATA_FATO', 'HORA_FATO',
                          'NATUREZA_APURADA', 'DATA_FATO', 'HORA_FATO', 'MÊS ESTATISTICA',
                          'NUMERO_LOGRADOURO', 'LATITUDE',
                          'LONGITUDE', 'DP_ELABORACAO', 'ID_DELEGACIA']

    armazena_valores.armazena_valores(homicidios, colunas_homicidios, 'homicidios', False)


def create_elaboracoes():
    elaboracoes = {}
    colunas_elaboracoes = ['MUNICIPIO_ELABORACAO', 'DP_ELABORACAO', 'DP_ELABORACAO', 'DEP_ELABORACAO']

    armazena_valores.armazena_valores(elaboracoes, colunas_elaboracoes, 'elaboracoes')


def create_departamentos():
    departamentos = {}
    colunas_departamentos = ['DEPARTAMENTO_CIRCUNSCRICAO']

    armazena_valores.armazena_valores(departamentos, colunas_departamentos, 'departamentos')


def create_delegacias():
    delegacias = {}
    colunas_delegacias = ['DP_CIRCUNSCRICAO ']

    armazena_valores.armazena_valores(delegacias, colunas_delegacias, 'delegacias')


def create_circunscricoes():
    circunscricoes = {}
    colunas_circunscricoes = ['MUNICIPIO_CIRCUNSCRICAO']

    armazena_valores.armazena_valores(circunscricoes, colunas_circunscricoes, 'circunscricoes')


def create_locais():
    locais = {}
    colunas_locais = ['LOGRADOURO', 'NUMERO_LOGRADOURO', 'LATITUDE', 'LONGITUDE']

    armazena_valores.armazena_valores(locais, colunas_locais, 'locais')


def create_divisoes_especializadas():
    divisoes_especializadas = {}
    colunas_divisoes_especializadas = ['DEP_ELABORACAO']

    armazena_valores.armazena_valores(divisoes_especializadas, colunas_divisoes_especializadas,
                                      'divisoes_especializadas')


def create_delegacias_especializadas():
    delegacias_especializadas = {}
    colunas_delegacias_especializadas = ['DP_ELABORACAO', 'ID_DELEGACIA']

    armazena_valores.armazena_valores(delegacias_especializadas, colunas_delegacias_especializadas,
                                      'delegacias_especializadas')


def create_municipios():
    municipios = {}
    colunas_municipios = ['MUNICIPIO_ELABORACAO']

    armazena_valores.armazena_valores(municipios, colunas_municipios, 'municipios')


def create_ocorrencias():
    ocorrencias = {}
    colunas_ocorrencias = ['NUM_BO', 'DATAHORA_REGISTRO_BO', 'ANO_BO']

    armazena_valores.armazena_valores(ocorrencias, colunas_ocorrencias, 'ocorrencias')
