*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${URL}  https://petclinic.justdev.tech/
${imgWelcome}       css=img.img-responsive

*** Keywords ***
User open petclinic website
    [Documentation]    Open and wait until homepage display
    Open Browser    ${URL}  chrome
    Maximize Browser Window
    Wait Until Element Is Visible    ${imgWelcome}     timeout=5







