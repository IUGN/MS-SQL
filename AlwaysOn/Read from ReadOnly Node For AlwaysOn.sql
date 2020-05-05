ALTER AVAILABILITY GROUP [<AOGroupname>]
 MODIFY REPLICA ON
N'<dbname>01' WITH 
(SECONDARY_ROLE (ALLOW_CONNECTIONS = READ_ONLY));
ALTER AVAILABILITY GROUP [<AOGroupname>]
 MODIFY REPLICA ON
N'<dbname>01' WITH 
(SECONDARY_ROLE (READ_ONLY_ROUTING_URL = N'TCP://<dbname>01.<domainname>:1433'));

ALTER AVAILABILITY GROUP [<AOGroupname>]
 MODIFY REPLICA ON
N'<dbname>02' WITH 
(SECONDARY_ROLE (ALLOW_CONNECTIONS = READ_ONLY));
ALTER AVAILABILITY GROUP [<AOGroupname>]
 MODIFY REPLICA ON
N'<dbname>02' WITH 
(SECONDARY_ROLE (READ_ONLY_ROUTING_URL = N'TCP://<dbname>02.<domainname>:1433'));

ALTER AVAILABILITY GROUP [<AOGroupname>] 
MODIFY REPLICA ON
N'<dbname>01' WITH 
(PRIMARY_ROLE (READ_ONLY_ROUTING_LIST=('<dbname>02','<dbname>01')));

ALTER AVAILABILITY GROUP [<AOGroupname>] 
MODIFY REPLICA ON
N'<dbname>02' WITH 
(PRIMARY_ROLE (READ_ONLY_ROUTING_LIST=('<dbname>01','<dbname>02')));
GO
