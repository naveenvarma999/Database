from sqlalchemy.orm import Session

from models import Property
from schemas import PropertyCreate, PropertyUpdate


def create_property(db: Session, property_data: PropertyCreate):
    new_property = Property(
        title=property_data.title,
        city=property_data.city,
        price=property_data.price,
        status=property_data.status
    )

    db.add(new_property)
    db.commit()
    db.refresh(new_property)

    return new_property


def get_all_properties(db: Session):
    return db.query(Property).all()


def get_property_by_id(db: Session, property_id: int):
    return db.query(Property).filter(Property.id == property_id).first()


def update_property(db: Session, property_id: int, property_data: PropertyUpdate):
    property_item = get_property_by_id(db, property_id)

    if property_item is None:
        return None

    property_item.title = property_data.title
    property_item.city = property_data.city
    property_item.price = property_data.price
    property_item.status = property_data.status

    db.commit()
    db.refresh(property_item)

    return property_item


def delete_property(db: Session, property_id: int):
    property_item = get_property_by_id(db, property_id)

    if property_item is None:
        return None

    db.delete(property_item)
    db.commit()

    return property_item