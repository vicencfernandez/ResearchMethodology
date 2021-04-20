# Crisp-set QCA

library(tidyverse)
library(QCA)

# load the data
myDataRaw <- read_csv(file = "crisp-01.csv", col_names = TRUE, col_types = "cccccin")

# Create a clean Data
myData <- data.frame (matrix(rep(numeric(22),6), nrow = 22, dimnames = list (myDataRaw$employee, names(myDataRaw[,2:7]))))

# Calibration of the variables
myData$per1 <- ifelse(myDataRaw$per1 == "yes", 1, 0) 
myData$per2 <- ifelse(myDataRaw$per2 == "yes", 1, 0) 
myData$att1 <- ifelse(myDataRaw$att1 == "high", 1, 0)
myData$att2 <- ifelse(myDataRaw$att2 == "high", 1, 0) 

myData$motivation <- calibrate(myDataRaw$motivation, type="crisp", thresholds = 70) 
myData$performance <- calibrate(myDataRaw$performance, type="crisp", thresholds = 30) 

# Necessary Condition Analysis
myDataNR <- superSubset(myData, outcome = "performance", conditions = ("per1, per2, att1, att2, motivation"), incl.cut = 0.9, cov.cut = 0.52)
myDataNR


# Sufficent Condition Analysis

### Building a Truth Table
myDataTT <- truthTable (myData, outcome = "performance", n.cut = 1, incl.cut1 = 1, show.cases = TRUE, sort.by = c("incl", "n"))
myDataTT

# Reduction Procedure
myDataSC <- minimize(myDataTT, details = TRUE, show.cases = TRUE)
myDataSC
