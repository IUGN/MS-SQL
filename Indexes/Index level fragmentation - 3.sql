
/*
Script  : Index Fragmentation Status (includes Partitioned Tables/Indexes)
Version : 1.0 (April 2010)
Author  : Richard Doering
Email   : r3m1xn9@gmail.com
Web     : http://sqlsolace.blogspot.com
*/
-- Hide quoted text -
SELECT
             SCHEMA_NAME(o.schema_id) AS SchemaName               
            ,OBJECT_NAME(o.object_id) AS TableName
            ,i.name  AS IndexName
            ,i.type_desc AS IndexType
            ,CASE WHEN ISNULL(ps.function_id,1) = 1 THEN 'NO' ELSE 'YES' END AS Partitioned
            ,COALESCE(fg.name ,fgp.name) AS FileGroupName
            ,p.partition_number AS PartitionNumber
            ,p.rows AS PartitionRows
            ,dmv.Avg_Fragmentation_In_Percent
            ,dmv.Fragment_Count
            ,dmv.Avg_Fragment_Size_In_Pages
            ,dmv.Page_Count 
            ,prv_left.value  AS PartitionLowerBoundaryValue
            ,prv_right.value AS PartitionUpperBoundaryValue
            ,CASE WHEN pf.boundary_value_on_right = 1 THEN 'RIGHT' WHEN pf.boundary_value_on_right = 0 THEN 'LEFT' ELSE 'NONE' END AS PartitionRange
            ,pf.name        AS PartitionFunction
            ,ds.name AS PartitionScheme
FROM sys.partitions AS p WITH (NOLOCK)
INNER JOIN sys.indexes AS i WITH (NOLOCK)
            ON i.object_id = p.object_id
            AND i.index_id = p.index_id
INNER JOIN sys.objects AS o WITH (NOLOCK)
            ON o.object_id = i.object_id
INNER JOIN sys.dm_db_index_physical_stats (DB_ID(), NULL, NULL , NULL, N'LIMITED') dmv
            ON dmv.OBJECT_ID = i.object_id
            AND dmv.index_id = i.index_id
            AND dmv.partition_number  = p.partition_number
LEFT JOIN sys.data_spaces AS ds WITH (NOLOCK)
      ON ds.data_space_id = i.data_space_id
LEFT JOIN sys.partition_schemes AS ps WITH (NOLOCK)
      ON ps.data_space_id = ds.data_space_id
LEFT JOIN sys.partition_functions AS pf WITH (NOLOCK)
      ON pf.function_id = ps.function_id
LEFT JOIN sys.destination_data_spaces AS dds WITH (NOLOCK)
      ON dds.partition_scheme_id = ps.data_space_id
      AND dds.destination_id = p.partition_number
LEFT JOIN sys.filegroups AS fg WITH (NOLOCK)
      ON fg.data_space_id = i.data_space_id
LEFT JOIN sys.filegroups AS fgp WITH (NOLOCK)
      ON fgp.data_space_id = dds.data_space_id
LEFT JOIN sys.partition_range_values AS prv_left WITH (NOLOCK)
      ON ps.function_id = prv_left.function_id
      AND prv_left.boundary_id = p.partition_number - 1
LEFT JOIN sys.partition_range_values AS prv_right WITH (NOLOCK)
      ON ps.function_id = prv_right.function_id
      AND prv_right.boundary_id = p.partition_number
WHERE
      OBJECTPROPERTY(p.object_id, 'ISMSShipped') = 0  
ORDER BY
	 Avg_Fragmentation_In_Percent DESC
    ,SchemaName
    ,TableName
    ,IndexName
    ,PartitionNumber