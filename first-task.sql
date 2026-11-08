-- Synthetic read-only example for a modern SQLite engine.
-- No persistent tables or customer records are created or modified.
-- Expected rows by definition: order_id 102 and 104.
-- This file has not been executed as part of content preparation.
WITH demo_orders AS (
    SELECT 101 AS order_id, 'demo-101@example.test' AS customer_email,
           'paid' AS payment_status, 'shipped' AS fulfillment_status
    UNION ALL SELECT 102, 'demo-102@example.test', 'paid', 'pending'
    UNION ALL SELECT 103, 'demo-103@example.test', 'unpaid', 'pending'
    UNION ALL SELECT 104, 'demo-104@example.test', 'paid', 'pending'
    UNION ALL SELECT 105, 'demo-105@example.test', 'paid', 'shipped'
)
SELECT order_id, customer_email, payment_status, fulfillment_status
FROM demo_orders
WHERE payment_status = 'paid' AND fulfillment_status = 'pending'
ORDER BY order_id;
