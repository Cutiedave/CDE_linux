#!/bin/bash

DB_NAME="posey"
DB_USER="david"
DB_HOST="localhost"
DB_PORT="5432"
CSV_DIR='$HOME/CDE_linux/posey_files'

for csv_file in "$CSV_DIR"/*.csv; do
  table_name=$(basename "$csv_file" .csv)
  psql -U "$DB_USER" -h "$DB_HOST" -p "$DB_PORT" -d "$DB_NAME" -c "\copy $table_name FROM '$csv_file' WITH (FORMAT csv, HEADER true)"
  echo "Data from $csv_file has been loaded into the $table_name table in the $DB_NAME database."
done
