
���� ������� �������� � ������� �� ��������� ����� � ����������:
WITH EXECUTE AS SELF

��������:

CREATE PROCEDURE [dbo].[Count_Hydra] WITH EXECUTE AS SELF
AS
BEGIN
	SET NOCOUNT ON;
SELECT rows AS 'Rows' FROM [Hydra].sys.sysindexes WHERE name= 'PK_Messages'
END
GO
