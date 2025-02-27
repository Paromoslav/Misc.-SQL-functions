CREATE DEFINER=`User`@`%` FUNCTION `IsNumber`(
	`Input` VARCHAR(67)
)
RETURNS bit(1)
LANGUAGE SQL
DETERMINISTIC
NO SQL
SQL SECURITY INVOKER
COMMENT ''
BEGIN
	RETURN Input REGEXP '^[-+]?(?:\\d+(?:\\.\\d*)?|\\.\\d+)(?:[eE][-+]?\\d+)?$';
END
