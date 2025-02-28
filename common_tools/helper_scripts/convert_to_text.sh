#!/bin/bash

# Create the 'text_versions' directory
mkdir -p text_versions

# Function to convert file to text and add file path
convert_to_text() {
    local file="$1"
    local output_file="text_versions/${file%.*}.txt"
    
    # Create subdirectories in text_versions if needed
    mkdir -p "$(dirname "$output_file")"
    
    # Add file path at the top
    echo "File path: $file" > "$output_file"
    echo "" >> "$output_file"
    
    # Convert based on file extension
    case "${file##*.}" in
        ipynb)
            jupyter nbconvert --to markdown "$file" --stdout >> "$output_file"
            ;;
        csv|json)
            cat "$file" >> "$output_file"
            ;;
    esac
}

# Find and convert all .ipynb, .csv, and .json files
find . -type f \( -name "*.ipynb" -o -name "*.csv" -o -name "*.json" \) -print0 | 
while IFS= read -r -d '' file; do
    convert_to_text "$file"
done

echo "Conversion complete. Text versions are in the 'text_versions' folder."
