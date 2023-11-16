*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${URL}  https://petclinic.justdev.tech/
${imgWelcome}       css=img.img-responsive

*** Keywords ***
User open petclinic website
    Open Browser    ${URL}  chrome
    Maximize Browser Window
    Wait Until Element Is Visible    ${imgWelcome}     timeout=5


Close all browser








