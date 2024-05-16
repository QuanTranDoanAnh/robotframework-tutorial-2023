*** Settings ***
Documentation    To validate the Login form
Library    OperatingSystem
Library    SeleniumLibrary
Test Setup        open the browser with the Mortgae payment url
Test Teardown    Close Browser Session
Resource         resources.robot

*** Variables ***
${Error_Message_Login}    css:.alert-danger
${Shop_page_load}        css:.nav-link

*** Test Cases ***
Validate UnSuccessful Login
    Fill the login Form    ${username}    ${invalid_password}
    wait until it checks and display error message
    verify error message is correct

Validate Cards display in the Shopping Page
    Fill the login Form    ${username}    ${valid_password}
    wait until Element is located in the page    ${Shop_page_load}
    Verify Card titles in the Shop page


*** Keywords ***
Fill the login Form
    [Arguments]    ${username}    ${password}
    Input Text        id:username    ${username}
    Input Password    id:password    ${password}
    Click Button      signInBtn

wait until it checks and display error message
    Wait Until Element Is Visible    ${Error_Message_Login}

verify error message is correct
    ${result}=    Get Text    ${Error_Message_Login}
    Should Be Equal As Strings    ${result}    Incorrect username/password.
    Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.

wait until Element is located in the page
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}

Verify Card titles in the Shop page
    @{expectedList}=    Create List    iphone X    Samsung Note 8    Nokia Edge    Blackberry
    ${elements}=    Get WebElements    css:.card-title
    FOR    ${element}    IN    @{elements}
        Log    ${element.text}
    END
