# Find the right PostgreSQL table when names collide

An `orders` table in `sales` and an `orders` table in `reporting` are different objects. An unqualified name such as `orders` resolves to the first match on PostgreSQL's search path. Before you inspect a table or copy its name into a query, confirm the connection, database and schema.

## 1. Check the database and search path

Use a local or test database you can access. If you already have an evaluation build of SqlOtter, check the SQL editor's connection and database target before running this query. The same database name can exist on two different servers.

```sql
SELECT current_database() AS database_name,
       current_schema AS first_schema,
       current_schemas(true) AS effective_search_path;
```

`first_schema` is the session's first schema; it does not tell you which schema contains a particular table. The search path array includes implicit schemas such as `pg_catalog` when applicable.

## 2. See which schemas expose that name

Replace `orders` with a table name from your test database. This query reads metadata only; it does not read rows from `orders`.

```sql
SELECT table_schema, table_name, table_type
FROM information_schema.tables
WHERE table_name = 'orders'
ORDER BY table_schema, table_type;
```

If the result contains both `sales.orders` and `reporting.orders`, use `table_type` to distinguish a base table from a view and choose the schema that fits your task. A missing row means the session cannot see that object through this view. Check the database, exact name and permissions before concluding it does not exist.

## 3. Open the intended schema in SqlOtter

1. Select the intended connection and database, then choose its **Schema** and find the object in that schema's tree. For same-named tables, use the schema tree: **Go To Table** may display a schema in its result, but activation does not independently switch to that schema.
2. Check the opened tab against the selected connection, database, schema and object. If you continue in SQL, use an explicit reference such as `sales.orders` and check the editor target again.

You can use the two SQL queries in any PostgreSQL client while SqlOtter's public downloads are being prepared. The names above are illustrative; the queries and desktop workflow were reviewed against documentation, with no new product acceptance run.

PostgreSQL reference: [Schemas and the search path](https://www.postgresql.org/docs/current/ddl-schemas.html), [session information functions](https://www.postgresql.org/docs/current/functions-info.html), and [the `tables` view](https://www.postgresql.org/docs/current/infoschema-tables.html).

See also [a focused first database task](first-task.md), or [share an object navigation question](https://github.com/superadmini/SqlOtter/issues) using sample names.
