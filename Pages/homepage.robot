*** Settings ***
Documentation       Keywords for home page
Library             SeleniumLibrary


*** Variables ***
${home_page_title}=      index page - Demo App
${hp_register}=        xpath=//a[contains(text(), 'Register')]
${hp_login}=           xpath=//a[contains(text(), 'Log In')]


*** Keywords ***
Is Home Page Displayed
    Title Should Be     ${home_page_title}   message=title did not match, we are not on index page

Go To Login Page
    Wait Until Page Contains Element        ${hp_login}
    Click Element   ${hp_login}

Go To Register Page
    Wait Until Page Contains Element        ${hp_register}
    Click Element   ${hp_register}