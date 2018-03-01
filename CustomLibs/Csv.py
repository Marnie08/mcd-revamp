#######################################################################################################################
#       Author:  Marnie Aguas
#       Date:  February 28, 2018
#       Revision History:
#######################################################################################################################

import csv

def read_csv_file(filename):
    data = []
    with open(filename, 'rb') as csvfile:
        reader =csv.reader(csvfile)
        for row in reader:
            data.append(row)
    return data
