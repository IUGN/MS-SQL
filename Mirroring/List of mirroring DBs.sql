SELECT [name] FROM sys.database_mirroring M
            INNER JOIN sys.databases DB
            ON M.database_id=DB.database_id
          WHERE mirroring_state IS NOT NULL