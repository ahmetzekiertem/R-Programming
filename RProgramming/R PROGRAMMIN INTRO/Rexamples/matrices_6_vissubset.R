#visulizing subsets


Data <- MinutesPlayed[1,, drop = FALSE] #drop expession is so important.
matplot(t(Data), type = "b", pch = 15:18, col = c(1:4,6))
legend("bottomleft", inset=0.05, legend = Players[1], col = c(1:4,6), pch(15:18), cex= 0.5, horiz = F, fill = c(1:4,6))