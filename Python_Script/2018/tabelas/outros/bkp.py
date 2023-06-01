import pandas as pd

with open('outputjson.json', encoding='utf-8') as fh:
    df = pd.read_json(fh)



dataframe = df.to_dict()

df['HD'] = df['HD'].fillna(1.0)

outputFile = open('delegacias/output.sql', "w")
output = open('circunscricoes/output.sql', "w")

circunscricoes = {}
delegacias = {}
homicidios = {}


colunas_circunscricoes = ['DEPARTAMENTO_CIRCUNSCRICAO', 'SECCIONAL_CIRCUNSCRICAO', 'MUNICIPIO_CIRCUNSCRICAO']
colunas_delegacias = ['ID_DELEGACIA', 'DP_CIRCUNSCRICAO ', 'SECCIONAL_CIRCUNSCRICAO', 'MUNICIPIO_CIRCUNSCRICAO']
colunas_homicidios = ['HD', 'Nº DE VÍT HD', 'MÊS ESTATISTICA', 'ANO ESTATISTICA', 'DATA_FATO', 'HORA_FATO', 'NATUREZA_APURADA', 'DEPARTAMENTO_CIRCUNSCRICAO', 'SECCIONAL_CIRCUNSCRICAO', 'MUNICIPIO_CIRCUNSCRICAO']

def itera_(dicionario, colunas):
    # Iterar pelas linhas do DataFrame
    for indice, linha in df.iterrows():
        # Extrair a chave da linha
        chave = indice + 1
        # Extrair os valores das outras colunas da linha
        valores = [linha[coluna] for coluna in colunas]
        # Adicionar as colunas e seus valores correspondentes ao dicionário com a chave correspondente
        dicionario[chave] = valores

itera_(circunscricoes, colunas_circunscricoes)
itera_(delegacias, colunas_delegacias)
itera_(homicidios, colunas_homicidios)

def armazena_dados_sem_repeticao(dicionario, path, is_duplicado = True):
    outputFile = open(f'{path}/output.sql', "w")

    valores_unicos = set()
    for valor in dicionario.values():
        valor_str = str(valor)
        valores_unicos.add(valor_str)

    # Criar um novo dicionário com os valores únicos
    novo_dicionario = {}
    if is_duplicado == False:
        novo_dicionario = dicionario
    else:
        for chave, valor in dicionario.items():
            valor_str = str(valor)
            if valor_str in valores_unicos:
                novo_dicionario[chave] = valor
                valores_unicos.remove(valor_str)

    # Criar as strings de insert dinamicamente
    results = []
    for chave, valor in novo_dicionario.items():
        valores_str = []
        for v in valor:
            # Verificar se o valor é uma string ou um inteiro
            if isinstance(v, str):
                valores_str.append(f"'{v}'")
            else:
                valores_str.append(str(v))
        valores_str = ", ".join(valores_str)
        result = f"INSERT INTO {path} values ({chave}, {valores_str}); \n"
        outputFile.write(result)

    return novo_dicionario

novo_delegacias = armazena_dados_sem_repeticao(delegacias, 'delegacias')
novo_circunscricoes = armazena_dados_sem_repeticao(circunscricoes, 'circunscricoes')
novo_homicidios = armazena_dados_sem_repeticao(homicidios, 'homicidios', False)

def armazena_tabela_relacionamento(tabela_um, tabela_dois, tabela_relacionamento, index_column, index_column_dois):
    output = open(f'{tabela_relacionamento}/output.sql', "w")
    for chave, valor_tb in tabela_um.items():
        for key, value in tabela_dois.items():
            if (value[1] == valor_tb[index_column] and value[2] == valor_tb[index_column_dois]):
                valores = [str(key), str(chave)]
                valores_formatados = []
                for valor in valores:
                    if isinstance(valor, str):
                        valores_formatados.append(str(valor))
                    else:
                        valores_formatados.append(f"'{valor}'")
                valores_string = ', '.join(valores_formatados)
                result = f"INSERT INTO {tabela_relacionamento} values ({valores_string});\n"
                output.write(result)

armazena_tabela_relacionamento(novo_delegacias, novo_circunscricoes, "delegacias_circunscricoes", 2, 3)
# armazena_tabela_relacionamento(novo_homicidios, novo_circunscricoes, "circunscricoes_homicidios", 8, 9)


output_cir_hom = open('circunscricoes_homicidios/output.sql', "w")

lines_seen_so_far = set()

for chave_hom, valor_hom in homicidios.items():
    for chave_circ, valor_circ in novo_circunscricoes.items():
            if (valor_circ[0] == valor_hom[7] and valor_circ[1] == valor_hom[8] and valor_circ[2] == valor_hom[9]):
                value = f"{chave_circ} {chave_hom} {valor_hom[4]} {valor_hom[5]} {valor_circ[0]} {valor_circ[1]} {valor_circ[2]}"

                if value not in lines_seen_so_far:
                    result = f"INSERT INTO  circunscricoes_homicidios values ({chave_circ}, {chave_hom});\n"
                    output_cir_hom.write(result)
                    lines_seen_so_far.add(value)


