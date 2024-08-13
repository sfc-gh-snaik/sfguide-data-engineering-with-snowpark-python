USE WAREHOUSE SNAIK;

--Simple Materialized View
CREATE OR REPLACE TABLE inventory (product_ID INTEGER, wholesale_price FLOAT,
  description VARCHAR);
    
CREATE OR REPLACE VIEW mv1 AS
  SELECT product_ID, SUM(wholesale_price)sum_wholesale_price FROM inventory group by 1;

INSERT INTO inventory
SELECT UNIFORM(10000,99999,ABS(RANDOM())) AS product_ID, UNIFORM(111111111,999999999,ABS(RANDOM())) AS wholesale_price, RANDSTR(4,RANDOM()) AS DEPT 
FROM TABLE(GENERATOR(ROWCOUNT => 20000000));

--Query from MV
select * from mv1;
