-- DATABASE: data_science
-- TABLE: funcionarios

/* Loops */
-- LOOP
-- WHILE
-- FOR
-- FOREACH

/* LOOP */

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
DECLARE counter INTEGER;
BEGIN
	FOR counter IN 1..10 LOOP
		RAISE NOTICE 'Counter %', counter;
	END LOOP;
END;
$$

CALL contador_for();

DROP PROCEDURE contador_for;

-- ou, sem criar uma função
DO
$$
DECLARE counter INTEGER;
BEGIN
	FOR counter IN 1..10 LOOP -- PERCORRE A LISTA
		RAISE NOTICE 'Counter %', counter;
	END LOOP;
END;
$$

-- REVERSE
DO
$$
DECLARE counter INTEGER;
BEGIN
	FOR counter IN REVERSE 10..1 LOOP -- PERCORRE A LISTA NO SENTIDO INVERSO
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

/* FOREACH */