from sqlalchemy import Column, BigInteger, String, Numeric, DateTime, ForeignKey
from sqlalchemy.sql import func

from database import Base


class TransactionProperty(Base):
    __tablename__ = "transaction_properties"

    id = Column(BigInteger, primary_key=True, autoincrement=True)
    title = Column(String(150), nullable=False)
    city = Column(String(100), nullable=False)
    price = Column(Numeric(12, 2), nullable=False)
    status = Column(String(30), default="AVAILABLE")


class PropertyBooking(Base):
    __tablename__ = "property_bookings"

    id = Column(BigInteger, primary_key=True, autoincrement=True)
    property_id = Column(
        BigInteger,
        ForeignKey("transaction_properties.id"),
        nullable=False
    )
    customer_name = Column(String(100), nullable=False)
    booking_status = Column(String(30), default="CONFIRMED")
    created_at = Column(DateTime, server_default=func.now())