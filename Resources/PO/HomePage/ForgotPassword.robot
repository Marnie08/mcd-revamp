*** Settings ***
Documentation  This Homepage page object contains keywords for Forgot Password.
#######################################################################################################################
#       Author:  Marnie Aguas
#       Date:  February 28, 2018
#       Revision History:
#######################################################################################################################
Library  SeleniumLibrary

*** Variables ***

*** Keywords ***
Forgot Password Validation
    Clicking Forgot Password
    Validate Loaded Forgot Password

Close Forgot Password PopUp
    Close PopUp

Clicking Forgot Password
    Click Link  ${SIGNIN_FORGOT_PASSWORD}

Validate Loaded Forgot Password
    @{FORGOTP_ELEMENTS}  Create List  ${FORGOT_PASSWORD_SUBMIT_BTN}  ${FORGOT_PASSWORD_TEXTBOX}  ${FORGOT_PASSWORD_POPUP}

    :FOR  ${ForgotPObject}  IN  @{FORGOTP_ELEMENTS}
    \  Page Should Contain Element  ${ForgotPObject}

Close PopUp
    Page Should Contain Element  ${FORGOT_PASSWORD_CLOSE}
    Wait Until Element Is Visible  ${FORGOT_PASSWORD_CLOSE}
    Click Element  ${FORGOT_PASSWORD_CLOSE}