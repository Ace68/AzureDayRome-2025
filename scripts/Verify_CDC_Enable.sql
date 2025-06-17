SELECT name, is_cdc_enabled
FROM sys.databases WHERE database_id = DB_ID();

SELECT name, is_cdc_enabled 
FROM sys.databases
WHERE name = 'AzureDayRome';