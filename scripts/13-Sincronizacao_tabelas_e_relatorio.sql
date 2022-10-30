/* BANCO DE DADOS - data_science */

/* SINCRONIZANDO TABELAS E RELATORIOS */

-- RECRIAÇÃO DA TABELA LOCACAO PARA RECEBER NOVOS DADOS
DROP TABLE LOCACAO;

CREATE TABLE LOCACAO(
IDLOCACAO INT PRIMARY KEY,
DATA TIMESTAMP,
MIDIA INT,
DIAS INT,
ID_FILME INT,
FOREIGN KEY(ID_FILME)
REFERENCES FILME(IDFILME)
);

-- USO DE SEQUENCE
-- INICIALIZAÇÃO DE SEQUENCE
CREATE SEQUENCE SEQ_LOCACAO;

-- INICIALIZAÇÃO DA SEQUENCIA
NEXTVAL('SEQ_LOCACAO');

-- USO DE SEQUENCE COMO PARAMETRO DE INSERT
-- FUNCAO NEXTVAL
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'01/08/2018',23,3,100);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'01/02/2018',56,1,400);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'02/07/2018',23,3,400);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'02/02/2018',43,1,500);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'02/02/2018',23,2,100);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'03/07/2018',76,3,700);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'03/02/2018',45,1,700);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'04/08/2018',89,3,100);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'04/02/2018',23,3,800);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'05/07/2018',23,3,500);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'05/02/2018',38,3,800);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'01/10/2018',56,1,100);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'06/12/2018',23,3,400);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'01/02/2018',56,2,300);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'04/10/2018',76,3,300);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'01/09/2018',32,2,400);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'08/02/2018',89,3,100);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'01/02/2018',23,1,200);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'08/09/2018',45,3,300);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'01/12/2018',89,1,400);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'09/07/2018',23,3,1000);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'01/12/2018',21,3,1000);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'01/02/2018',34,2,100);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'09/08/2018',67,1,1000);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'01/02/2018',76,3,1000);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'01/02/2018',66,3,200);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'09/12/2018',90,1,400);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'03/02/2018',23,3,100);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'01/12/2018',65,5,1000);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'03/08/2018',43,1,1000);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'01/02/2018',27,31,200);

-- VERIFICANDO DAS TABELAS
-- VERIFICANDO OS NOVOS INSERT
SELECT * FROM LOCACAO;	
SELECT * FROM GENERO;
SELECT * FROM FILME;
SELECT * FROM REL_LOCADORA;

DROP REL_LOCADORA;

-- PREPARANDO NOVA TABELA RELATÓRIO
-- PREPARANDO SELECT
SELECT
L.IDLOCACAO,
F.NOME AS FILME,
G.NOME AS GENERO,
L.DATA AS DATA,
L.DIAS AS DIAS,
L.MIDIA AS MIDIA
FROM GENERO G
INNER JOIN FILME F
ON G.IDGENERO = F.ID_GENERO
INNER JOIN LOCACAO L
ON L.ID_FILME = F.IDFILME;

-- TRANSFORMANDO SELECT EM TABELA
CREATE TABLE RELATORIO_LOCADORA AS 
SELECT
L.IDLOCACAO,
F.NOME AS FILME,
G.NOME AS GENERO,
L.DATA AS DATA,
L.DIAS AS DIAS,
L.MIDIA AS MIDIA
FROM GENERO G
INNER JOIN FILME F
ON G.IDGENERO = F.ID_GENERO
INNER JOIN LOCACAO L
ON L.ID_FILME = F.IDFILME;

-- VERIFICANDO TABELA RELATORIO
SELECT * FROM RELATORIO_LOCADORA;
SELECT * FROM LOCACAO;

/* SELECT PARA TRAZER OS REGISTROS NOVOS */

-- SELECT PARA NUMERO DE REGISTROS DA LOCACAO E RELATORIO
SELECT
MAX(IDLOCACAO) AS RELATORIO,
(SELECT MAX(IDLOCACAO) FROM LOCACAO) AS LOCACAO -- SUBQUERY
FROM RELATORIO_LOCADORA;

-- SELECT PARA COMPARAR REGISTROS DAS TABELAS LOCACAO E RELATORIO
-- RETORNA A DIFERENÇA
SELECT
L.IDLOCACAO,
F.NOME AS FILME,
G.NOME AS GENERO,
L.DATA AS DATA,
L.DIAS AS DIAS,
L.MIDIA AS MIDIA
FROM GENERO G
INNER JOIN FILME F
ON G.IDGENERO = F.ID_GENERO
INNER JOIN LOCACAO L
ON L.ID_FILME = F.IDFILME
WHERE IDLOCACAO NOT IN (SELECT IDLOCACAO FROM RELATORIO_LOCADORA); -- SELECIONA A DIFERENÇA

/* INSERINDO OS REGISTROS NOVOS */

-- INSERIR REGISTROS DA DIFERENÇA ENTRE AS TABELAS DE ORIGEM NA TABELA DE RELATORIO 
INSERT INTO RELATORIO_LOCADORA -- COMANDO PARA INSERIR OS REGISTROS
SELECT
L.IDLOCACAO,
F.NOME AS FILME,
G.NOME AS GENERO,
L.DATA AS DATA,
L.DIAS AS DIAS,
L.MIDIA AS MIDIA
FROM GENERO G
INNER JOIN FILME F
ON G.IDGENERO = F.ID_GENERO
INNER JOIN LOCACAO L
ON L.ID_FILME = F.IDFILME
WHERE IDLOCACAO NOT IN (SELECT IDLOCACAO FROM RELATORIO_LOCADORA); -- SELECIONA (WHERE) E RETORNA A DIFERENÇA
-- SE A DIFERENÇA FOR VAZIO, NADA É INSERIDO
-- SE A DIFERENÇA EXISTIR, FAZ INSERT DOS REGISTROS DA DIFERENÇA

-- VERIFICANDO SE ESTA SINCRONIZADO
-- SINCRONIZADO, SE AS TABELAS TEM MESMO NUMEROS DE REGISTROS
SELECT
MAX(IDLOCACAO) AS RELATORIO,
(SELECT MAX(IDLOCACAO) FROM LOCACAO) AS LOCACAO
FROM RELATORIO_LOCADORA;

/* VAMOS DEIXAR ESSE PROCEDIMENTO AUTOMATICO POR MEIO
DE UMA TRIGGER */

/* TRIGGER NO POSTGRESQL SEGUE UM PASSO A PASSO,
CRIA-SE UM FUNÇÃO PARA EXECUTAR OS COMANDOS DESEJADOS,
DEPOIS CRIA-SE UMA TRIGGER QUE CHAMA ESSA FUNÇÃO */

-- CRIAR FUNÇÃO QUE,
-- VERIFICA SE A TABELA RELATÓRIO ESTA SINCRONIZADA
-- SE NÃO ESTA, SINCRONIZA
-- DEPOIS ATUALIZA O ARQUIVO
CREATE OR REPLACE FUNCTION ATUALIZA_REL() -- CRIA UMA FUNÇÃO OU SOBRESCREVE SE A FUNÇÃO JÁ EXISTIR
RETURNS TRIGGER AS -- É UMA FUNÇÃO PARA UMA TRIGGER. RETORNO (RETURNS) DE UMA TRIGGER
$$ -- ALTERA DELIMITADOR PARA PODER USAR O ";" DENTRO DO BLOCO DE PROGRAMAÇÃO
BEGIN -- INICIA O BLOCO DE PROGRAMAÇÃO

INSERT INTO RELATORIO_LOCADORA
SELECT L.IDLOCACAO, F.NOME AS FILME, G.NOME AS GENERO, L.DATA AS DATA, L.DIAS AS DIAS, L.MIDIA AS MIDIA
FROM GENERO G
INNER JOIN FILME F
ON G.IDGENERO = F.ID_GENERO
INNER JOIN LOCACAO L
ON L.ID_FILME = F.IDFILME
WHERE IDLOCACAO NOT IN (SELECT IDLOCACAO FROM RELATORIO_LOCADORA);

-- SOBREESCREVE O ARQUIVO CRIADO ANTERIORMENTE, SE EXISTIR
COPY RELATORIO_LOCADORA TO
'/home/serigo/DB/PostgreSQL/Export_dados/RELATORIO_LOCADORA.csv'
DELIMITER ';'
CSV HEADER;

RETURN NEW; -- ARGUMENTO TEMPORAL (NEW, OLD)
END; -- ENCERRA O BLOCO DE PROGRAMAÇÃO
$$ -- FINALIZA A MUDANÇA DO DELIMITADOR
LANGUAGE PLPGSQL; -- DEFINE A LINGUEM QUE FOI USADA NO BLOCO DE PROGRAMAÇÃO

/* COMANDO PARA APAGAR UMA TRIGGER */

DROP TRIGGER TG_RELATORIO ON LOCACAO; -- NECESSARIO DEFINIR ONDE A TRIGGER ESTA LOCADA

/* CRIANDO A TRIGGER */

CREATE TRIGGER TG_RELATORIO
AFTER INSERT ON LOCACAO
FOR EACH ROW -- PARA CADA LINHA (REGISTRO)
EXECUTE PROCEDURE ATUALIZA_REL(); -- CHAMA A FUNÇÃO