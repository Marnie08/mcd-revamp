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
Regular User Knowledge Hub Validation
    Tiles Count
    Validate Active Tiles

Tiles Count
    ${TilesCount}  Get Element Count  //*[@id="myCarousel"]/div/div[1]
    Log  ${TilesCount}
    Run Keyword If  ${TilesCount} > 0  Tiles On The Page  ${TilesCount}

Tiles On The Page
    [Arguments]  ${ItemCount}
    Log  ${ItemCount}
    :FOR  ${INDEX}  IN RANGE  1  ${ItemCount}
    \   Log  ${INDEX}
    \   ${id}  Get Value  //*[@id="${INDEX}-1"]/div[1]/h5
    \   Log  ${id}

Validate Active Tiles
    @{TILES}  Create List  ${KNOWLEDGE_HUB_PROM_PROD}  ${KNOWLEDGE_HUB_FOOD_CS}  ${KNOWLEDGE_HUB_CHEM_MAT}  ${KNOWLEDGE_HUB_LAWS_RULES}  ${KNOWLEDGE_HUB_AUDIT_PROG}  ${KNOWLEDGE_HUB_FAC_GOV}  ${KNOWLEDGE_HUB_PROG_INFO}  ${KNOWLEDGE_HUB_LABS_ONLY}  ${KNOWLEDGE_HUB_PROJ_MGT}  ${KNOWLEDGE_HUB_FILE_TRANS}

    :FOR  ${UserTile}  IN  @{TILES}
    \  Page Should Not Contain Element  ${UserTile}




#${tam}=    Get Matching Xpath Count    //table[@id='tableCols']/tbody/tr[@style='cursor: move; display: table-row;' or @style='cursor: move;']
#    :FOR    ${i}    IN RANGE    1    ${tam}+1
#    \    ${id}=    Get Element Attribute    //table[@id='tableCols']/tbody/tr[@style='cursor: move; display: table-row;' or @style='cursor: move;'][${i}]@id


