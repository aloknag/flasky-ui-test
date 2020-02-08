*** Settings ***
Documentation    Test Cases related to user registration

Library             SeleniumLibrary
Resource            ../../Pages/homepage.robot
Resource            ../../Pages/customkeywords.robot
Resource            ../../Pages/registerpage.robot
Variables           ../../variables/variables.py
Library             ../../userkeywords/keywords.py

Test Setup          Open Browser    ${BASE_URL}      ${BROWSER}
...                 Set Selenium Parameters
Test Teardown       Close All Browsers

*** Variables ***
${test_data_file}=      testdata/registration_test_data.csv

*** Test Cases ***
TC_01 Register a New User Using Faker Data
    [Tags]    registration
    Is Home Page Displayed
    Go To Register Page
    @{list_data}=    Create Fake Data
    Register User   @{list_data}
    Registration Should Be Successful


TC_02 Register a Existing User Using CSV Data
    [Tags]     registration
    # We are using Read CSV here, but this can be achieved using Fake Data too.
    # This is alternative apprach but requires csv file with registered user information
    @{data_from_csv}=   Read CSV File      ${test_data_file}
    Log Many     @{data_from_csv}
    Go To Register Page
    Register User   ${data_from_csv}
    Registration Should Fail
