SELECT OBJECT_NAME(OBJECT_ID) as TableName , Name as IndexName, type_desc as IndexType, is_disabled as Status
FROM sys.indexes where is_disabled=1
