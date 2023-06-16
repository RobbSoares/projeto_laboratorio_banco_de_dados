#!/usr/bin/env python
# encoding: utf-8
import pandas as pd


def gera_tabela_relacionamento_delegacias_circunscricoes():
    delegacias = []
    circunscricoes = []

    with open('output_2018.json', encoding='utf-8') as fh:
        df = pd.read_json(fh)

    with open('tabelas/atualizadas/delegacias/atualizacao.sql', encoding='utf-8') as fh:
        for line in fh:
            delegacias.append(line)

    with open('tabelas/atualizadas/circunscricoes/atualizacao.sql', encoding='utf-8') as fh:
        for line in fh:
            circunscricoes.append(line)

    lines_already_seen = []

    delegacias_df = df[['DP_CIRCUNSCRICAO ', 'MUNICIPIO_CIRCUNSCRICAO']].drop_duplicates().values.tolist()

    for delegacia in delegacias_df:
        lines_already_seen.append((delegacia[0], delegacia[1]))

    delegacias_segmentadas = []
    for delegacia in delegacias:
        delegacias_segmentadas.append(delegacia.split("(")[1].split(")")[0].split(", "))

    circunscricoes_segmentadas = []
    for circunscricao in circunscricoes:
        circunscricoes_segmentadas.append(circunscricao.split("(")[1].split(")")[0].split(", "))

    seen = []
    inserts = []
    for delegacia in delegacias_segmentadas:
        for line_df in lines_already_seen:
            if delegacia[1].strip("'") == line_df[0]:
                for circunscricao in circunscricoes_segmentadas:
                    if circunscricao[1].strip("'") == line_df[1]:
                        inserts.append(
                            f"insert into delegacias_circunscricoes values ({delegacia[0]}, {circunscricao[0]}); \n")
                        seen.append((delegacia[1], circunscricao[1]))

    print(len(inserts))
    output = open('tabelas/relacionamento/delegacias_circunscricoes/output.sql', 'w',  encoding="utf-8")
    for e in inserts:
        output.write(e)


def gera_tabela_relacionamento_delegacias_departamentos():
    departamentos = []
    delegacias = []

    with open('output_2018.json', encoding='utf-8') as fh:
        df = pd.read_json(fh)

    with open('tabelas/atualizadas/departamentos/atualizacao.sql', encoding='utf-8') as fh:
        for line in fh:
            departamentos.append(line)

    with open('tabelas/atualizadas/delegacias/atualizacao.sql', encoding='utf-8') as fh:
        for line in fh:
            delegacias.append(line)

    lines_already_seen = []

    departamentos_df = df[['DP_CIRCUNSCRICAO ', 'DEPARTAMENTO_CIRCUNSCRICAO']].drop_duplicates().values.tolist()

    for departamento in departamentos_df:
        lines_already_seen.append((departamento[0], departamento[1]))

    departamentos_segmentadas = []
    for departamento in departamentos:
        departamentos_segmentadas.append(departamento.split("(")[1].split(")")[0].split(", "))

    delegacias_segmentadas = []
    for delegacia in delegacias:
        delegacias_segmentadas.append(delegacia.split("(")[1].split(")")[0].split(", "))

    seen = []
    inserts = []
    for line_df in lines_already_seen:
        for departamento in departamentos_segmentadas:
            for delegacia in delegacias_segmentadas:
                if departamento[1].strip("'") == line_df[1] and delegacia[1].strip("'") == line_df[0]:
                    inserts.append(
                        f"insert into delegacias_departamentos values ({departamento[0]}, {delegacia[0]}); \n")
                    seen.append((departamento[1], delegacia[1]))

    print(len(inserts))
    output = open('tabelas/relacionamento/delegacias_departamentos/output.sql', 'w',  encoding="utf-8")
    for e in inserts:
        output.write(e)


def gera_tabela_relacionamento_delegacias_especializadas_homicidios():
    homicidios = []
    delegacia_especializadas_especializadas = []

    with open('output_2018.json', encoding='utf-8') as fh:
        df = pd.read_json(fh)

    with open('tabelas/atualizadas/homicidios/atualizacao.sql', encoding='utf-8') as fh:
        for line in fh:
            homicidios.append(line)

    with open('tabelas/atualizadas/delegacias_especializadas/atualizacao.sql', encoding='utf-8') as fh:
        for line in fh:
            delegacia_especializadas_especializadas.append(line)

    lines_already_seen = []
    homicidios_df = df[['DATA_FATO', 'HORA_FATO', 'MÊS ESTATISTICA', 'DP_ELABORACAO', 'LATITUDE',
                        'LONGITUDE']].drop_duplicates().values.tolist()

    for homicidio in homicidios_df:
        lines_already_seen.append((homicidio[0], homicidio[1], homicidio[2], homicidio[3], homicidio[4], homicidio[5]))

    homicidios_segmentadas = []
    for homicidio in homicidios:
        homicidios_segmentadas.append(homicidio.split("(")[1].split(")")[0].split(", "))

    delegacia_especializadas_especializadas_segmentadas = []
    for delegacia_especializada in delegacia_especializadas_especializadas:
        delegacia_especializadas_especializadas_segmentadas.append(
            delegacia_especializada.split("(")[1].split(")")[0].split(", "))

    inserts = []
    for line in lines_already_seen:
        for delegacia_especializada in delegacia_especializadas_especializadas_segmentadas:
            if delegacia_especializada[1].strip("'") == str(line[3]):
                for homicidio in homicidios_segmentadas:
                    if homicidio[5].strip("'") == str(line[0]) and homicidio[6].strip("'") == str(line[1]) and \
                            homicidio[3].strip("'") == str(line[2]) and homicidio[12].strip("'") == str(line[4]) \
                            and homicidio[13].strip("'") == str(line[5]) \
                            and homicidio[14].strip("'") == delegacia_especializada[1].strip("'") \
                            and homicidio[15].strip("'") == delegacia_especializada[2].strip("'"):
                        inserts.append(
                            f"insert into delegacias_especializadas_homicidios values ({delegacia_especializada[0]}, {homicidio[0]}); \n")

    print(len(inserts))
    output = open('tabelas/relacionamento/delegacias_especializadas_homicidios/output.sql', 'w',  encoding="utf-8")
    for e in inserts:
        output.write(e)



def gera_tabela_relacionamento_delegacias_homicidios():
    homicidios = []
    delegacias = []

    with open('output_2018.json', encoding='utf-8') as fh:
        df = pd.read_json(fh)

    with open('tabelas/atualizadas/homicidios/atualizacao.sql', encoding='utf-8') as fh:
        for line in fh:
            homicidios.append(line)

    with open('tabelas/atualizadas/delegacias/atualizacao.sql', encoding='utf-8') as fh:
        for line in fh:
            delegacias.append(line)

    lines_already_seen = []
    homicidios_df = df[['DATA_FATO', 'HORA_FATO', 'MÊS ESTATISTICA', 'DP_CIRCUNSCRICAO ', 'SECCIONAL_CIRCUNSCRICAO', 'MUNICIPIO_CIRCUNSCRICAO']].drop_duplicates().values.tolist()

    for homicidio in homicidios_df:
        lines_already_seen.append((homicidio[0], homicidio[1], homicidio[2], homicidio[3], homicidio[4], homicidio[5]))

    homicidios_segmentadas = []
    for homicidio in homicidios:
        homicidios_segmentadas.append(homicidio.split("(")[1].split(")")[0].split(", "))

    delegacias_segmentadas = []
    for delegacia in delegacias:
        delegacias_segmentadas.append(delegacia.split("(")[1].split(")")[0].split(", "))

    inserts = []
    for homicidio in homicidios_segmentadas:
        for line in lines_already_seen:
            if homicidio[3].strip("'") == str(line[2]) \
                    and homicidio[5].strip("'") == line[0] \
                    and homicidio[6].strip("'") == str(line[1]):
                for delegacia in delegacias_segmentadas:
                    if delegacia[1].strip("'") == str(line[3]):
                        inserts.append(
                            f"insert into delegacias_homicidios values ({delegacia[0]}, {homicidio[0]}); \n")

    print(len(inserts))
    output = open('tabelas/relacionamento/delegacias_homicidios/output.sql', 'w',  encoding="utf-8")
    for e in inserts:
        output.write(e)


def gera_tabela_relacionamento_delegacias_ocorrencias():
    ocorrencias = []
    delegacias = []

    with open('output_2018.json', encoding='utf-8') as fh:
        df = pd.read_json(fh)

    with open('tabelas/atualizadas/ocorrencias/atualizacao.sql', encoding='utf-8') as fh:
        for line in fh:
            ocorrencias.append(line)

    with open('tabelas/atualizadas/delegacias/atualizacao.sql', encoding='utf-8') as fh:
        for line in fh:
            delegacias.append(line)

    lines_already_seen = []

    ocorrencias_df = df[['DP_CIRCUNSCRICAO ', 'NUM_BO']].drop_duplicates().values.tolist()

    for ocorrencia in ocorrencias_df:
        lines_already_seen.append((ocorrencia[0], ocorrencia[1]))

    ocorrencias_segmentadas = []
    for ocorrencia in ocorrencias:
        ocorrencias_segmentadas.append(ocorrencia.split("(")[1].split(")")[0].split(", "))

    delegacias_segmentadas = []
    for delegacia in delegacias:
        delegacias_segmentadas.append(delegacia.split("(")[1].split(")")[0].split(", "))
    print(delegacias_segmentadas.__len__())
    print(ocorrencias_segmentadas.__len__())
    inserts = []
    for ocorrencia in ocorrencias_segmentadas:
        for line_df in lines_already_seen:
            if ocorrencia[1].strip("'") == str(line_df[1]):
                for delegacia in delegacias_segmentadas:
                    if delegacia[1].strip("'") == str(line_df[0]):
                        inserts.append(
                            f"insert into delegacias_ocorrencias values ({delegacia[0]}, {ocorrencia[0]}); \n")

    print(len(inserts))
    output = open('tabelas/relacionamento/delegacias_ocorrencias/output.sql', 'w',  encoding="utf-8")
    for e in inserts:
        output.write(e)


def gera_tabela_relacionamento_divisoes_delegacias_especializadas():
    divisoes_especializadas = []
    delegacia_especializadas_especializadas = []

    with open('output_2018.json', encoding='utf-8') as fh:
        df = pd.read_json(fh)

    with open('tabelas/atualizadas/divisoes_especializadas/atualizacao.sql', encoding='utf-8') as fh:
        for line in fh:
            divisoes_especializadas.append(line)

    with open('tabelas/atualizadas/delegacias_especializadas/atualizacao.sql', encoding='utf-8') as fh:
        for line in fh:
            delegacia_especializadas_especializadas.append(line)

    lines_already_seen = []

    divisoes_especializadas_df = df[['DP_ELABORACAO', 'DEP_ELABORACAO']].drop_duplicates().values.tolist()

    for divisao_especializada in divisoes_especializadas_df:
        lines_already_seen.append((divisao_especializada[0], divisao_especializada[1]))

    divisoes_especializadas_segmentadas = []
    for divisao_especializada in divisoes_especializadas:
        divisoes_especializadas_segmentadas.append(divisao_especializada.split("(")[1].split(")")[0].split(", "))

    delegacia_especializadas_especializadas_segmentadas = []
    for delegacia_especializada in delegacia_especializadas_especializadas:
        delegacia_especializadas_especializadas_segmentadas.append(
            delegacia_especializada.split("(")[1].split(")")[0].split(", "))

    seen = []
    inserts = []
    for line_df in lines_already_seen:
        for divisao_especializada in divisoes_especializadas_segmentadas:
            for delegacia_especializada in delegacia_especializadas_especializadas_segmentadas:
                if divisao_especializada[1].strip("'") == line_df[1] and delegacia_especializada[1].strip("'") == \
                        line_df[0]:
                    inserts.append(
                        f"insert into divisoes_delegacias_especializadas values ({delegacia_especializada[0]}, {divisao_especializada[0]}); \n")
                    seen.append((divisao_especializada[1], delegacia_especializada[1]))

    print(len(inserts))
    output = open('tabelas/relacionamento/divisoes_delegacias_especializadas/output.sql', 'w',  encoding="utf-8")
    for e in inserts:
        output.write(e)


def gera_tabela_relacionamento_locais_homicidios():
    homicidios = []
    locais = []

    with open('output_2018.json', encoding='utf-8') as fh:
        df = pd.read_json(fh)

    with open('tabelas/atualizadas/homicidios/atualizacao.sql', encoding='utf-8') as fh:
        for line in fh:
            homicidios.append(line)

    with open('tabelas/atualizadas/locais/atualizacao.sql', encoding='utf-8') as fh:
        for line in fh:
            locais.append(line)

    lines_already_seen = []
    homicidios_df = df[['DATA_FATO', 'HORA_FATO', 'MÊS ESTATISTICA', 'LOGRADOURO', 'NUMERO_LOGRADOURO', 'LATITUDE',
                        'LONGITUDE', 'NUM_BO', 'DATAHORA_REGISTRO_BO', 'ANO_BO', 'DP_ELABORACAO', 'ID_DELEGACIA',
                        'MUNICIPIO_ELABORACAO', 'DP_ELABORACAO', 'DP_ELABORACAO',
                        'DEP_ELABORACAO']].drop_duplicates().values.tolist()

    for homicidio in homicidios_df:
        lines_already_seen.append(
            (homicidio[0], homicidio[1], homicidio[2], homicidio[3], homicidio[4], homicidio[5], homicidio[6],
             [homicidio[7]]))

    homicidios_segmentadas = []
    for homicidio in homicidios:
        homicidios_segmentadas.append(homicidio.split("(")[1].split(")")[0].split(", "))

    locais_segmentadas = []
    for local in locais:
        locais_segmentadas.append(local.split("(")[1].split(")")[0].split(", "))

    inserts = []
    duplicado = set()
    for homicidio in homicidios_segmentadas:
        for line in lines_already_seen:
            if homicidio[5].strip("'") == line[0] \
                    and homicidio[6].strip("'") == str(line[1]):
                for local in locais_segmentadas:
                    if local[1].strip("'") == str(line[3]) \
                            and local[3].strip("'") == str(line[5]) \
                            and local[4].strip("'") == str(line[6]) \
                            and homicidio[12].strip("'") == local[3].strip("'") \
                            and homicidio[13].strip("'") == local[4].strip("'"):
                        inserts.append(
                            f"insert into locais_homicidios values ({homicidio[0]}, {local[0]}); \n")

    print(len(inserts))
    output = open('tabelas/relacionamento/locais_homicidios/output.sql', 'w',  encoding="utf-8")
    for e in inserts:
        output.write(e)


def gera_tabela_relacionamento_locais_tipos():
    tipos_locais = []
    locais = []

    with open('output_2018.json', encoding='utf-8') as fh:
        df = pd.read_json(fh)

    with open('tabelas/atualizadas/tipo_local/atualizacao.sql', encoding='utf-8') as fh:
        for line in fh:
            tipos_locais.append(line)

    with open('tabelas/atualizadas/locais/atualizacao.sql', encoding='utf-8') as fh:
        for line in fh:
            locais.append(line)

    lines_already_seen = []
    tipos_locais_df = df[['DESC_TIPOLOCAL', 'LOGRADOURO', 'NUMERO_LOGRADOURO', 'LATITUDE',
                          'LONGITUDE']].drop_duplicates().values.tolist()

    for tipo_local in tipos_locais_df:
        lines_already_seen.append(
            (tipo_local[0], tipo_local[1], tipo_local[2], tipo_local[3], tipo_local[4]))

    tipos_locais_segmentadas = []
    for tipo_local in tipos_locais:
        tipos_locais_segmentadas.append(tipo_local.split("(")[1].split(")")[0].split(", "))

    locais_segmentadas = []
    for local in locais:
        locais_segmentadas.append(local.split("(")[1].split(")")[0].split(", "))

    inserts = []
    for line in lines_already_seen:
        for local in locais_segmentadas:
            if local[1].strip("'") == str(line[1]) and local[2].strip("'") == str(line[2]):
                for tipo_local in tipos_locais_segmentadas:
                    if tipo_local[1].strip("'") == str(line[0]):
                        inserts.append(
                            f"insert into tipos_locais values ({tipo_local[0]}, {local[0]}); \n")

    print(len(inserts))
    output = open('tabelas/relacionamento/tipos_locais/output.sql', 'w',  encoding="utf-8")
    for e in inserts:
        output.write(e)


def gera_tabela_relacionamento_unidades_delegacias():
    unidades_administrativas = []
    delegacias = []

    with open('output_2018.json', encoding='utf-8') as fh:
        df = pd.read_json(fh)

    with open('tabelas/atualizadas/unidades_administrativas/atualizacao.sql') as fh:
        for line in fh:
            unidades_administrativas.append(line)

    with open('tabelas/atualizadas/delegacias/atualizacao.sql') as fh:
        for line in fh:
            delegacias.append(line)

    lines_already_seen = []

    unidades_administrativas_df = df[['SECCIONAL_CIRCUNSCRICAO', 'DP_CIRCUNSCRICAO ']].drop_duplicates().values.tolist()

    for unidade_administrativa in unidades_administrativas_df:
        lines_already_seen.append((unidade_administrativa[0], unidade_administrativa[1]))

    unidades_administrativas_segmentadas = []
    for unidade_administrativa in unidades_administrativas:
        unidades_administrativas_segmentadas.append(unidade_administrativa.split("(")[1].split(")")[0].split(", "))

    delegacias_segmentadas = []
    for delegacia in delegacias:
        delegacias_segmentadas.append(delegacia.split("(")[1].split(")")[0].split(", "))

    inserts = []
    for unidade_administrativa in unidades_administrativas_segmentadas:
        for line_df in lines_already_seen:
            if unidade_administrativa[1].strip("'") == line_df[0]:
                for delegacia in delegacias_segmentadas:
                    if delegacia[1].strip("'") == line_df[1]:
                        inserts.append(
                            f"insert into unidades_delegacias values ({unidade_administrativa[0]}, {delegacia[0]}); \n")

    print(len(inserts))
    output = open('tabelas/relacionamento/unidades_delegacias/output.sql', 'w',  encoding="utf-8")
    for e in inserts:
        output.write(e)
