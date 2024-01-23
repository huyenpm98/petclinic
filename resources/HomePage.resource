*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${URL}  https://petclinic.justdev.tech/
${imgWelcome}       css=img.img-responsive

*** Keywords ***
User open petclinic website
    [Documentation]    Open and wait until homepage display
    ${chrome_options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    test-type
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Create Webdriver    Chrome    chrome_options=${chrome_options}
    Open Browser    ${URl}    chrome    options=${chrome_options}
#    Open Browser    ${URL}  chrome
    Maximize Browser Window
    Wait Until Element Is Visible    ${imgWelcome}     timeout=5







