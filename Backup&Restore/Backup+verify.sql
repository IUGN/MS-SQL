BACKUP DATABASE [BD] TO  DISK = N'\\<Path>' WITH NOFORMAT, NOINIT,  NAME = N'Billing-Full Database Backup', SKIP, NOREWIND, NOUNLOAD, COMPRESSION,  STATS = 10
GO
declare @backupSetId as int
select @backupSetId = position from msdb..backupset where database_name=N'BD' and backup_set_id=(select max(backup_set_id) from msdb..backupset where database_name=N'BD' )
if @backupSetId is null begin raiserror(N'Verify failed. Backup information for database ''Billing'' not found.', 16, 1) end
RESTORE VERIFYONLY FROM  DISK = N'\\<Path>' WITH  FILE = @backupSetId,  NOUNLOAD,  NOREWIND
GO
