select spid, kpid, status, substring(program_name,1,50) as 'program_name', blocked, cpu, physical_io, hostname, cmd,waittime

from master.dbo.sysprocesses