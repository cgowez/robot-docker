# README #

Robot Framework in Docker running Chrome and Firefox in headless mode (no Xvfb required)

## What is this repository for? ##

This repository has a Dockerfile to create a Robot Framework image and a container to share Robot scripts locally, 
this image also contains Chrome and Firefox browsers running in headless mode (no Xvfb required).

Make sure after pulling this repo your Robot code is copied/moved to this folder structure.

### Folder structure:

-robot-docker/

--robot/

---data/

---pageobjects/

---reports/

---tests/


### Versioning

-robotframework: latest

-robotframework-selenium2library: latest

-robotframework-faker: latest

-robotframework-pabot: latest

-Chrome webdriver: 2.33

-Gecko webdriver: 0.19.0

-Chrome browser: latest

-Firefox browser: 57.0b13

### How do I get set up? ###

Set up: (Docker should be already installed and running locally)

### 1) run: ./build

This will create the image based on the Dockerfile then create a container sharing a volume between Docker and local machine (robot-docker/robot/)

### 2) run Robot tests: ./run_test.sh

This will create a new container using the previous shared volume, it will run any Robot Suite that it's under robot-docker/robot/tests/ and logs, 
reports and screenshots will be stored in robot-docker/robot/reports/

### Optional 3) run: ./remove

Remove any container that belongs to the Robot Framework image and also Robot image is deleted.


You can send more parameters as part of pybot command line e.g.

./run_test.sh -v URL:https://www.amazon.com -v BROWSER:firefox -V env/sitchrome.py

This is sent to the container like this:

pybot -v URL:https://www.amazon.com -v BROWSER:firefox -V env/sitchrome.py --outputdir reports/ --listener /opt/listener.py tests/