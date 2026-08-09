from database import Base, engine, SessionLocal
from models import TransactionProperty, PropertyBooking


Base.metadata.create_all(bind=engine)

db = SessionLocal()

try:
    # Clean old practice data
    db.query(PropertyBooking).delete()
    db.query(TransactionProperty).delete()
    db.commit()

    # Create sample property
    property_item = TransactionProperty(
        title="Luxury Villa",
        city="London",
        price=950000,
        status="AVAILABLE"
    )

    db.add(property_item)
    db.commit()
    db.refresh(property_item)

    print("Property created:")
    print(property_item.id, property_item.title, property_item.status)

    # -----------------------------
    # Transaction starts here
    # -----------------------------
    try:
        property_to_book = db.query(TransactionProperty).filter(
            TransactionProperty.id == property_item.id
        ).first()

        if property_to_book is None:
            raise ValueError("Property not found")

        if property_to_book.status != "AVAILABLE":
            raise ValueError("Property is not available")

        # Step 1: create booking
        booking = PropertyBooking(
            property_id=property_to_book.id,
            customer_name="Naveen Varma",
            booking_status="CONFIRMED"
        )

        db.add(booking)

        # Step 2: update property status
        property_to_book.status = "BOOKED"

        # Save both changes together
        db.commit()
        db.refresh(booking)
        db.refresh(property_to_book)

        print("\nBooking successful:")
        print("Booking ID:", booking.id)
        print("Property status:", property_to_book.status)

    except Exception as error:
        db.rollback()

        print("\nBooking failed:")
        print(error)

    # Check final database state
    print("\nFinal properties:")
    properties = db.query(TransactionProperty).all()

    for prop in properties:
        print(prop.id, prop.title, prop.status)

    print("\nFinal bookings:")
    bookings = db.query(PropertyBooking).all()

    for booking in bookings:
        print(booking.id, booking.property_id, booking.customer_name)

finally:
    db.close()