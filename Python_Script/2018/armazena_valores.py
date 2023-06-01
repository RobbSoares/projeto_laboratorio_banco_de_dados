import pandas as pd

def armazena_valores(dicionario, colunas, tabela, atualizacao = False, is_duplicado = True, nome_json = '2017'):
    itera(dicionario, colunas, nome_json)
    armazena_dados_sem_repeticao(dicionario, tabela, atualizacao, is_duplicado)

def itera(dic, col, nome_json):
    with open(f'{nome_json}.json', encoding='utf-8') as fh:
        df = pd.read_json(fh)
        
    df['HD'] = df['HD'].fillna(1.0)

    for indice, linha in df.iterrows():
        chave = indice + 1
        valores = [linha[coluna] for coluna in col]
        dic[chave] = valores


def armazena_dados_sem_repeticao(dicionario, path, atualizacao, is_duplicado=True):
    if (atualizacao):
        output = open(f'tabelas/{path}/atualizacao.sql', "w",  encoding="utf-8")
    else:
        output = open(f'tabelas/{path}/output.sql', "w",  encoding="utf-8")

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
