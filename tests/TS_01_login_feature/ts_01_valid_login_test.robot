*** Settings ***
Documentation       Test Cases related to valid user login

Library             SeleniumLibrary
Resource            ../../Pages/loginpage.robot
Resource            ../../Pages/userdetailspage.robot
Resource            ../../Pages/homepage.robot
Resource            ../../Pages/customkeywords.robot
Variables           ../../variables/variables.py

Test Setup          Open Browser    ${BASE_URL}      ${BROWSER}
...                 Set Selenium Parameters
Test Teardown       Close All Browsers


*** Test Cases ***
TC_01 Login As Registered User And Verify Details Are Displayed
    [Tags]      login_test
    Is Home Page Displayed
    Go To Login Page
    Is Login Page Displayed
    Login As User ${valid_username} With Password ${valid_password}
    Login Should Be Successful
    Verify User Details    ${valid_username}      ${valid_firstname}    ${valid_lastname}    ${valid_phone_number}
    Log Out User