#!/usr/bin/env python
# encoding: utf-8
import pandas as pd


def gera_tabela_relacionamento_delegacias_circunscricoes():
    delegacias = []
    circunscricoes = []

    with open('outputjson.json', encoding='utf-8') as fh:
        df = pd.read_json(fh)

    with open('tabelas/delegacias/output.sql') as fh:
        for line in fh:
            delegacias.append(line)

    with open('tabelas/circunscricoes/output.sql') as fh:
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
    output = open('tabelas/delegacias_circunscricoes/output.sql', 'w')
    for e in inserts:
        output.write(e)


def gera_tabela_relacionamento_delegacias_departamentos():
    departamentos = []
    delegacias = []

    with open('outputjson.json', encoding='utf-8') as fh:
        df = pd.read_json(fh)

    with open('tabelas/departamentos/output.sql') as fh:
        for line in fh:
            departamentos.append(line)

    with open('tabelas/delegacias/output.sql') as fh:
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

    output = open('tabelas/delegacias_departamentos/output.sql', 'w')
    for e in inserts:
        output.write(e)


def gera_tabela_relacionamento_delegacias_especializadas_homicidios():
    homicidios = []
    delegacia_especializadas_especializadas = []

    with open('outputjson.json', encoding='utf-8') as fh:
        df = pd.read_json(fh)

    with open('tabelas/homicidios/output.sql') as fh:
        for line in fh:
            homicidios.append(line)

    with open('tabelas/delegacias_especializadas/output.sql') as fh:
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
    output = open('tabelas/delegacias_especializadas_homicidios/output.sql', 'w')
    for e in inserts:
        output.write(e)


def gera_tabela_relacionamento_delegacias_especializadas_municipios():
    delegacia_especializadas = []
    municipios = []

    with open('outputjson.json', encoding='utf-8') as fh:
        df = pd.read_json(fh)

    with open('tabelas/delegacias_especializadas/output.sql') as fh:
        for line in fh:
            delegacia_especializadas.append(line)

    with open('tabelas/municipios/output.sql') as fh:
        for line in fh:
            municipios.append(line)

    lines_already_seen = []

    delegacia_especializadas_especializadas_df = df[
        ['DP_ELABORACAO', 'MUNICIPIO_ELABORACAO']].drop_duplicates().values.tolist()

    for delegacia_especializada in delegacia_especializadas_especializadas_df:
        lines_already_seen.append((delegacia_especializada[0], delegacia_especializada[1]))

    delegacia_especializadas_segmentadas = []
    for delegacia_especializada in delegacia_especializadas:
        delegacia_especializadas_segmentadas.append(delegacia_especializada.split("(")[1].split(")")[0].split(", "))

    municipios_segmentadas = []
    for municipio in municipios:
        municipios_segmentadas.append(municipio.split("(")[1].split(")")[0].split(", "))

    output = open('tabelas/delegacias_especializadas_municipios/output.sql', 'w')
    for line_df in lines_already_seen:
        for delegacia_especializada in delegacia_especializadas_segmentadas:
            for municipio in municipios_segmentadas:
                if delegacia_especializada[1].strip("'") == line_df[0] and municipio[1].strip("'") == line_df[1]:
                    output.write(
                        f"insert into delegacias_especializadas_municipios values ({delegacia_especializada[0]}, {municipio[0]}); \n")


def gera_tabela_relacionamento_delegacias_homicidios():
    homicidios = []
    delegacias = []

    with open('outputjson.json', encoding='utf-8') as fh:
        df = pd.read_json(fh)

    with open('tabelas/homicidios/output.sql') as fh:
        for line in fh:
            homicidios.append(line)

    with open('tabelas/delegacias/output.sql') as fh:
        for line in fh:
            delegacias.append(line)

    lines_already_seen = []
    homicidios_df = df[['DATA_FATO', 'HORA_FATO', 'MÊS ESTATISTICA', 'DP_CIRCUNSCRICAO ', 'SECCIONAL_CIRCUNSCRICAO',
                        'MUNICIPIO_CIRCUNSCRICAO']].drop_duplicates().values.tolist()
    print(len(homicidios_df))
    for homicidio in homicidios_df:
        if homicidio[3] == '002 DP - Bom Retiro':
            print(homicidio[3])
        lines_already_seen.append((homicidio[0], homicidio[1], homicidio[2], homicidio[3], homicidio[4], homicidio[5]))

    homicidios_segmentadas = []
    for homicidio in homicidios:
        homicidios_segmentadas.append(homicidio.split("(")[1].split(")")[0].split(", "))

    delegacias_segmentadas = []
    for delegacia in delegacias:
        delegacias_segmentadas.append(delegacia.split("(")[1].split(")")[0].split(", "))

    inserts = []
    duplicado = set()
    for homicidio in homicidios_segmentadas:
        for line in lines_already_seen:
            if homicidio[8].strip("'") == line[4] \
                    and homicidio[9].strip("'") == line[5] \
                    and homicidio[3].strip("'") == str(line[2]) \
                    and homicidio[5].strip("'") == line[0] \
                    and homicidio[6].strip("'") == str(line[1]):
                for delegacia in delegacias_segmentadas:
                    if delegacia[1].strip("'") == str(line[3]):
                        duplicado.add((homicidio[3].strip("'"), homicidio[5].strip("'"), homicidio[6].strip("'"),
                                       delegacia[1].strip("'")))
                        inserts.append(
                            f"insert into delegacias_homicidios values ({delegacia[0]}, {homicidio[0]}); \n")

    print(len(inserts))
    output = open('tabelas/delegacias_homicidios/output.sql', 'w')
    for e in inserts:
        output.write(e)


def gera_tabela_relacionamento_delegacias_ocorrencias():
    ocorrencias = []
    delegacias = []

    with open('outputjson.json', encoding='utf-8') as fh:
        df = pd.read_json(fh)

    with open('tabelas/ocorrencias/output.sql') as fh:
        for line in fh:
            ocorrencias.append(line)

    with open('tabelas/delegacias/output.sql') as fh:
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

    inserts = []
    for ocorrencia in ocorrencias_segmentadas:
        for line_df in lines_already_seen:
            if ocorrencia[1].strip("'") == str(line_df[1]):
                for delegacia in delegacias_segmentadas:
                    if delegacia[1].strip("'") == str(line_df[0]):
                        inserts.append(
                            f"insert into delegacias_ocorrencias values ({delegacia[0]}, {ocorrencia[0]}); \n")

    print(len(inserts))
    output = open('tabelas/delegacias_ocorrencias/output.sql', 'w')
    for e in inserts:
        output.write(e)


def gera_tabela_relacionamento_divisoes_delegacias_especializadas():
    divisoes_especializadas = []
    delegacia_especializadas_especializadas = []

    with open('outputjson.json', encoding='utf-8') as fh:
        df = pd.read_json(fh)

    with open('tabelas/divisoes_especializadas/output.sql') as fh:
        for line in fh:
            divisoes_especializadas.append(line)

    with open('tabelas/delegacias_especializadas/output.sql') as fh:
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

    output = open('tabelas/divisoes_delegacias_especializadas/output.sql', 'w')
    for e in inserts:
        output.write(e)


def gera_tabela_relacionamento_locais_homicidios():
    homicidios = []
    locais = []

    with open('outputjson.json', encoding='utf-8') as fh:
        df = pd.read_json(fh)

    with open('tabelas/homicidios/output.sql') as fh:
        for line in fh:
            homicidios.append(line)

    with open('tabelas/locais/output.sql') as fh:
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
                            and homicidio[13].strip("'") == local[3].strip("'") \
                            and homicidio[14].strip("'") == local[4].strip("'") \
                            and homicidio[11].strip("'") == local[1].strip("'"):
                        inserts.append(
                            f"insert into locais_homicidios values ({homicidio[0]}, {local[0]}); \n")

    print(len(inserts))
    output = open('tabelas/locais_homicidios/output.sql', 'w')
    for e in inserts:
        output.write(e)


def gera_tabela_relacionamento_unidades_delegacias():
    unidades_administrativas = []
    delegacias = []

    with open('outputjson.json', encoding='utf-8') as fh:
        df = pd.read_json(fh)

    with open('tabelas/unidades_administrativas/output.sql') as fh:
        for line in fh:
            unidades_administrativas.append(line)

    with open('tabelas/delegacias/output.sql') as fh:
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
    output = open('tabelas/unidades_delegacias/output.sql', 'w')
    for e in inserts:
        output.write(e)


def gera_tabela_relacionamento_locais_tipos():
    tipos_locais = []
    locais = []

    with open('outputjson.json', encoding='utf-8') as fh:
        df = pd.read_json(fh)

    with open('tabelas/tipo_local/output.sql') as fh:
        for line in fh:
            tipos_locais.append(line)

    with open('tabelas/locais/output.sql') as fh:
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
    output = open('tabelas/tipos_locais/output.sql', 'w')
    for e in inserts:
        output.write(e)
