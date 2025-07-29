/*
Purpose:
This script creates a new 'data_warehouse' database and initializes three schemas: bronze, silver, and gold.
It drops any existing version of the database and schemas to ensure a clean setup for the data warehousing pipeline.
*/

use master;
go

if db_id('data_warehouse') is not null
begin
    drop database data_warehouse;
end
go

create database data_warehouse;
go


use data_warehouse;
go


if exists (select * from sys.schemas where name = 'bronze')
begin
    exec('drop schema bronze');
end
go

exec('create schema bronze');
go

if exists (select * from sys.schemas where name = 'silver')
begin
    exec('drop schema silver');
end
go

exec('create schema silver');
go

if exists (select * from sys.schemas where name = 'gold')
begin
    exec('drop schema gold');
end
go

exec('create schema gold');
go

