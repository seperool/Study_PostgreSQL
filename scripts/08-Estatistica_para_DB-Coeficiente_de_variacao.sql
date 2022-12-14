/* BANCO DE DADOS - data_science */

/* ESTATÍSTICA BÁSICA COM BANCO DE DADOS */

/* COEFICIENTE DE VARIACAO */

/* PROJECAO:
	MAQUINAS
	QUANTIDADE
	TOTAL
	MEDIA
	MEDIANA
	MAXIMO
	MINIMO
	AMPLITUDE
	VARIANCIA
	DESVIO PADRAO
	COEFICIENTE DE VARIACAO
*/

/* CALCULO DE COEFICIENTE DE VARIACAO

COEF. VAR. = (DESV_PADRAO/MEDIA)*100
LOGO,
COEF. VAR = (STDDEV_POP(Coluna)/AVG(Coluna))*100

SE COEF. VAR. <= 15, BAIXA DISPERSAO
SE 15 < COEF. VAR. < 30, MÉDIA DISPERSAO
SE COEF. VAR. >= 30, ALTA DISPERSAO
*/

SELECT
MAQUINA,
COUNT(QTD) AS "QUANTIDADE",
ROUND(SUM(QTD),2) AS "TOTAL",
ROUND(AVG(QTD),2) AS "MEDIA",
ROUND(MEDIAN(QTD),2) AS "MEDIANA",
MAX(QTD) AS "MAXIMO",
MIN(QTD) AS "MINIMO",
ROUND((MAX(QTD) - MIN(QTD)),2) AS "AMPLITUDE TOTAL",
ROUND(VAR_POP(QTD),2) AS "VARIANCIA POP.",
ROUND(STDDEV_POP(QTD),2) AS "DES_PADRAO POP.",
ROUND(((STDDEV_POP(QTD)/AVG(QTD))*100),2) AS "COEF_VAR"
FROM MAQUINAS
GROUP BY 1
ORDER BY 11 DESC;