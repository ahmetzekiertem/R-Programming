
getwd()
movies <- read.csv(file.choose())
movies

head(movies)

colnames(movies) <- c("Film", "Genre", "CriticRating", "AudienceRating", "BudgetMillions", "Year")
head(movies)
tail(movies)
str(movies)

movies$Year <- factor(movies$Year)

summary(movies)

str(movies)

#-----------Aesthetic

library(ggplot2)

#add geometry
 
ggplot(data = movies, aes(x = CriticRating, y = AudienceRating, colour =Genre, size = BudgetMillions)) + geom_point()


#---------- Plotting With Layers

p <- ggplot(data = movies, aes(x = CriticRating, y = AudienceRating, colour =Genre,
                               size = BudgetMillions)) 
p + geom_point()

#lines

p + geom_line()

#multiple layers

p + geom_point() + geom_line()

# overriding aesthethetic

p + geom_point(aes(x = BudgetMillions)) +
  xlab("Budget Millions $$$")

#override ex3


#ex4

p + geom_point() + geom_line(size = 1)

#-------------  setting vs mapping

r <- ggplot(data = movies, aes(x = CriticRating, y = AudienceRating))
r + geom_point()

#Add colour

#1 mapping(what we have done so far):

r + geom_point(aes(colour=Genre))

#2 Setting:

r + geom_point(colour = "DarkGreen")

#ERROR

r + geom_point(aes(colour="DarkGreen"))

s <- ggplot(data = movies, aes(x=Budget..million...))
s + geom_histogram(binwidth = 10)
s
movies

#colnames(movies)


#add colour

s + geom_histogram(binwidth = 10, aes(fill = Genre), colour = "Black")

#>>>>> 3(we will improve it)

#sometimes you may need density charts :

s + geom_density(aes(fill=Genre), position = "stack")

#======Starting Layer Tips

s + geom_histogram(binwidth = 10, aes(fill = Genre), colour = "Black")

#anather Ways:

t <- ggplot(data = movies)
t + geom_histogram(binwidth = 10, aes(x = Audience.Ratings..),
                   fill = "White", colour = "Blue")

#----------Statittical Transformations

?geom_smooth

t <- ggplot(data = movies, aes(x = Rotten.Tomatoes.Ratings..,
                               y = Audience.Ratings.., colour = Genre))
t + geom_point() + geom_smooth(fill = NA)

#boxplots

t <- ggplot(data = movies, aes(x = Genre,
                               y = Audience.Ratings.., colour = Genre))
t + geom_boxplot(size = 1) + geom_point()

#tip / hack :

t + geom_boxplot() + geom_jitter()
#------- Using Facets

movies <- read.csv(file.choose())

movies <- homework_data
select(homework_data, homework_data$Day.of.Week == "Friday")

