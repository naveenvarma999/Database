# Day 48 - FastAPI Project Structure

## What I learned

FastAPI projects should be split into proper files.

## Important files

database.py contains database connection.

models.py contains SQLAlchemy table models.

schemas.py contains Pydantic request and response models.

crud.py contains database operations.

routers/properties.py contains API routes.

main.py starts the FastAPI app.

## Why this is useful

It keeps the code clean.

It avoids making main.py too big.

It makes the project easier to maintain.

It is closer to real backend project structure.

## Main memory

Router handles API routes.

CRUD handles database logic.

Model defines table structure.

Schema defines request and response data.