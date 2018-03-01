*** Settings ***
Documentation  This page object contains the keywords common to all test suites within the project.
#######################################################################################################################
#       Author:  Marnie Aguas
#       Date:  February 28, 2018
#       Revision History:
#######################################################################################################################

Library  Collections
Library  SeleniumLibrary

*** Variables ***


*** Keywords ***
Begin Web Test
    Run Keyword If      '${BROWSER}' == 'chrome'      Open Chrome Browser to Page
    ...     ELSE IF     '${BROWSER}' == 'Firefox'     Open Firefox Browser to Page
    ...     ELSE IF     '${BROWSER}' == 'IE'          Open Internet Explorer to Page

End Web Test
   Close Browser


Open Chrome Browser to Page
    [Documentation]     Opens _Google Chrome_ to a given web page.

    ${chrome_options}  Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${prefs}  Create Dictionary  profile_default_content_settings.popups = 1

    Call Method    ${chrome_options}    add_experimental_option  prefs  ${prefs}
    Call Method    ${chrome_options}    add_argument    -test-type
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Call method    ${chrome_options}    add_argument    --disable-popup-blocking
    Call Method    ${chrome_options}    add_argument    -incognito
    Call Method    ${chrome_options}    add_argument    --disable-infobars

    Run Keyword If    os.sep == '/'    Create Webdriver    Chrome    my_alias    chrome_options=${chrome_options}    executable_path=/bin/chromedriver
    ...    ELSE    Create Webdriver    Chrome    my_alias    chrome_options=${chrome_options}
    Maximize Browser Window


Open Internet Explorer to Page
    ${dc}   Evaluate    sys.modules['selenium.webdriver'].DesiredCapabilities.INTERNETEXPLORER  sys, selenium.webdriver
    Set To Dictionary   ${dc}   ignoreProtectedModeSettings    ${True}
    Set To Dictionary   ${dc}   ie.forceCreateProcessApi       ${True}
    Set To Dictionary   ${dc}   ie.browserCommandLineSwitches=-private
    Open Browser    about:blank  ${BROWSER}  desired_capabilitie=${dc}

Open Firefox Browser to Page
    Open Browser    about:blank  ${BROWSER}



