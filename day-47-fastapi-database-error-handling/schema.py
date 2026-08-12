from pydantic import BaseModel, EmailStr


class UserCreate(BaseModel):
    full_name: str
    email: EmailStr


class UserResponse(BaseModel):
    id: int
    full_name: str
    email: str

    class Config:
        from_attributes = True


class PropertyCreate(BaseModel):
    title: str
    city: str
    price: float
    status: str = "AVAILABLE"


class PropertyResponse(BaseModel):
    id: int
    title: str
    city: str
    price: float
    status: str

    class Config:
        from_attributes = True