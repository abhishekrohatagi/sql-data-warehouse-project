/*
This commit creates all the necessary silver layer tables for the CRM and ERP systems.
For each table, it first checks if the table already exists and drops it if present.
It then recreates the table using a standardized and cleaned schema structure.

The following tables have been created under the 'silver' schema:

- crm_cust_info: Stores cleaned customer master data
- crm_prd_info: Contains product information including cost and active date range
- crm_sales_details: Holds sales transactions with quantity, sales amount, and pricing
- erp_loc_a101: Maps customer IDs to countries
- erp_cust_az12: Captures customer demographics like birthdate and gender
- erp_px_cat_g1v2: Contains product categories, subcategories, and maintenance info

Each table includes a `dwh_create_date` column with a default value of `GETDATE()` for audit and tracking purposes.

This setup establishes the silver layer as a reliable, structured foundation for downstream transformations, analytics, and business logic.
*/
-- Drop and create silver.crm_cust_info
IF OBJECT_ID('silver.crm_cust_info', 'U') IS NOT NULL
BEGIN
    DROP TABLE silver.crm_cust_info;
END
GO

CREATE TABLE silver.crm_cust_info (
    cst_id INT,
    cst_key NVARCHAR(50),
    cst_firstname NVARCHAR(50),
    cst_lastname NVARCHAR(50),
    cst_marital_status NVARCHAR(50),
    cst_gndr NVARCHAR(50),
    cst_create_date DATE,
    dwh_create_date DATETIME2 DEFAULT GETDATE()
);
GO

-- Drop and create silver.crm_prd_info
IF OBJECT_ID('silver.crm_prd_info', 'U') IS NOT NULL
BEGIN
    DROP TABLE silver.crm_prd_info;
END
GO

CREATE TABLE silver.crm_prd_info (
    prd_id INT,
    cat_id NVARCHAR(50),
    prd_key NVARCHAR(50),
    prd_nm NVARCHAR(50),
    prd_cost INT,
    prd_line NVARCHAR(50),
    prd_start_dt DATE,
    prd_end_dt DATE,
    dwh_create_date DATETIME2 DEFAULT GETDATE()
);
GO

-- Drop and create silver.crm_sales_details
IF OBJECT_ID('silver.crm_sales_details', 'U') IS NOT NULL
BEGIN
    DROP TABLE silver.crm_sales_details;
END
GO

CREATE TABLE silver.crm_sales_details (
    sls_ord_num NVARCHAR(50),
    sls_prd_key NVARCHAR(50),
    sls_cust_id INT,
    sls_order_dt DATE,
    sls_ship_dt DATE,
    sls_due_dt DATE,
    sls_sales INT,
    sls_quantity INT,
    sls_price INT,
    dwh_create_date DATETIME2 DEFAULT GETDATE()
);
GO

-- Drop and create silver.erp_loc_a101
IF OBJECT_ID('silver.erp_loc_a101', 'U') IS NOT NULL
BEGIN
    DROP TABLE silver.erp_loc_a101;
END
GO

CREATE TABLE silver.erp_loc_a101 (
    cid NVARCHAR(50),
    cntry NVARCHAR(50),
    dwh_create_date DATETIME2 DEFAULT GETDATE()
);
GO

-- Drop and create silver.erp_cust_az12
IF OBJECT_ID('silver.erp_cust_az12', 'U') IS NOT NULL
BEGIN
    DROP TABLE silver.erp_cust_az12;
END
GO

CREATE TABLE silver.erp_cust_az12 (
    cid NVARCHAR(50),
    bdate DATE,
    gen NVARCHAR(50),
    dwh_create_date DATETIME2 DEFAULT GETDATE()
);
GO

-- Drop and create silver.erp_px_cat_g1v2
IF OBJECT_ID('silver.erp_px_cat_g1v2', 'U') IS NOT NULL
BEGIN
    DROP TABLE silver.erp_px_cat_g1v2;
END
GO

CREATE TABLE silver.erp_px_cat_g1v2 (
    id NVARCHAR(50),
    cat NVARCHAR(50),
    subcat NVARCHAR(50),
    maintenance NVARCHAR(50),
    dwh_create_date DATETIME2 DEFAULT GETDATE()
);
GO
