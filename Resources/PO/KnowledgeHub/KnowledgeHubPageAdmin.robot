*** Settings ***
#######################################################################################################################
#       Author:  Marnie Aguas
#       Date:  February 28, 2018
#       Revision History:
#######################################################################################################################

*** Variables ***

*** Keywords ***
Admin Knowledge Hub Redirection
    Sleep  45s
    Wait Until Page Contains Element  css=#myCarousel > div

Admin Sign Out
    Click Link  css=#bs-example-navbar-collapse-1 > ul.nav.navbar-nav.navbar-right > li.dropdown.nav-useraccount > a
    Click Link  Log out
    Log  Admin User