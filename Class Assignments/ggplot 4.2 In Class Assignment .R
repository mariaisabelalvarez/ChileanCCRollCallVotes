#GG Plot Exercise in Class January 26 // 4.2 

library(tidyverse)
#Reading in the Data 
adult_data <- read_csv("Documents/GitHub/d2m-2023-shared/datasets/adult.data.csv")

#In Class Exercises with ggplot 
ggplot(adult_data, aes(age)) + geom_density()

ggplot(adult_data, aes(age)) + geom_histogram()

ggplot(adult_data, aes(age)) + geom_histogram(binwidth = 5)

ggplot(adult_data, aes(`education-num`)) + geom_density()

ggplot(adult_data, aes(`education-num`)) + geom_density(adjust = 2)

ggplot(adult_data, aes(race)) + geom_density()

ggplot(adult_data, aes(race)) + geom_histogram()

ggplot(adult_data, aes(race)) + geom_histogram (stat = "count")

ggplot(adult_data, aes(occupation)) + geom_bin()

ggplot(filter(adult_data, !is.na(occupation)), aes(occupation)) + geom_bar()

#In Class Assignment with ggplot
#Plot 1 
ggplot(adult_data, aes(`capital-gain`)) + geom_histogram()

#Plot 2
ggplot(adult_data, aes(y=`hours-per-week`)) + geom_density()


