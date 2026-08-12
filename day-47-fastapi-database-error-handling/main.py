from fastapi import FastAPI, Depends, HTTPException
from sqlalchemy.exc import IntegrityError
from sqlalchemy.orm import Session

from database import Base, engine, SessionLocal
from models import ApiUser, ApiProperty
from schema import UserCreate, UserResponse, PropertyCreate, PropertyResponse


Base.metadata.create_all(bind=engine)

app = FastAPI(title="Day 47 FastAPI Database Error Handling")


def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()


@app.get("/")
def home():
    return {"message": "Day 47 API is running"}


@app.post("/users", response_model=UserResponse)
def create_user(user_data: UserCreate, db: Session = Depends(get_db)):
    new_user = ApiUser(
        full_name=user_data.full_name,
        email=user_data.email
    )

    try:
        db.add(new_user)
        db.commit()
        db.refresh(new_user)
        return new_user

    except IntegrityError:
        db.rollback()
        raise HTTPException(
            status_code=400,
            detail="Email already registered"
        )


@app.get("/users", response_model=list[UserResponse])
def get_users(db: Session = Depends(get_db)):
    return db.query(ApiUser).all()


@app.post("/properties", response_model=PropertyResponse)
def create_property(property_data: PropertyCreate, db: Session = Depends(get_db)):
    new_property = ApiProperty(
        title=property_data.title,
        city=property_data.city,
        price=property_data.price,
        status=property_data.status
    )

    try:
        db.add(new_property)
        db.commit()
        db.refresh(new_property)
        return new_property

    except IntegrityError:
        db.rollback()
        raise HTTPException(
            status_code=400,
            detail="Invalid property data. Price must be greater than 0."
        )


@app.get("/properties", response_model=list[PropertyResponse])
def get_properties(db: Session = Depends(get_db)):
    return db.query(ApiProperty).all()
