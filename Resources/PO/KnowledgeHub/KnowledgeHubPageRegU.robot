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
    Sleep  15s
    Wait Until Page Contains Element  css=#myCarousel > div