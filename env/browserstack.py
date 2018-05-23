#List of Browsers & its versions: https://www.browserstack.com/list-of-browsers-and-platforms?product=automate
USERNAME = "<your_browserstack_user_name>"
KEY = "<your_browserstack_key>"
REMOTE_BROWSER = "Edge" #IE, Firefox, Chrome
BROWSER_VERSION = "16.0" #Note: If browser_version capability is not set, the test will run on the latest version of the browser set by browser capability.
OS = "Windows"
OS_VERSION = "10"
RESOLUTION = "1280x1024" #1024x768, 1280x800, 1280x1024, 1366x768, 1440x900, 1680x1050, 1600x1200, 1920x1200, 1920x1080, 2048x1536

REMOTE_URL = "http://" + USERNAME + ":" + KEY + "@hub.browserstack.com:80/wd/hub"
DESIRED_CAPABILITIES = "browser:" + REMOTE_BROWSER + ",browser_version:" + BROWSER_VERSION + ",os:" + OS + ", os_version:" + OS_VERSION + ",resolution:" + RESOLUTION
