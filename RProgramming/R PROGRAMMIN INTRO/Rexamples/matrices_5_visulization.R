
#visualizing with Matplot()

?matplot




matplot(t(FieldGoals/FieldGoalAttempts), type = "b", pch = 15:18, col = c(1:4,6))
legend("bottomleft", inset=0.01, legend = Players, col = c(1:4,6), pch(15:18), cex= 0.5, horiz = F, fill = c(1:4,6))

#According to our graph DwightHoward is the most acccurete player in our data.
#t() the function can enable transposetion.

t(FieldGoals)
