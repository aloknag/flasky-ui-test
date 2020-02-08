*** Settings ***
Documentation       Keywords For Login Page Interactions
Resource            errorpage.robot
Library             SeleniumLibrary


*** Variables ***
${login_page_url}=        login
${login_page_title}=    Log In - Demo App
${lp_login}=           xpath=//a[contains(text(), 'Log In')]
${lp_username}=        id=username
${lp_password}=        id=password
${lp_submit}=          xpath=//input[@value='Log In']
${lp_loggedinText}=    xpath=//h1[contains(text(), 'User Information')]

*** Keywords ***
Is Login Page Displayed
    Title Should Be     ${login_page_title}   message=title did not match, we are not on login page
    ${lp_location}	        Get Location
    Should Contain      ${lp_location}     ${login_page_url}

Login As User ${user} With Password ${pass}
    Log  User=${user}, and Pass=${pass}
    Scroll Element Into View    ${lp_username}
    Input Text      ${lp_username}     ${user}
    Scroll Element Into View    ${lp_password}
    Input Text      ${lp_password}     ${pass}
    Click Element   ${lp_submit}

Login Should Be Successful
    Wait Until Page Contains Element        ${lp_loggedinText}
    Page Should Contain Element             ${lp_loggedinText}
    ${cookie}=      Get Cookie      session
    Log     ${cookie}

Login Should Be Unsuccessful
    Is Error Page Displayed

