*** Settings ***
Documentation  This page object contains keywords within the Mc Donalds Knowledge Hub Application
#       Author:  Marnie Aguas
#       Date:  February 28, 2018
#       Revision History:


Resource  ./PO/HomePage/LandingPage.robot
Resource  ./PO/HomePage/SignIn.robot

*** Variables ***


*** Keywords ***
####################################################################################################################
# Homepage Validation
####################################################################################################################
Navigate The Homepage
    LandingPage.Load Landing Page
    LandingPage.Verify Loaded Landing Page

Validate Landing Page Banners
    LandingPage.Locate Landing Page Banners

Validate The Login Panel
    SignIn.Validate Login Panel

####################################################################################################################
#Login with invalid credentials
#   #Version 1 - External Data Source
####################################################################################################################
Login With Many Invalid Credentials
    [Arguments]  ${InvalidLoginScenarios}
    :FOR  ${LoginScenario}  IN  @{InvalidLoginScenarios}
    \  Navigate The Homepage
    \  Attempt Login CSV File  ${LoginScenario}
    \  Verify Login Page Error Message  ${LoginScenario}

    #Version 2 - Built In Data Source - Template
Test Multiple Login Scenarios
    [Arguments]  ${Credentials}
    Navigate The Homepage
    Attempt Login Input Data  ${Credentials}
    Verify Login Page Error Message  ${Credentials.ExpectedErrorMessage}

Verify Login Page Error Message
    [Arguments]  ${ExpectedErrorMessage}
    SignIn.Verify Error Message  ${ExpectedErrorMessage}

####################################################################################################################
#Login with valid credentials - Looping
####################################################################################################################
Login With Valid Credentials
    [Arguments]  ${ValidLoginScenarios}
    :FOR  ${LoginScenario}  IN  @{ValidLoginScenarios}
    \  Navigate The Homepage
    \  Attempt Login CSV File  ${LoginScenario}
    \  Valid User Redirection  ${LoginScenario}

####################################################################################################################
#Login with valid User Credentials - Any Type of User
####################################################################################################################
Login With Valid Login Credentials CSV File
    [Arguments]  ${Credentials}
    Navigate The Homepage
    Attempt Login CSV File  ${Credentials}

Attempt Login CVS File
    [Arguments]  ${Credentials}
    SignIn.Enter Credentials Via CSV File  ${Credentials}
    SignIn.Click Submit

Login With Valid Login Credentials Input Data
    [Arguments]  ${Credentials}
    Navigate The Homepage
    Attempt Login Input Data  ${Credentials}

Attempt Login Input Data
    [Arguments]  ${Credentials}
    SignIn.Enter Credentials Via Input Data  ${Credentials}
    SignIn.Click Submit

Redirection Page
    [Arguments]  ${UserType}
    Valid User Redirection  ${UserType}

####################################################################################################################
#Login with valid Regular User Credentials
####################################################################################################################
Login With Valid Regular User Credentials
    [Arguments]  ${ValidRegLoginScenarios}
    :FOR  ${LoginRegUser}  IN  @{ValidRegLoginScenarios}
    \  Valid Regular User Redirection  ${LoginRegUser}

####################################################################################################################
#User validation for Login - Looping
####################################################################################################################
Valid User Redirection
    [Arguments]  ${UserType}
    Run Keyword If      '${UserType[2]}' == 'admin'  Redirect To Knowledge Hub
    ...     ELSE IF     '${UserType[2]}' == 'regular user'  Redirect To Tutorial

Valid Admin User Redirection
    [Arguments]  ${UserType}
    Run Keyword If      '${UserType[2]}' == 'admin'  Knowledge Hub  ${UserType}
    ...     ELSE IF     '${UserType[2]}' == 'regular user'  Stop Test Suite

Valid Regular User Redirection
    [Arguments]  ${UserType}
    Run Keyword If      '${UserType[2]}' == 'regular user'  Tutorial  ${UserType}
    ...     ELSE IF     '${UserType[2]}' == 'admin'  Stop Test Suite

####################################################################################################################
#Knowledge Hub - Admin
####################################################################################################################
Redirect To Admin Knowledge Hub
    Sleep  45s
    Wait Until Page Contains Element  css=#myCarousel > div
    Admin Sign Out
    Log  Admin User

Admin Sign Out
    Click Link  css=#bs-example-navbar-collapse-1 > ul.nav.navbar-nav.navbar-right > li.dropdown.nav-useraccount > a
    Click Link  Log out

####################################################################################################################
#Tutorial
####################################################################################################################
Redirect To Tutorial
    Sleep  45s
    Wait Until Element Is Visible  css=#carousel-example-generic
    Log  Regular User


#Login with valid credentials
Login To The Site
    [Arguments]  ${UserData}
    SignIn.Fill Login And Submit  ${UserData}

Stop Test Suite
    Log  Stop Test Suite







