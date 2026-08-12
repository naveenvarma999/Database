from sqlalchemy import Column, BigInteger, String, Numeric, CheckConstraint

from database import Base


class ApiUser(Base):
    __tablename__ = "api_safe_users"

    id = Column(BigInteger, primary_key=True, autoincrement=True)
    full_name = Column(String(100), nullable=False)
    email = Column(String(150), unique=True, nullable=False)


class ApiProperty(Base):
    __tablename__ = "api_safe_properties"

    id = Column(BigInteger, primary_key=True, autoincrement=True)
    title = Column(String(150), nullable=False)
    city = Column(String(100), nullable=False)
    price = Column(Numeric(12, 2), nullable=False)
    status = Column(String(30), default="AVAILABLE")

    __table_args__ = (
        CheckConstraint("price > 0", name="api_check_price_positive"),
    )