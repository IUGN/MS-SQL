EXEC sp_MSForEachTable 'ALTER TABLE ? NOCHECK CONSTRAINT ALL'
GO

EXEC sp_MSForEachTable 'TRUNCATE TABLE ?'
GO 

EXEC sp_MSForEachTable 'GRANT ALTER ON ?  TO [Rights_For_Alter_SP]'
GO