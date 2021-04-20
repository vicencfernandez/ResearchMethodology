# Clustering

library(tidyverse)
library(factoextra)
library(NbClust)

# load the data
myDataRaw <- read_csv(file = "cluster-01.csv", col_names = TRUE, col_types = "cnn")

# Standardizing the data to make variables comparable.
myData <- data.frame (performance = scale(myDataRaw[,2:3])[,1], salary = scale(myDataRaw[,2:3])[,2])
rownames(myData) <- myDataRaw$employee

# Calculate the number of cluster with Silhouette method
fviz_nbclust(myData, kmeans, method = "silhouette")+
  labs(subtitle = "Silhouette method")

# Calculate the number of cluster with Elbow method
fviz_nbclust(myData, kmeans, method = "wss") +
  geom_vline(xintercept = 4, linetype = 2) +
  labs(subtitle = "Elbow method")

# k-means for FOUR clusters
kmeansObj <- kmeans(myData, centers = 4)

# Show the results  
kmeansObj$cluster

# Show the plot with scaled data 
plot(myData$salary, myData$performance, col = kmeansObj$cluster, pch = 19, cex = 1)
text(y=myData$performance, x=myData$salary, label=rownames(myData), col = kmeansObj$cluster, pos = 4)

# Show the plot without scaled data 
plot(myDataRaw$salary, myDataRaw$performance, col = kmeansObj$cluster, pch = 19, cex = 1, ylim = c(40, 120), xlim = c(950, 1850))
text(y=myDataRaw$performance, x=myDataRaw$salary, label=myDataRaw$employee, col = kmeansObj$cluster, pos = 4)
