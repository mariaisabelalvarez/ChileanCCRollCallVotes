install.packages("tidyverse")

library(tidyverse)

library(readr)

mmdata <- read_excel("MM Data.xlsx", skip = 1)

mmdata.long <- mmdata %>%
  pivot_longer(cols = c("Red", "Green","Blue", "Orange", "Yellow", "Brown"),
               names_to = "Color",
               values_to = "Number")

