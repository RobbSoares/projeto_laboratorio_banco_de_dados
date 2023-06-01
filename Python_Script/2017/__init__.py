#!/usr/bin/env python
# encoding: utf-8


import insert_de_valores
import tabelas_relacionamentos

insert_de_valores.create_homicidios()
# insert_de_valores.create_locais()
# tabelas_relacionamentos.gera_tabela_relacionamento_locais_homicidios()
#
tabelas_relacionamentos.gera_tabela_relacionamento_delegacias_especializadas_homicidios()






