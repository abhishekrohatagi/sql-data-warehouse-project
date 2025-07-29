/*
Purpose:
This script drops and recreates staging (bronze layer) tables used for loading CRM and ERP data.
The tables include customer info, product details, sales transactions, location data, and pricing categories.
This setup supports the initial raw data ingestion layer in the data pipeline.
*/

if object_id('bronze.crm_cust_info', 'u') is not null
begin
    drop table bronze.crm_cust_info;
end
go

create table bronze.crm_cust_info (
    cst_id int,
    cst_key nvarchar(50),
    cst_firstname nvarchar(50),
    cst_lastname nvarchar(50),
    cst_material_status nvarchar(50),
    cst_gndr nvarchar(50),
    cst_create_date date
);
go

if object_id('bronze.crm_prd_info', 'u') is not null
begin
    drop table bronze.crm_prd_info;
end
go

create table bronze.crm_prd_info (
    prd_id int,
    prd_key nvarchar(50),
    prd_nm nvarchar(50),
    prd_cost int,
    prd_line nvarchar(50),
    prd_start_dt datetime,
    prd_end_dt datetime
);
go

if object_id('bronze.crm_sales_details', 'u') is not null
begin
    drop table bronze.crm_sales_details;
end
go

create table bronze.crm_sales_details (
    sls_ord_num nvarchar(50),
    sls_prd_key nvarchar(50),
    sls_cust_id int,
    sls_order_dt int,      -- stored as yyyymmdd (int)
    sls_ship_dt int,
    sls_due_dt int,
    sls_sales int,
    sls_quantity int,
    sls_price int
);
go

if object_id('bronze.erp_loc_a101', 'u') is not null
begin
    drop table bronze.erp_loc_a101;
end
go

create table bronze.erp_loc_a101 (
    cid nvarchar(50),
    cntry nvarchar(50)
);
go

if object_id('bronze.erp_cust_az12', 'u') is not null
begin
    drop table bronze.erp_cust_az12;
end
go

create table bronze.erp_cust_az12 (
    cid nvarchar(50),
    bdate date,
    gen nvarchar(50)
);
go

if object_id('bronze.erp_px_cat_g1v2', 'u') is not null
begin
    drop table bronze.erp_px_cat_g1v2;
end
go

create table bronze.erp_px_cat_g1v2 (
    id nvarchar(50),
    cat nvarchar(50),
    subcat nvarchar(50),
    maintenance nvarchar(50)
);
go
