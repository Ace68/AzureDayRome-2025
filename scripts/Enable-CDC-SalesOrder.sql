EXEC sys.sp_cdc_enable_db;

EXEC sys.sp_cdc_enable_table
    @source_schema = N'dbo',
    @source_name   = N'SalesOrder',
    @role_name     = N'admin',
    @filegroup_name = N'PRIMARY',
    @supports_net_changes = 1
GO