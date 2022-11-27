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
-- Não, pouca repetição, não forma um padrão relevante (não apresenta um indicativo de algo).

/* 2 - Qual a moda departamental? (Qual o departamento que mais emprega?) */

SELECT
Departamento,
COUNT(idfuncionario) AS MODA
FROM funcionarios
GROUP BY 1
ORDER BY 2 DESC;
-- "BELEZA" e "ROUPAS" cada um 53 funcionarios.

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

SELECT
ROUND(MEDIAN(salario),2) AS MEDIANA_SALARIOS
FROM funcionarios;
-- Valor da mediana dos salarios = 96278,50

SELECT
departamento,
ROUND(MEDIAN(salario),2) AS MEDIANA_SALARIOS
FROM funcionarios
GROUP BY departamento
ORDER BY 2 DESC;
-- Valor da mediana por departamento:
/*
"Outdoors"	114977.50
"Beleza"	113893.00
"Alimentícios"	109373.00
"Games"	109058.00
"Filmes"	108548.50
"Ferramentas"	107709.00
"Computadores"	106382.00
"Automotivo"	105073.00
"Saúde"	103703.00
"Jardim"	97351.00
"Crianças"	95040.00
"Brinquedos"	93714.00
"Eletronicos"	93245.00
"Books"	91561.00
"Roupas"	91532.00
"Lar"	91452.00
"Bebês"	89680.00
"Industrial"	88029.00
"Esporte"	87433.00
"Joalheria"	86896.50
"Calçados"	85511.00
"Música"	84261.00
*/

/* 5 - Qual é a amplitude de todos os salários? */

SELECT
MAX(salario) AS Salario_Max,
MIN(salario) AS Salario_Min,
ROUND(MAX(salario)-MIN(salario),2) AS Amplitude_salarios
FROM funcionarios;
-- Amplitude total = 109791,00

/* 6 - Cálcule as principais medidas estatísticas por departamento. */

-- Medidas de posição:
	-- MODA
	-- MEDIANA
	-- MEDIA
-- Medidas de dispersão:
	-- MÁXIMO
	-- MÍNIMO
	-- AMPLITUDE TOTAL
	-- VARIÂNCIA
	-- DESVIO-PADRÃO
	-- COEFICIENTE DE VARIAÇÃO

SELECT
departamento,
COUNT(idfuncionario) as MODA_DEPARTAMENTAL,
ROUND(MEDIAN(salario),2) AS MEDIANA_SALARIO,
ROUND(AVG(salario),2) AS MEDIA_SALARIO,
MAX(salario) AS SALARIO_MAXIMO,
MIN(salario) AS SALARIO_MINIMO,
ROUND(MAX(salario)-MIN(salario),2) AS AMPLITUDE_TOTAL_SALARIO,
ROUND(VAR_POP(salario),2) AS VARIANCIA,
ROUND(STDDEV_POP(salario),2) AS DESV_PAD_SALARIO,
ROUND((STDDEV_POP(salario)/AVG(salario))*100,2) AS COEF_VAR
FROM funcionarios
GROUP BY departamento
ORDER BY 1;

/*
"Alimentícios"	46	109373.00	101113.93	149929	44919	105010.00	1161021316.10	34073.76	33.70
"Automotivo"	46	105073.00	99658.00	146167	42602	103565.00	929902811.87	30494.31	30.60
"Bebês"	45	89680.00	93749.42	148687	42924	105763.00	912220932.82	30203.00	32.22
"Beleza"	53	113893.00	103416.28	149099	40254	108845.00	952478558.54	30862.25	29.84
"Books"	47	91561.00	94890.15	146745	42714	104031.00	945765035.83	30753.29	32.41
"Brinquedos"	41	93714.00	96187.17	149835	40138	109697.00	1150709491.31	33922.11	35.27
"Calçados"	43	85511.00	92281.81	147739	45463	102276.00	849306565.17	29142.86	31.58
"Computadores"	52	106382.00	99095.44	149336	46960	102376.00	930175201.52	30498.77	30.78
"Crianças"	38	95040.00	93237.55	149351	43097	106254.00	1072987422.93	32756.49	35.13
"Eletronicos"	49	93245.00	91615.12	149597	40218	109379.00	1073778518.03	32768.56	35.77
"Esporte"	40	87433.00	93901.03	147166	40418	106748.00	1049150239.87	32390.59	34.49
"Ferramentas"	39	107709.00	105020.72	149586	44788	104798.00	795868561.02	28211.14	26.86
"Filmes"	36	108548.50	100911.81	146970	41898	105072.00	876898879.10	29612.48	29.34
"Games"	49	109058.00	103883.76	149221	41516	107705.00	1040425239.16	32255.62	31.05
"Industrial"	47	88029.00	92900.85	148816	40194	108622.00	889271955.28	29820.66	32.10
"Jardim"	47	97351.00	101959.26	148860	50057	98803.00	909562157.08	30158.95	29.58
"Joalheria"	46	86896.50	87812.22	149114	41026	108088.00	875256537.78	29584.73	33.69
"Lar"	52	91452.00	92734.71	149598	40415	109183.00	1037243300.97	32206.26	34.73
"Música"	37	84261.00	88507.22	144608	42759	101849.00	1001696601.52	31649.59	35.76
"Outdoors"	48	114977.50	112055.42	148906	43366	105540.00	745849798.45	27310.25	24.37
"Roupas"	53	91532.00	95054.53	148408	42797	105611.00	1000324590.36	31627.91	33.27
"Saúde"	46	103703.00	98975.65	145962	43431	102531.00	1216304238.79	34875.55	35.24
*/

/* 7 - Qual departamento te dá maior oportunidade de ganhar mais? */
-- Resposta: OUTDOOR, por que?

SELECT
departamento,
ROUND(MEDIAN(salario),2) AS MEDIANA_SALARIO,
ROUND(AVG(salario),2) AS MEDIA_SALARIO,
MAX(salario) AS SALARIO_MAXIMO,
MIN(salario) AS SALARIO_MINIMO,
ROUND(MAX(salario)-MIN(salario),2) AS AMPLITUDE_TOTAL_SALARIO,
ROUND(VAR_POP(salario),2) AS VARIANCIA,
ROUND(STDDEV_POP(salario),2) AS DESV_PAD_SALARIO,
ROUND((STDDEV_POP(salario)/AVG(salario))*100,2) AS COEF_VAR
FROM funcionarios
GROUP BY departamento
ORDER BY 9;

SELECT
departamento,
ROUND(MEDIAN(salario),2) AS MEDIANA_SALARIO,
ROUND(AVG(salario),2) AS MEDIA_SALARIO,
MAX(salario) AS SALARIO_MAXIMO,
MIN(salario) AS SALARIO_MINIMO,
ROUND(MAX(salario)-MIN(salario),2) AS AMPLITUDE_TOTAL_SALARIO,
ROUND(VAR_POP(salario),2) AS VARIANCIA,
ROUND(STDDEV_POP(salario),2) AS DESV_PAD_SALARIO,
ROUND((STDDEV_POP(salario)/AVG(salario))*100,2) AS COEF_VAR
FROM funcionarios
GROUP BY departamento
ORDER BY 2 DESC;
-- É o departamento de "OUTDOOR", pois apresenta o maior salario em questão de mediana
-- (valores centrais)
-- Mediana = 114977.50
-- e o menor coeficiente de variação do salario.
-- Coef. Variação = 24.37