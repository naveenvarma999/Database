# Day 47 - FastAPI Database Error Handling

## What I learned

FastAPI should return clean error messages when database errors happen.

## Important concepts

IntegrityError happens when a database constraint is broken.

Examples:

- duplicate email
- negative price
- invalid foreign key
- missing required value

## Why rollback is needed

After IntegrityError, the database session becomes unsafe.

db.rollback() cancels the failed operation and makes the session usable again.

## HTTPException

HTTPException is used to return proper API errors.

Example:

raise HTTPException(status_code=400, detail="Email already registered")

## Main memory

Database constraint protects data.

IntegrityError means constraint broken.

rollback cancels failed operation.

HTTPException sends clean response to API user.