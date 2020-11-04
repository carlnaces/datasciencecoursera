library(dplyr)
#Managing data frames
dim(iris)

#print out variable names
names(iris)

#select range of columns
head(select(iris, Sepal.Width:Petal.Width))

#selecting every column except one using minus sign
head(select(iris, -(Sepal.Width:Petal.Width)))

#filter is used to subset rows
#takes binary argumnets

#arrange function arranges table using a column
iris <- arrange(iris, Sepal.Length)


#renaming with rename()
#rename(dataframe, current name = new name, current name = new name)

#mutating or creating new variables using mutate()
#mutate(dataframe, conditions) adds it to the end of the table

#groupby 
#group table into groups using conditions, can also create new variables
#dataframe <- mutate(dataframe, temporary condition, labels = c("whatever you like))
#newdataframe <- group_by(dataframe, temporary condition)

#summarize

