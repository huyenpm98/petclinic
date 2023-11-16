*** Settings ***
Library         SeleniumLibrary
Resource    ../resources/HomePage.resource

*** Variables ***
${searchOwnerForm}       id=search-owner-form
${btnFindOwners}      css=a[href="/owners/find"]
${btnAddOwner}      css=a[href='/owners/new']
${addOwnerForm}      id=add-owner-form
${txtFirstname}     id=firstName
${txtLastname}     id=lastName
${txtAddress}     id=address
${txtCity}     id=city
${txtTelephone}     id=telephone
${btnSubmit}     css=button[type='submit']
${msgError}     css=span.help-inline
${tableNewOwnerInfo}     xpath=//h2[contains(text(),'Owner')]
${lblName}     xpath=//th[text()='Name']/following::b
${lblAddress}     xpath=//th[text()='Address']/following::td[1]
${lblCity}     xpath=//th[text()='City']/following::td[1]
${lblTelephone}     xpath=//th[text()='Telephone']/following::td[1]

*** Keywords ***

User search owner
    Click Element    ${btnFindOwners}
    Wait Until Element Is Visible    ${searchOwnerForm}     timeout=5

User open "Find owners" menu
    User open petclinic website
    Click Element    ${btnFindOwners}
    Wait Until Element Is Visible    ${searchOwnerForm}     timeout=5

User click button Add owner
    Click Element       ${btnAddOwner}
    Wait Until Element Is Visible    ${addOwnerForm}     timeout=5

User input firstname
    [Arguments]  ${firstname}
    IF    "${firstname}" != "${EMPTY}"
         Input Text      ${txtFirstname}      ${firstname}
    END

User input lastname
    [Arguments]  ${lastname}
    IF    "${lastname}" != "${EMPTY}"
         Input Text      ${txtLastname}      ${lastname}
    END

User input address
    [Arguments]  ${address}
    IF    "${address}" != "${EMPTY}"
         Input Text      ${txtAddress}      ${address}
    END

User input city
    [Arguments]  ${city}
    IF    "${city}" != "${EMPTY}"
         Input Text      ${txtCity}      ${city}
    END

User input telephone
    [Arguments]  ${telephone}
    IF    "${telephone}" != "${EMPTY}"
         Input Text      ${txtTelephone}      ${telephone}
    END

User click button Create owner
    Click Element       ${btnSubmit}

User create owner first name:"${firstname}", last name:"${lastname}", adress:"${address}", city:"${city}", telephone: "${telephone}"
    Set global variable  ${firstname}  ${firstname}
    Set global variable  ${lastname}  ${lastname}
    Set global variable  ${address}  ${address}
    Set global variable  ${city}  ${city}
    Set global variable  ${telephone}  ${telephone}

    User click button Add owner
    User input firstname    ${firstname}
    User input lastname    ${lastname}
    User input address    ${address}
    User input city    ${city}
    User input telephone    ${telephone}
    User click button Create owner

A warning message display "${error}"
    Element Should Be Visible    ${msgError}
    Element Text Should Be    ${msgError}    ${error}

Verify user's information is correct
    Element Should Be Visible       ${tableNewOwnerInfo}
    ${name} =   Catenate    ${firstname}   ${lastname}
    Element Text Should Be    ${lblName}    ${name}
    Element Text Should Be    ${lblAddress}    ${address}
    Element Text Should Be    ${lblCity}    ${city}
    Element Text Should Be    ${lblTelephone}    ${telephone}

User search for previously created owner
    User input lastname     ${lastname}
    Click Element       ${btnSubmit}
    Element Should Be Visible       ${tableNewOwnerInfo}
















