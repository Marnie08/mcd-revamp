*** Settings ***
Documentation  This Homepage page object contains keywords about the page's Login facility.
#######################################################################################################################
#       Author:  Marnie Aguas
#       Date:  February 28, 2018
#       Revision History:
#######################################################################################################################

Library  SeleniumLibrary

*** Variables ***
${SIGN_IN_USERNAME_FIELD}       css=#PlaceHolderMain_Login2_UserName
${SIGN_IN_PASSWORD}             css=#PlaceHolderMain_Login2_Password
${SIGN_IN_SUBMIT}               css=#SubmitLogin
${SIGN_IN_FORGOT_PASSWORD}      css=#PlaceHolderMain_Login2_ForgotPassword1_forgotPasswordTextLbl
${SIGN_IN_NEW_USER}             css=#LoginContainers > div:nth-child(3) > button
${SIGN_IN_LOGO}                 css=body > div > div > div.col-md-12 > div.login > div.col-md-4.col-xs-12.login-form.text-center > div.login-logo


*** Keywords ***
# Sign In Panel form objects validation
Validate Login Panel
    Validate Panel Content

Validate Panel Content
    @{SIGN_IN_ELEMENTS}  Create List  ${SIGN_IN_USERNAME_FIELD}  ${SIGN_IN_PASSWORD}  ${SIGN_IN_SUBMIT}  ${SIGN_IN_FORGOT_PASSWORD}  ${SIGN_IN_NEW_USER}  ${SIGN_IN_LOGO}

    :FOR  ${SignIn_Element}  IN  @{SIGN_IN_ELEMENTS}
    \  Look For Sign In Element  ${SignIn_Element}

Look For Sign In Element
    [Arguments]  ${PassedSIElement}
    page should contain element  ${PassedSIElement}

#Login with valid and invalid credentials
Enter Credentials Via CSV File
    [Arguments]  ${Credentials}
    Run Keyword Unless  '${Credentials[0]}' == '#BLANK'  Input Text  ${SIGN_IN_USERNAME_FIELD}  ${Credentials[0]}
    Run Keyword Unless  '${Credentials[1]}' == '#BLANK'  Input Password  ${SIGN_IN_PASSWORD}  ${Credentials[1]}

Enter Credentials Via Input Data
    [Arguments]  ${Credentials}
    Run Keyword Unless  '${Credentials.Username}' == '#BLANK'  Input Text  ${SIGN_IN_USERNAME_FIELD}  ${Credentials.Username}
    Run Keyword Unless  '${Credentials.Password}' == '#BLANK'  Input Password  ${SIGN_IN_PASSWORD}  ${Credentials.Password}

Click Submit
    Click Button  ${SIGN_IN_SUBMIT}

Verify Error Message
    [Arguments]  ${ExpectedErrorMessage}
    Page Should Contain  ${ExpectedErrorMessage[2]}

Clear Input Fields
    Clear Element Text  ${SIGN_IN_USERNAME_FIELD}
    Clear Element Text  ${SIGN_IN_PASSWORD}


#Login with valid credentails
Fill Login And Submit
    [Arguments]  ${UserData}
    Fill Username  ${UserData.Username}
    Fill Password  ${UserData.Password}
    Click Button  ${SIGN_IN_SUBMIT}
    Sleep  5s

Fill Username
    [Arguments]  ${Username}
    Input Text  ${SIGN_IN_USERNAME_FIELD}  ${Username}

Fill Password
    [Arguments]  ${Password}
    Input Password  ${SIGN_IN_PASSWORD}  ${Password}