# How to Inspect a Nested PostgreSQL JSONB Field in SqlOtter

Use PostgreSQL’s `#>>` operator to read a nested JSONB value as text. When you need to see that value in the context of the whole document, open the cell in SqlOtter’s field editor and switch to **JSON Mode** if your build and selected field offer it.

## Check the path with a read-only query

This example uses synthetic event data and writes nothing to the database.

```sql
WITH demo_events(id, payload) AS (
    VALUES (1, '{"request":{"region":"us-east","attempt":2}}'::jsonb)
)
SELECT id,
       payload #>> '{request,region}' AS region,
       payload #>> '{request,attempt}' AS attempt_text
FROM demo_events;
```

The example returns `us-east` and `2` as text. Use `#>` when you need the JSONB value. When the path is missing or does not match the document structure, these operators return SQL `NULL`.

## Inspect the whole document in the table grid

1. Connect to a test database and open a table with a JSONB column. Choose a sample row and check the database, schema and row identifier.
2. Open the field editor for the JSONB cell. Use **Edit Mode** → **JSON Mode** when the mode is available. Continue in the detected JSON view if the editor opens there already.
3. Expand the `request` object or use the field editor’s search to locate `region`. If the current mode offers **Format**, it can make the structure easier to read.
4. Close with **Cancel** to discard any local edits. Where the field opens read-only, the editor can still expose inspection controls and hides **OK**.

The SQL sample demonstrates path extraction. The grid workflow applies to a field opened from a table, and available controls depend on the build, field type, permissions and how you opened it. For JSON stored inside a binary BLOB, check the BLOB preview or text view, which uses a separate interface.

[PostgreSQL JSON operators](https://www.postgresql.org/docs/current/functions-json.html) · [PostgreSQL JSON types](https://www.postgresql.org/docs/current/datatype-json.html) · [SqlOtter product preview](README.md)
