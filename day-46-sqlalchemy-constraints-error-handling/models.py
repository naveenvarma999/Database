from sqlalchemy import (
    Column,
    BigInteger,
    String,
    Numeric,
    ForeignKey,
    CheckConstraint
)

from database import Base


class SafeUser(Base):
    __tablename__ = "safe_users"

    id = Column(BigInteger, primary_key=True, autoincrement=True)
    full_name = Column(String(100), nullable=False)
    email = Column(String(150), unique=True, nullable=False)


class SafeProperty(Base):
    __tablename__ = "safe_properties"

    id = Column(BigInteger, primary_key=True, autoincrement=True)
    title = Column(String(150), nullable=False)
    price = Column(Numeric(12, 2), nullable=False)
    status = Column(String(30), default="AVAILABLE")

    __table_args__ = (
        CheckConstraint("price > 0", name="check_price_positive"),
    )


class SafeBooking(Base):
    __tablename__ = "safe_bookings"

    id = Column(BigInteger, primary_key=True, autoincrement=True)

    property_id = Column(
        BigInteger,
        ForeignKey("safe_properties.id"),
        nullable=False
    )

    user_id = Column(
        BigInteger,
        ForeignKey("safe_users.id"),
        nullable=False
    )

    booking_status = Column(String(30), default="CONFIRMED")
