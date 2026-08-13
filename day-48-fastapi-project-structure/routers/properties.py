from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session

import crud
from database import SessionLocal
from schemas import PropertyCreate, PropertyUpdate, PropertyResponse


router = APIRouter(
    prefix="/properties",
    tags=["Properties"]
)


def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()


@router.post("/", response_model=PropertyResponse)
def create_property(property_data: PropertyCreate, db: Session = Depends(get_db)):
    return crud.create_property(db, property_data)


@router.get("/", response_model=list[PropertyResponse])
def get_properties(db: Session = Depends(get_db)):
    return crud.get_all_properties(db)


@router.get("/{property_id}", response_model=PropertyResponse)
def get_property(property_id: int, db: Session = Depends(get_db)):
    property_item = crud.get_property_by_id(db, property_id)

    if property_item is None:
        raise HTTPException(status_code=404, detail="Property not found")

    return property_item


@router.put("/{property_id}", response_model=PropertyResponse)
def update_property(
    property_id: int,
    property_data: PropertyUpdate,
    db: Session = Depends(get_db)
):
    property_item = crud.update_property(db, property_id, property_data)

    if property_item is None:
        raise HTTPException(status_code=404, detail="Property not found")

    return property_item


@router.delete("/{property_id}")
def delete_property(property_id: int, db: Session = Depends(get_db)):
    property_item = crud.delete_property(db, property_id)

    if property_item is None:
        raise HTTPException(status_code=404, detail="Property not found")

    return {"message": "Property deleted successfully"}