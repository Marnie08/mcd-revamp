*** Settings ***
#######################################################################################################################
#       Author:  Marnie Aguas
#       Date:  February 28, 2018
#       Revision History:
#######################################################################################################################
Library  SeleniumLibrary

*** Variables ***

*** Keywords ***
Registration Form Validation
    Clicking New User Button


Clicking New User Button
    Wait Until Element Is Visible  ${SIGN_IN_NEW_USER}
    Click Element  ${SIGN_IN_NEW_USER}