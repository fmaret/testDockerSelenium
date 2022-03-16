import os
from time import sleep
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from webdriver_manager.chrome import ChromeDriverManager


def open_driver(enable_headless=True, lang_fr=True):
    options = Options()
    options.add_argument("--window-size=1980,1020")
    if enable_headless:
        options.add_argument("--headless")
    options.add_argument("--no-sandbox")
    options.add_argument("--disable-dev-shm-usage")
    
    options.add_argument("--user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36")
    
    
    driver = webdriver.Chrome(options=options)

    return driver

if __name__ == "__main__":
    driver = open_driver(enable_headless=True)

    driver.get("https://www.lacentrale.fr/")

    sleep(10)
    print(driver.current_url)
    driver.quit()