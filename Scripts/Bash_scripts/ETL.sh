#!/bin/bash

# This creates an environen variable for the data ur;
export DATA_URL="https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv"

# Additional variables for the data transformations
RAW_DIR="raw"
TRANSFORMED_DIR="Transformed"
GOLD_DIR="Gold"
CURRENT_DATE=$(date +%Y-%m-%d)

# creates the raw folder
mkdir -p "$RAW_DIR" "$TRANSFORMED_DIR" "$GOLD_DIR"

# downlods the raw data
echo "Starting the Extract process..."
curl -o "$RAW_DIR/data.csv" $DATA_URL

# check for successful download of the raw data
if [ -f "$RAW_DIR/data.csv" ]; then
  echo "File downloaded successfully and saved in the $RAW_DIR folder."
else
  echo "Error: File not downloaded."
  exit 1
fi

echo "Starting the Transform process..."
# creates a date dynamic variable for storing the file transfored on a day and saving to a new folder
TRANSFORMED_FILE="$TRANSFORMED_DIR/${CURRENT_DATE}_finance.csv"
awk -F, 'BEGIN {OFS=","} NR==1 {$3 = "variable_code"; print $1, $2, $4, $3} NR>1 {print $1, $2, $4, $3}' "$RAW_DIR/data.csv" > "$TRANSFORMED_FILE"

if [ -f "$TRANSFORMED_FILE" ]; then
  echo "Transformation successful. File saved as $TRANSFORMED_FILE."
else
  echo "Error: Transformation failed."
  exit 1
fi

# moves the transformed file to the final destination !!!!!!!!
echo "Starting the Load process..."
mv "$TRANSFORMED_FILE" "$GOLD_DIR/"

if [ -f "$GOLD_DIR/${CURRENT_DATE}_finance.csv" ]; then
  echo "Load process completed. File saved in the $GOLD_DIR folder."
else
  echo "Error: Load process failed."
  exit 1
fi

echo "ETL process completed successfully."

# QED!!!!!!!!!
# Bash is cool!!!
