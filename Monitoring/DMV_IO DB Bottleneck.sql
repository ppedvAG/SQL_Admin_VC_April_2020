
SELECT TOP 5
qs.*
FROM sys.dm_exec_query_stats qs
ORDER BY total_logical_reads DESC
GO


SELECT TOP 5
st.text,
qp.query_plan,
qs.*
FROM sys.dm_exec_query_stats qs
CROSS APPLY sys.dm_exec_sql_text(qs.plan_handle) st
CROSS APPLY sys.dm_exec_query_plan(qs.plan_handle) qp
ORDER BY total_logical_reads DESC
GO


--— — — — — — — — — — — — — — — — — — — — — — — — — — -
--— Get I/O utilization by database.
--— — — — — — — — — — — — — — — — — — — — — — — — — — -
--— Helps determine which database is using the most I/O resources on the instance.
;
with
Aggregate_IO_Statistics
as
(
select
db_name(database_id) as [Database Name]
,cast(sum(num_of_bytes_read + num_of_bytes_written) / 1048576 as decimal(12,2)) as io_in_mb
from sys.dm_io_virtual_file_stats(null,null) as [DM_IO_STATS]
group by database_id
)
select
row_number() over (order by io_in_mb desc) as [I/O Rank]
,cast(io_in_mb / sum(io_in_mb) over () * 100.0 as decimal(5,2)) as [I/O Percent]
,[Database Name]
from
Aggregate_IO_Statistics
order by
[I/O Rank]
option (recompile);