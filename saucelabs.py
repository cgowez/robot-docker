#Saucelabs platform configurator https://wiki.saucelabs.com/display/DOCS/Platform+Configurator#/
USERNAME = "<your_saucelabs_user_name>"
KEY = "<your_saucelabs_key>"
REMOTE_BROWSER = "internet explorer" # MicrosoftEdge, firefox, chrome
BROWSER_VERSION = "11.103" #Note: If browser_version capability is not set, the test will run on the latest version of the browser set by browser capability.
OS = "Windows"
OS_VERSION = "10"
RESOLUTION = "1280x1024" #1024x768, 1280x800, 1280x1024, 1366x768, 1440x900, 1680x1050, 1600x1200, 1920x1200, 1920x1080, 2048x1536

REMOTE_URL = "http://" + USERNAME + ":" + KEY + "@ondemand.saucelabs.com:80/wd/hub"
DESIRED_CAPABILITIES = "browserName:" + REMOTE_BROWSER + ",version:" + BROWSER_VERSION + ",platform:" + OS + " " + OS_VERSION + ",screenResolution:" + RESOLUTION
