-- Description: This script enables Change Data Capture (CDC) for the specified database.
-- Database: global-azure-2025
USE [global-azure-2025]
GO

-- Enable Change Data Capture (CDC) for the database
EXEC sys.sp_cdc_enable_db
GO

-- Disable CDC for the database if it was already enabled
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'global-azure-2025' AND is_cdc_enabled = 1)
EXEC sys.sp_cdc_disable_db
GO