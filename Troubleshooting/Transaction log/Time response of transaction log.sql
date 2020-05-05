    SELECT      (wait_time_ms - signal_wait_time_ms) / waiting_tasks_count AS [����� ������� ��������������� �������� ������� (ms)]
                  ,    max_wait_time_ms AS [������������ ����� �������� (ms)]
    FROM        sys.dm_os_wait_stats
    WHERE       wait_type = 'WRITELOG' AND waiting_tasks_count > 0;
--DBCC SQLPERF ('sys.dm_os_wait_stats', CLEAR);
--GO

