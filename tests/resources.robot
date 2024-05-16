*** Settings ***
Documentation      A resource file with reusable keywords and variables.
...                
...                The system specific keywords created here from our own
...                domain specific language. They utilize keywords provided
...                by the imported SeleniumLibrary.
Library            SeleniumLibrary
Library            OperatingSystem

*** Variables ***
${username}    rahulshettyacademy
${invalid_password}    12345678
${valid_password}    learning
${url}            https://rahulshettyacademy.com/loginpagePractise/
*** Keywords ***
open the browser with the Mortgae payment url
    Create Webdriver    Chrome
    Go To    ${url}

Close Browser Session
    Close Browser