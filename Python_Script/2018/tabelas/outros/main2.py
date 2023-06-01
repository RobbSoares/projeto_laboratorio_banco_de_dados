import pandas as pd
import re

query = open('tag_titulo/query1.sql', 'w')
genre_query = open('genero_titulo/genre1.sql', 'w')
network_query = open('network_titulo/network1.sql', 'w')
exibicao_query = open('exibicao_titulo/exibicao_query1.sql', 'w')
elenco_query = open('elenco_titulo/elenco_query1.sql', 'w')

with open('kdrama_att/att_kdrama.json', encoding='utf-8') as fh:
    data = pd.read_json(fh)

with open('tag_titulo/tags1.txt', encoding='utf-8') as tags:
    tag_names = tags.readlines()

with open('tag_titulo/titulos1.txt', 'r') as titles:
    title_names = titles.readlines()

with open('genero_titulo/genero1.txt', 'r') as genres:
    genre_names = genres.readlines()

with open('network_titulo/network1.txt', 'r') as network:
    network_names = network.readlines()

with open('exibicao_titulo/exibicao1.txt', 'r') as exibicao:
    exibicao_day = exibicao.readlines()

with open('elenco_titulo/elenco1.txt', 'r') as elenco:
    elenco_name = elenco.readlines()


gnr_dict = data['Genre'].to_dict()
tag_dict = data['Tags'].to_dict()
title_dict = data['Name'].to_dict()
network_dict = data['Original Network'].to_dict()
exibicao_dict = data['Aired On'].to_dict()
elenco_dict = data['Cast'].to_dict()

tags_list = []
titles_list = []
genre_list = []
network_list = []
exibicao_list = []
elenco_list = []

for line in genre_names:
    genre_list.append(line.strip())

for line in tag_names:
    tags_list.append(line.strip())

for line in title_names:
    titles_list.append(line.strip())

for line in network_names:
    network_list.append(line.strip())

for line in exibicao_day:
    exibicao_list.append(line.strip())

for line in elenco_name:
    elenco_list.append(line.strip())

print(elenco_name)

inserts = []
insert_genres = []
insert_network = []
insert_exibicao = []
insert_elenco = []

for key, value in gnr_dict.items():
    for k, val in title_dict.items():
        for genre in genre_list:
            if k == key and genre in value:
                insert_genres.append(f'insert into titulogenero values ({val}, { genre_list.index(genre) + 1 });')

for key, value in network_dict.items():
    for k, val in title_dict.items():
        for network in network_list:
            if k == key and network in value:
                insert_network.append(f'insert into titulonetwork values ({ network_list.index(network) + 1 }, {val});')
print(elenco_list)
for key, value in elenco_dict.items():
    for k, val in title_dict.items():
        for elenco in elenco_list:
            if k == key and elenco in value:
                insert_elenco.append(f'insert into tituloelenco values ({ elenco_list.index(elenco) + 1 }, {val});')

for key, value in exibicao_dict.items():
    for k, val in title_dict.items():
        for day in exibicao_list:
            if k == key and day in value:
                insert_exibicao.append(f'insert into tituloexibicao values ({ exibicao_list.index(day) + 1 }, {val});')

for key, value in tag_dict.items():
    for k, val in title_dict.items():
        for tag in tags_list:
            if k == key and tag in value:
                inserts.append(f'insert into titulotag values ({val}, { tags_list.index(tag) + 1 });')

for title in titles_list:
    for insert_genre in insert_genres:
        if title in insert_genre:
            result = insert_genre.replace(title, str(titles_list.index(title) + 1))
            genre_query.write(f'{result} \n')


for title in titles_list:
    for insert in inserts:
        if title in insert:
            result = insert.replace(title, str(titles_list.index(title) + 1))
            query.write(f'{result} \n')

for title in titles_list:
    for insert in insert_network:
        if title in insert:
            result = insert.replace(title, str(titles_list.index(title) + 1))
            network_query.write(f'{result} \n')

for title in titles_list:
    for insert in insert_exibicao:
        if title in insert:
            result = insert.replace(title, str(titles_list.index(title) + 1))
            exibicao_query.write(f'{result} \n')

for title in titles_list:
    for insert in insert_elenco:
        if title in insert:
            result = insert.replace(title, str(titles_list.index(title) + 1))
            elenco_query.write(f'{result} \n')

print(insert_elenco)
