*** Settings ***
Documentation  This layer handles keywords for the Tutorial Splash Screen
#######################################################################################################################
#       Author:  Marnie Aguas
#       Date:  February 28, 2018
#       Revision History:
#######################################################################################################################

Library  SeleniumLibrary

*** Variables ***

*** Keywords ***
Tutorial Page Redirection
    Sleep  45s
    Wait Until Element Is Visible  css=#carousel-example-generic
    #Regular User Skipping Tutorial
    #Regular User Sign Out
    #Log  Regular User

Regular User Skipping Tutorial
    Wait Until Page Contains Element  css=#carousel-example-generic > ol > li:nth-child(3)
    Click Element  xpath=//*[@id="carousel-example-generic"]/ol/li[3]
    Wait Until Element Is Visible  xpath=//*[@id="carousel-example-generic"]/div/div[3]/div[2]/div[2]/p/a[2]
    Click Element  xpath=//*[@id="carousel-example-generic"]/div/div[3]/div[2]/div[2]/p/a[2]


Clicking Cancel
    Click Element  xpath=//*[@id="carousel-example-generic"]/div/div[3]/div[2]/div[2]/p/a[1]
    #Click Element  xpath=//*[@id="carousel-example-generic"]/ol/li[3]
    #Click Element  xpath=//*[@id="carousel-example-generic"]/div/div[3]/div[2]/div[2]/p/a[2]
    #Sleep 10s
    #Click Link  css=#bs-example-navbar-collapse-1 > ul.nav.navbar-nav.navbar-right > li.dropdown.nav-useraccount > a
    #Sleep 10s
    #Click Link  css=#bs-example-navbar-collapse-1 > ul.nav.navbar-nav.navbar-right > li.dropdown.nav-useraccount.open > ul > li:nth-child(2) > a