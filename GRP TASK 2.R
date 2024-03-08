
# Name :-  Sayan Banerjee
# Topic :- Task 2 - K means clustering on the Iris dataset
#GRIPMARCH24

#First call the required libraries to perform k means clustering
library(dplyr)
library(ggplot2)
library(ggfortify)
library(stats)

# Now assign a variable for the iris dataset ( The iris dataset is prebuilt in R) 

a = iris
View(iris)   #To view the entire iris dataset

#Now we will modify our dataset and remove the last column ie Species to perform k means clustering

b = iris[,-c(5)]   # To remove the 5th column that is species 
View(b)

# Now we will first find the optimal number of clusters
elbowplot = function(data, nc=15, seed=1234){
  elbow = (nrow(data)-1)*sum(apply(data,2,var))
  for (i in 2:nc){
    set.seed(seed)
    elbow[i] <- sum(kmeans(data, centers=i)$withinss)}
  plot(1:nc, elbow, type="b", xlab="Number of Clusters",
       ylab="Within groups sum of squares")
  elbow
}

elbowplot(b)

#So from here we see that the elbow can be observed at 2 which gives us k=2 (optimum clusters)

k = kmeans(b , 2)
autoplot(k , b , frame= TRUE )
k$centers   #This will show th centres of the  clusters corresponding to the 4 factors of iris dataset

#Using the autoplot function we did the clustering 

#Another method :-
library(cluster)
clusplot(b , k$cluster , shade = TRUE , color = TRUE , lines = 0 , labels = 0)

Thank You







