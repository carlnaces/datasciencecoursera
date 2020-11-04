library(dplyr)

if(!file.exists("data")){
  dir.create("data")
}

#1
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile = "quiz.csv")

quizData <- read.csv("/home/coral/quiz.csv")

quizData %>% 
  filter(VAL == 24) %>% 
  View()


#3
library(xlsx)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileUrl, destfile = "excel.xlsx")
colIndex <- 7:15
rowIndex <- 18:23

dat <- read.xlsx("/home/coral/excel.xlsx", sheetIndex = 1,
                       colIndex = colIndex,
                       rowIndex = rowIndex)

sum(dat$Zip*dat$Ext,na.rm=T)


#4
library(XML)
fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- xmlTreeParse(fileUrl, useInternal = TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)
names(rootNode)
sum(xpathSApply(rootNode,"//zipcode",xmlValue) == 21231)

#5
library(data.table)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv" 
download.file(fileUrl, destfile = "datable.csv")

DT <- fread("/home/coral/datable.csv")

system.time(tapply(DT$pwgtp15,DT$SEX,mean))
#0.001
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
#0
system.time(mean(DT$pwgtp15,by=DT$SEX))
#0
system.time(DT[,mean(pwgtp15),by=SEX])
#0.002
system.time(mean(DT[DT$SEX==1,]$pwgtp15))
#0.004