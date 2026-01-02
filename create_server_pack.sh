#!/bin/bash
# Bash Script to Create Server Resource Pack ZIP
# Run this script from the minecraft_hopecubes directory

echo "Creating server resource pack ZIP file..."

SOURCE_FOLDER="hopecubes_resourcepack"
ZIP_FILE="hopecubes_resourcepack.zip"

# Check if source folder exists
if [ ! -d "$SOURCE_FOLDER" ]; then
    echo "Error: $SOURCE_FOLDER not found!"
    exit 1
fi

# Remove existing ZIP if it exists
if [ -f "$ZIP_FILE" ]; then
    echo "Removing existing $ZIP_FILE..."
    rm -f "$ZIP_FILE"
fi

# Create ZIP file - change to source folder first to ensure correct structure
echo "Compressing resource pack..."
cd "$SOURCE_FOLDER"
zip -r "../$ZIP_FILE" . -q
cd ..

# Verify ZIP was created
if [ -f "$ZIP_FILE" ]; then
    FILE_SIZE=$(du -h "$ZIP_FILE" | cut -f1)
    echo "Success! Created $ZIP_FILE"
    echo "File size: $FILE_SIZE"
    
    # Calculate SHA-1 hash
    echo ""
    echo "Calculating SHA-1 hash..."
    HASH=$(sha1sum "$ZIP_FILE" | cut -d' ' -f1)
    echo "SHA-1 Hash: $HASH"
    echo ""
    echo "Copy this hash to your server.properties file:"
    echo "resource-pack-sha1=$HASH"
    
    echo ""
    echo "Next steps:"
    echo "1. Upload $ZIP_FILE to your web server"
    echo "2. Get the direct download URL"
    echo "3. Add to server.properties:"
    echo "   resource-pack=YOUR_URL_HERE"
    echo "   resource-pack-sha1=$HASH"
    echo "   resource-pack-prompt=\"Your custom message here!\""
else
    echo "Error: Failed to create ZIP file!"
    exit 1
fi

