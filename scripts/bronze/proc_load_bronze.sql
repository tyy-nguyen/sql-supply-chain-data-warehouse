CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
    DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;

    BEGIN TRY
        SET @batch_start_time = GETDATE();
        PRINT '=================================================';
        PRINT 'Loading Bronze Layer';
        PRINT '=================================================';

        SET @start_time = GETDATE();
        PRINT '>> Truncating TABLE: bronze.customer_master';
        TRUNCATE TABLE bronze.customer_master;

        PRINT '>> Inserting Data Into: bronze.customer_master';
        BULK INSERT bronze.customer_master
        FROM 'C:\Users\tyler\OneDrive\Documents\projects\supply-chain-warehouse-project\raw_data\customer_master.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0A',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '>>----------------';

        SET @start_time = GETDATE();
        PRINT '>> Truncating TABLE: bronze.product_master';
        TRUNCATE TABLE bronze.product_master;

        PRINT '>> Inserting Data Into: bronze.product_master';
        BULK INSERT bronze.product_master
        FROM 'C:\Users\tyler\OneDrive\Documents\projects\supply-chain-warehouse-project\raw_data\product_master.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0A',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '>>----------------';

        SET @start_time = GETDATE();
        PRINT '>> Truncating TABLE: bronze.supplier_master';
        TRUNCATE TABLE bronze.supplier_master;

        PRINT '>> Inserting Data Into: bronze.supplier_master';
        BULK INSERT bronze.supplier_master
        FROM 'C:\Users\tyler\OneDrive\Documents\projects\supply-chain-warehouse-project\raw_data\supplier_master.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0A',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '>>----------------';

        SET @start_time = GETDATE();
        PRINT '>> Truncating TABLE: bronze.sales_orders';
        TRUNCATE TABLE bronze.sales_orders;

        PRINT '>> Inserting Data Into: bronze.sales_orders';
        BULK INSERT bronze.sales_orders
        FROM 'C:\Users\tyler\OneDrive\Documents\projects\supply-chain-warehouse-project\raw_data\sales_orders.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0A',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '>>----------------';

        SET @start_time = GETDATE();
        PRINT '>> Truncating TABLE: bronze.procurement_orders';
        TRUNCATE TABLE bronze.procurement_orders;

        PRINT '>> Inserting Data Into: bronze.procurement_orders';
        BULK INSERT bronze.procurement_orders
        FROM 'C:\Users\tyler\OneDrive\Documents\projects\supply-chain-warehouse-project\raw_data\procurement_orders.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0A',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '>>----------------';

        SET @batch_end_time = GETDATE();
        PRINT '========================================================';
        PRINT 'Loading Bronze Layer is Completed';
        PRINT '    - Total Load Duration: ' + CAST(DATEDIFF(SECOND, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' seconds';
        PRINT '========================================================';
    END TRY
    BEGIN CATCH
        PRINT '============================================================';
        PRINT 'ERROR OCCURRED DURING LOADING BRONZE LAYER';
        PRINT 'Error Message: ' + ERROR_MESSAGE();
        PRINT 'Error Number: ' + CAST(ERROR_NUMBER() AS NVARCHAR);
        PRINT 'Error State: ' + CAST(ERROR_STATE() AS NVARCHAR);
        PRINT '============================================================';
    END CATCH
END
