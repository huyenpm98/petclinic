*** Settings ***
Library    String
Resource    ../resources/HomePage.resource
Resource    ../resources/FindOwnersPage.resource
Test Setup  Given User open "Find owners" menu
Test Teardown   Close All Browsers

***Test Case***

Sc01: Warning message when fill forbidden data
    [Tags]     Sc01
    When User create owner first name:"toto", last name:"paul", adress:"une rue", city:"todo", telephone: "toto"
    Then A warning message display "numeric value out of bounds (<10 digits>.<0 digits> expected)"

Sc02: Create owner successfully
    [Tags]     Sc02
    When User create owner first name:"toto", last name:"paul", adress:"une rue", city:"todo", telephone: "0145874563"
    Then Table Owner information should displays
    And Name should same as Firstname and Lastname filled in previous screen
    And Address should same as Address filled in previous screen
    And City should same as City filled in previous screen
    And Telephone should same as Telephone filled in previous screen

Sc03: Search owner
    [Tags]     Sc03
    ${lastname}=  Generate Random String  10  [LETTERS]
    When User create owner first name:"preData", last name:"${lastname}", adress:"preData", city:"preData", telephone: "0145874565"
    Then Table Owner information should displays
    And Name should same as Firstname and Lastname filled in previous screen
    And Address should same as Address filled in previous screen
    And City should same as City filled in previous screen
    And Telephone should same as Telephone filled in previous screen
    When User search owner
    And User search for previously created owner
    Then Table Owner information should displays
    And Name should same as Firstname and Lastname filled in previous screen
    And Address should same as Address filled in previous screen
    And City should same as City filled in previous screen
    And Telephone should same as Telephone filled in previous screen




