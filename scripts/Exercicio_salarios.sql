-- database: data_science
-- table: funcionarios

/* Exercicios */

-- verificando tabela
SELECT salario FROM funcionarios;

/* 1 - Qual a moda dos salários? A moda dos salários diz algo de relevante? */

SELECT
salario,
COUNT(salario) AS MODA
FROM funcionarios
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;
-- NÃO, POUCA REPETIÇÃO, NÃO FORMA UM PADRÃO RELEVANTE (INDICATIVO DE ALGO).

/* 2 - Qual a moda departamental? (Qual o departamento que mais emprega?) */

SELECT
Departamento,
COUNT(idfuncionario) AS MODA
FROM funcionarios
GROUP BY 1
ORDER BY 2 DESC;
-- "BELEZA" E "ROUPAS" CADA UM 53 FUNCIONARIOS.

/* 3 - Qual o desvio-padrão de cada departamento? */

/* 4 - Cálcule a mediana salarial de todo set de dados. */

/* 5 - Qual é a amplitude de todos os salários? */

/* 6 - Cálcule as principais medidas estatísticas por departamento. */

/* 7 - Qual departamento te dá maior oportunidade de ganhar mais? --Outdoor*/