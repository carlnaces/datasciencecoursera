
#Summarizing notes
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

#can get basic summary data thru summary()
summary(restData)

#can use the str data to get more depth on the data
str(restData)

#can use quantile() to check quantiles of quantitative variables
quantile(restData$councilDistrict, na.rm = TRUE)

#can use quantile to get specific probabilities
quantile(restData$councilDistrict, probs = c(0.5, 0.75, 0.9), na.rm = TRUE)

#Make table function provides the count of each entry in a column
#ifany adds a final entry for NA values to check
table(restData$zipCode, useNA = "ifany")

#You can also make two dimensional tables to check how many of something is in something
#for example how many in district 2 are in a certain zipcode
table(restData$councilDistrict, restData$zipCode)


#Checking for missing values
sum(is.na(restData$councilDistrict))
#returns 1 if there are NAs

#can also use if any command
any(is.na(restData$councilDistrict))

#can also use conditional thru all()
all(restData$zipCode > 0)
#apparently there exists values less than zero for zipcodes here

#You can also take sums across columns to check if there are NAs
colSums(is.na(restData))


#Can also use
all(colSums(is.na(restData)) ==0)





#Finding values with specifics
#Like all zipcodes 21212
table(restData$zipCode %in% c("21212"))

#Can also input multiple
table(restData$zipCode %in% c("21212", "21213"))



#Can also use this to SUBSET
restData[restData$zipCode %in% c("21212", "21213"),]


#CROSS TABS
data("UCBAdmissions")
DF = as.data.frame(UCBAdmissions)
summary(DF)

xt <- xtabs(Freq ~ Gender + Admit, data=DF)
xt
Admit
#This shows the frequency of admission of per gender
# Gender   Admitted Rejected
# Male       1198     1493


#size of a data set
object.size()
print(object.size(DF), units = "Mb")
# Female      557     1278

