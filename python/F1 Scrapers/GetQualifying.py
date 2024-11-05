import requests
from bs4 import BeautifulSoup

# URL of the page to scrape
url = input("Enter the url: ")
race_name = input("Enter the name of the race: ")

# Send a GET request to the URL
response = requests.get(url)

# Check if the request was successful
if response.status_code == 200:
    # Parse the HTML content of the page
    soup = BeautifulSoup(response.content, 'html.parser')
    
    # Find and print the title of the page
    title = soup.title.string
    print(f"Page Title: {title}")
    
    # Find and print all the practice session results
    results_table = soup.find(id="maincontent")
    if results_table:
        print(f"Race,Position,Car No,Time,Gap,Laps,Session")
        rows = results_table.find_all('tr')
        for row in rows:
            columns = row.find_all('td')
            if columns:
                position = columns[0].text.strip()
                car_no = columns[1].text.strip()
                qone = columns[4].text.strip()
                qtwo = columns[5].text.strip()
                qthree = columns[6].text.strip()
                laps = columns[7].text.strip()
                # print(f"Position: {position}, Car No: {car_no}, Time: {time}, Gap: {gap}, Laps: {laps}")
                print(f"{race_name},{position},{car_no},{qone},{laps},1")
                print(f"{race_name},{position},{car_no},{qtwo},{laps},2")
                print(f"{race_name},{position},{car_no},{qthree},{laps},3")
                
    else:
        print("No results found!")
else:
    print(f"Failed to retrieve the page. Status code: {response.status_code}")
