import pandas as pd

with open('outputjson.json', encoding='utf-8') as fh:
    df = pd.read_json(fh)
print(df)
dicionario = {}

# Iterar pelas linhas do DataFrame
for indice, linha in df.iterrows():
    # Extrair a chave da linha
    chave = linha['ID_DELEGACIA']

    # Extrair os valores das outras colunas da linha
    valores = [linha['DP_CIRCUNSCRICAO '], linha['MUNICIPIO_CIRCUNSCRICAO']]

    # Adicionar as colunas e seus valores correspondentes ao dicion�rio com a chave correspondente
    dicionario[chave] = valores



print(dicionario)
#
#
# # Criar um DataFrame com tr�s colunas
# df = pd.DataFrame({'coluna1': [1, 2, 3], 'coluna2': ['a', 'b', 'c'], 'coluna3': [True, False, True]})
#
# # Criar um dicion�rio vazio
# dicionario = {}
#
# # Iterar pelas linhas do DataFrame
# for indice, linha in df.iterrows():
#     # Extrair a chave da linha
#     chave = linha['coluna1']
#
#     # Extrair os valores das outras colunas da linha
#     valores = [linha['coluna2'], linha['coluna3']]
#
#     # Usar o m�todo zip() para combinar as colunas e os valores correspondentes
#     pares_chave_valor = zip(['coluna2', 'coluna3'], valores)
#
#     # Adicionar os pares chave-valor ao dicion�rio
#     for coluna, valor in pares_chave_valor:
#         dicionario.setdefault(chave, {})[coluna] = valor
#
# print(dicionario)