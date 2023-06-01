--------------------------------------------------------
--  Arquivo criado - Sexta-feira-Maio-19-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table CIRCUNSCRICOES
--------------------------------------------------------

  CREATE TABLE "APP"."CIRCUNSCRICOES" 
   (	"CIR_ID" NUMBER(*,0), 
	"CIR_MUNICIPIO" VARCHAR2(60 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "APP"."CIRCUNSCRICOES"."CIR_ID" IS 'Esta coluna é a PK.';
   COMMENT ON COLUMN "APP"."CIRCUNSCRICOES"."CIR_MUNICIPIO" IS 'Esta coluna armazena o nome do município onde a circunscrição está localizada. ';
REM INSERTING into APP.CIRCUNSCRICOES
SET DEFINE OFF;
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('354','Valinhos');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('357','Igarapava');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('358','Patrocínio Paulista');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('359','Restinga');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('364','Urânia');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('366','Itaporanga');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('371','Rosana');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('372','Santo Anastácio');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('451','Cabrália Paulista');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('452','Estrela DOeste');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('453','Santa Branca');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('454','Jales');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('455','Salesópolis');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('456','Américo de Campos');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('457','Itararé');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('458','Bofete');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('459','Onda Verde');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('460','Barra Bonita');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('1','São Paulo');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('2','Cruzeiro');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('3','Cunha');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('4','Lorena');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('6','Jacareí');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('7','Caçapava');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('8','São José dos Campos');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('9','Caraguatatuba');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('10','Ubatuba');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('11','Campos do Jordão');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('12','Natividade da Serra');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('13','Pindamonhangaba');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('14','Taubaté');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('15','Tremembé');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('16','Araçatuba');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('17','Guararapes');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('19','Campinas');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('21','Águas de Lindóia');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('22','Atibaia');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('23','Jundiaí');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('24','Itapira');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('25','Mogi Guaçu');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('26','Santo Antônio de Posse');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('27','Araraquara');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('28','Matão');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('29','Barretos');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('30','Colômbia');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('31','Bebedouro');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('33','Franca');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('34','Guará');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('36','Cravinhos');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('37','Ribeirão Preto');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('39','Ibaté');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('40','Porto Ferreira');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('41','São Carlos');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('42','Pontal');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('43','Pradópolis');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('44','Sertãozinho');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('45','Bauru');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('46','Lençóis Paulista');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('47','Marília');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('48','Catanduva');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('51','Mirassol');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('52','São José do Rio Preto');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('53','Tanabi');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('54','Votuporanga');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('55','Itariri');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('57','Iguape');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('58','Miracatu');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('59','Guarujá');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('60','Praia Grande');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('61','Santos');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('62','São Vicente');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('63','Itaí');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('64','Piraju');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('65','Boituva');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('66','Apiaí');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('67','Araçariguama');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('68','Araçoiaba da Serra');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('69','Iperó');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('70','Itu');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('71','Salto de Pirapora');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('72','Sorocaba');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('73','Assis');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('74','Tupi Paulista');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('75','Presidente Prudente');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('78','Americana');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('79','Cosmópolis');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('80','Hortolândia');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('81','Sumaré');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('82','Araras');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('83','Limeira');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('84','Rio Claro');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('85','Santa Gertrudes');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('86','Barueri');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('87','Carapicuíba');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('88','Cotia');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('89','Itapevi');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('90','Diadema');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('91','Francisco Morato');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('92','Franco da Rocha');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('93','Guarulhos');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('94','Santa Isabel');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('95','Itaquaquecetuba');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('96','Mogi das Cruzes');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('97','Suzano');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('98','Osasco');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('99','Mauá');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('100','Ribeirão Pires');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('101','Santo André');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('102','São Bernardo do Campo');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('104','Embu das Artes');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('105','Embu-Guaçu');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('106','Itapecerica da Serra');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('107','Taboão da Serra');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('108','Guaratinguetá');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('109','Igaratá');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('110','Pereira Barreto');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('111','Birigui');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('114','Paulínia');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('115','Bragança Paulista');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('116','Campo Limpo Paulista');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('117','Itupeva');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('118','Jarinu');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('119','Tabatinga');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('120','Pirangi');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('121','Taiaçu');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('123','Monte Alto');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('124','Pederneiras');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('125','Igaraçu do Tietê');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('126','Jaú');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('127','Lins');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('128','Sabino');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('131','Urupês');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('133','Itanhaém');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('136','Bertioga');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('137','Cubatão');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('138','Avaré');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('139','Iaras');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('140','Botucatu');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('141','Itatinga');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('142','Itapetininga');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('143','Tatuí');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('144','Ibiúna');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('146','Porto Feliz');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('147','Salto');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('148','Votorantim');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('150','Regente Feijó');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('151','Mirante do Paranapanema');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('152','Monte Mor');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('153','Santa Bárbara DOeste');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('155','Aguaí');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('156','São João da Boa Vista');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('157','Jandira');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('158','Pirapora do Bom Jesus');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('159','Mairiporã');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('160','Arujá');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('161','Ferraz de Vasconcelos');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('162','Poá');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('163','Canas');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('164','Potim');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('165','Roseira');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('166','São Sebastião');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('167','Castilho');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('169','Penápolis');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('170','Indaiatuba');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('172','Itatiba');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('173','Américo Brasiliense');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('174','Colina');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('178','Barrinha');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('179','Jaboticabal');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('182','Santa Fé do Sul');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('183','Bady Bassitt');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('186','Peruíbe');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('189','Adamantina');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('190','Paraguaçu Paulista');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('191','Teodoro Sampaio');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('192','Casa Branca');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('193','Santa Cruz das Palmeiras');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('194','Leme');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('195','Piracicaba');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('196','São Pedro');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('197','Santana de Parnaíba');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('198','Vargem Grande Paulista');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('199','Juquitiba');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('200','Andradina');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('202','Louveira');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('203','Itápolis');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('204','Batatais');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('205','Ituverava');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('206','Guariba');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('207','Agudos');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('208','Dois Córregos');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('209','Promissão');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('210','Tupã');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('211','Pindorama');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('212','Ouroeste');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('213','José Bonifácio');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('214','Registro');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('217','Guareí');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('219','Mairinque');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('220','Piedade');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('221','Tietê');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('225','Engenheiro Coelho');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('226','Nova Odessa');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('228','Pirassununga');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('231','Vargem Grande do Sul');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('232','Caieiras');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('233','Cajamar');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('234','Rio Grande da Serra');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('235','São Lourenço da Serra');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('238','Amparo');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('239','Várzea Paulista');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('241','Guaíra');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('242','Miguelópolis');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('244','Morro Agudo');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('245','Arealva');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('248','Ourinhos');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('249','Tabapuã');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('251','Mongaguá');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('253','Fartura');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('254','Anhembi');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('255','Areiópolis');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('256','Capão Bonito');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('259','Palmital');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('261','Presidente Epitácio');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('262','Presidente Venceslau');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('264','Capivari');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('266','Aparecida');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('267','Avanhandava');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('269','Mogi Mirim');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('270','Altair');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('271','Olímpia');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('274','Jardinópolis');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('275','São Joaquim da Barra');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('277','Taquarituba');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('278','Buri');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('280','São Roque');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('282','Álvares Machado');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('284','Cordeirópolis');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('286','Cachoeira Paulista');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('287','Ibitinga');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('288','Cajobi');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('290','Serrana');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('291','Santa Rita do Passa Quatro');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('292','Balbinos');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('293','Vera Cruz');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('299','Artur Nogueira');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('301','São Sebastião da Grama');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('303','Auriflama');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('307','Monte Aprazível');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('308','Valentim Gentil');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('310','Itobi');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('311','Buritama');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('312','Santo Antonio do Aracanguá');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('313','Piracaia');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('314','Vargem');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('315','Cabreúva');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('316','Jaguariúna');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('318','Santa Rosa do Viterbo');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('320','Pitangueiras');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('322','Novo Horizonte');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('324','Juquiá');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('326','São Miguel Arcanjo');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('327','Itapeva');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('329','Espírito Santo do Pinhal');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('332','Nazaré Paulista');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('333','Socorro');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('335','Bocaina');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('338','Sete Barras');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('339','Paraibuna');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('341','São Simão');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('343','Garça');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('347','Potirendaba');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('352','Panorama');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('353','Ilhabela');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('374','Canitar');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('375','Santa Mercedes');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('376','Sebastianópolis do Sul');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('377','Sarutaiá');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('378','União Paulista');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('379','Cristais Paulista');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('380','Paulo de Faria');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('381','Monteiro Lobato');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('382','Santa Albertina');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('383','Brotas');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('384','Iacanga');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('385','Itaberá');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('386','Populina');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('387','Ipaussu');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('388','Conchal');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('389','Guaimbê');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('390','Suzanápolis');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('391','Pontes Gestal');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('392','Santa Cruz do Rio Pardo');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('393','Morungaba');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('394','São João das Duas Pontes');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('395','Parapuã');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('396','Campina do Monte Alegre');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('397','Tapiratiba');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('398','Barra do Turvo');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('399','Itapura');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('400','Palmares Paulista');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('401','Alvinlândia');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('402','Gavião Peixoto');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('403','Lavínia');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('404','Ribeirão do Sul');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('405','Ibirarema');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('406','Santa Lucia');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('407','Ilha Solteira');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('408','Nova Campina');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('409','Joanópolis');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('410','Lindóia');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('411','Biritiba Mirim');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('412','Ribeirão Grande');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('413','Porangaba');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('414','Itirapina');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('415','Guararema');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('416','Iracemápolis');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('417','Sales');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('418','Charqueada');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('419','Corumbataí');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('420','Coronel Macedo');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('421','São Bento do Sapucaí');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('422','Rincão');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('423','Echaporã');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('424','Mira Estrela');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('425','Junqueirópolis');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('426','Dobrada');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('427','Orlândia');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('428','Pirapozinho');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('429','Guaiçara');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('430','Severínia');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('431','Tarumã');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('432','Vista Alegre do Alto');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('433','Macatuba');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('434','Icém');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('435','Flórida Paulista');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('436','Getulina');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('437','Buritizal');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('438','Itaju');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('439','Canitar');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('440','Cafelândia');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('441','Queluz');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('442','Borborema');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('443','Ribeira');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('444','Pardinho');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('445','Lourdes');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('446','Cesário Lange');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('447','Lupércio');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('448','Reginópolis');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('449','Cananéia');
Insert into APP.CIRCUNSCRICOES (CIR_ID,CIR_MUNICIPIO) values ('450','Ocauçu');
--------------------------------------------------------
--  DDL for Index PK_CIR
--------------------------------------------------------

  CREATE UNIQUE INDEX "APP"."PK_CIR" ON "APP"."CIRCUNSCRICOES" ("CIR_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Trigger TG_SQ_CIR
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "APP"."TG_SQ_CIR" 
before insert on circunscricoes
for each row
begin
    :new.cir_id := sq_cir.nextval;
end;

/
ALTER TRIGGER "APP"."TG_SQ_CIR" ENABLE;
--------------------------------------------------------
--  Constraints for Table CIRCUNSCRICOES
--------------------------------------------------------

  ALTER TABLE "APP"."CIRCUNSCRICOES" ADD CONSTRAINT "CK_CIR_MUNICIPIO" CHECK (cir_municipio is not null) ENABLE;
  ALTER TABLE "APP"."CIRCUNSCRICOES" ADD CONSTRAINT "PK_CIR" PRIMARY KEY ("CIR_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
