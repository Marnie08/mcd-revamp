*** Settings ***
Documentation  This contains the Mc Donalds Knowledge Hub Application Test Suites
#######################################################################################################################
#       Author:  Marnie Aguas
#       Date:  February 28, 2018
#       Revision History:
#######################################################################################################################

Resource  ../Data/InputData.robot
Resource  ../Resources/DataManager.robot
Resource  ../Resources/CommonWeb.robot
Resource  ../Resources/McdRevampApp.robot

Test Setup  CommonWeb.Begin Web Test
Test Teardown  CommonWeb.End Web Test

# robot -d results/Test0 Tests/McdRevamp.robot
# robot -d results/dictionary -v BROWSER:chrome -v ENVIRONMENT:qa Tests/McdRevamp.robot
# robot -d results/invalidExt -i InvalidExternal -v BROWSER:chrome -v ENVIRONMENT:qa Tests/McdRevamp.robot
# robot -d results/validCredentials6 -i ValidCredentials -v BROWSER:chrome -v ENVIRONMENT:qa Tests/McdRevamp.robot
# robot -d results/PopupIE -i ValidCredentials -v BROWSER:ie -v ENVIRONMENT:qa Tests/McdRevamp.robot
# robot -d results/ValidLogin -i Sample1 -v BROWSER:chrome -v ENVIRONMENT:qa Tests/McdRevamp.robot

*** Variables ***

*** Test Cases ***
#######################################################################################################################
#   VAIDATIONS
#######################################################################################################################
Logged out user should be able to load the Mc Donalds Homepage.
    [Documentation]  Test Suite 1
    [Tags]  Test1
    McdRevampApp.Navigate The Homepage

Logged out user should be able to navigate the Mc Donalds Homepage.
    [Documentation]  Test Suite 2
    [Tags]  ForgotPassword
    McdRevampApp.Navigate The Homepage
    McdRevampApp.Validate Landing Page Banners
    McdRevampApp.Validate The Login Panel
    McdRevampApp.Validate Forgot Password Facility

User should see correct error message with invalid login credentials
    [Tags]  InvalidCredentials
    ${InvalidLoginScenarios}  DataManager.Get Csv Data  ${INVALID_CREDENTIALS_PATH_CSV}
    McdRevampApp.Login With Many Invalid Credentials  ${InvalidLoginScenarios}

#User should be able to login with valid credentials
   # [Tags]  ValidCredentials
   # ${ValidLoginScenarios}  DataManager.Get Csv Data  ${VALID_CREDENTIALS_PATH_CSV}
   # McdRevampApp.Login With Valid Credentials  ${ValidLoginScenarios}
#######################################################################################################################
#                                              Admin User Test Suite
#######################################################################################################################
Admin User should be able to login with valid ADMIN login credentials.
    [Documentation]  Test Suite 3
    [Tags]  TestAdmin  Sample1
    McdRevampApp.Login With Valid Login Credentials Input Data  ${ADMIN_USER}
    McdRevampApp.Redirect To Admin Knowledge Hub
    McdRevampApp.User Logout

#######################################################################################################################
#                                              Regular User Test Suite
#######################################################################################################################
Regular User should be able to login with valid Regular User login credentials.
    [Documentation]  Test Suite 3
    [Tags]  RegUserKH  Sample2
    McdRevampApp.Login With Valid Login Credentials Input Data  ${REGULAR_USER}
    McdRevampApp.Redirect To Tutorial
    McdRevampApp.Finish Tutorial
    McdRevampApp.User Logout

Regular User should be able to view "Main Tutorial Page" every successful login.
    [Documentation]  Test Suite 4
    [Tags]  TutorialCancel  Sample2
    McdRevampApp.Login With Valid Login Credentials Input Data  ${REGULAR_USER}
    McdRevampApp.Redirect To Tutorial
    McdRevampApp.Cancelling Non-display Of Tutorial
    McdRevampApp.Finish Tutorial
    McdRevampApp.User Logout

Regular User should be able to skip tutorial when skip button is clicked.
    [Documentation]  Test Suite 5
    [Tags]  TutorialRUSkip  Sample2
    McdRevampApp.Login With Valid Login Credentials Input Data  ${REGULAR_USER}
    McdRevampApp.Redirect To Tutorial
    SplashScreen.User Skipping Tutorial
    McdRevampApp.User Logout

Regular User should be able to view limited number of tiles on the Knowledge Hub Page.
    [Documentation]  Test Suite 5
    [Tags]  KHValidation  Sample2
    McdRevampApp.Login With Valid Login Credentials Input Data  ${REGULAR_USER}
    McdRevampApp.Redirect To Tutorial
    McdRevampApp.Finish Tutorial
    McdRevampApp.Validate Regular User Knowledge Hub Page
    McdRevampApp.User Logout


#######################################################################################################################
#                                    QFL/QML/Facility Governance Test Suite
#######################################################################################################################
QFL User should be able to login with valid Regular User login credentials.
    [Documentation]  Test Suite 3
    [Tags]  TestRegStd  SampleQFL
    McdRevampApp.Login With Valid Login Credentials Input Data  ${QFL_QML_FACILITY_GOVERNANCE}
    McdRevampApp.Redirect To Tutorial
    McdRevampApp.Finish Tutorial
    McdRevampApp.User Logout

QFL User should be able to view "Main Tutorial Page" every successful login.
    [Documentation]  Test Suite 4
    [Tags]  TutorialCancel  SampleQFL
    McdRevampApp.Login With Valid Login Credentials Input Data  ${QFL_QML_FACILITY_GOVERNANCE}
    McdRevampApp.Redirect To Tutorial
    McdRevampApp.Cancelling Non-display Of Tutorial
    McdRevampApp.Finish Tutorial
    McdRevampApp.User Logout

QFL User should be able to skip tutorial when skip button is clicked.
    [Documentation]  Test Suite 5
    [Tags]  TutorialSkip  SampleQFL
    McdRevampApp.Login With Valid Login Credentials Input Data  ${QFL_QML_FACILITY_GOVERNANCE}
    McdRevampApp.Redirect To Tutorial
    SplashScreen.User Skipping Tutorial
    McdRevampApp.User Logout

QFL User should be able to have an option to de-activate Tutorial.
    [Documentation]  Test Suite 5
    [Tags]  TutorialDeactivate  SampleQFL
    McdRevampApp.Login With Valid Login Credentials Input Data  ${QFL_QML_FACILITY_GOVERNANCE}
    McdRevampApp.Redirect To Tutorial
    McdRevampApp.Activating Never To See Tutorial
    McdRevampApp.User Logout

QFL User should be able to activate tutorial via Knowledge Hub Help.
    [Documentation]  Test Suite 5
    [Tags]  TutorialDeactivate  SampleQFL
    McdRevampApp.Login With Valid Login Credentials Input Data  ${QFL_QML_FACILITY_GOVERNANCE}
    McdRevampApp.Redirect To Tutorial Via Help
    McdRevampApp.Deactivating Never To See Tutorial
    McdRevampApp.User Logout

#Main Tutorial Page should not be shown if "Never show this again" is ticked.
#    [Documentation]  Test Suite 5
#    [Tags]  TutorialCancel  Sample2
