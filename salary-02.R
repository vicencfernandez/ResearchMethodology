# Test Hipothesis - 2 samples

library(tidyverse)
myData1 <- read_csv(file = "salary-02a.csv", col_names = TRUE, col_types = "n")
myData2 <- read_csv(file = "salary-02b.csv", col_names = TRUE, col_types = "n")

t.test(myData1$salary, myData2$salary, conf.level=0.95, alternative="two.sided", var.equal=T)
