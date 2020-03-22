
stats <- read.csv(file.choose())

#Method 1 : Select The File Manually 
stats

#Method 2 : Set WD and Read Data

getwd()
#Windows :

#Mac : 

setwd("/Users/mac/Desktop/PROGRAMMING/RProgramming")

rm(stats)
stats <- read.csv(file.choose())
stats

# --------------------------------------  Exploring Data

nrow(stats) #195

ncol(stats) #5

head(stats) # show top 6 rows
tail(stats, n = 10) # show the bottom 6 rows

str(stats)  # str()  runif() distribution type

summary(stats)

# Using the dollar $ sign 

stats[3,3]
stats[3,"Birth.rate"]

stats$Internet.users
stats$Internet.users[2]

stats[, "Internet.users"]

t(stats)

levels(stats$Income.Group)

#================ Basic Operations with DF.

stats[1:10,] #subsetting

stats[c(4,100),]

#Remember how the [] works :

is.data.frame(stats[1,])

typeof(stats[,1:2])

is.data.frame(stats[,1,drop = FALSE])

#multiply columns

stats$Birth.rate * stats$Internet.users
stats$Birth.rate + stats$Internet.users

#ADD column

stats$MyCalc <- stats$Birth.rate * stats$Internet.users

stats

#test of knowledge 

stats$xyz <- 1:5
head(stats, n=10)

#remove a column

stats$MyCalc <- NULL
stats$xyz <- NULL


# ------------------------Filtering data frame

filter <- stats$Internet.users < 2
stats[filter,]

stats[stats$Birth.rate > 40 & stats$Internet.users < 2 ,]

stats[stats$Income.Group == "High income"& stats$Birth.rate > 30,]
levels(stats$Income.Group)


stats[stats$Country.Name == "Turkey",]

#------------------------Intorduction to qplot

library(ggplot2)
 
qplot(data = stats,x = stats$Internet.users )
qplot(data = stats, x=stats$Income.Group, y=stats$Birth.rate, size = 10,
      colour = I("blue"))
qplot(data = stats, x=stats$Income.Group, y=stats$Birth.rate, size = 10, geom = "boxplot",
      colour = I("blue"))

qplot(data = stats, x=stats$Income.Group, y=stats$Birth.rate, geom = "boxplot")


#--------------------- visualizing what we need

qplot(data = stats, x=Internet.users, y=Birth.rate, colour = stats$Income.Group,
      size = I(4))
