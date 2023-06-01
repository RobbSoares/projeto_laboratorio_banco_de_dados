

def armazena_tabela_relacionamento(tabela_um, tabela_dois, tabela_relacionamento):
    output = open(f'{tabela_relacionamento}/output.sql', "w")
    for chave, valor_tb in tabela_um.items():
        for key, value in tabela_dois.items():
            if (value[1] == valor_tb[1] and value[2] == valor_tb[2]):
                valores = [str(chave), str(key)]
                valores_formatados = []
                for valor in valores:
                    if isinstance(valor, str):
                        valores_formatados.append(str(valor))
                    else:
                        valores_formatados.append(f"'{valor}'")
                valores_string = ', '.join(valores_formatados)
                result = f"INSERT INTO {tabela_relacionamento} values ({valores_string});\n"
                output.write(result)
