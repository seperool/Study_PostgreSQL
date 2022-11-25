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

SELECT
departamento,
ROUND(STDDEV_POP(salario),2) AS Desv_Padrao_Pop
FROM funcionarios
GROUP BY 1
ORDER BY 2 DESC;

-- Desvio-Padrão por departamento
/*
"Saúde"	34875.55
"Alimentícios"	34073.76
"Brinquedos"	33922.11
"Eletronicos"	32768.56
"Crianças"	32756.49
"Esporte"	32390.59
"Games"	32255.62
"Lar"	32206.26
"Música"	31649.59
"Roupas"	31627.91
"Beleza"	30862.25
"Books"	30753.29
"Computadores"	30498.77
"Automotivo"	30494.31
"Bebês"	30203.00
"Jardim"	30158.95
"Industrial"	29820.66
"Filmes"	29612.48
"Joalheria"	29584.73
"Calçados"	29142.86
"Ferramentas"	28211.14
"Outdoors"	27310.25
*/

/* 4 - Cálcule a mediana salarial de todo set de dados. */

/* 5 - Qual é a amplitude de todos os salários? */

SELECT
MAX(salario) AS Salario_Max,
MIN(salario) AS Salario_Min,
ROUND(MAX(salario)-MIN(salario),2) AS Amplitude_salarios
FROM funcionarios;
-- Amplitude = 109791,00

/* 6 - Cálcule as principais medidas estatísticas por departamento. */

/* 7 - Qual departamento te dá maior oportunidade de ganhar mais? --Outdoor*/