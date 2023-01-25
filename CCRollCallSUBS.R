#CC Roll Call Votes, Analysis of the Substantive Phase of the Constitutional Convention's Debate

#Library essential packages 
pacman::p_load(tidyverse, forcats, pscl, coda, ggrepel, readxl, mcmc, matrixStats)

#Read in data 
library(readxl)
CCRollCallSUBS <- read_excel("Downloads/CCRollCallSUBS.xlsx")
View(CCRollCallSUBS)

#Data to matrix form, omitting some information about the CC delegates in the spreadsheet
CCRollCallSUBS_1 <- data.matrix(CCRollCallSUBS[-c(1:13)])



