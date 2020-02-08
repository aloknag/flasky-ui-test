*** Settings ***
Documentation    Keywords related to register page

Library             SeleniumLibrary
Variables           ../variables/variables.py
Resource            loginpage.robot

*** Variables ***
${register_page_url}=     register
${rp_page_title}=   Register - Demo App
${rp_username}=        id=username
${rp_password}=        id=password
${rp_firstname}=       id=firstname
${rp_lastname}=        id=lastname
${rp_phone}=           id=phone
${rp_submit}=          xpath=//input[@value='Register']
${rp_user_registered}=   already registered



*** Keywords ***
Is Register Page Displayed
    Title Should Be     ${rp_page_title}   message=title did not match, we are not on register page
    ${lp_location}	        Get Location
    Should Contain      ${lp_location}     ${register_page_url}

Register User
    [Arguments]     ${user}     ${pass}     ${fname}     ${lname}    ${ph_num}
    Scroll Element Into View    ${rp_username}
    Input Text      ${rp_username}     ${user}
    Scroll Element Into View    ${rp_password}
    Input Text      ${rp_password}     ${pass}
    Scroll Element Into View    ${rp_firstname}
    Input Text      ${rp_firstname}     ${fname}
    Scroll Element Into View    ${rp_lastname}
    Input Text      ${rp_lastname}     ${lname}
    Scroll Element Into View    ${rp_phone}
    Input Text      ${rp_phone}     ${ph_num}
    Click Element   ${rp_submit}

Registration Should Be Successful
    Is Login Page Displayed

Registration Should Fail
    Page Should Contain     ${rp_user_registered}

