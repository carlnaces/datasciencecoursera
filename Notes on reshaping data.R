
#reshaping data notes
library(reshape2)
head(mtcars)

#Melting data frames
mtcars$carname <- rownames(mtcars)
carMelt <- melt(mtcars, id=c("carname", "gear", "cyl"), measure.vars = c("mpg", "hp"))
head(carMelt, n=3)

#Casting data frames
cylData <- dcast(carMelt, cyl ~ variable)
cylData

#another exampl
cylData <- dcast(carMelt, cyl ~ variable, mean)
cylData

#insect sprays
#so for every valueof sprays, takes the counts and sums it
head(InsectSprays)
tapply(InsectSprays$count, InsectSprays$spray, sum)


#SPLIT APPLY COMBINE
spIns = split(InsectSprays$count, InsectSprays$spray)
spIns
sprCount = lapply(spIns, sum)
sprCount
unlist(sprCount)

#Can also 
sapply(spIns, sum)
