#!/bin/bash

# Counter for unique file names
counter=1

# Read the file line by line
while IFS= read -r url
do
    # Use curl to download the HTML file
    html=$(curl -s "$url")

    # Use grep to only pull the <h1> and <p> tags, then use tr to trim the output and cut away the tags
    text=$(echo "$html" | grep -oP '(?<=<h1>|<p>).*?(?=</h1>|</p>)' | tr -d '\n')

    # Save this output to a file name
    echo "$text" > "file$counter.txt"

    # Increment the counter
    ((counter++))
done < urls.txt

# Use cat to verify that the script was successful
for ((i=1; i<counter; i++))
do
    echo "Content of file$i.txt:"
    cat "file$i.txt"
    echo
done
