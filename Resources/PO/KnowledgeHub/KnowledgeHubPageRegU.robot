*** Settings ***
#######################################################################################################################
#       Author:  Marnie Aguas
#       Date:  February 28, 2018
#       Revision History:
#######################################################################################################################

Library  SeleniumLibrary

*** Variables ***


*** Keywords ***
Regular User Sign Out
    Sleep  15s
    Click Link  css=#bs-example-navbar-collapse-1 > ul.nav.navbar-nav.navbar-right > li.dropdown.nav-useraccount > a
    Sleep  10s
    Click Link  css=#bs-example-navbar-collapse-1 > ul.nav.navbar-nav.navbar-right > li.dropdown.nav-useraccount.open > ul > li:nth-child(2) > a