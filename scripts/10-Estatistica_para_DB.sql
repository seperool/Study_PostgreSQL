/* BANCO DE DADOS - data_science */

/* ESTATÍSTICA BÁSICA COM BANCO DE DADOS */

/* PROJETANDO TODAS AS INFORMACOES ESTATISTICAS
DE UMA TABELA */

/* PROJECAO:
	MAQUINAS
	QUANTIDADE
	TOTAL
	MEDIA
	MEDIANA
	MODA
	MAXIMO
	MINIMO
	AMPLITUDE
	VARIANCIA
	DESVIO PADRAO
	COEFICIENTE DE VARIACAO
*/

SELECT
MAQUINA,
COUNT(QTD) AS "QUANTIDADE",
ROUND(SUM(QTD),2) AS "TOTAL",
ROUND(AVG(QTD),2) AS "MEDIA",
ROUND(MEDIAN(QTD),2) AS "MEDIANA",
MODE() WITHIN GROUP(ORDER BY QTD) AS "MODA",
MAX(QTD) AS "MAXIMO",
MIN(QTD) AS "MINIMO",
ROUND((MAX(QTD) - MIN(QTD)),2) AS "AMPLITUDE TOTAL",
ROUND(VAR_POP(QTD),2) AS "VARIANCIA POP.",
ROUND(STDDEV_POP(QTD),2) AS "DES_PADRAO POP.",
ROUND(((STDDEV_POP(QTD)/AVG(QTD))*100),2) AS "COEF_VAR"
FROM MAQUINAS
GROUP BY 1
ORDER BY 12 DESC;