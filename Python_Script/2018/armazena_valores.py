import pandas as pd

def armazena_valores(dicionario, colunas, tabela, atualizacao = False, is_duplicado = True, nome_json = '2018'):
    itera(dicionario, colunas, nome_json)
    armazena_dados_sem_repeticao(dicionario, tabela, atualizacao, is_duplicado, nome_json)

def itera(dic, col, nome_json):
    with open(f'{nome_json}.json', encoding='utf-8') as fh:
        df = pd.read_json(fh)
        
    df['HD'] = df['HD'].fillna(1.0)

    for indice, linha in df.iterrows():
        chave = indice + 1
        valores = [linha[coluna] for coluna in col]
        dic[chave] = valores


def armazena_dados_sem_repeticao(dicionario, path, atualizacao, is_duplicado=True, nome_json = '2018'):
    if (nome_json == '2018'):
        output = open(f'tabelas/atualizadas/{path}/atualizacao.sql', "w",  encoding="utf-8")
    else:
        output = open(f'tabelas/atualizadas/{path}/output.sql', "w",  encoding="utf-8")

    valores_unicos = set()
    for valor in dicionario.values():
        valor_str = str(valor)
        valores_unicos.add(valor_str)

    # Criar um novo dicion?rio com os valores ?nicos
    novo_dicionario = {}
    if not is_duplicado:
        print('entrou')
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
    
    if (path == 'homicidios' or path == 'pessoas') and nome_json == '2018':
        tb_id = 3505

    if path == 'delegacias' and nome_json == '2018':
        tb_id = 698
    
    if path == 'locais' and nome_json == '2018':
        tb_id = 2547  
    
    if path == 'tipo_local' and nome_json == '2018':
        tb_id = 26
    
    if path == 'ocorrencias' and nome_json == '2018':
        tb_id = 3280


    result = [];
    
    for chave, valor in novo_dicionario.items():
        valores_str = []
        for v in valor:
            # Verificar se o valor ? uma string ou um inteiro
            if isinstance(v, str):
                valores_str.append(f"'{v}'")
            else:
                valores_str.append(str(v))

        valores_str = ", ".join(valores_str)
        if path == 'homicidios':
            
            result.append(f"INSERT INTO {path} values ({tb_id}, {valores_str}, {tb_id}); \n")
        else:
            result.append(f"INSERT INTO {path} values ({tb_id}, {valores_str}); \n")
        tb_id = tb_id + 1

    for line in result:
        output.write(line)

    return novo_dicionario
