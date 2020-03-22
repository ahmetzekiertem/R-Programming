setwd("~/Desktop/MOOCs/Udemy/RProgramming/ADVANCED R PROGRAMMING/Weather Data")
 

Chicago <- read.csv("Chicago-F.csv", row.names = 1)
NewYork <- read.csv("NewYork-F.csv", row.names = 1)
Houston <- read.csv("Houston-F.csv", row.names = 1)
SanFrancisco <- read.csv("SanFrancisco-F.csv", row.names = 1)

#Check

#Chicago:
Chicago
#NewYork:
NewYork
Houston
SanFrancisco

is.data.frame(Chicago)

#Convert to matrix

Chicago <- as.matrix(Chicago)
SanFrancisco <- as.matrix(SanFrancisco)
Houston <- as.matrix(Houston)
NewYork <- as.matrix(NewYork)

#Lets put all of these into a list:

Weather <- list(Chicago=Chicago, SanFrancisco =SanFrancisco, Houston = Houston, NewYork = NewYork)

Weather[3]

Weather[[3]]

apply(Chicago, 1, mean)

mean(Chicago["DaysWithPrecip",])

#analyze one city:

apply(Chicago, 1, max)
apply(Chicago, 1, min)

#for practice:

apply(Chicago, 2, max)  #does not make much sense, but good exercise
apply(Chicago, 2, min)

#Compare: 

apply(Chicago, 1, mean)
apply(NewYork, 1, mean)
apply(Houston, 1, mean)
apply(SanFrancisco, 1, mean)

#Recreating the apply function with loops (advanced topics)

Chicago

#find the mean of every row:
#1. via loops

output <- NULL #prepearing an empty vector

for(i in 1:5) { #run cycle
  output[i] <- mean(Chicago[i,])
  
}

output
names(output) <- rownames(Chicago) # we put as output names as rownames of Chicago.
output

#2.via apply function

apply(Chicago, 1, mean)

#Using lapply

?lapply 
Chicago
t(Chicago) #Transpose

lapply(Weather, t) #LIST(t(Chicago), t(Houston), t(SanFrancisco), t(NewYork))

lapply(Weather, rbind, NewRow=1:12)  #we add new row.

#example 3

?rowMeans
rowMeans(Chicago) #identical apply(Chicago, 1, mean)
lapply(Weather, rowMeans)

#rowMeans
#colMeans
#rowSums
#colSums

#Combining lapply with the [ ] operator

Weather$Chicago[1,1]

Weather[[1]][1,1]
lapply(Weather, "[", 1, 1)
lapply(Weather, "[", 1, )

lapply(Weather, "[", ,3 )

#adding our own function

lapply(Weather, function(x) x[5,])
lapply(Weather, function(x) x[1,]-x[2,])

lapply(Weather, function(x) ((x[1,]-x[2,])/x[2,]))


#Using sapply()

sapply(Weather, "[", 1,7)

#Avera_High_Temprature for 4th quarter:

sapply(Weather, "[", 1, 10:12)

round(sapply(Weather, rowMeans),2)

#Another example

sapply(Weather, function(x) ((x[1,]-x[2,])/x[2,]))

#By the way

# Nesting apply() function

Weather

lapply(Weather, rowMeans)

#very advanced tutoirial

#which.max{}

which.max(Chicago[1,])

sapply(Weather,function(y) apply(y, 1, function(x) names(which.max(x))))
