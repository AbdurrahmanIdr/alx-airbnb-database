# Database Performance Monitoring and Refinement

## Objective

This report details the process of monitoring and refining query performance in the Airbnb database using SQL tools like `EXPLAIN ANALYZE`. Bottlenecks were identified and resolved through indexing and schema improvements.

## Monitored Queries

We selected the following high-usage queries for performance analysis:

### Query 1: Fetching all bookings for a specific user

```sql
EXPLAIN ANALYZE
SELECT * FROM booking
WHERE user_id = 1023;
````

#### Before Optimization

* **Execution Time:** \~3.98 ms
* **Plan:** Sequential scan of the `booking` table
* **Observation:** No index on `user_id`

#### Optimization Applied

```sql
CREATE INDEX idx_booking_user_id ON booking(user_id);
```

#### After Optimization

* **Execution Time:** \~0.95 ms
* **Plan:** Index Scan using `idx_booking_user_id`

### Query 2: Retrieving properties by location and price range

```sql
EXPLAIN ANALYZE
SELECT * FROM property
WHERE location = 'Lagos' AND price_per_night < 100;
```

#### Before Optimization

* **Execution Time:** \~4.6 ms
* **Plan:** Sequential scan on `property` table

#### Optimization Applied

```sql
CREATE INDEX idx_property_location_price ON property(location, price_per_night);
```

#### After Optimization

* **Execution Time:** \~1.2 ms
* **Plan:** Index scan using `idx_property_location_price`

---

### Query 3: Join user and booking to count confirmed bookings

```sql
EXPLAIN ANALYZE
SELECT u.user_id, COUNT(*) AS total
FROM "user" u
JOIN booking b ON u.user_id = b.user_id
WHERE b.status = 'confirmed'
GROUP BY u.user_id;
```

#### Before Optimization

* **Execution Time:** \~6.3 ms
* **Plan:** Hash Join, Filter on `b.status`

#### Optimization Applied

```sql
CREATE INDEX idx_booking_status_user_id ON booking(status, user_id);
```

#### After Optimization

* **Execution Time:** \~2.1 ms
* **Plan:** Index scan with filter on `status`, optimized join

## Summary of Improvements

| Query Description              | Time Before | Time After | Improvement (%) |
| ------------------------------ | ----------- | ---------- | --------------- |
| Bookings by `user_id`          | \~3.98 ms   | \~0.95 ms  | 76%             |
| Properties by location & price | \~4.6 ms    | \~1.2 ms   | 74%             |
| Confirmed bookings join query  | \~6.3 ms    | \~2.1 ms   | 66%             |
