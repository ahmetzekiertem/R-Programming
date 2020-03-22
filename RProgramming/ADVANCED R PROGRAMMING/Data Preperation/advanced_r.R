
getwd()
setwd("..")
setwd("/Users/mac/Desktop/PROGRAMMING/RProgramming/ADVANCED R PROGRAMMING/Data Preperation")

fin <- read.csv(file.choose())

head(fin)
str(fin)

fin$Inseption <- factor(fin$Inception)

#Factor Variable Trap (FVT)
#Converting into Numerics for Characteristics:

a <- c("12", "13", "14", "12", "12")

b <- as.numeric(a)
b
#Converting into Numerics for Factors:

z <- factor(c("12", "13", "14", "12", "12"))
typeof(z)

y <- as.numeric(z)
y

# correct way

x <- as.numeric(as.character(z))
x

head(fin)
str(fin)
fin$Profit <- factor(fin$Profit)

summary(fin)

#sub() and gsub() functions

?sub
fin$Expenses <- gsub(" Dollars", "", fin$Expenses)
fin$Expenses <- gsub(",", "", fin$Expenses)
head(fin)
str(fin) 
  #expense anymore is not factors now charcates.

fin$Revenue <- gsub("\\$","", fin$Revenue)
fin$Revenue <- gsub(",","", fin$Revenue)

fin$Growth <- gsub("%", "", fin$Revenue)
head(fin)
str(fin)

fin$Revenue <- as.numeric(fin$Revenue)
fin$Growth <- as.numeric(fin$Growth)
fin$Expenses <- as.numeric(fin$Expenses)
head(fin)
str(fin)
summary(fin)
library(dplyr)
select(data = fin, fin$Inception)

getwd()
setwd("..")
setwd("R PROGRAMMIN INTRO")
setwd("Rexamples")
select(fin,starts_with("St"))

#locating missing data

head(fin, 24)

complete.cases(fin)
fin[!complete.cases(fin),]  #count() == 6

#fin2 = read.csv('Future 500.csv', na.string=c(""))

#factors missing data show <NA>, numeric datas NA

#Data filters using which() for non-missing data

fin[which(fin$Revenue == 9746272),]

#Filtering : Using is.na() for missing data 

fin[fin$Employees == 45,] #this commut will include also na values.
fin[which(fin$Employees == 45),]

#is.na()
a <- c(1, 24, 543, NA, 7)
is.na(a)

is.na(fin$Expenses)
fin[is.na(fin$Expenses),]

#Removing records with misssing values

fin_backup <- fin

fin[!complete.cases(fin),] # we select uncomplete columns  

fin[!is.na(fin$Inseption),]

fin <- fin[!is.na(fin$Inseption),] #opposite way

# Reseting Data Frame Indexes

rownames(fin) <- 1:nrow(fin)
rownames(fin) <- NULL
rownames(fin)
fin

#Replacing Missing Data : Factual Analysis Method

fin[is.na(fin$State)]

fin[fin$State == "" & fin$City=="New York","State"] <- "NY"
fin[fin$City=="San Francisco",]

#CHECK: 
fin[fin$State == "SA"]
fin[c(11, 377),]

fin[!complete.cases(fin),]

fin[is.na(fin$State)  & fin$City=="San Francisco","State"] <- "SA"

fin[is.na(fin$State) & fin$City=="San Francisco","State"] <- "CA"

#CHECK

fin[c(83,266),]

fin[!complete.cases(fin),] #3,8,17,43,331


fin[is.na(fin$Employees),]

fin[fin$Industry == "Retail",]

median(fin[,"Employees"],na.rm = TRUE)
mean(fin[fin$Industry == "Retail","Employees"],na.rm = TRUE)

med_empl_retail <- median(fin[fin$Industry == "Retail","Employees"],na.rm = TRUE)

fin[is.na(fin$Employees) & fin$Industry == "Retail", "Employees"] <- med_empl_retail

fin[fin$Industry == "Retail",]

mean_empl_service <- mean(fin[fin$Industry == "Financial Services", "Employees"], na.rm = TRUE)

mean_empl_service

fin[is.na(fin$Employees) & fin$Industry == "Financial Services", "Employees"] <- mean_empl_service

#CHECK 
fin[fin$ID == 332,]

#Replacing missing values :Median Imputation Method (Part2)

fin[!complete.cases(fin),]

med_growth_constr <- median(fin[fin$Industry=="Construction","Growth"], na.rm = TRUE)
med_growth_constr

fin[is.na(fin$Growth) & fin$Industry == "Construction", "Growth"] <- med_growth_constr

fin[c(8,17,43),]

fin[!complete.cases(fin),]

as.double(fin$Profit)

fin[is.na(fin$Expenses) & fin$Industry=="Construction" & is.na(fin$Profit),]

fin[is.na(fin$Expenses) & !is.na(fin$Revenue),"Expenses"] <- fin[17, "Revenue"]-fin[17, "Profit"]


med_revenue_constr <- median(fin[fin$Industry=="Construction","Revenue"], na.rm = TRUE)

fin[fin$Industry=="Construction" & is.na(fin$Revenue),"Revenue"] <- med_revenue_constr

#Check:
fin[!complete.cases(fin),]

#Replacing Missing Data : deriving values

#Revenue - Expenses = Profit

#Expenses = Revenue - Profit

as.numeric(as.character(fin$Profit))

str(fin)


fin[is.na(fin$Expenses),]

fin[17,]

typeof(fin$Profit)

# ----------

fin$Profit <- as.numeric(as.character(fin$Profit))

which(fin$Employees == 45)

fin[which(fin$Employees == 45),] #ignore NA values in filtering
#Check:
str(fin)

?which

?complete.cases
fin[is.na(fin$Expenses),"Expenses"] <- fin[is.na(fin$Expenses), "Revenue"] - fin[is.na(fin$Expenses), "Profit"] 

fin[!complete.cases(fin),]

med_expens_12 <- median(fin[!is.na(fin$Expenses),"Expenses"])

fin[!is.na(fin$Expenses),"Expenses"] <- med_expens_12

fin[]