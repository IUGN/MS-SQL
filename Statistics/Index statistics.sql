USE Billing3;
GO
DECLARE @id int, @indid int
SET @id = OBJECT_ID('dbo.Operations')
SELECT @indid = index_id 
FROM sys.indexes
WHERE object_id = @id 
   AND name = 'IX_Operations_ID'
DBCC SHOWCONTIG (@id, @indid);
GO