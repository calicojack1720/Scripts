# scrapes the data for practice sessions, qualifying sessions, and the race for an F1 race on
# formula1.com and outputs the results to csv files

import sys
import requests
from bs4 import BeautifulSoup
import csv

def ScrapePractice(purl):
    
    for x in range(4):
        psessionURL = purl + "/" + str(x)
        # Send a GET request to the URL
        response = requests.get(psessionURL)

        # Check if the request was successful
        if response.status_code == 200:
            race_type = 0
            
            # Parse the HTML content of the page
            soup = BeautifulSoup(response.content, 'html.parser')
            
            # Find and print the title of the page
            title = soup.title.string
            print(f"Page Title: {title}")
            
            # Find and print all the race results
            results_table = soup.find(id="maincontent")
            if results_table:
                rows = results_table.find_all('tr')
                for row in rows:
                    columns = row.find_all('td')
                    if columns:
                        position = columns[0].text.strip()
                        car_no = columns[1].text.strip()
                        laps = columns[4].text.strip()
                        time = columns[5].text.strip()
                        pts = columns[6].text.strip()
                        print(f"{race_name},{position},{car_no},{laps},{time},{pts},{race_type}")
                        
            else:
                print("No results found!")
        else:
            print(f"Failed to retrieve practice results. Status code: {response.status_code}")

def ScrapeQualifying(qurl):
    # Send a GET request to the URL
    response = requests.get(qurl)

    # Check if the request was successful
    if response.status_code == 200:
        race_type = 0
        
        # Parse the HTML content of the page
        soup = BeautifulSoup(response.content, 'html.parser')
        
        # Find and print the title of the page
        title = soup.title.string
        print(f"Page Title: {title}")

        print(f"Race,Position,Car No,Time,Gap,Laps,Session")
        
        # Find and print all the practice session results
        results_table = soup.find(id="maincontent")
        if results_table:
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
        print(f"Failed to retrieve qualifying results. Status code: {response.status_code}")

def ScrapeRace(url):
    
    rurl = url + "/race-result"

    # Send a GET request to the URL
    response = requests.get(rurl)

    # Check if the request was successful
    if response.status_code == 200:
        race_type = 0
        
        # Parse the HTML content of the page
        soup = BeautifulSoup(response.content, 'html.parser')
        
        # Find and print the title of the page
        title = soup.title.string
        print(f"Page Title: {title}")
        
        # Find and print all the race results
        results_table = soup.find(id="maincontent")
        if results_table:
            print(f"Race,Position,CarNo,Laps,Time,Pts,Type")
            rows = results_table.find_all('tr')
            for row in rows:
                columns = row.find_all('td')
                if columns:
                    position = columns[0].text.strip()
                    car_no = columns[1].text.strip()
                    laps = columns[4].text.strip()
                    time = columns[5].text.strip()
                    pts = columns[6].text.strip()
                    print(f"{race_name},{position},{car_no},{laps},{time},{pts},{race_type}")
                    
        else:
            print("No results found!")
    else:
        print(f"Failed to retrieve race results. Status code: {response.status_code}")


#if len(sys.argv) < 1:
#    print(f"No website provided, quitting...")
#    exit

#baseURL = sys.argv[0]
baseURL = input("Enter base url: ")
race_name = input("Enter the race name: ")
practiceURL = baseURL + "/practice"
qualifyingURL = baseURL + "/qualifying"
raceURL = baseURL + "/race-result"

ScrapePractice(practiceURL)
ScrapeQualifying(qualifyingURL)
ScrapeRace(raceURL)