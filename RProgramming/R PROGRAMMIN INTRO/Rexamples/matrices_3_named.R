

#Named Vectors

Charlie <- 1:5

#give names 
names(Charlie) <- c("a", "b", "c", "d", "e")
Charlie
Charlie["d"]

names(Charlie) 

#clear names

names(Charlie) <- NULL
Charlie

#=====================

# Naming Matrix Dimension


#rep(c("A", "b", "bbb"), times = 3)

#rep(c("A", "b", "bbb"), each = 3) each 


temp.vec <- rep(c("A", "b", "bbb"), each = 3) 

Bravo <-matrix(temp.vec,3,3)
Bravo

rownames(Bravo) <- c("How", "are", "you?")
Bravo

colnames(Bravo) <- c("Ahmet", "Zeki", "Ertem")
Bravo

Bravo[2,2] <- 0

Bravo["How", "Ertem"] <- "emirertem"
