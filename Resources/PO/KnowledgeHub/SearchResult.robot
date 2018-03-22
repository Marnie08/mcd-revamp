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
    Validation Of Search Results
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
    Sleep  45s
    Wait Until Element Is Visible  ${SEARCH_SEARCHBOX}
    ${SearchText}  Get Element Attribute  ${SEARCH_SEARCHBOX}  value
    ${SearchText}  Convert To String  ${SearchText}
    Should Be Equal  ${SEARCH_ITEM}  ${SearchText}

Compare Search Category And The Existing Category
    Left Panel Validation
    ${LeftCat}  Get Text   ${SEARCH_LEFT_CAT}
    Should Be Equal As Strings  ${LeftCat}  ${KNOWLEDGE_HUB_SPEC_LIB}  ignore_case=True


Left Panel Validation
    Page Should Contain Element  ${SEARCH_LEFT_ICON}
    Mouse Over  ${SEARCH_LEFT_ICON}
    Wait Until Element Is Visible  ${SEARCH_LEFT_CAT}
    Mouse Out  ${SEARCH_LEFT_ICON}
    Sleep  15s


Validation Of Search Results
    Page Should Contain  ${KNOWLEDGE_HUB_SPEC_LIB}
    Page Should Contain Element  xpath=//*[@id="global-search-result"]/uib-accordion/div/li
    Wait Until Element Is Visible  ${SEARCH_CATEGORY_REGUSER}
    Click Element  ${SEARCH_CATEGORY_REGUSER}
    Wait Until Element Is Visible  ${SEARCH_DRILLDOWN}
    Click Element  ${SEARCH_DRILLDOWN}

