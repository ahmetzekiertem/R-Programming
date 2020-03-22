setwd("/Users/mac/Desktop/PROGRAMMING/RProgramming/ADVANCED R PROGRAMMING/List in R")

dataset = read.csv('P3-Machine-Utilization.csv')

#Derive utilization column.

dataset$Utilization <- 1 - dataset$Percent.Idle

head(dataset, 12)

#Handling Data-Times in R

?POSIXct

dataset$PosixTime <- as.POSIXct(dataset$Timestamp, format="%d/%m/%Y %H:%M")

summary(dataset)

#TIP: how to rearrenge columns in df:

dataset$Timestamp <- NULL

dataset <- dataset[,c(4,1,2,3)]

head(dataset)

# What is a list? 

RL1 <- dataset[dataset$Machine == "RL1",]

summary(RL1)
RL1$Machine <- factor(RL1$Machine)

#Construct List

#Character: Machine name

#Vector: (min,mean,max) Utilization for the month (excluding unknown hours)

#Logical: Has utilization ever fallen below %90 ? TRUE/FALSE

dataset_stats_rl1 <- c(min(RL1$Utilization, na.rm = TRUE),
                       mean(RL1$Utilization, na.rm = TRUE),
                       max(RL1$Utilization, na.rm = TRUE))

length(which(RL1$Utilization < 0.95))

as.logical()

dataset_under_95_flag <- length(which(RL1$Utilization < 0.95)) > 0
  
list_rl1 <- list("RL1", dataset_stats_rl1, dataset_under_95_flag)

#Naming components of a list.

names(list_rl1) <- c("Machine", "Stats", "LowThreshold")

#Another way . Like with dataframe 

list_rl1 <- list(Machine = "RL1", Stats = dataset_stats_rl1, LowThreshold = dataset_under_95_flag)
list_rl1

#Extracting components of a list

# three ways:

#[] will always return a list

#[[]] will always return a actual object.

# $ same as double square brackets. but prettier

list_rl1[1]

list_rl1[[1]]
list_rl1$Machine 

#how would you access 3rd element of vector.

list_rl1[[2]][3]  #Maximum value.

list_rl1$Stats[3]

#Adding and deleting components of a list.

list_rl1[4] <- "New Information"

#Another way to add a compenent -via the $.

list_rl1$UnkownHours <- RL1[is.na(RL1$Utilization),"PosixTime"]

#Remove a componenet using NULL method.

list_rl1

list_rl1[4] <- NULL


#!Notice :Numeratin has shifted.

list_rl1[4]

#Add anather compenents.

#Dataframe: for this machine.

list_rl1$Data <- RL1


list_rl1$Data[is.na(list_rl1$Data$Utilization),]

summary(list_rl1)
 
#Subsetting a list

#Quick Challenge:

#Let's proceed:

list_rl1[1:2]

list_rl1[c(1,5)]

 #Double square bracketss ARE NOT for Subsetting.

list_rl1[c(4,5)] <- list_rl1[c(5,4)]

names(list_rl1)
list_rl1[[4]] <- list_rl1[[c(5,4)]]
list_rl1[4]

names(list_rl1[c(4,5)]) <- names(list_rl1[c(5,4)])

list_rl1[c(4,5)] <- list_rl1[c(5,4)]

library(ggplot2)

p <- ggplot(data=dataset)

myplot <- p + geom_line(aes(x=PosixTime, y=Utilization, colour=Machine), size=1.2) +
    facet_grid(Machine~.) + geom_hline(yintercept = 0.95,)

list_rl1$Plot <- myplot
  