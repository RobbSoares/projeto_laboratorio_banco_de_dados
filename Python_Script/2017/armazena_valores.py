import pandas as pd

with open('outputjson.json', encoding='utf-8') as fh:
    df = pd.read_json(fh)

df['HD'] = df['HD'].fillna(1.0)

def armazena_valores(dicionario, colunas, tabela, is_duplicado=True, copia=[]):
    itera(dicionario, colunas)
    armazena_dados_sem_repeticao(dicionario, tabela, is_duplicado)

def itera(dic, col):
    for indice, linha in df.iterrows():
        chave = indice + 1
        valores = [linha[coluna] for coluna in col]
        dic[chave] = valores


def armazena_dados_sem_repeticao(dicionario, path, is_duplicado=True):
    output = open(f'tabelas/{path}/output.sql', "w")

    valores_unicos = set()
    for valor in dicionario.values():
        valor_str = str(valor)
        valores_unicos.add(valor_str)

    # Criar um novo dicion?rio com os valores ?nicos
    novo_dicionario = {}
    if not is_duplicado:
        novo_dicionario = dicionario
    else:
        for chave, valor in dicionario.items():
            valor_str = str(valor)
            if valor_str in valores_unicos:
                novo_dicionario[chave] = valor
                valores_unicos.remove(valor_str)

    # Criar as strings de insert dinamicamente
    results = []
    tb_id = 1
    print(len(novo_dicionario))
    for chave, valor in novo_dicionario.items():
        valores_str = []
        for v in valor:
            # Verificar se o valor ? uma string ou um inteiro
            if isinstance(v, str):
                valores_str.append(f"'{v}'")
            else:
                valores_str.append(str(v))
        valores_str = ", ".join(valores_str)
        result = f"INSERT INTO {path} values ({tb_id}, {valores_str}); \n"
        output.write(result)
        tb_id = tb_id + 1

    return novo_dicionario
