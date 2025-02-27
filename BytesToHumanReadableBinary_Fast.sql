CREATE DEFINER=`User`@`%` FUNCTION `BytesToHumanReadableBinary_Fast`(
	`iBytes` DECIMAL(65,0) UNSIGNED
)
RETURNS varchar(42) CHARSET utf8mb4
LANGUAGE SQL
DETERMINISTIC
NO SQL
SQL SECURITY INVOKER
COMMENT ''
BEGIN
   DECLARE vSize DECIMAL(37,2) UNSIGNED;
   DECLARE vSuffix CHAR(4);
	
	CASE 
		WHEN iBytes < 1024                            THEN RETURN CONCAT(iBytes, ' B');
		WHEN iBytes < 1048576                         THEN SET vSize = ROUND(iBytes / 1024, 2),                            vSuffix = ' KiB';
		WHEN iBytes < 1073741824                      THEN SET vSize = ROUND(iBytes / 1048576, 2),                         vSuffix = ' MiB';
		WHEN iBytes < 1099511627776                   THEN SET vSize = ROUND(iBytes / 1073741824, 2),                      vSuffix = ' GiB';
		WHEN iBytes < 1125899906842624                THEN SET vSize = ROUND(iBytes / 1099511627776, 2),                   vSuffix = ' TiB';
		WHEN iBytes < 1152921504606846976             THEN SET vSize = ROUND(iBytes / 1125899906842624, 2),                vSuffix = ' PiB';
		WHEN iBytes < 1180591620717411303424          THEN SET vSize = ROUND(iBytes / 1152921504606846976, 2),             vSuffix = ' EiB';
		WHEN iBytes < 1208925819614629174706176       THEN SET vSize = ROUND(iBytes / 1180591620717411303424, 2),          vSuffix = ' ZiB';
		WHEN iBytes < 1237940039285380274899124224    THEN SET vSize = ROUND(iBytes / 1208925819614629174706176, 2),       vSuffix = ' YiB';
		WHEN iBytes < 1267650600228229401496703205376 THEN SET vSize = ROUND(iBytes / 1237940039285380274899124224, 2),    vSuffix = ' RiB';
		                                              ELSE SET vSize = ROUND(iBytes / 1267650600228229401496703205376, 2), vSuffix = ' QiB';
	END CASE;
    
	RETURN CONCAT(TRIM(TRAILING '.' FROM TRIM(TRAILING '0' FROM vSize)), vSuffix);
END
