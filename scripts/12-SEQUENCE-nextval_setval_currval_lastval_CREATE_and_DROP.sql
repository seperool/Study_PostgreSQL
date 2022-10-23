/* SEQUENCE */
/*
SEQUENCE é um objeto do banco de dados,
definido pelo usuário e não está vinculada a nenhuma tabela específica, 
o que significa que seu valor pode ser compartilhado por várias tabelas.
Passa um número, de uma sequência continua (do objeto SEQUENCE).
*/

--CRIANDO UM OBJETO DO TIPO SEQUENCE COMEÇANDO EM 101
CREATE SEQUENCE myseq START 101; -- NOME DO OBJETO SEQUENCE É myseq

-- AVANÇANDO O VALOR DA SEQUENCE COM O COMANDO nextval
SELECT nextval('myseq');

-- REDEFININDO O VALOR DA SEQUENCE A PARTIR DE UM NUMERO
-- COMANDO setval
SELECT setval('myseq', 42);           --O PROXIMO nextval RETORNARA 43
SELECT setval('myseq', 42, true);     --MESMO QUE O COMANDO ANTERIOR
SELECT setval('myseq', 42, false);    --O PROXIMO nextval RETORNARA 42

-- RETORNA O VALOR MAIS RECENTE OBTIDO PELO nextval
-- COMANDO currval
SELECT setval ('myseq',101);
SELECT currval('myseq');

-- DELETANDO O OBJETO SEQUENCE myseq
DROP SEQUENCE myseq;
CREATE SEQUENCE myseq START 101;
SELECT currval('myseq'); 
-- ERRO POIS NÃO FOI DADO NENHUM COMANDO nextval
-- COMANDO currval DEPENDE DE nextval TER SIDO EXECUTADO ANTERIORMENTE

-- RETORNA O VALOR MAIS RECENTE OBTIDO PELO nextval
-- SEM ESPECIFICAR A SEQUENCE
-- SE HOUVER MAIS DE UMA SEQUENCE EM UTILIZAÇÃO, RETORNA A ULTIMA A SER UTILIZIADA
-- COMANDO lastval
SELECT nextval('myseq');
SELECT lastval();

-- DELETANDO A SEQUENCE EXISTENTE myseq
DROP SEQUENCE myseq;