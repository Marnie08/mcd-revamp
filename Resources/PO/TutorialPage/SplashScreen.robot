*** Settings ***
Documentation  This layer handles keywords for the Tutorial Splash Screen
#######################################################################################################################
#       Author:  Marnie Aguas
#       Date:  February 28, 2018
#       Revision History:
#######################################################################################################################

Library  SeleniumLibrary

*** Variables ***

*** Keywords ***
Tutorial Page Redirection
    Sleep  45s
    Wait Until Element Is Visible  ${TUTORIAL_CAROUSEL}

User Finishing Tutorial
    Get Picture And Dot Count
    Clicking Finish Button

Activating Never To See Tutorial
    Get Picture And Dot Count
    Clicking Checkbox
    Clicking Finish Button


Clicking Finish Button
    Wait Until Element Is Visible  ${TUTORIAL_FINISH_BTN}
    Click Element  ${TUTORIAL_FINISH_BTN}

User Skipping Tutorial
    Wait Until Element Is Visible  ${TUTORIAL_SKIP_BTN}
    Click Element  ${TUTORIAL_SKIP_BTN}
    Wait Until Page Contains  ${TUTORIAL_SKIP_MSG}
    Wait Until Page Contains  ${TUTORIAL_NEVER_MSG}
    Clicking Finish Button

Get Picture And Dot Count
    ${PicCount}  Get Element Count  xpath=//*[@id="carousel-example-generic"]/div/div
    Log  ${PicCount}
    ${DotCount}  Get Element Count  xpath=//*[@id="carousel-example-generic"]/ol/li
    Run Keyword If  ${PicCount} == ${DotCount}  Clicking Last Dot  ${DotCount}

Clicking Cancel
    Get Picture And Dot Count
    Wait Until Element Is Visible  ${TUTORIAL_NEVER_BOX}
    Click Element  ${TUTORIAL_NEVER_BOX}
    Wait Until Element Is Visible  ${TUTORIAL_CANCEL_BTN}
    Click Element  ${TUTORIAL_CANCEL_BTN}
    Get Picture And Dot Count


User Deactivating Tutorial Clicked
    Wait Until Element Is Visible  ${TUTORIAL_SKIP_BTN}
    Click Element  ${TUTORIAL_SKIP_BTN}
    Wait Until Page Contains  ${TUTORIAL_SKIP_MSG}
    Wait Until Page Contains  ${TUTORIAL_NEVER_MSG}
    ${passed}  Run Keyword And Return Status  Checkbox Clicked
    Run Keyword If  ${passed}  Clicking Checkbox
    Clicking Finish Button

Checkbox Clicked
    Page Should Contain Checkbox  ${TUTORIAL_NEVER_BOX}
    Wait Until Element Is Visible  ${TUTORIAL_NEVER_BOX}
    Checkbox Should Be Selected  ${TUTORIAL_NEVER_BOX}

Clicking Last Dot
    [Arguments]  ${LastDot}
    Wait Until Page Contains Element  xpath=//*[@id="carousel-example-generic"]/ol/li[${LastDot}]
    Click Element  xpath=//*[@id="carousel-example-generic"]/ol/li[${LastDot}]

Clicking Checkbox
    Page Should Contain Checkbox  ${TUTORIAL_NEVER_BOX}
    Wait Until ELement Is Visible  ${TUTORIAL_NEVER_BOX}
    Click Element  ${TUTORIAL_NEVER_BOX}



