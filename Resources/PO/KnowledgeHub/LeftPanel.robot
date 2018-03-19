*** Settings ***
Documentation  This contains the Mc Donalds Knowledge Hub Application Test Suites
#######################################################################################################################
#       Author:  Marnie Aguas
#       Date:  February 28, 2018
#       Revision History:
#######################################################################################################################
Library  SeleniumLibrary

*** Variables ***

*** Keywords ***
Left Side Panel Validation
    @{LEFT_PANEL}  Create List  ${KNOWLEDGE_HUB_ACTIVITY_FEED}  ${KNOWLEDGE_HUB_ACTIVITY_FEED_ICON}

    :FOR  ${PanelItem}  IN  @{LEFT_PANEL}
    \  Page Should Contain Element  ${PanelItem}
    \  Log  ${PanelItem}