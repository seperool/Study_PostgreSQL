-- DATABASE: data_science
-- TABLE: funcionarios

SELECT * FROM FUNCIONARIOS;

SELECT
COUNT(SEXO)
FROM FUNCIONARIOS
WHERE SEXO = 'Masculino';

/* Loops */
-- LOOP
-- WHILE
-- FOR
-- FOREACH

/* LOOP */
-- IF EXIT
-- EXIT WHEN
-- IF CONTINUE
-- CONTINUE WHEN

-- IF EXIT
CREATE PROCEDURE contador_loop_if_exit()
LANGUAGE plpgsql
AS
$$
DECLARE CONTADOR INTEGER = 0;
BEGIN
	LOOP
		IF CONTADOR > 5 THEN
			EXIT;
		END IF;
		RAISE NOTICE 'CONTADOR É %', CONTADOR;
		CONTADOR = CONTADOR + 1;
	END LOOP;
END;
$$

CALL contador_loop_if_exit();

DROP PROCEDURE contador_loop_if_exit();

-- Ou, sem criar uma função (PROCEDURE)
DO
$$
DECLARE CONTADOR INTEGER = 0;
BEGIN
	LOOP
		IF CONTADOR > 5 THEN
			EXIT;
		END IF;
		RAISE NOTICE 'CONTADOR É %', CONTADOR;
		CONTADOR = CONTADOR + 1;
	END LOOP;
END;
$$

-- EXIT WHEN
CREATE PROCEDURE contador_loop_exit_when()
LANGUAGE plpgsql
AS
$$
DECLARE counter INTEGER=0;
BEGIN
	LOOP
		EXIT WHEN counter = 5;
		counter = counter + 1;
		RAISE NOTICE 'Counter %', counter;
	END LOOP;
END;
$$

CALL contador_loop_exit_when();

DROP PROCEDURE contador_loop_exit_when();

-- CONTINUE (IF CONTINUE)
-- PULA PARA A PROXIMA ITERAÇÃO
DO
$$
DECLARE CONTADOR INTEGER = 0;
BEGIN
	LOOP
		CONTADOR = CONTADOR + 1;
		IF (CONTADOR = 5) THEN
			CONTINUE;
		END IF;
		IF (CONTADOR > 10) THEN
			EXIT;
		END IF;
		RAISE NOTICE 'CONTADOR = %', CONTADOR;
	END LOOP;
END;
$$


-- CONTINUE WHEN
-- DEFINE UMA EXPRESSÃO, QUANDO CUMPRIDA DESENCADEIA O CONTINUE
-- OU SEJA, PULA PARA A PROXIMA ITERAÇÃO
DO
$$
DECLARE CONTADOR INTEGER = 0;
BEGIN
	LOOP
		CONTADOR = CONTADOR + 1;
		CONTINUE WHEN (CONTADOR = 5);
		EXIT WHEN (CONTADOR > 10);
		RAISE NOTICE 'CONTADOR = %', CONTADOR;
	END LOOP;
END;
$$

/* WHILE */

CREATE PROCEDURE contador_while()
LANGUAGE plpgsql
AS
$$
DECLARE counter INTEGER=0;
BEGIN
	WHILE (counter < 5) LOOP -- LAÇO ENQUANTO A EXPRESSÃO FOR VERDADEIRA
		counter = counter + 1;
		RAISE NOTICE 'Counter %', counter;
	END LOOP;
END;
$$

CALL contador_while();

DROP PROCEDURE contador_while;

/* FOR */

-- LAÇO QUE PECORRE UMA LISTA PRÉDETERMINADA
CREATE PROCEDURE contador_for()
LANGUAGE plpgsql
AS
$$
BEGIN
	FOR counter IN 1..10 LOOP
		RAISE NOTICE 'Counter %', counter;
	END LOOP;
END;
$$

CALL contador_for();

DROP PROCEDURE contador_for;
-- NÃO PRECISA DECLARAR A VARIAVEL CONTADOR
-- NO FOR, A VARIAVEL CONTADOR É CRIADA E POR DEFAULT RECEBE O TIPO 'INTEGER' (INTEIRO)

-- ou, sem criar uma função
DO
$$
BEGIN
	FOR counter IN 1..10 LOOP -- PERCORRE A LISTA, SOMANDO 1 A VARIAVEL COUNTER A CADA ITERAÇÃO
		RAISE NOTICE 'Counter %', counter;
	END LOOP;
END;
$$

-- REVERSE
-- SUBTRAI VALOR DA VARIAVEL CONTADOR A CADA ITERAÇÃO
DO
$$
BEGIN
	FOR counter IN REVERSE 10..1 LOOP -- PERCORRE A LISTA, SUBTRAINDO 1 A VARIAVEL COUNTER A CADA ITERAÇÃO
		RAISE NOTICE 'Counter %', counter;
	END LOOP;
END;
$$

-- BY 2
DO
$$
DECLARE counter INTEGER; -- NÃO PRECISA DE INPUT INICIAL
BEGIN
	FOR counter IN REVERSE 10..1 BY 2 LOOP -- PERCORRE A LISTA DE 2 EM 2 (BY 2)
		RAISE NOTICE 'Counter %', counter;
	END LOOP;
END;
$$

-- FOR IN QUERY
-- PERCORRE UMA DETERMINA CONSULTA
DO
$$
DECLARE
	FUNC VARCHAR(30);
	CONTADOR INTEGER = 0;
BEGIN
	FOR CONTADOR, FUNC IN
		SELECT
		IDFUNCIONARIO,
		NOME
		FROM FUNCIONARIOS
	LOOP
		RAISE NOTICE 'O nome do funcionario é %, seu ID é %', FUNC, CONTADOR;
	END LOOP;
END;
$$
-- ITERA LINHA POR LINHA DA CONSULTA (QUERY)
-- SALVA A CADA ITERAÇÃO A VALOR DO REGISTRO NA VARIAVEL

/* FOREACH */

-- EM VEZ DE ITERAR PELAS LINHAS RETORNADAS POR UMA CONSULTA SQL,
-- ELE ITERA PELOS ELEMENTOS DE UM VALOR DE MATRIZ (ARRAY)