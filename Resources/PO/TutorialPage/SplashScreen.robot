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
    Wait Until Element Is Visible  css=#carousel-example-generic


Regular User Skipping Tutorial
    Wait Until Page Contains Element  ${TUTORIAL_DOT3}
    Click Element  ${TUTORIAL_DOT3}
    Wait Until Element Is Visible  ${TUTORIAL_FINISH_BTN}
    Click Element  ${TUTORIAL_FINISH_BTN}


Clicking Cancel
    Wait Until Element Is Visible  ${TUTORIAL_CANCEL_BTN}
    Click Element  ${TUTORIAL_CANCEL_BTN}
