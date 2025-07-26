--  Create the main partitioned table WITHOUT a primary key
CREATE TABLE booking_partitioned (
    booking_id INT,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(50),
    total_price DECIMAL(10, 2)
) PARTITION BY RANGE (start_date);

-- . Create partitions per year (do NOT define PK again)
CREATE TABLE booking_2023 PARTITION OF booking_partitioned
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE booking_2024 PARTITION OF booking_partitioned
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE booking_2025 PARTITION OF booking_partitioned
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

CREATE UNIQUE INDEX idx_booking_partitioned_id_start
    ON booking_partitioned (booking_id, start_date);

-- . Example query on the partitioned table
SELECT *
FROM booking_partitioned
WHERE start_date BETWEEN '2023-03-01' AND '2024-03-31';
