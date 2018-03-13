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
Validate Page Header Objects
    @{PAGE_HEADER}  Create List  ${PAGE_HEADER_SEARCHBOX}  ${PAGE_HEADER_SAVED_SEARCH}  ${PAGE_HEADER_HELP}  ${PAGE_HEADER_USER}

    :FOR  ${PHElement}  IN  @{PAGE_HEADER}
    \  Page Should Contain Element  ${PHElement}


User Sign Out
    Sleep  30s
    Click Link  ${PAGE_HEADER_USER}
    Click Link  Log out

Clicking McD Site Tutorial
    Sleep  30s
    Click Link  ${PAGE_HEADER_HELP}
    Click Link   McD Site Tutorial

Regular User Search Box Validation
    Wait Until Element Is Visible    ${PAGE_HEADER_SAVED_SEARCH}
    Click Element

