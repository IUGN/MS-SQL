-- ���� �����������, ���� ������� �� ��� �����, � ��� �����. �� ������ ���
GO
DBCC SHRINKFILE (2,10000)


USE [db]
GO
DBCC SHRINKFILE (N'db_log' , 0)
GO


USE db;
GO
SELECT file_id, name, physical_name, size
FROM sys.database_files;
GO
DBCC SHRINKFILE (N'db_log', TRUNCATEONLY);
GO

/*����������� ������ - ����������� ������� ���� ����� ����� ����
�������� ��������� ��������� ��� � ��������� �������� �� ����� � ���������!!!
*/
USE �������
ALTER DATABASE ������� SET RECOVERY SIMPLE
DBCC SHRINKFILE (������������, ��������������);
ALTER DATABASE ������� SET RECOVERY FULL


sp_spaceused