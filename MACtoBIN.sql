CREATE DEFINER=`User`@`%` FUNCTION `MACtoBIN`(
	`MAC` VARCHAR(17)
)
RETURNS binary(6)
LANGUAGE SQL
DETERMINISTIC
NO SQL
SQL SECURITY INVOKER
COMMENT ''
BEGIN
	RETURN UNHEX(REPLACE(REPLACE(MAC,':',''),'-',''));
END
