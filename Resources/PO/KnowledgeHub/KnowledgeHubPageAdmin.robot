*** Settings ***
#######################################################################################################################
#       Author:  Marnie Aguas
#       Date:  February 28, 2018
#       Revision History:
#######################################################################################################################
Library  SeleniumLibrary

*** Variables ***

*** Keywords ***
Admin Knowledge Hub Redirection
    Sleep  45s
    Wait Until Page Contains Element  xpath=//*[@id="0"]/div[1]


