# Fuzzy-set QCA
library(tidyverse)
library(QCA)

# load the data
myDataRaw <- read_csv(file = "fuzzy-01.csv", col_names = TRUE, col_types = "cnnnnnnn")

# Create a clean Data
myData <- data.frame (matrix(rep(numeric(19),7), nrow = 19, dimnames = list (myDataRaw$employee, names(myDataRaw[,2:8]))))

# Calibration (inthis example, all variables have been calibrated previously)
myData$att1 <- myDataRaw$att1 
myData$att2 <- myDataRaw$att2 
myData$att3 <- myDataRaw$att3 
myData$att4 <- myDataRaw$att4 
myData$att5 <- myDataRaw$att5 
myData$att6 <- myDataRaw$att6 
myData$performance <- myDataRaw$performance 

# Necessary Condition Analysis
myDataNR <- superSubset(myData, outcome = "performance", conditions = ("att1, att2, att3, att4, att5, att6"), incl.cut = 0.965, cov.cut = 0.6)
myDataNR


# Sufficent Condition Analysis

### Building a Truth Table
myDataTT <- truthTable (myData, outcome = "performance", n.cut = 1, incl.cut1 = 0.9, show.cases = TRUE, sort.by = c("incl", "n"))
myDataTT

# Reduction Procedure
myDataSC <- minimize(myDataTT, details = TRUE, show.cases = TRUE)
myDataSC
