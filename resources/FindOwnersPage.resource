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
${tableOwnerInfo}     xpath=//h2[text()='Owner Information']
${lblName}     xpath=//th[text()='Name']/following::b
${lblAddress}     xpath=//th[text()='Address']/following::td[1]
${lblCity}     xpath=//th[text()='City']/following::td[1]
${lblTelephone}     xpath=//th[text()='Telephone']/following::td[1]

*** Keywords ***

User search owner
    [Documentation]    Click button "Find owners" on navigation bar
    Click Element    ${btnFindOwners}
    Wait Until Element Is Visible    ${searchOwnerForm}     timeout=5

User open "Find owners" menu
    [Documentation]    Open website
    ...                Click button "Find owners" on navigation bar
    ...                Wait until search owner form displays
    User open petclinic website
    Click Element    ${btnFindOwners}
    Wait Until Element Is Visible    ${searchOwnerForm}     timeout=5

User click button Add owner
    [Documentation]    Click button "Add owner"
    Click Element       ${btnAddOwner}
    Wait Until Element Is Visible    ${addOwnerForm}     timeout=5

User input firstname
    [Documentation]    Enter firstname if value is not empty
    [Arguments]  ${firstname}
    IF    "${firstname}" != "${EMPTY}"
         Input Text      ${txtFirstname}      ${firstname}
    END

User input lastname
    [Documentation]    Enter lastname if value is not empty
    [Arguments]  ${lastname}
    IF    "${lastname}" != "${EMPTY}"
         Input Text      ${txtLastname}      ${lastname}
    END

User input address
    [Documentation]    Enter address if value is not empty
    [Arguments]  ${address}
    IF    "${address}" != "${EMPTY}"
         Input Text      ${txtAddress}      ${address}
    END

User input city
    [Documentation]    Enter city if value is not empty
    [Arguments]  ${city}
    IF    "${city}" != "${EMPTY}"
         Input Text      ${txtCity}      ${city}
    END

User input telephone
    [Documentation]    Enter telephone if value is not empty
    [Arguments]  ${telephone}
    IF    "${telephone}" != "${EMPTY}"
         Input Text      ${txtTelephone}      ${telephone}
    END

User click button Create owner
    [Documentation]    Click button "Add owner"
    Click Element       ${btnSubmit}

User create owner first name:"${firstname}", last name:"${lastname}", adress:"${address}", city:"${city}", telephone: "${telephone}"
    [Documentation]    Set global variables for owner information
    ...                Enter info into form and click button "Add owner"
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
    [Documentation]    Verify warning message as expected message
    Element Should Be Visible    ${msgError}
    Element Text Should Be    ${msgError}    ${error}

Table Owner information should displays
    [Documentation]    Verify "Owner Information" table displays
    Element Should Be Visible       ${tableOwnerInfo}

Name should same as Firstname and Lastname filled in previous screen
    [Documentation]    Verify "Name" field corresponds to Firstname and Lastname
    ${name} =   Catenate    ${firstname}   ${lastname}
    Element Text Should Be    ${lblName}    ${name}

Address should same as Address filled in previous screen
    [Documentation]    Verify "Address" field corresponds to Address
    Element Text Should Be    ${lblAddress}    ${address}

City should same as City filled in previous screen
    [Documentation]    Verify "City" field corresponds to City
    Element Text Should Be    ${lblCity}    ${city}

Telephone should same as Telephone filled in previous screen
    [Documentation]    Verify "Telephone" field corresponds to Telephone
    Element Text Should Be    ${lblTelephone}    ${telephone}

User search for previously created owner
    [Documentation]    Search owner with Lastname
    ...                Wait until owner information table displays
    User input lastname     ${lastname}
    Click Element       ${btnSubmit}
    Element Should Be Visible       ${tableOwnerInfo}
















