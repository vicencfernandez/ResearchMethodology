# Multiple Linear Regression

library(tidyverse)
library(plot3D)

# load the data
myData <- read_csv(file = "regres-01.csv", col_names = TRUE, col_types = "nnnnn")

# Calculate the Multiple Linear Regression model
myResult <- lm (motivation~stability+control+diversity, data = myData)

# Show the results  
summary(myResult)

# Show the plot
scatter3D(myData$control, myData$diversity, myData$motivation)
