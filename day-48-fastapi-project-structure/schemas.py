from pydantic import BaseModel
from decimal import Decimal


class PropertyCreate(BaseModel):
    title: str
    city: str
    price: Decimal
    status: str = "AVAILABLE"


class PropertyUpdate(BaseModel):
    title: str
    city: str
    price: Decimal
    status: str


class PropertyResponse(BaseModel):
    id: int
    title: str
    city: str
    price: Decimal
    status: str

    class Config:
        from_attributes = True