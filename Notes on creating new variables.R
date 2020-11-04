
#Creating New Variables
#Example on openbalitmore data

#Create data directory
if(!file.exists("./data")){
  dir.create("./data")
}

#url to the data to download
fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
#download file
download.file(fileUrl, destfile = "./data/restaurants.csv")
#Read restaurant data
restData <- read.csv("./data/restaurants.csv")

#Creating sequences, like range on python
#create sequence with range 1 to 10 in increments of 2
s1 <- seq(1,10,by = 2); s1

#create sequence with range 1 to 10 with length 3
s2 <- seq(1,10, length = 3); s2

#If you have a vector x, seq(along = x) creates a list of indices of length x
x <- c(1,3,4,5,10); seq(along =x)
#can be used when looping on a dataset

#Creating new variable with subsetting
restData$nearMe = restData$neighborhood %in% c("Roland Park", "Homeland")
table(restData$nearMe)


#Creating new variable with binary variables
restData$zipWrong = ifelse(restData$zipCode < 0, TRUE, FALSE)
table(restData$zipWrong, restData$zipCode <0)


#Creating categorical values
restData$zipGroups = cut(restData$zipCode, breaks = quantile(restData$zipCode))
table(restData$zipGroups)
#create 2x2 table from this zipgroups and zipcodes
table(restData$zipGroups, restData$zipCode)



#Creating factor variables
restData$zcf <- factor(restData$zipCode)
restData$zcf[1:10]
class(restData$zcf)

#Example for factor variables
yesno <- sample(c("yes", "no"), size = 10, replace = TRUE)
yesnofac = factor(yesno, levels = c("yes", "no"))
relevel(yesnofac, ref= "yes")

#Mutations (easier with dplyr)