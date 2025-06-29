# Database Schema (DDL)

## Description

This directory contains the SQL script used to define the database schema for an Airbnb-like application. The schema includes tables, data types, constraints, foreign keys, and indexes necessary to support the core functionalities of the platform.

## Files

- `schema.sql`: Contains SQL `CREATE TABLE` statements for all entities.
- `README.md`: This documentation file.

## Schema Overview

### Tables Defined

- `users`
- `properties`
- `bookings`
- `payments`
- `reviews`
- `messages`

### Key Constraints and Features

- **Primary Keys**: UUIDs used in all tables for unique identification.
- **Foreign Keys**:
  - `host_id` in `properties` references `users`
  - `user_id` and `property_id` in `bookings` reference `users` and `properties`
  - `booking_id` in `payments` references `bookings`
  - `user_id` and `property_id` in `reviews` reference `users` and `properties`
  - `sender_id` and `recipient_id` in `messages` reference `users`
- **Unique Constraints**: `email` in the `users` table.
- **Check Constraints**: `rating` in `reviews` must be between 1 and 5.
- **Timestamps**: Used for creation and update tracking.
- **Indexes**: Applied on frequently queried fields for performance.

## Usage

To initialize the schema, run the following command:

```bash
mysql -u <username> -p <database_name> < schema.sql
