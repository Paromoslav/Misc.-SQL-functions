CREATE DEFINER=`User`@`%` FUNCTION `BitsToHumanReadable_Fast`(
	`iBits` DECIMAL(65,0) UNSIGNED
)
RETURNS varchar(43) CHARSET utf8mb4
LANGUAGE SQL
DETERMINISTIC
NO SQL
SQL SECURITY INVOKER
COMMENT ''
BEGIN
   DECLARE vSize DECIMAL(38,2) UNSIGNED;
   DECLARE vSuffix CHAR(5);
	
	CASE 
		WHEN iBits < 1000                            THEN RETURN CONCAT(iBits, ' bit');
		WHEN iBits < 1000000                         THEN SET vSize = ROUND(iBits / 1000, 2),                            vSuffix = ' kbit';
		WHEN iBits < 1000000000                      THEN SET vSize = ROUND(iBits / 1000000, 2),                         vSuffix = ' Mbit';
		WHEN iBits < 1000000000000                   THEN SET vSize = ROUND(iBits / 1000000000, 2),                      vSuffix = ' Gbit';
		WHEN iBits < 1000000000000000                THEN SET vSize = ROUND(iBits / 1000000000000, 2),                   vSuffix = ' Tbit';
		WHEN iBits < 1000000000000000000             THEN SET vSize = ROUND(iBits / 1000000000000000, 2),                vSuffix = ' Pbit';
		WHEN iBits < 1000000000000000000000          THEN SET vSize = ROUND(iBits / 1000000000000000000, 2),             vSuffix = ' Ebit';
		WHEN iBits < 1000000000000000000000000       THEN SET vSize = ROUND(iBits / 1000000000000000000000, 2),          vSuffix = ' Zbit';
		WHEN iBits < 1000000000000000000000000000    THEN SET vSize = ROUND(iBits / 1000000000000000000000000, 2),       vSuffix = ' Ybit';
		WHEN iBits < 1000000000000000000000000000000 THEN SET vSize = ROUND(iBits / 1000000000000000000000000000, 2),    vSuffix = ' Rbit';
		                                             ELSE SET vSize = ROUND(iBits / 1000000000000000000000000000000, 2), vSuffix = ' Qbit';
	END CASE;
    
	RETURN CONCAT(TRIM(TRAILING '.' FROM TRIM(TRAILING '0' FROM vSize)), vSuffix);
END
