/*
===========================================================
Create Database and Schemas
===========================================================

Script Purpose:
    This script creates a new database named 'data_warehouse' after checking if it already exists.
    If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas
    within the database: 'bronze', 'silver', and 'gold'.

WARNING:
    Running this script will DROP the entire 'data_warehouse' database if it exists.
    All data in the database will be permanently deleted. 
    Proceed with caution and ensure you have proper backups before running this script.
*/

-- Switch to master context
USE master;
GO

-- Drop the database if it exists
IF DB_ID('data_warehouse') IS NOT NULL
BEGIN
    DROP DATABASE data_warehouse;
END
GO

-- Create the database
CREATE DATABASE data_warehouse;
GO

-- Switch to the newly created database
USE data_warehouse;
GO

-- Create the schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO

