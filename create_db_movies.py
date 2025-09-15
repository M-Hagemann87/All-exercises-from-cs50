### Used  AI help to convert CSV files to DB (database):

import pandas as pd
import sqlite3
import sys

def csv_to_sqlite(csv_file, db_file, table_name="my_table"):
    # Load CSV into pandas DataFrame
    df = pd.read_csv(csv_file)

    # Connect (or create) SQLite database
    conn = sqlite3.connect(db_file)

    # Write data into SQLite table
    df.to_sql(table_name, conn, if_exists="replace", index=False)

    conn.close()
    print(f"Success converted to database: {db_file}")

# Example usage
if __name__ == "__main__":
    # Change these values to your file names
    csv_to_sqlite("netflix2025.csv", "movies.db", "movies")
