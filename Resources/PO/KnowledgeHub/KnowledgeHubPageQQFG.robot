*** Settings ***
#######################################################################################################################
#       Author:  Marnie Aguas
#       Date:  February 28, 2018
#       Revision History:
#######################################################################################################################

*** Variables ***

*** Keywords ***
Admin Knowledge Hub Redirection
    Sleep  45s
    Wait Until Page Contains Element  css=#myCarousel > div

