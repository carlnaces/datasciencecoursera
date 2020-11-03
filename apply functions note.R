library(datasets)
library(readr)
library(dplyr)


data(mtcars)
head(mtcars)

#calculating the mean of a column, by a values of another columng
sapply(split(mtcars$mpg, mtcars$cyl), mean)
tapply(mtcars$mpg,mtcars$cyl,mean)
with(mtcars, tapply(mpg,cyl,mean))

#splitting the df into separate sets by values of a column
split(mtcars, mtcars$cyl)



