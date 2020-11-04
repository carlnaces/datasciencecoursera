library(RMySQL)

#Conneting and viewing available databases
ucscDb <-  dbConnect(MySQL(), user= "genome",
                     host = "genome-mysql.cse.ucsc.edu")

result <- dbGetQuery(ucscDb, "show databases;"); dbDisconnect(ucscDb);
result

#Selecting a database for human genome  hg19
hg19 <- dbConnect(MySQL(), user = "genome",
                  db = "hg19",
                  host = "genome-mysql.cse.ucsc.edu")
allTables <- dbListTables(hg19)
length(allTables)

#Show first 5 tables
allTables[1:5]

#Show all fields of a particular table in a particular database (Columns
dbListFields(hg19, "affyU133Plus2")

#Show all rows of the same table
dbGetQuery(hg19, "select count(*) from affyU133Plus2")

#Actually reading table now
affyData <- dbReadTable(hg19, "affyU133Plus2")
View(head(affyData))

#Loading only a subset of a database because too large
#Note "misMatches is a column of the table
#This just stores the result of the query
query <- dbSendQuery(hg19, "select * from affyU133Plus2 where misMatches between 1 and 3")

#Fetching the query result
affyMis <- fetch(query); quantile(affyMis$misMatches)

#This doesn't download the data yet

#Download a small part only , don't forget to clear query
affyMisSmall <- fetch(query, n = 10); dbClearResult(query);

#get dimensions of downloaded small part of database
dim(affyMisSmall)

#most important is to close connectio
dbDisconnect(hg19)



#Reading on HDF5
source("http://bioconductor.org/biocLite.R")
bioclite("rhdf5")













