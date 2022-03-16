FROM python:3.8

RUN apt update
RUN apt-get install -y gnupg wget
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list
RUN apt-get update && apt-get install -y google-chrome-stable
# Installing Unzip
RUN apt-get install -yqq unzip

# Set up Chromedriver Environment variables
ENV CHROMEDRIVER_VERSION 98.0.4758.102
ENV CHROMEDRIVER_DIR /tmp/chromedriver.zip
# Download the Chrome Driver

RUN wget -O /tmp/chromedriver.zip "http://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip"

# Unzip the Chrome Driver into /usr/local/bin directory
RUN unzip $CHROMEDRIVER_DIR chromedriver -d /usr/local/bin/


# Set display port as an environment variable
ENV DISPLAY=:99

COPY . /app
WORKDIR /app

RUN pip install --upgrade pip

RUN pip install -r requirements.txt

CMD ["python", "./open_driver.py"]