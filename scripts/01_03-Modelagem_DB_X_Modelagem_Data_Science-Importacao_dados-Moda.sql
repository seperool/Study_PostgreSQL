/* BANCO DE DADOS - data_science */

/* Modelagem Banco de Dados x Data Science */

/* Banco de Dados -> 1,2 e 3 Formas normais
Evitam reduncancia, consequentemente poupam espaço em disco.
Consomem muito processamento em função de Joins. Queries lentas

Data Science e B.I -> Focam em agregaçoes e performance.
Não se preocupam com espaço em disco.
Em B.I, modelagem mínima (DW).
Em Data Science, preferencialmente modelagem Colunar */

/*---------------------------------------------------------------*/

/*Importando CSV*/

/*
Tipos de arquivos (mais comuns) gerados por:
SERVIDORES - ".log" e ".csv"
Banco de dados - ".csv" e ".relacional"
*/

/* Um aspecto importante é que ao exportar um arquivo
devemos passar do "modelo relacional" para "modelo colunar",
para melhor trabalhar com esse arquivo em outro lugar 
(linguagens de programação: R, Python, ...).
Para isso, antes de exportarmos devemos fazer uma Query,
que junte numa tabela as informações a serem exportadas,
podendo adicionar informações de resumo dos dados
(como por exemplo funções de agregação (max, min, avg, ...)),
e então exportar o resultado desta "Query".
*/

/* O servidor de maquinas gerou um arquivo de log CSV.
Vamos importá-lo e analisa-lo dentro do nosso banco */

-- Criando tabela para receber os dados do arquivo
CREATE TABLE MAQUINAS(
	MAQUINA VARCHAR(20),
	DIA INT,
	QTD NUMERIC(10,2)
);

-- Caminho que contem o arquivo
-- NÃO é um comando!!! É apenas para salvar a string do caminho que contém o arquvio
/home/serigo/DB/PostgreSQL/Import_dados

-- Comandos de importação dos dados do arquivo ".csv"
COPY MAQUINAS -- copiar dados para tabela "MAQUINAS"
FROM '/home/serigo/DB/PostgreSQL/Import_dados/LogMaquinas.csv'  -- Caminho do arquivo
DELIMITER ',' -- delimitador no arquivo, "o que separa os campos no arquivo".
CSV HEADER; -- Avisando que tem cabeçalho no arquivo, corta a primeira linha.

-- Verificando os dados na tabela
SELECT * FROM MAQUINAS;