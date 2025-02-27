CREATE DEFINER=`User`@`%` FUNCTION `EasterSunday`(
	`iYear` SMALLINT UNSIGNED
)
RETURNS date
LANGUAGE SQL
DETERMINISTIC
NO SQL
SQL SECURITY INVOKER
COMMENT 'Implementation of the Easter algorithm (Computus)'
BEGIN
	DECLARE a, b, c, d, e, g, h, i, k, l, m, n, p SMALLINT;
	
	SET a = iYear MOD 19,
	    b = FLOOR(iYear / 100),
	    c = iYear MOD 100,
	    d = FLOOR(b / 4),
	    e = b MOD 4,
	    g = FLOOR((8 * b + 13) / 25),
	    h = (19 * a + b - d - g + 15) MOD 30,
	    i = FLOOR(c / 4),
	    k = c MOD 4,
	    l = (32 + 2 * e + 2 * i - h - k) MOD 7,
	    m = FLOOR((a + 11 * h + 19 * l) / 433),
	    n = FLOOR((h + l - 7 * m + 90) / 25),
	    p = (h + l - 7 * m + 33 * n + 19) MOD 32;
	
	RETURN DATE(CONCAT(iYear,'-',n,'-',p));
END
