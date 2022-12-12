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

-- EXIT

-- LABEL

/* WHILE */
CREATE PROCEDURE contador_while()
LANGUAGE plpgsql
AS
$$
DECLARE counter INTEGER=0;
BEGIN
	WHILE (counter < 5) LOOP
		counter = counter + 1;
		RAISE NOTICE 'Counter %', counter;
	END LOOP;
END;
$$

CALL contador_while();

DROP PROCEDURE contador_while;

/* FOR */

/* FOREACH */