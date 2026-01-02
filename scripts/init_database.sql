/*
Create Database and Schemas
Script Purpose:
    Initializes the DataWarehouse database with a medallion architecture (bronze/silver/gold schemas).
    - Drops existing DataWarehouse database if present (DESTRUCTIVE)
    - Creates fresh DataWarehouse database
    - Establishes three-tier data lakehouse schema structure:
        * bronze: Raw/landing zone for source data
        * silver: Cleansed and conformed data
        * gold: Business-level aggregated/modeled data
    
Warning:
    ⚠️ DESTRUCTIVE OPERATION - ALL DATA WILL BE LOST ⚠️
    - This script will DROP the entire DataWarehouse database
    - All tables, data, stored procedures, and objects will be permanently deleted
    - Active connections will be forcefully terminated (ROLLBACK IMMEDIATE)
    - DO NOT run in production without explicit approval and verified backups
    - Intended for development/testing environments or initial setup only
*/

USE master;
GO

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS(SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')  -- Fixed: sys.database → sys.databases
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO
  
CREATE SCHEMA silver;
GO
  
CREATE SCHEMA gold;
GO
