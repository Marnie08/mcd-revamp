*** Settings ***
#######################################################################################################################
#       Author:  Marnie Aguas
#       Date:  February 28, 2018
#       Revision History:
#######################################################################################################################
Library  SeleniumLibrary

*** Variables ***

*** Keywords ***
####################################################################################################################
#Knowledge Hub - Regular User
####################################################################################################################
Regular User Category Page Validation
    Tiles Count
    Regular User Validate Inactive Tiles

Tiles Count
    [Documentation]  This keyword is for the determination of the tile count visible on the Knowledge Hub Page.
    ${TilesCount}  Get Element Count  //*[@id="myCarousel"]/div/div[1]
    Log  ${TilesCount}
    Run Keyword If  ${TilesCount} == 0  Exit for loop
    ...  ELSE IF  ${TilesCount} == 1  Get Tiles
    ...  ELSE  ${TilesCount} > 1  Tiles On The Page  ${TilesCount}

Get Tiles
    ${Label}  Get Text  xpath=//*[@id="0"]/div[1]

Tiles On The Page
    [Documentation]  This keyword is for the identification of the visible tiles on the Knowledge Hub Page.
    [Arguments]  ${ItemCount}
    Log  ${ItemCount}
    :FOR  ${TILEINDEX}  IN RANGE  1  ${ItemCount}+1
    \   Log  ${TILEINDEX}
    \   ${Label}  Get Text  xpath=//*[@id="${TILEINDEX}"]/div[1]/h5
    \   Log  ${Label}  does not exist.

Regular User Validate Inactive Tiles
    @{TILES}  Create List  ${KNOWLEDGE_HUB_PROM_PROD}  ${KNOWLEDGE_HUB_FOOD_CS}  ${KNOWLEDGE_HUB_CHEM_MAT}  ${KNOWLEDGE_HUB_LAWS_RULES}  ${KNOWLEDGE_HUB_AUDIT_PROG}  ${KNOWLEDGE_HUB_FAC_GOV}  ${KNOWLEDGE_HUB_PROG_INFO}  ${KNOWLEDGE_HUB_LABS_ONLY}  ${KNOWLEDGE_HUB_PROJ_MGT}  ${KNOWLEDGE_HUB_FILE_TRANS}

    :FOR  ${UserTile}  IN  @{TILES}
    \  Page Should Not Contain Element  ${UserTile}
    \  Log  ${UserTile}







