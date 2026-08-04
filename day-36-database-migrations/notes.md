# Day 36 - Database Migrations

## What I learned

A migration is a saved database change file.

It is used to track database changes clearly.

## Simple meaning

Migration = database change saved in a file

## Examples of migrations

- Create table
- Add column
- Add constraint
- Add index
- Change column type
- Drop column
- Drop table

## Why migrations are useful

Migrations help teams apply the same database changes.

They make database changes trackable in GitHub.

They help update development, testing, and production databases safely.

## Up and Down migration

Up migration applies a change.

Down migration undoes a change.

## Real job rule

Do not change production database randomly.

Write migration files and apply them carefully.

## Interview answer

A database migration is a controlled way to change the database schema. It can create tables, add columns, add indexes, or change constraints. Migrations are usually stored in version control so all team members and environments can apply the same database changes.