# Exploratory Factor Analysis

library(tidyverse)
library(psych)
library(GPArotation)

# load the data
myData <- read_csv(file = "efa-01.csv", col_names = TRUE, col_types = "nnnnnn")

# calculate correlation matrix
myCorr <- cor(myData)

# Calculate eigen values 
eigen(myCorr)$values 

# Calculate the factorial analysis (loadings)
myResults <- fa(r = myCorr, nfactors = 2, rotate = "oblimin", fm="pa") 
myResults$loadings
