import os
import requests
from urllib.parse import urlparse
from bs4 import BeautifulSoup

# Check if urls.txt exists
if not os.path.isfile('urls.txt'):
    print("Error: urls.txt not found.")
    exit(1)

# Read the file line by line
with open('urls.txt', 'r') as file:
    urls = file.readlines()

for url in urls:
    url = url.strip()
    # Extract the domain name from the URL for the filename
    filename = urlparse(url).netloc + '.txt'

    # Use requests to download the HTML file
    try:
        html = requests.get(url).text
    except requests.exceptions.RequestException as e:
        print(f"Error: Failed to download {url}")
        continue

    # Use BeautifulSoup to only pull the <h1> and <p> tags
    soup = BeautifulSoup(html, 'html.parser')
    text = ' '.join([tag.get_text(strip=True) for tag in soup.find_all(['h1', 'p'])])

    # Check if text extraction was successful
    if not text:
        print(f"Error: Failed to extract text from {url}")
        continue

    # Save this output to a file name
    with open(filename, 'w') as f:
        f.write(url + '\n')
        f.write(text + '\n')

# Use os and open to verify that the script was successful
for file in os.listdir():
    if file.endswith('.txt'):
        print(f"Content of {file}:")
        with open(file, 'r') as f:
            print(f.read())
        print()

