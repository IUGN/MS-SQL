DECLARE @DATE DATETIME
SET @DATE='2017-10-28'
SELECT @DATE AS GIVEN_DATE, @DATE-DAY(@DATE)+1 AS FIRST_DAY_OF_DATE, 
EOMONTH(@DATE) AS LAST_DAY_OF_MONTH