SELECT session_id,database_id,percent_complete, start_time, status, command,  cpu_time, total_elapsed_time

FROM sys.dm_exec_requests WHERE status != 'background' and status != 'sleeping'


order by cpu_time desc

kill 335


exec sp_who2

