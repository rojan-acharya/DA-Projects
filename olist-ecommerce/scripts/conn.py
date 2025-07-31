from sqlalchemy import create_engine
from sqlalchemy.exc import SQLAlchemyError


def connection():
    try:
        engine = create_engine("mysql+pymysql://root:root@localhost/ecommerce")
        with engine.connect() as conn:
            print('Connection success')
        return engine
    except SQLAlchemyError as e:
        print(f"Connection failed: {e}")
        raise