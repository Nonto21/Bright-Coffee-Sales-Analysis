SELECT * FROM `workspace`.`default`.`bright_coffee_shop_analysis_case_study_1` LIMIT 100;
CREATE OR REPLACE TABLE processed_bright_coffee_shop_analysis AS
SELECT
    product_type,
    DATE_TRUNC('hour', transaction_time) AS hour_bucket,
    SUM(transaction_qty) AS total_units,
    SUM(unit_price * transaction_qty) AS total_revenue
FROM `workspace`.`default`.`bright_coffee_shop_analysis_case_study_1`
GROUP BY product_type, hour_bucket
ORDER BY total_revenue DESC;
SELECT * FROM processed_bright_coffee_shop_analysis;