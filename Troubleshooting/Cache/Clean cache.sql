DBCC FREEPROCCACHE WITH NO_INFOMSGS;
GO
DBCC DROPCLEANBUFFERS WITH NO_INFOMSGS;
GO
--������� ���� ������ ��� ���������� ��

select name, database_id from sys.databases
DBCC FLUSHPROCINDB (<dbid>)