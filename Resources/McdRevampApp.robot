*** Settings ***
Documentation  This page object contains keywords within the Mc Donalds Knowledge Hub Application
#######################################################################################################################
#       Author:  Marnie Aguas
#       Date:  February 28, 2018
#       Revision History:
#######################################################################################################################
Library  SeleniumLibrary

Resource  ./PO/HomePage/LandingPage.robot
Resource  ./PO/HomePage/SignIn.robot
Resource  ./PO/HomePage/ForgotPassword.robot
Resource  ./PO/TutorialPage/SplashScreen.robot
Resource  ./PO/KnowledgeHub/CategoryPage.robot
Resource  ./PO/KnowledgeHub/PageHeader.robot
Resource  ./PO/KnowledgeHub/SearchResult.robot
Resource  ./PO/KnowledgeHub/LeftPanel.robot
Resource  ./PO/KnowledgeHub/RightPanel.robot
Resource  ./PO/KnowledgeHub/PageHeader.robot

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

Validate Forgot Password Facility
    ForgotPassword.Forgot Password Validation
    ForgotPassword.Close Forgot Password PopUp

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
#                                             CSV FILE
####################################################################################################################
Login With Valid Login Credentials CSV File
    [Arguments]  ${Credentials}
    Navigate The Homepage
    Attempt Login CSV File  ${Credentials}

Attempt Login CSV File
    [Arguments]  ${Credentials}
    SignIn.Enter Credentials Via CSV File  ${Credentials}
    SignIn.Click Submit

#####################################################################################################################
#                                          INPUT DATA
#####################################################################################################################
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
    CategoryPage.Admin Knowledge Hub Redirection

####################################################################################################################
#Knowledge Hub - Regular User
####################################################################################################################
Validate Regular User Knowledge Hub Category Page
    CategoryPage.Regular User Knowledge Hub Validation
    LeftPanel.Left Side Panel Validation
    RightPanel.Right Side Panel Validation
    PageHeader.Validate Page Header Objects

Compare Tile Content With Search List


Get Tile Name
    [Arguments]


####################################################################################################################
#Knowledge Hub Logout
####################################################################################################################
User Logout
    PageHeader.User Sign Out


####################################################################################################################
#Tutorial
####################################################################################################################
Redirect To Tutorial Via Help
    PageHeader.Clicking McD Site Tutorial

Redirect To Tutorial
    SplashScreen.Tutorial Page Redirection

Cancelling Non-display Of Tutorial
    SplashScreen.Clicking Cancel

Activate Never To See Tutorial
    SplashScreen.Activating Never To See Tutorial

Finish Tutorial
    SplashScreen.User Finishing Tutorial

Skipping Tutorial
    SplashScreen.User Skipping Tutorial

Deactivating Never To See Tutorial
    SplashScreen.Tutorial Page Redirection
    SplashScreen.User Deactivating Tutorial Clicked

#######################################################################################################################
#                               Search
#######################################################################################################################
Regular User Search Box Items Validation
    PageHeader.Regular User Search Box Validation

Searching Globally Using Icon
    PageHeader.Search Item Via Magnifying Lens
    SearchResult.Search Result Page Validation

Searching Globally All Option
    PageHeader.Search Item Via All Search Option


#Login with valid credentials
Login To The Site
    [Arguments]  ${UserData}
    SignIn.Fill Login And Submit  ${UserData}

Stop Test Suite
    Log  Stop Test Suite







