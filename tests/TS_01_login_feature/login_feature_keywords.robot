*** Settings ***
Documentation       Test Cases related to valid user login

Library             SeleniumLibrary
Resource            ../../Pages/loginpage.robot
Resource            ../../Pages/userdetailspage.robot
Resource            ../../Pages/homepage.robot
Resource            ../../Pages/customkeywords.robot
Variables           ../../variables/variables.py

*** Keywords ***
Login As Invalid User And Verify Error Message
    [Arguments]     ${user}     ${pass}
    Go To Login Page
    Is Login Page Displayed
    Login As User ${user} With Password ${pass}
    Login Should Be Unsuccessful

Login With Empty Fields And Verify Error Message
    [Arguments]     ${user}     ${pass}
    Go To Login Page
    Is Login Page Displayed
    Login As User ${user} With Password ${pass}
    Is Login Page Displayed