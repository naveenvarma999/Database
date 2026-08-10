from sqlalchemy.exc import IntegrityError

from database import Base, engine, SessionLocal
from models import SafeUser, SafeProperty, SafeBooking


Base.metadata.create_all(bind=engine)

db = SessionLocal()

try:
    # Clean old practice data
    db.query(SafeBooking).delete()
    db.query(SafeProperty).delete()
    db.query(SafeUser).delete()
    db.commit()

    # -----------------------------
    # 1. Insert valid user
    # -----------------------------
    user = SafeUser(
        full_name="Naveen Varma",
        email="naveen@example.com"
    )

    db.add(user)
    db.commit()
    db.refresh(user)

    print("1. Valid user inserted:")
    print(user.id, user.full_name, user.email)

    # -----------------------------
    # 2. Try duplicate email
    # -----------------------------
    try:
        duplicate_user = SafeUser(
            full_name="Another Naveen",
            email="naveen@example.com"
        )

        db.add(duplicate_user)
        db.commit()

    except IntegrityError:
        db.rollback()
        print("\n2. Duplicate email rejected by database")

    # -----------------------------
    # 3. Insert valid property
    # -----------------------------
    property_item = SafeProperty(
        title="Luxury Villa",
        price=950000,
        status="AVAILABLE"
    )

    db.add(property_item)
    db.commit()
    db.refresh(property_item)

    print("\n3. Valid property inserted:")
    print(property_item.id, property_item.title, property_item.price)

    # -----------------------------
    # 4. Try invalid property price
    # -----------------------------
    try:
        bad_property = SafeProperty(
            title="Wrong Price Property",
            price=-5000,
            status="AVAILABLE"
        )

        db.add(bad_property)
        db.commit()

    except IntegrityError:
        db.rollback()
        print("\n4. Negative price rejected by database")

    # -----------------------------
    # 5. Insert valid booking
    # -----------------------------
    booking = SafeBooking(
        property_id=property_item.id,
        user_id=user.id,
        booking_status="CONFIRMED"
    )

    db.add(booking)
    db.commit()
    db.refresh(booking)

    print("\n5. Valid booking inserted:")
    print(booking.id, booking.property_id, booking.user_id)

    # -----------------------------
    # 6. Try booking with wrong property_id
    # -----------------------------
    try:
        wrong_booking = SafeBooking(
            property_id=999999,
            user_id=user.id,
            booking_status="CONFIRMED"
        )

        db.add(wrong_booking)
        db.commit()

    except IntegrityError:
        db.rollback()
        print("\n6. Booking with invalid property_id rejected by database")

    # -----------------------------
    # 7. Final data check
    # -----------------------------
    print("\nFinal users:")
    users = db.query(SafeUser).all()

    for item in users:
        print(item.id, item.full_name, item.email)

    print("\nFinal properties:")
    properties = db.query(SafeProperty).all()

    for item in properties:
        print(item.id, item.title, item.price)

    print("\nFinal bookings:")
    bookings = db.query(SafeBooking).all()

    for item in bookings:
        print(item.id, item.property_id, item.user_id, item.booking_status)

finally:
    db.close()