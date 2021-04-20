# 2-way ANOVA

library(tidyverse)

myData <- read_csv(file = "anova-01.csv", col_names = TRUE, col_types = "nffn")
myResults <- aov(assessment~training*gender, myData)
summary (myResults)
