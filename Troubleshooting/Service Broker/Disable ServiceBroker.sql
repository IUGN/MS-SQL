select * from sys.databases where is_broker_enabled=1
ALTER DATABASE msdb SET DISABLE_BROKER WITH ROLLBACK IMMEDIATE