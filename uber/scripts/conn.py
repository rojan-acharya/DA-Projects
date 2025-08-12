from sqlalchemy import create_engine
from sqlalchemy.exc import SQLAlchemyError


def connection():
    try:
        engine = create_engine("mysql+mypysql://root:root@localhost/uber")
        with engine.connect() as conn:
            print("Connection Successfull !!")
        return engine
    except SQLAlchemyError as e:
        print(f"Connection Failed: {e}")
        raise