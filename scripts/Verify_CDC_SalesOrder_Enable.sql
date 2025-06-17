select name,type,type_desc,is_tracked_by_cdc
from sys.tables
where name = 'SalesOrder'
GO