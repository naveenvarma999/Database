from sqlalchemy import Column, BigInteger, String, Numeric

from database import Base


class Property(Base):
    __tablename__ = "structured_properties"

    id = Column(BigInteger, primary_key=True, autoincrement=True)
    title = Column(String(150), nullable=False)
    city = Column(String(100), nullable=False)
    price = Column(Numeric(12, 2), nullable=False)
    status = Column(String(30), default="AVAILABLE")