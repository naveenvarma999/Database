from alembic import op
import sqlalchemy as sa


def upgrade():
    op.add_column(
        "users",
        sa.Column("phone", sa.String(length=20), nullable=True)
    )


def downgrade():
    op.drop_column("users", "phone")