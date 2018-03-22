*** Settings ***
Documentation  This Homepage page object contains keywords for the landing page.
#######################################################################################################################
#       Author:  Marnie Aguas
#       Date:  February 28, 2018
#       Revision History:
#######################################################################################################################
Library  SeleniumLibrary


*** Variables ***


*** Keywords ***
#Load The Landing Page
Chrome Landing Page
    Go To  ${URL.${ENVIRONMENT}}

Internet Explorer Landing Page
    Go To  ${URL.${ENVIRONMENT}}

Firefox Landing Page
    Go To  ${URL.${ENVIRONMENT}}

Load Landing Page
    Run Keyword If      '${BROWSER}' == 'chrome'      Chrome Landing Page
    ...     ELSE IF     '${BROWSER}' == 'ff'     Firefox Landing Page
    ...     ELSE IF     '${BROWSER}' == 'IE'          Internet Explorer Landing Page

Verify Loaded Landing Page
    Wait Until Page Contains  ${LANDING_PAGE_BANNER}

Locate Landing Page Banners
    @{LANDING_ELEMENTS}  Create List  ${LANDING_PAGE_LABEL}  ${LANDING_PAGE_CONTACT}

    :FOR  ${Landing_Banner}  IN  @{LANDING_ELEMENTS}
    \  Look For Landing Element  ${Landing_Banner}

Look For Landing Element
    [Arguments]  ${PassedLandElement}
    Page Should Contain Element  ${PassedLandElement}