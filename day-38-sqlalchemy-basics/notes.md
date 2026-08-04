# Day 38 - SQLAlchemy Basics

## What I learned

SQLAlchemy is a Python library used to work with databases.

It lets us represent database tables as Python classes.

## Simple meaning

SQLAlchemy = Python way to work with SQL databases.

## Important terms

engine = database connection

SessionLocal = creates a database session

Base = parent class for database models

Model = Python class that represents a table

Column = database column

## Example

class User(Base):

This means User is a table model.

__tablename__ = "sqlalchemy_users"

This means the table name in PostgreSQL is sqlalchemy_users.

## Main memory

SQLAlchemy converts Python code into SQL queries.





SQLAlchemy helps Python connect and work with PostgreSQL.

Model = Python class for database table.

Session = used to insert, update, delete, and read data.

Base.metadata.create_all() creates tables from models.