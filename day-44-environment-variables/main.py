from database import engine


try:
    with engine.connect() as connection:
        print("Database connected successfully using .env file")

except Exception as error:
    print("Database connection failed")
    print(error)
