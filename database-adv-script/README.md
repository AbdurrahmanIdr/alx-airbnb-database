# Advanced SQL Scripts – ALX Airbnb Database Project

This directory contains advanced SQL queries and documentation designed to enhance the performance, scalability, and analytical capabilities of the Airbnb database system. It includes join operations, subqueries, window functions, indexing strategies, performance optimization, and table partitioning.

## Folder: `database-adv-script/`

### 1. `joins_queries.sql`

- Contains:
  - **INNER JOIN** to list bookings with user info.
  - **LEFT JOIN** to list properties with or without reviews.
  - **FULL OUTER JOIN** to combine all users and bookings regardless of linkage.

### 2. `subqueries.sql`

- Contains:
  - **Non-correlated subquery** to find properties with an average rating > 4.0.
  - **Correlated subquery** to find users who have made more than 3 confirmed bookings.

### 3. `aggregations_and_window_functions.sql`

- Contains:
  - **Aggregations** using `COUNT` and `GROUP BY` to count bookings per user.
  - **Window functions** (`ROW_NUMBER`, `RANK`) to rank properties by total bookings.

### 4. `database_index.sql`

- Contains:
  - `CREATE INDEX` commands for frequently used columns in the `user`, `booking`, and `property` tables.
  - Helps optimize query execution using indexes.

### 5. `index_performance.md`

- Reports execution time and index scan usage before and after adding indexes.
- Shows measurable performance improvements.

### 6. `perfomance.sql`

- Initial complex query joining `booking`, `user`, `property`, and `payment` tables.
- Refactored query to reduce overhead and improve execution time.

### 7. `optimization_report.md`

- Describes inefficiencies found via `EXPLAIN ANALYZE`.
- Details improvements made via query refactoring or index usage.

### 8. `partitioning.sql`

- Implements **table partitioning** on the `booking` table using the `start_date` column.
- Creates child tables (e.g., `booking_2023`, `booking_2024`) for better query performance on large datasets.

### 9. `partition_performance.md`

- Documents performance comparison between non-partitioned and partitioned `booking` tables.
- Reports observed gains in execution time and index usage for date-range queries.

### 10. `performance_monitoring.md`

- Analyzes common query patterns using `EXPLAIN ANALYZE`.
- Documents schema adjustments and additional indexes based on query analysis.

---

## How to Use

1. **Run SQL scripts** in your PostgreSQL or compatible SQL environment.
2. Use `EXPLAIN ANALYZE` to verify improvements in performance after applying indexes or refactoring queries.
3. Refer to each `.md` file for explanations, before/after comparisons, and performance justifications.

---

## Requirements

- PostgreSQL 12+
- Preloaded Airbnb-style schema with populated tables: `user`, `property`, `booking`, `review`, `payment`
-
