CREATE DEFINER=`User`@`%` FUNCTION `BytesToHumanReadable_Fast`(
	`iBytes` DECIMAL(65,0) UNSIGNED
)
RETURNS varchar(41) CHARSET utf8mb4
LANGUAGE SQL
DETERMINISTIC
NO SQL
SQL SECURITY INVOKER
COMMENT ''
BEGIN
   DECLARE vSize DECIMAL(38,2) UNSIGNED;
   DECLARE vSuffix CHAR(3);
	
	CASE 
		WHEN iBytes < 1000                            THEN RETURN CONCAT(iBytes, ' B');
		WHEN iBytes < 1000000                         THEN SET vSize = ROUND(iBytes / 1000, 2),                            vSuffix = ' kB';
		WHEN iBytes < 1000000000                      THEN SET vSize = ROUND(iBytes / 1000000, 2),                         vSuffix = ' MB';
		WHEN iBytes < 1000000000000                   THEN SET vSize = ROUND(iBytes / 1000000000, 2),                      vSuffix = ' GB';
		WHEN iBytes < 1000000000000000                THEN SET vSize = ROUND(iBytes / 1000000000000, 2),                   vSuffix = ' TB';
		WHEN iBytes < 1000000000000000000             THEN SET vSize = ROUND(iBytes / 1000000000000000, 2),                vSuffix = ' PB';
		WHEN iBytes < 1000000000000000000000          THEN SET vSize = ROUND(iBytes / 1000000000000000000, 2),             vSuffix = ' EB';
		WHEN iBytes < 1000000000000000000000000       THEN SET vSize = ROUND(iBytes / 1000000000000000000000, 2),          vSuffix = ' ZB';
		WHEN iBytes < 1000000000000000000000000000    THEN SET vSize = ROUND(iBytes / 1000000000000000000000000, 2),       vSuffix = ' YB';
		WHEN iBytes < 1000000000000000000000000000000 THEN SET vSize = ROUND(iBytes / 1000000000000000000000000000, 2),    vSuffix = ' RB';
		                                              ELSE SET vSize = ROUND(iBytes / 1000000000000000000000000000000, 2), vSuffix = ' QB';
	END CASE;
    
	RETURN CONCAT(TRIM(TRAILING '.' FROM TRIM(TRAILING '0' FROM vSize)), vSuffix);
END
