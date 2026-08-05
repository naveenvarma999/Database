# Day 39 - SQLAlchemy CRUD Operations

## What I learned

CRUD means Create, Read, Update, Delete.

In SQL:

Create = INSERT

Read = SELECT

Update = UPDATE

Delete = DELETE

## SQLAlchemy methods

db.add() is used to insert new data.

db.query().all() is used to read all rows.

db.query().filter().first() is used to read one matching row.

Changing object values and using db.commit() updates data.

db.delete() deletes data.

db.commit() saves changes permanently.

db.refresh() reloads database-generated values like id and created_at.

## Main memory

SQLAlchemy lets us do database operations using Python code.
