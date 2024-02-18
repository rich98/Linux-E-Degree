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
