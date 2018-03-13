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
    Clicking Last Dot
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

Clicking Cancel
    Clicking Last Dot
    Wait Until Element Is Visible  ${TUTORIAL_NEVER_BOX}
    Click Element  ${TUTORIAL_NEVER_BOX}
    Wait Until Element Is Visible  ${TUTORIAL_CANCEL_BTN}
    Click Element  ${TUTORIAL_CANCEL_BTN}
    Clicking Last Dot

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
    Wait Until Page Contains Element  ${TUTORIAL_DOT3}
    Click Element  ${TUTORIAL_DOT3}

Clicking Checkbox
    Page Should Contain Checkbox  ${TUTORIAL_NEVER_BOX}
    Wait Until ELement Is Visible  ${TUTORIAL_NEVER_BOX}
    Click Element  ${TUTORIAL_NEVER_BOX}



