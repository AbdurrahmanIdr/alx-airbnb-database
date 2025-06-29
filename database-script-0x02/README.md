# Database Seeding Script

## Overview

This script populates the Airbnb-like database with sample records for all entities including users, properties, bookings, payments, reviews, and messages. The data reflects realistic use cases such as bookings between guests and hosts, and completed payments and reviews.

## File

- `seed.sql`: SQL script containing INSERT statements for all entities.

## Data Coverage

- Multiple users with different roles (`guest`, `host`)
- Two properties listed by a host
- Two bookings created by different users
- One successful payment for a confirmed booking
- One review posted by a guest for a property
- Two messages exchanged between a guest and a host

## Usage

To seed the database:

```bash
mysql -u <username> -p <database_name> < seed.sql
