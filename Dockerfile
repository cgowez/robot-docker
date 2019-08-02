FROM debian:stretch-slim
ENV FIREFOXBROWSER_VERSION 68.0.1
ENV DEPS wget curl unzip

RUN apt-get update \
 && apt-get install -y $DEPS gcc python python-pip libdbus-glib-1-dev libgtk2.0-0\
 ## Install Chrome
 && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
 && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list \
 && apt-get update && apt-get install -y google-chrome-stable \
 ## Install Firefox
 && wget https://ftp.mozilla.org/pub/firefox/releases/$FIREFOXBROWSER_VERSION/linux-x86_64/en-US/firefox-$FIREFOXBROWSER_VERSION.tar.bz2 \
 && tar -xjf "firefox-$FIREFOXBROWSER_VERSION.tar.bz2" \
 && mv firefox /opt/firefox \
 && rm "firefox-$FIREFOXBROWSER_VERSION.tar.bz2" \
 ## Move Binaries, place headless scripts
 && echo $'#!/bin/bash\n\
chrome --headless --disable-gpu --no-sandbox $@ &\n\
chrome=$!\n\
wait $chrome' > /usr/bin/headless-chrome \
 && echo $'#!/bin/bash\n\
firefox-browser -headless $@ &\n\
ff=$!\n\
wait $ff' > /usr/bin/headless-firefox \
 && ln -s /opt/firefox/firefox /usr/bin/firefox-browser \
 && ln -s /usr/bin/headless-firefox /usr/bin/firefox \
 && mv /opt/google/chrome/google-chrome /opt/google/chrome/google-chrome-browser \
 && rm /usr/bin/google-chrome-stable \
 && rm /usr/bin/google-chrome \
 && ln -s /opt/google/chrome/google-chrome-browser /usr/bin/chrome \
 && ln -s /usr/bin/headless-chrome /usr/bin/google-chrome \
 && chmod a+x /usr/bin/headless-chrome \
 && chmod a+x /usr/bin/headless-firefox \
 ## Install robotFramework and deps
 && pip install --upgrade pip \
 && pip install robotframework robotframework-seleniumlibrary robotframework-faker webdrivermanager \
 ## Download Browser Drivers
 && webdrivermanager firefox chrome --linkpath /usr/bin

 WORKDIR /robot
