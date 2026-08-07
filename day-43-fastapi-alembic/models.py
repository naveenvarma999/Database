from sqlalchemy import String, BigInteger, Column, Numeric
from database import Base

class Property(Base):
    __tablename__ = "alembic_properties"
    id = Column (BigInteger, primary_key=True, index=True)
    name = Column(String(255), nullable=False)
    City = Column(String(255), nullable=False)
    price = Column(Numeric(10, 2), nullable=False)
    status = Column(String(50), default = "Available")
