#Process for downloading data online

#set working directory thru getwd() or setwd()

#function for checking if directory is in current directory  and if it isn't create that directory

if(!file.exists("data")){
  dir.create("data")
}

#Download file thru url
fileUrl <- "https:// "
download.file(fileUrl, destfile = "cameras.csv", method ="curl")

#save date downloaded
dataDownloaded <- date()


#reading camera data
cameraData <- read.table("file directory", sep =",", header = TRUE)

#number of rows to read
nrows()

#can be paired skip 
skip()


#reading excel use xlsx package
library(xlsx)
read.xlsx()

#read specific rows or columns
colIndex <- 2:3
rowIndex <- 1:4

cameraData <- read.xlsx("file directory", sheetIndex = 1, colIndex = colIndex,
                        rowIndex = rowIndex)


#Reading Extensible Markup Language (XML) using XML package
library(XML)
fileUrl <- "https something"
doc <- xmlTreeParse(fileUrl, useInternal = TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)
names(rootNode)

#Directly access parts of the XML
rootNode[1]

#if you just want first element subset
rootNode[[1][1]]

#can learn Xpath for more advanced.

#Reading JavaScript Object Notation
library(jsonlite)
jsonData <- fromJSON("https something")
names(jsonData)

#You can write dataframes into JSON for API
myjson <- toJSON(iris, pretty = TRUE)







