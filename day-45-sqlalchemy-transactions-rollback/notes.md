# Day 45 - SQLAlchemy Transactions and Rollback

## What I learned

A transaction is a group of database operations that should succeed together or fail together.

## Simple meaning

If all steps are successful, use commit.

If any step fails, use rollback.

## Why transactions are needed

Transactions protect database consistency.

Example:

When a property is booked:

1. Insert booking record
2. Change property status to BOOKED

Both should happen together.

## Important methods

db.commit() saves changes permanently.

db.rollback() cancels unsaved changes after an error.

## Real examples

Transactions are used in:

- booking systems
- payments
- orders
- ticket reservations
- inventory updates

## Main memory

Transaction = all or nothing.

Commit = save.

Rollback = cancel.