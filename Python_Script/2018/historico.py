def migracao_de_dados(table, primary_key):
    old_data = []
    new_data = []

    with open(f'./tabelas/{table}/output.sql', encoding='utf-8') as fh:
        for line in fh:
            old_data.append(line)

    with open(f'./tabelas/{table}/atualizacao.sql', encoding='utf-8') as fh:
        for line in fh:
            new_data.append(line)

    treated_old_data = []
    treated_new_data = []
    
    for line in old_data:
        treated_old_data.append(line.split("(")[1].split(")")[0].split(", "))
        
    for line in new_data:
        treated_new_data.append(line.split("(")[1].split(")")[0].split(", "))
    
    # Guarda apenas os valores de cada conjunto
    old_set = set(old_line[1] for old_line in treated_old_data)
    new_set = set(new_line[1] for new_line in treated_new_data)

    # Dados existentes nas duas tabelas
    common_elements = old_set.intersection(new_set)
    
    # Dados que não possuem na tabela antiga
    different_elements_in_new = new_set.difference(old_set)
    
    # Dados que não possuem na tabela nova
    different_elements_in_old = old_set.difference(new_set)
    
    to_delete = []   
    for element in different_elements_in_old:
        for line in treated_old_data:
           if (element == line[1]):
                to_delete.append(f"DELETE FROM {table} WHERE {primary_key} = {line[0]}; \n")    
                 
    data = []
    for element in different_elements_in_new:
        for line in treated_new_data:
            if (table != 'delegacias_especializadas'):
                if (element == line[1]):
                    data.append(f"INSERT INTO {table} values ({line[0]}, {element}); \n")
            else:
                if (element == line[1]):
                    data.append(f"INSERT INTO {table} values ({line[0]}, {element}, {line[2]}); \n")

    output = open(f'historico/{table}/insert.sql', 'w',  encoding="utf-8")  
    for datum in data:
        output.write(datum)

    output = open(f'historico/{table}/delete.sql', 'w', encoding="utf-8")  
    for item in to_delete:
        output.write(item)
        
    print(f'Número de elementos em comum: {common_elements.__len__()}')
    print(f'Número de inexistentes na tabela nova que estavam na antiga: {different_elements_in_new.__len__()}')
    print(f'Número de inexistentes na tabela antiga que estão na nova: {different_elements_in_old.__len__()}')
    print(f'Número de elementos na tabela antiga: {old_data.__len__()}')
    print(f'Número de elementos na tabela nova: {new_data.__len__()}')
