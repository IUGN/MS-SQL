SELECT sql_handle,
(
SELECT top 1 [text] FROM ::fn_get_sql(sysprocesses.sql_handle)
) as sqlcommand

FROM master..sysprocesses where spid =140


select * from sys.dm_tran_locks where request_session_id =113 and resource_database_id =27

select * from master.dbo.sysprocesses where spid =113