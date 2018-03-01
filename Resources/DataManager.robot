*** Settings ***
Documentation  Use this layer in getting data from an external CSV file
#       Author:  Marnie Aguas
#       Date:  February 20, 2018
#       Revision History:

Library  ../CustomLibs/Csv.py


*** Keywords ***
Get CSV Data
    [Arguments]  ${FilePath}
    ${Data}  read csv file  ${FilePath}
    [Return]  ${Data}