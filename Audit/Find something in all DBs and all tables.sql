DECLARE @value VARCHAR(64)
DECLARE @sql VARCHAR(1024)
DECLARE @table VARCHAR(64)
DECLARE @column VARCHAR(64)
DECLARE @Oldtable VARCHAR(64)
DECLARE @Count int
DECLARE @Count1 int

SET NOCOUNT ON

set @Count  = 0
set @Count1 = 0
set @Oldtable = ''
SET @value = '<something>' -- ������� ��������

CREATE TABLE #t (
    tablename VARCHAR(64),
    columnname VARCHAR(64)
)

DECLARE TABLES CURSOR
FOR
    SELECT
		o.name,
		c.name
    FROM
		syscolumns c
			INNER JOIN sysobjects o
				ON c.id = o.id
    WHERE
		1=1
		AND o.type = 'U'
		AND c.xtype IN (167, 175, 231, 239)
    ORDER BY
		o.name,
		c.name  

OPEN TABLES  

FETCH NEXT FROM TABLES
INTO @table, @column  

WHILE @@FETCH_STATUS = 0
BEGIN
    SET @sql = 'IF EXISTS(SELECT NULL FROM [' + @table + '] '
    SET @sql = @sql + 'WHERE RTRIM(LTRIM([' + @column + '])) = ''' + @value + ''') '
    SET @sql = @sql + 'INSERT INTO #t VALUES (''' + @table + ''', '''
    SET @sql = @sql + @column + ''')'
    EXEC(@sql)   

    IF (@Oldtable <> @table)
		BEGIN
			PRINT '����� � ������� ' +@table
			SET @Oldtable = @table
		END

	SELECT @Count1=COUNT(*)  from #t
	IF (@Count <> @Count1)
		BEGIN
			PRINT '    ***�������*** � ������� ' +  @column
			SET @Count = @Count1
		END

    FETCH NEXT FROM TABLES
    INTO @table, @column
END  

CLOSE TABLES
DEALLOCATE TABLES   

SELECT * FROM #t  

DROP TABLE #t
