*** Settings ***
Documentation       keywords for error page
Library             SeleniumLibrary

*** Variables ***
${error_page_url}=        error
${error_page_title}=    Login Failure - Demo App
${error_text}=      xpath=//h1[contains(text(), 'Login Failure')]


*** Keywords ***
Is Error Page Displayed
    Title Should Be     ${error_page_title}   message=title did not match, we are not on error page
    ${e_location}	        Get Location
    Should Contain      ${e_location}     ${error_page_url}
    Wait Until Page Contains Element        ${error_text}
    Page Should Contain Element             ${error_text}