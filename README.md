# README #

Docker container that runs Selenium Chrome and Firefox drivers in headless mode (no Xvfb required).

## What is this repository for? ##

This repository has a Dockerfile that creates a Robot Framework image and a container to run Robot scripts locally,
this image contains Chrome and Firefox browsers running in headless mode (no Xvfb required) and a ".py" file with settings
to run local scripts in BrowserStack or Saucelabs services, BrowserStack and Microsoft have a partnership so you get unlimited execution time
to run scripts against Microsoft Edge browser.

Your script repository must be checked out as a git submodule of this repository. https://git-scm.com/docs/git-submodule


### Versioning

* robotframework: latest

* robotframework-seleniumlibrary: latest

* robotframework-faker: latest

* robotframework-pabot: latest

* Chrome webdriver: latest

* Gecko webdriver: latest

* Chrome browser: latest

* Firefox browser: 74.0


### Pre-requisites ###

Docker should be already installed and running.


### 1) Create docker image and shared volume:

```
./build
```

This creates an image based on the Dockerfile then create a container sharing a volume between Docker and your local machine (robot-docker/*)

### 2) Run Robot tests:

```
./robot test/
```

This creates a new container using the shared volume (created in step 1), it will run any Robot Suite that it's under robot-docker/ and logs,
reports and screenshots will be stored in robot-docker/

### Optional 3) Remove container

```
./remove
```

Remove any container that belongs to the Robot Framework image and also Robot image is deleted.

### Run local scripts in Microsoft Edge (BrowserStack)

1. Register at https://www.browserstack.com/

2. Get your username and key

3. Input those values in "browserstack.py" file

4. Run your tests: ./robot.sh -V env/browserstack.py

### Run local scripts in Microsoft Internet Explorer (Saucelabs)

1. Register at https://www.saucelabs.com/

2. Get your username and key

3. Input those values in "saucelabs.py" file

4. Run your tests: ./robot.sh -V env/saucelabs.py

## Sending parameters to the scripts ##

You can send parameters as part of pybot command line

e.g.
```

./robot -v URL:https://www.amazon.com -v BROWSER:firefox

```

This is sent to the container like this:

```

robot -v URL:https://www.amazon.com -v BROWSER:firefox --outputdir reports/
```
