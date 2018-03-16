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
    Sleep  30s
    Page Should Contain Element  ${SEARCH_RESULT_TITLE}

Left Panel Validation


Search Result