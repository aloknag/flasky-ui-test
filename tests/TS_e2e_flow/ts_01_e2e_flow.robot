*** Settings ***
Documentation    Test Cases related to end-to-end flow
...              register a user
...              login as that user and validate details

Library             SeleniumLibrary
Library             String
Library             ../../userkeywords/keywords.py
Resource            ../../Pages/homepage.robot
Resource            ../../Pages/customkeywords.robot
Resource            ../../Pages/registerpage.robot
Resource            ../../Pages/loginpage.robot
Resource            ../../Pages/userdetailspage.robot
Resource            ../../Pages/errorpage.robot

Variables           ../../variables/variables.py

Test Setup          Open Browser    ${BASE_URL}      ${BROWSER}
...                 Set Selenium Parameters
Test Teardown       Close All Browsers

*** Test Cases ***
TC_01 Validate End To End User Flow
    [Tags]    e2e
    Is Home Page Displayed
    Go To Register Page
    Is Register Page Displayed
    @{list_data}=    Create Fake Data
    Register User   @{list_data}
    Registration Should Be Successful
    Login As User ${list_data}[0] With Password ${list_data}[1]
    Login Should Be Successful
    Is User Details Page Displayed
    Verify User Details     ${list_data}[0]  ${list_data}[2]  ${list_data}[3]  ${list_data}[4]
    Log Out User
