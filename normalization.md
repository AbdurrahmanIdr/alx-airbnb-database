# Task 1: Normalize Your Database Design

## Objective

To verify that the Airbnb database schema adheres to the principles of Third Normal Form (3NF) by identifying and eliminating redundancy, enforcing data integrity, and ensuring a scalable structure.

## Normalization Process

### First Normal Form (1NF)

- All tables have a primary key that uniquely identifies each record.
- All attributes contain atomic (indivisible) values.
- No repeating groups or arrays exist within a column.

**Status:** The current design satisfies 1NF.

### Second Normal Form (2NF)

- The design is already in 1NF.
- There are no composite primary keys in the schema.
- All non-key attributes are fully functionally dependent on the primary key.

**Status:** The current design satisfies 2NF.

### Third Normal Form (3NF)

- The design is already in 2NF.
- All non-key attributes are only dependent on the primary key and not on other non-key attributes.
- No transitive dependencies are present.
  - For example, user email depends only on `user_id`, not through other fields.

**Status:** The current design satisfies 3NF.

## Review and Justification

The initial schema design for the Airbnb-like application was created with normalization principles in mind. After a detailed review, the following observations were made:

- Each table is structured around a single primary key.
- All attributes represent a single fact about the entity.
- There are no derived or redundant fields.
- The use of ENUMs and foreign keys provides clear domain constraints and enforces relationships without violating 3NF.

As a result, no structural modifications were required to reach 3NF.

## Conclusion

The schema as defined meets the requirements for 3NF. No violations of normalization principles were identified, and the database structure supports efficient, reliable operations without redundancy.
