#!/bin/bash

# Check if urls.txt exists
if [[ ! -f urls.txt ]]; then
    echo "Error: urls.txt not found."
    exit 1
fi

# Read the file line by line
while IFS= read -r url
do
    # Extract the domain name from the URL for the filename
    filename=$(echo "$url" | awk -F/ '{print $3}').txt

    # Use curl to download the HTML file
    html=$(curl -s --fail "$url")

    # Check if curl was successful
    if [[ $? -ne 0 ]]; then
        echo "Error: Failed to download $url"
        continue
    fi

    # Use grep to only pull the <h1> and <p> tags, then use tr to trim the output and cut away the tags
    text=$(echo "$html" | grep -oP '(?<=<h1>|<p>).*?(?=</h1>|</p>)' | tr -d '\n')

    # Check if text extraction was successful
    if [[ -z "$text" ]]; then
        echo "Error: Failed to extract text from $url"
        continue
    fi

    # Save this output to a file name
    echo "$url" > "$filename"
    echo "$text" >> "$filename"
done < urls.txt

# Use ls and cat to verify that the script was successful
for file in *.txt
do
    echo "Content of $file:"
    cat "$file"
    echo
done

