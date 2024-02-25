# Web Content Extractor

This script extracts the text content from the URLs listed in a file and saves them into separate text files.

## Requirements

- Bash
- curl
- grep
- awk
- tr

## Usage

1. Create a file named `urls.txt` in the same directory as this script. Each line of `urls.txt` should contain one URL from which you want to extract text.

2. Run the script with the command `./script_name.sh`.

## How It Works

The script reads the `urls.txt` file line by line. For each URL, it:

1. Extracts the domain name from the URL to use as the filename for the output file.
2. Downloads the HTML of the page using `curl`.
3. Extracts the text within `<h1>` and `<p>` tags from the HTML using `grep`.
4. Saves the URL and the extracted text into a `.txt` file named after the domain.

If the script encounters an error at any point (such as if the `urls.txt` file is not found, or if `curl` fails to download a page), it will print an error message to the console and continue with the next URL.

After processing all URLs, the script prints the content of all `.txt` files to the console to verify that the script was successful.

## Notes

- The script does not recursively follow links. It only extracts text from the exact URLs provided in `urls.txt`.
- The script only extracts text within `<h1>` and `<p>` tags. If the web page uses different tags to mark up its main content, the script might not extract all relevant text.

The script uses a for loop. Specifically, it uses a for loop at the end to iterate over all .txt files in the current directory. Here’s the relevant part of the script:

Use ls and cat to verify that the script was successful
'''
for file in *.txt
do
    echo "Content of $file:"
    cat "$file"
    echo
'''

## For loop
This for loop prints the content of each .txt file to the console, which helps to verify that the script has successfully extracted text from the URLs. Each iteration of the loop represents one .txt file. The file variable takes on the name of each .txt file in turn, and the cat command prints the content of the current file. The echo command is used to print a newline character after the content of each file for readability.

In addition to the for loop, the script also uses a while loop to read the urls.txt file line by line and process each URL. This is another form of loop used in the script.

## A python version

