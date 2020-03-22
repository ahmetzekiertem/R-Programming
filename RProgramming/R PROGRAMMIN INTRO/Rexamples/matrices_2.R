
Salary
MinutesPlayed
Games
# we can built matrix with matrix() rbind() , cbind() 


#?matrix
#matrix(data = NA, nrow = 1, ncol = 1, byrow = FALSE, dimnames = NULL)

my.data <- 1:20
my.data 

A <- matrix(my.data, 4, 5)
A
A[2,3]
 
B <- matrix(my.data, 4, 5, byrow = TRUE) #DEFAULT = FALSE
B

#rbind() function 

r1 <- c("I", "am", "happy")
r2 <- c("Wgat", "a", "day")
r3 <- c(1, 2, 3)

C <- rbind(r1, r2, r3)
C
rbind()

#cbind()

c1 <- 1:5
c2 <- -1:-5
D <- cbind(c1, c2)
D

m1 <- c("AHMET", "ZEKI", "ERTEM")
m2 <- c("lale", "ertem", "figen")
m3 <- c("s1", "s2", "s3")
M <- rbind(m1, m2, m3)
M

K <- cbind(m1, m2, m3)
K