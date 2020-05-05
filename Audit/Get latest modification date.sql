SELECT name, schema_id,type,create_date,modify_date
FROM sys.objects
WHERE type = 'P'
AND DATEDIFF(D,modify_date, GETDATE()) < 30

SELECT * FROM sys.procedures 
--where name = 'MessageGateOperatorRelationsImport'
order by name