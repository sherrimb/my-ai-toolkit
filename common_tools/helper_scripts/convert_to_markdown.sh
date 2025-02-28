#!/bin/bash

# Create the 'markdown_versions' directory
mkdir -p markdown_versions

# Function to convert file to markdown and add file path
convert_to_markdown() {
    local file="$1"
    local output_file="markdown_versions/${file%.*}.md"

    # Create subdirectories in markdown_versions if needed
    mkdir -p "$(dirname "$output_file")"

    # Add file path at the top
    echo "# File path: $file" > "$output_file"
    echo "" >> "$output_file"

    # Convert based on file extension
    case "${file##*.}" in
        ipynb)
            jupyter nbconvert --to markdown "$file" --stdout | tail -n +2 >> "$output_file"
            ;;
        csv)
            echo '```
            head -n 10 "$file" >> "$output_file"
            echo '...' >> "$output_file"
            echo '```' >> "$output_file"
            ;;
        json)
            echo '```
            cat "$file" >> "$output_file"
            echo '```' >> "$output_file"
            ;;
    esac
}

# Find and convert all .ipynb, .csv, and .json files
find . -type f \( -name "*.ipynb" -o -name "*.csv" -o -name "*.json" \) -print0 | 
while IFS= read -r -d '' file; do
    convert_to_markdown "$file"
done

echo "Conversion complete. Markdown versions are in the 'markdown_versions' folder."
