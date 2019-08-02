*** Settings ***
Library             SeleniumLibrary

*** Variables ***
${URL}  https://www.google.com
${BROWSER}  chrome
${REMOTE_URL}  ${EMPTY}
${DESIRED_CAPABILITIES}  ${EMPTY}

*** Test Cases ***
Open Site
    [Tags]  web
    Open Browser  ${URL}  ${BROWSER}  remote_url=${REMOTE_URL}  desired_capabilities=${DESIRED_CAPABILITIES}
    Set Window Size  1280  800
    Capture Page Screenshot
    Close All Browsers
