# Test Hipothesis - 1 sample

library(tidyverse)
myData <- read_csv(file = "salary-01.csv", col_names = TRUE, col_types = "n")

t.test(myData$salary, conf.level=0.95, alternative="two.sided", mu=1500)

t.test(myData$salary, conf.level=0.95, alternative="greater", mu=1500)

t.test(myData$salary, conf.level=0.95, alternative="less", mu=1500)
