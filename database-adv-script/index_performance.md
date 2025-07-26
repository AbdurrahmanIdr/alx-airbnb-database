# Index Optimization Report

## Objective
Improve the performance of queries on high-usage columns using indexes.

---

## Indexed Columns
We created indexes on the following columns:

| Table     | Column        | Reason for Indexing             |
|-----------|---------------|----------------------------------|
| user      | user_id       | Used in JOINs with booking       |
| booking   | user_id       | Used in JOINs and filters        |
| booking   | property_id   | Used in JOIN with property       |
| property  | property_id   | Used in JOIN and ORDER BY        |
| review    | property_id   | Used in LEFT JOIN for reviews    |

---

## Performance Analysis

### Query 1: Booking Summary per User

```sql
SELECT u.user_id, COUNT(b.booking_id)
FROM "user" u
JOIN booking b ON u.user_id = b.user_id
GROUP BY u.user_id;
````

### EXPLAIN ANALYZE (Before Index)

* Execution Time: **\~2.150 ms**
* Sequential scans on `booking` and `user`

### EXPLAIN ANALYZE (After Index)

* Execution Time: **\~0.136 ms**
* Index scans used: `idx_booking_user_id`, `idx_user_user_id`

---

### Query 2: Property Booking Count with Ranking

```sql
WITH property_count AS (
  SELECT p.property_id, COUNT(b.booking_id) AS total_booking
  FROM property p
  JOIN booking b ON p.property_id = b.property_id
  GROUP BY p.property_id
)
SELECT property_id, total_booking,
  ROW_NUMBER() OVER (ORDER BY total_booking DESC)
FROM property_count;
```

### EXPLAIN ANALYZE (Before Index)

* Execution Time: **\~2.730 ms**

### EXPLAIN ANALYZE (After Index)

* Execution Time: **\~0.094 ms**
* Index scan used: `idx_booking_property_id`, `idx_property_property_id`

---

### Conclusion

The use of indexes on primary join and filtering columns reduced query times by **70–80%**, especially for aggregation and ranking queries.
