*** Settings ***
Documentation       Keywords related to user's page
Library             SeleniumLibrary

*** Variables ***
${users_page_url}=        user
${ud_page_title}=       User Information - Demo App
${ud_logout}=          xpath=//a[contains(text(), 'Log Out')]
${ud_username}=        id=username
${ud_firstname}=       id=firstname
${ud_lastname}=        id=lastname
${ud_phone}=           id=phone


*** Keywords ***
Verify User Details
    [Arguments]      ${user}    ${fname}   ${lname}    ${ph}
    Element Text Should Be      ${ud_username}      ${user}      message=username did not match
    Element Text Should Be      ${ud_firstname}     ${fname}     message=firstname did not match
    Element Text Should Be      ${ud_lastname}      ${lname}     message=lastname did not match
    Element Text Should Be      ${ud_phone}         ${ph}        message=phone number did not match

Log Out User
    Wait Until Page Contains Element        ${ud_logout}
    Click Element    ${ud_logout}
    Is Home Page Displayed


Is User Details Page Displayed
    Title Should Be     ${ud_page_title}   message=title did not match, we are not on user details page
    ${ud_location}	        Get Location
    Should Contain      ${ud_location}     ${users_page_url}