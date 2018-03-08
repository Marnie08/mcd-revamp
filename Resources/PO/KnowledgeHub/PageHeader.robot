*** Settings ***
Documentation  This contains the Mc Donalds Knowledge Hub Application Test Suites
#######################################################################################################################
#       Author:  Marnie Aguas
#       Date:  February 28, 2018
#       Revision History:
#######################################################################################################################

*** Variables ***

*** Keywords ***
Validate Page Header Objects
    @{PAGE_HEADER}  Create List  ${PAGE_HEADER_SEARCHBOX}  ${PAGE_HEADER_SAVED_SEARCH}  ${PAGE_HEADER_HELP}  ${PAGE_HEADER_USER}

    :FOR  ${PHElement}  IN  @{PAGE_HEADER}
    \  Page Should Contain Element  ${PHElement}


User Sign Out
    Click Link  ${PAGE_HEADER_USER}
    Click Link  Log out