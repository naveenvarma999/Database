from fastapi import FastAPI

from database import Base, engine
from routers import properties


Base.metadata.create_all(bind=engine)

app = FastAPI(title="Day 48 FastAPI Structured Project")


app.include_router(properties.router)


@app.get("/")
def home():
    return {"message": "Day 48 structured FastAPI project is running"}