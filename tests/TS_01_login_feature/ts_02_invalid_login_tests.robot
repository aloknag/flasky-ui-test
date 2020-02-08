*** Settings ***
Documentation       Test Cases related to invalid user login

Library             SeleniumLibrary
Resource            login_feature_keywords.robot
Variables           ../../variables/variables.py

Test Setup          Open Browser    ${BASE_URL}      ${BROWSER}
...                 Set Selenium Parameters
Test Teardown       Close All Browsers

*** Variables ***
${ts02_invalid}=     invalid


*** Test Cases ***
TC_01 Invalid Login
    [Tags]      login_test
    [Template]    Login As Invalid User And Verify Error Message
    ${ts02_invalid}  ${valid_password}
    ${ts02_invalid}  ${ts02_invalid}
    ${valid_username}   ${ts02_invalid}

TC_02 Empty Fields Login
    [Tags]      login_test
    [Template]    Login With Empty Fields And Verify Error Message
    ${EMPTY}    ${valid_password}
    ${valid_username}    ${EMPTY}
    ${EMPTY}    ${EMPTY}