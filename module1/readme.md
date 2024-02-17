This is a bash script that reads a list of URLs from a file named urls.txt, downloads the HTML content of each URL, extracts the text within <h1> and <p> tags, and saves the extracted text into separate text files. After processing all URLs, it prints the content of each text file to the console.

Here’s a breakdown of what each part of the script does:

counter=1: This initializes a counter used for creating unique filenames.
while IFS= read -r url: This reads the urls.txt file line by line, with each line treated as a URL.
html=$(curl -s "$url"): This uses curl to download the HTML content of the URL. The -s option makes curl operate in silent mode.
text=$(echo "$html" | grep -oP '(?<=<h1>|<p>).*?(?=</h1>|</p>)' | tr -d '\n'): This extracts the text within <h1> and <p> tags from the HTML content. It uses grep with Perl-compatible regular expressions (-P) to match the text and tr to remove newline characters.
echo "$text" > "file$counter.txt": This writes the extracted text into a text file. The filename is generated using the counter.
((counter++)): This increments the counter.
for ((i=1; i<counter; i++)): After processing all URLs, this loop goes through each created text file.
cat "file$i.txt": This prints the content of each text file to the console.
