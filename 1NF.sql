WITH RECURSIVE ProductSplit AS (
    SELECT
        OrderID,
        CustomerName,
        SUBSTRING_INDEX(Products, ',', 1) AS Product,
        SUBSTRING(Products, LENGTH(SUBSTRING_INDEX(Products, ',', 1)) + 2) AS RemainingProducts
    FROM
        ProductDetail
    UNION ALL
    SELECT
        ps.OrderID,
        ps.CustomerName,
        SUBSTRING_INDEX(ps.RemainingProducts, ',', 1) AS Product,
        SUBSTRING(ps.RemainingProducts, LENGTH(SUBSTRING_INDEX(ps.RemainingProducts, ',', 1)) + 2) AS RemainingProducts
    FROM
        ProductSplit ps
    WHERE
        LENGTH(ps.RemainingProducts) > 0
)
SELECT
    OrderID,
    CustomerName,
    TRIM(Product) AS Product
FROM
    ProductSplit;