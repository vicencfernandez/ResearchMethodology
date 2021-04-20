# Association

library(tidyverse)
library(arulesViz)
library(arules)

# load the data
myDataRaw <- read_csv(file = "association-01.csv", col_names = TRUE, col_types = "cc")

# Transform the data-set to a transsaccional data-set
myData <- myDataRaw 
myData <- split(myData$item,myData$invoice) # converting to a list
myData <- as(myData,"transactions") # converting to transacctions

# Creating association rules
myRules <- apriori(myData, parameter=list(support=0.01, confidence = 0.01))

# Number of rules
print(myRules)

# Order the rules by confidence
myRules <- sort(myRules, by="confidence", decreasing=TRUE)

# Show the 3 most imporabt rules 
inspect(head(myRules,3))

# Plot a matrix with 50 rules, and their consequencies
plot(head(myRules,50), method="grouped")

