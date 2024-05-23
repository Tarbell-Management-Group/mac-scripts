#!/bin/bash

# URL of the file to download
FILE_URL="https://cdn.console.gotoassist.com/dtc/G2AAgentDesktopConsoleMac.zip"

# Destination directory
DEST_DIR="/Applications"
FILE_NAME=$(basename "$FILE_URL")
TEMP_DIR="/tmp"

# Download the file to a temporary directory
echo "Downloading file from $FILE_URL..."
curl -L "$FILE_URL" -o "$TEMP_DIR/$FILE_NAME"

# Verify if the download was successful
if [ $? -ne 0 ]; then
  echo "Failed to download file. Exiting."
  exit 1
fi

# Unzip the downloaded file to the destination directory
echo "Unzipping file to $DEST_DIR..."
unzip "$TEMP_DIR/$FILE_NAME" -d "$DEST_DIR"

# Verify if the unzip was successful
if [ $? -ne 0 ]; then
  echo "Failed to unzip file. Exiting."
  rm "$TEMP_DIR/$FILE_NAME"
  exit 1
fi

# Clean up by removing the downloaded zip file from the temporary directory
echo "Cleaning up..."
rm "$TEMP_DIR/$FILE_NAME"

echo "The file has been downloaded and extracted to $DEST_DIR"
