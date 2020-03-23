FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y python python-pip gcc wget curl unzip libdbus-glib-1-dev libgtk2.0-0

RUN pip install --upgrade pip
RUN pip install robotframework
RUN pip install robotframework-seleniumlibrary
RUN pip install robotframework-faker
RUN pip install robotframework-pabot
RUN pip install robotframework-csvlibrary
RUN pip install requests
RUN pip install robotframework-requests
RUN pip install webdrivermanager

ENV FIREFOXBROWSER_VERSION 74.0

WORKDIR /robot

ADD utils/headless-chrome /usr/bin/headless-chrome
RUN chmod a+x /usr/bin/headless-chrome
ADD utils/headless-firefox /usr/bin/headless-firefox
RUN chmod a+x /usr/bin/headless-firefox

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
  && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list \
  && apt-get update \
  && apt-get -y install google-chrome-stable

RUN wget https://ftp.mozilla.org/pub/firefox/releases/$FIREFOXBROWSER_VERSION/linux-x86_64/en-US/firefox-$FIREFOXBROWSER_VERSION.tar.bz2 \
   && tar -xjf "firefox-$FIREFOXBROWSER_VERSION.tar.bz2" \
   && mv firefox /opt/firefox \
   && ln -s /opt/firefox/firefox /usr/bin/firefox-browser \
   && ln -s /usr/bin/headless-firefox /usr/bin/firefox \
   && rm "firefox-$FIREFOXBROWSER_VERSION.tar.bz2"

RUN mv /opt/google/chrome/google-chrome /opt/google/chrome/google-chrome-browser \
   && rm /usr/bin/google-chrome-stable \
   && rm /usr/bin/google-chrome \
   && ln -s /opt/google/chrome/google-chrome-browser /usr/bin/chrome \
   && ln -s /usr/bin/headless-chrome /usr/bin/google-chrome

RUN webdrivermanager firefox chrome --linkpath /usr/bin

RUN pip list
RUN firefox --version
RUN chrome --version
RUN chromedriver --version
RUN geckodriver --version
