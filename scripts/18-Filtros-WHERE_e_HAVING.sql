/* BANCO DE DADOS: data_science */
/* TABELA: funcionarios */

-- VERIFICANDO TABELA
SELECT * FROM FUNCIONARIOS;

/* FILTROS DE GRUPO - WHERE e HAVING */

/* WHERE */

/* 1 - FILTROS BASEADOS EM VALORES NÚMERICOS */

SELECT
NOME,
DEPARTAMENTO,
SALARIO
FROM FUNCIONARIOS
WHERE SALARIO > 100000.00;

-- A COLUNA DO FILTRO NÃO PRECISA ESTAR NA PROJEÇÃO (SELECT)
SELECT
NOME,
DEPARTAMENTO
FROM FUNCIONARIOS
WHERE SALARIO > 100000.00;

/* 2 - FILTROS BASEADOS EM STRINGS */

SELECT
NOME,
DEPARTAMENTO,
SALARIO
FROM FUNCIONARIOS
WHERE DEPARTAMENTO = 'Ferramentas';
-- "CASE SENSITIVE" A STRING,
-- SENSIVEL A CAIXE DAS LETRAS

/* 3 - FILTROS BASEADOS EM MULTIPLAS COLUNAS E TIPOS - CONSIDERAR 'OR' OU 'AND' */

SELECT
NOME,
DEPARTAMENTO,
SALARIO
FROM FUNCIONARIOS
WHERE DEPARTAMENTO = 'Ferramentas'
AND SALARIO > 100000;

/* 4 - FILTRO BASEADO EM UM UNICO TIPO E COLUNA - ATENÇÃO PARA REGRA DO 'AND' E 'OR' */

SELECT
NOME,
DEPARTAMENTO,
SALARIO
FROM FUNCIONARIOS
WHERE DEPARTAMENTO = 'Ferramentas' AND DEPARTAMENTO = 'Books';
-- SEMPRE FALSO, POIS UMA COLUNA NÃO PODE TER DUAS RESPOSTAS AO MESMO TEMPO
-- NUNCA USAR 'AND' NO CASO DE DOIS FILTROS DESTINTOS EM UMA MESMA COLUNA.

/* 5 - FILTROS BASEADOS EM PADRÃO DE CARACTERES */

SELECT
DEPARTAMENTO,
SUM(SALARIO) AS SALARIO_TOTAL
FROM FUNCIONARIOS
WHERE DEPARTAMENTO LIKE 'B%'
GROUP BY DEPARTAMENTO;
-- DEPARTAMENTOS QUE COMEÇAM COM A LETRA 'B'
-- USO DO 'LIKE' PARA USAR O CARACTERE CORINGA '%'

/* 6 - FILTROS BASEADOS EM PADRÃO DE CARACTERES COM MAIS DE UMA LETRA */

SELECT
DEPARTAMENTO,
SUM(SALARIO) AS SALARIO_TOTAL
FROM FUNCIONARIOS
WHERE DEPARTAMENTO LIKE 'Be%'
GROUP BY DEPARTAMENTO;
-- DEPARTAMENTOS QUE COMEÇAM COM AS LETRAS 'Be'

/* 7 - UTILIZANDO CARACTERE CORINGA NO MEIO DA PALAVRA */

SELECT
DEPARTAMENTO,
SUM(SALARIO) AS SALARIO_TOTAL
FROM FUNCIONARIOS
WHERE DEPARTAMENTO LIKE 'B%s'
GROUP BY DEPARTAMENTO;
-- DEPARTAMENTOS QUE COMEÇAM COM A LETRA 'B' E TERMINAM COM A LETRA 's'.

/* HAVING */
-- WHERE = COLUNAS NÃO AGREGADAS
-- HAVING = COLUNAS AGREGADAS

/* 8 - E SE EU QUISESSE FILTRAR O GRUPAMENTO PELO SALARIO (SUM(SALARIO))?
POR EXEMPLO MAIOR QUE 4.000.000.00 */

SELECT
DEPARTAMENTO,
SUM(SALARIO) AS SALARIO_TOTAL
FROM FUNCIONARIOS
GROUP BY DEPARTAMENTO
HAVING SUM(SALARIO) > 4000000;
-- 'HAVING' SOMENTE DEPOIS DE 'GROUP BY'

-- USANDO 'WHERE' E 'HAVING' NA MESMA CONSULTA
SELECT
DEPARTAMENTO,
SUM(SALARIO) AS SALARIO_TOTAL
FROM FUNCIONARIOS
WHERE DEPARTAMENTO LIKE 'B%s'
GROUP BY DEPARTAMENTO
HAVING SUM(SALARIO) > 4000000;