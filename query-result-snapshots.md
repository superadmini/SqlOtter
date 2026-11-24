# Compare Query Result Snapshots Without Leaving the SQL Editor

When the installed desktop build includes this feature, SqlOtter can keep a compact query result in its SQL editor, run a second version, and summarize the captured rows that changed. This is useful for a quick check such as comparing grouped counts before and after changing a reporting period.

## A practical comparison workflow

1. Confirm the editor's connection and database target. Use a local or test database while learning the workflow.
2. Run the baseline query and wait until the rows you want to inspect are loaded.
3. In the result toolbar, choose **Pin current result snapshot**. The snapshot stays in this editor session with its source SQL and target.
4. Change one filter or reporting period, keep the output columns consistent, and run the query again.
5. Choose **Compare with latest pinned result**. Review whether the target, SQL, or column layout changed, then review the counts of captured rows added or removed.
6. Use **Go to SQL source** to return to the statement behind a result before changing or rerunning it.

For example, run a grouped count by status for one date range, pin the result, change only the date range, and run it again. Keeping the same selected columns makes the comparison easier to read; date and SQL syntax vary by database.

## Read the comparison carefully

SqlOtter compares captured row values. Duplicate rows count separately; the comparison does not reconcile entities by a primary key. Check the reported target, SQL, and column layout before interpreting a difference. If you need to verify individual records or every row in a large result, use a query with stable keys or another full-data comparison method.

Snapshots are temporary and remain only while the SQL editor instance is open. Each editor can hold up to 20 snapshots, with up to 5,000 loaded rows in each. If a result exceeds that limit, the comparison covers only the rows captured in each snapshot. Pinning a result does not rerun the query.

Feature availability depends on the installed desktop build and selected database. This repository is a product preview and does not include an installer. See [the first database task](first-task.md) for a small synthetic SQL example, or [the repository overview](README.md) for current product information.
