# Melakukan import mysql connector
import mysql.connector

# Melakukan percobaan koneksi
conn = mysql.connector.connect(
    host="127.0.0.1",
    user="root",
    password="*******",
    database="kalbe"
)

# Membuat object cursor sebagai penanda
cursor = conn.cursor()

# Deklarasi SQL Query untuk memasukan record ke DB (KARYAWAN)
insert_sql = "INSERT INTO KARYAWAN (FIRST_NAME, LAST_NAME, AGE, SEX, INCOME) VALUES (%s, %s, %s, %s, %s)"

values = ("Nam", "Ma", 21, "L", 50000)

try:
    # Eksekusi SQL Command
    cursor.execute(insert_sql, values)

    # Melakukan perubahab (commit) pada DB
    conn.commit()
    print("Data inserted successfully.")

except mysql.connector.Error as err:
    #Roll Back apabila ada issue
    print("Error:", err)
    conn.rollback()

# Menutup Koneksi
if conn.is_connected():
    cursor.close()
    conn.close()
    print("Connection closed.")
