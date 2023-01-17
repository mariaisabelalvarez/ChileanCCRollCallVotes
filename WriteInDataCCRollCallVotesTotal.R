#ReadInData 

#Read In Complete Data Set with all of the roll call votes in the Constitutional Assembly in binary form 
totalCCrollcall <- read_excel("~/Downloads/d2mCCRollCallVotesTotal.xlsx")

#Read In test.csv 
testsheet <- read_csv("~/Downloads/test.csv")

#Read In testdata.csv
datacsv <- read_csv("~/Downloads/testdata.csv")
Sys.setenv("VROOM_CONNECTION_SIZE")
