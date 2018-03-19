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
Search Result Page Validation
    Results Panel Validation
    Search Box Validation
    Compare Search Category And The Existing Category

Results Panel Validation
    Sleep  45s
    Result Panel Partial Objects
    Page Should Contain  Global Search

Result Panel Partial Objects
    @{RESULT_PANEL}  Create List  ${SEARCH_RESULT_TITLE}  ${SEARCH_BACK}  ${SEARCH_SEARCHBOX}  ${SEARCH_SAVE}  ${SEARCH_MAG_LENS}
    :FOR  ${RPanelItem}  IN  @{RESULT_PANEL}
    \  Page Should Contain Element  ${RPanelItem}

Search Box Validation
    ${CorrectKeyword}  Get Text  ${SEARCH_SEARCHBOX}
    ${CorrectKeyword}  Convert To String  ${CorrectKeyword}
    Should Be Equal  ${SEARCH_ITEM}  ${CorrectKeyword}

Compare Search Category And The Existing Category
    Page Should Contain Element  ${SEARCH_CATEGORY_REGUSER}
    ${SearchCat}  Get Text  ${SEARCH_CATEGORY_REGUSER}
    ${SearchCat}  Convert To String  ${SearchCat}
    Left Panel Validation
    ${LeftCat}  Get Text  ${SEARCH_LEFT_CAT}
    ${LeftCat}  Convert To String  ${LeftCat}
    Should Be Equal  ${LeftCat}  ${SearchCat}


Left Panel Validation
    Page Should Contain Element  ${SEARCH_LEFT_ICON}
    Mouse Over  ${SEARCH_LEFT_ICON}
    Page Should Contain Element  ${SEARCH_LEFT_CAT}


Search Result