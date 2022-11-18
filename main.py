import os
import random
import psycopg2
import datetime
from dotenv import load_dotenv

load_dotenv(".env")
conn = psycopg2.connect(
                        dbname = os.environ.get("dbname"),
                        user = os.environ.get("user"),
                        password = os.environ.get("pass"),
                        host = os.environ.get("host")
                        )
cursor = conn.cursor()

def insert_users():

    i = 0

    while i<1001:
        age = random.randint(14, 70)

        cursor.execute('''INSERT INTO users (age) 
        VALUES (%s); ''',
        ([age]))
        i += 1

        conn.commit()
        conn.close()

def insert_items():

    i = 0

    while i<759:
        price = random.uniform(1000, 30000)

        cursor.execute('''INSERT INTO items (price) 
        VALUES (%s); ''',
        ([price]))
        i += 1
        print(i)

        conn.commit()
        conn.close()

def insert_purchas():

    i = 0
    j = 0

    start = datetime.datetime(2020, 1, 1)
    end = datetime.datetime(2022, 11, 18)

    while i<9001:
        userId = random.randint(1, 1000)
        itemid = random.randint(1, 758)
        date = start + (end - start) * random.random()

        cursor.execute('''INSERT INTO purchases (userid, itemid, date) 
        VALUES (%s, %s, %s); ''',
        (userId, itemid, date))
        i += 1
        print(i)
        conn.commit()
    
    while j<301:
        
        userId = random.randint(1, 1000)
        itemid = 357
        date = start + (end - start) * random.random()

        cursor.execute('''INSERT INTO purchases (userid, itemid, date) 
        VALUES (%s, %s, %s); ''',
        (userId, itemid, date))
        j += 1
        print(i)

        conn.commit()
        conn.close()

if __name__ == "__main__":

    insert_users()
    insert_items()
    insert_purchas()