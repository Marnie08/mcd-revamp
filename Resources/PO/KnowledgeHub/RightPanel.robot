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
Right Side Panel Validation
    @{RIGHT_PANEL}  Create list  ${KNOWLEDGE_HUB_RECENTLY_VIEWED}  ${KNOWLEDGE_HUB_RESOURCES}

    :FOR  ${RightItem}  IN  @{RIGHT_PANEL}
    \  Page Should Contain Element  ${RightItem}
    \  Log  ${RightItem}