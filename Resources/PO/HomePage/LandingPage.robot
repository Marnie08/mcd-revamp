*** Settings ***
Documentation  This Homepage page object contains keywords for the landing page.
#       Author:  Marnie Aguas
#       Date:  February 28, 2018
#       Revision History:

Library  SeleniumLibrary


*** Variables ***
${LANDING_PAGE_BANNER}      Welcome to McDonald’s
${LANDING_PAGE_LABEL}       css=body > div > div > div.col-md-12 > div.login > div.col-md-8.col-xs-12.login-hero > h4
${LANDING_PAGE_CONTACT}     css=body > div > div > div.col-md-12 > div.login > div.col-md-8.col-xs-12.login-hero > p

*** Keywords ***
#Load The Landing Page
Chrome Landing Page
    go to  ${URL.${ENVIRONMENT}}

Internet Explorer Landing Page
    go to  ${URL.${ENVIRONMENT}}

Firefox Landing Page
    go to  ${URL.${ENVIRONMENT}}

Load Landing Page
    Run Keyword If      '${BROWSER}' == 'chrome'      Chrome Landing Page
    ...     ELSE IF     '${BROWSER}' == 'Firefox'     Firefox Landing Page
    ...     ELSE IF     '${BROWSER}' == 'IE'          Internet Explorer Landing Page

Verify Loaded Landing Page
    wait until page contains  ${LANDING_PAGE_BANNER}

Locate Landing Page Banners
    @{LANDING_ELEMENTS}  Create List  ${LANDING_PAGE_LABEL}  ${LANDING_PAGE_CONTACT}

    :FOR  ${Landing_Banner}  IN  @{LANDING_ELEMENTS}
    \  Look For Landing Element  ${Landing_Banner}

Look For Landing Element
    [Arguments]  ${PassedLandElement}
    page should contain element  ${PassedLandElement}