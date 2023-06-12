#!/usr/bin/env python
# encoding: utf-8
import pandas as pd

def relacionamento_delegacias_circunscricoes():
    delegacias = []
    circunscricoes = []

    with open('output_2018.json', encoding='utf-8') as fh:
        df = pd.read_json(fh)

    with open('tabelas/delegacias/output.sql', encoding='utf-8') as fh:
        for line in fh:
            delegacias.append(line)

    with open('tabelas/circunscricoes/output.sql', encoding='utf-8') as fh:
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
    output = open('historico/delegacias_circunscricoes/output.sql', 'w',  encoding="utf-8")
    for e in inserts:
        output.write(e)


def relacionamento_delegacias_especializadas_homicidios():
    homicidios = []
    delegacia_especializadas_especializadas = []

    with open('output_2018.json', encoding='utf-8') as fh:
        df = pd.read_json(fh)

    with open('tabelas/homicidios/output.sql', encoding='utf-8') as fh:
        for line in fh:
            homicidios.append(line)

    with open('tabelas/delegacias_especializadas/output.sql', encoding='utf-8') as fh:
        for line in fh:
            delegacia_especializadas_especializadas.append(line)
    
    lines_already_seen = []
    homicidios_df = df[['DATA_FATO', 'HORA_FATO', 'MÊS ESTATISTICA', 'DP_ELABORACAO', 'LATITUDE',
                        'LONGITUDE']].drop_duplicates().values.tolist()

    for homicidio in homicidios_df:
        lines_already_seen.append((homicidio[0], homicidio[1], homicidio[2], homicidio[3], homicidio[4], homicidio[5]))

    print(lines_already_seen.__len__())
    homicidios_segmentadas = []
    for homicidio in homicidios:
        homicidios_segmentadas.append(homicidio.split("(")[1].split(")")[0].split(", "))

    delegacia_especializadas_especializadas_segmentadas = []

    i = 0
    for delegacia_especializada in delegacia_especializadas_especializadas:
        i = i + 1
        if "(" in delegacia_especializada and ")" in delegacia_especializada:
            
            split_result = delegacia_especializada.split("(")[1].split(")")[0].split(", ")
            if len(split_result) > 0:
                delegacia_especializadas_especializadas_segmentadas.append(split_result)
            else:
                print(f"A divisão da string {delegacia_especializada} resultou em uma lista vazia.")
        else:
            print(f"A string {delegacia_especializada} não contém os caracteres esperados.")

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
    output = open('historico/delegacias_especializadas_homicidios/output.sql', 'w',  encoding="utf-8")
    for e in inserts:
        output.write(e)

def relacionamento_divisoes_delegacias_especializadas():
    divisoes_especializadas = []
    delegacia_especializadas_especializadas = []

    with open('output_2018.json', encoding='utf-8') as fh:
        df = pd.read_json(fh)

    with open('tabelas/divisoes_especializadas/output.sql', encoding='utf-8') as fh:
        for line in fh:
            divisoes_especializadas.append(line)

    with open('tabelas/delegacias_especializadas/output.sql', encoding='utf-8') as fh:
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
    output = open('historico/divisoes_delegacias_especializadas/output.sql', 'w',  encoding="utf-8")
    for e in inserts:
        output.write(e)
