CREATE DEFINER=`User`@`%` FUNCTION `BINtoMAC`(
	`BinMAC` BINARY(6)
)
RETURNS char(17) CHARSET utf8mb4
LANGUAGE SQL
DETERMINISTIC
NO SQL
SQL SECURITY INVOKER
COMMENT ''
BEGIN
	RETURN INSERT(
	       INSERT(
	       INSERT(
	       INSERT(
	       INSERT(
	       	HEX(BinMAC),
	       	11, 0, ':'),
	       	 9, 0, ':'),
	       	 7, 0, ':'),
	       	 5, 0, ':'),
	       	 3, 0, ':');
END
