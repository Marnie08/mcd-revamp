*** Settings ***
Documentation  This contains the Mc Donalds Knowledge Hub Application Test Suites
#       Author:  Marnie Aguas
#       Date:  February 28, 2018
#       Revision History:

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

*** Variables ***

*** Test Cases ***
Logged out user should be able to load the Mc Donalds Homepage.
    [Documentation]  Test Suite 1
    [Tags]  Test0
    McdRevampApp.Navigate The Homepage

Logged out user should be able to navigate the Mc Donalds Homepage.
    [Documentation]  Test Suite 2
    [Tags]  Test1
    McdRevampApp.Navigate The Homepage
    McdRevampApp.Validate Landing Page Banners
    McdRevampApp.Validate The Login Panel

User should see correct error message with invalid login credentials
    [Tags]  InvalidCredentials
    ${InvalidLoginScenarios}  DataManager.Get Csv Data  ${INVALID_CREDENTIALS_PATH_CSV}
    McdRevampApp.Login With Many Invalid Credentials  ${InvalidLoginScenarios}

User should be able to login with valid credentials
    [Tags]  ValidCredentials
    ${ValidLoginScenarios}  DataManager.Get Csv Data  ${VALID_CREDENTIALS_PATH_CSV}
    McdRevampApp.Login With Valid Credentials  ${ValidLoginScenarios}

Admin User should be able to login with valid ADMIN login credentials.
    [Documentation]  Test Suite 3
    [Tags]  TestAdmin  Sample1
    McdRevampApp.Login With Valid Login Credentials Input Data  ${ADMIN_USER}
    McdRevampApp.Redirect To Admin Knowledge Hub

Regular User should be able to login with valid Regular User login credentials.
    [Documentation]  Test Suite 3
    [Tags]  TestRegStd  Sample1
    McdRevampApp.Login With Valid Login Credentials Input Data  ${REGULAR_USER}
    McdRevampApp.Redirect To Tutorial