*** Settings ***
Documentation    Generic Keywords which are not related to pages.
Library             SeleniumLibrary
Variables           ../variables/variables.py

*** Keywords ***
Set Selenium Parameters
    Set Selenium Speed      ${SELENIUM_SPEED}
    Set Selenium Implicit Wait      ${SELENIUM_IMPLICIT_WAIT}
    Set Selenium Timeout    ${SELENIUM_TIMEOUT}
    Set Screenshot Directory    ${SCREENSHOT_DIR}
    Maximize Browser Window
