# Day 46 - SQLAlchemy Constraints and Error Handling

## What I learned

Constraints are database rules that protect data quality.

## Examples of constraints

unique means duplicate values are not allowed.

nullable=False means value is required.

CheckConstraint checks custom rules like price > 0.

ForeignKey means a row must connect to an existing row in another table.

## IntegrityError

IntegrityError happens when a database rule is broken.

Examples:

Duplicate email

Negative price

Invalid foreign key

Missing required value

## Rollback

After an IntegrityError, we must use db.rollback().

Rollback cancels the failed operation and makes the session usable again.

## Main memory

Constraint = database rule

IntegrityError = rule broken

rollback = cancel failed operation



Main difference
Topic	Meaning
Constraint	Database rule
IntegrityError	Error when database rule is broken
rollback	Cancels failed operation
commit	Saves successful operation