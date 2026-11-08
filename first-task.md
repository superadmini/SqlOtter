# Complete one useful database task in SqlOtter

A useful first session ends with a result you can inspect. This example keeps the task small: run a read-only query over synthetic order data, find the records that need attention, and export the result if you need to share it.

## Choose a test connection

Public installation instructions are being prepared. If you already have an evaluation build, use a local or test database you are allowed to access. Review the connection, database, and schema before running SQL. The synthetic query can also be read independently of the application.

The query below is written for a modern SQLite engine. It defines its input inside the statement, so it does not create a table or modify existing records. Other SQL dialects and older engines may need different syntax.

```sql
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
```

This synthetic example is designed to return orders `102` and `104`. That is the expected result from the SQL definition, not a recorded run in your application or engine.

## Inspect a result with a purpose

Before running, confirm the SQL editor's execution target and intended scope. Run just this statement, then inspect the result rows and any execution messages.

You now have a focused question: which orders are paid but awaiting fulfillment? A small result lets you check the answer without scanning unrelated records.

If you use the table content view on a real test table, its loaded-page highlights can help locate visible values. A loaded-page search only examines loaded content. Keep the SQL `WHERE` clause when the question needs filtering at the database.

## Export only what the next person needs

For a handoff, use the query-result export path available in your build. Review the selected format, columns, and destination. Open the exported file and compare it with the result you intended to share.

Do not treat a selected format or a completion message as proof that a downstream tool parsed the file correctly. Column labels, nulls, binary values, and numeric representation matter in real workflows.

## Measure the improvement for your work

Repeat one familiar task in your current workflow and in SqlOtter using the same synthetic data. Record elapsed time, the number of tool switches, whether you lost the target context, and any errors. These observations are more useful than a promised speed multiplier.

[Read the loaded-value guide](find-loaded-values.md) or [share a workflow or blocker](https://github.com/superadmini/SqlOtter/issues). Product download and trial links will be added after the public services are available.

*AI-assisted draft based on product guides. The sample query and export workflow were not executed as part of preparing this article.*
