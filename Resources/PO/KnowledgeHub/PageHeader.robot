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
    Sleep  10s
    Wait Until Element Is Visible    ${PAGE_HEADER_SEARCHBOX}
    Click Element  ${PAGE_HEADER_SEARCHBOX}
    Search Box List Items

Search Box List Items
    ${Search_Box_Items}  Get Element Count  //*[@id="bs-example-navbar-collapse-1"]/ul[1]/li[1]/form/div[2]/ul
    Log  ${Search_Box_Items}

