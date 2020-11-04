#install.packages("jsonlite")
library(jsonlite)
#install.packages("httpuv")
library(httpuv)
#install.packages("httr")
library(httr)

#1
# Can be github, linkedin etc depending on application
oauth_endpoints("github")

# Change based on what you 
myapp <- oauth_app(appname = "coursera_oath",
                   key = "60050b53ff2d3f95cbe6",
                   secret = "0618b519d0ad14c305c04d375a470da4a3ba0465")

# Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)

# Take action on http error
stop_for_status(req)

# Extract content from a request
json1 = content(req)

# Convert to a data.frame
gitDF = jsonlite::fromJSON(jsonlite::toJSON(json1))

# Subset data.frame
gitDF[gitDF$full_name == "jtleek/datasharing", "created_at"] 





#2 sqldf
library(sqldf)

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
f <- file.path(getwd(), "ss0pid.csv")
download.file(url, f)
acs <- data.table::data.table(read.csv(f))

#query below selects only the data for the probability weights pwgtp1 
# with ages less than 50
query1 <- sqldf("select pwgtp1 from acs where AGEP < 50")

#3 Query below is same as sqldf("select distinct AGEP from acs)
unique(acs$AGEP)

#4 Opening and reading html file thru readLines function, don't forget to close connnection

fileUrl <- "http://biostat.jhsph.edu/~jleek/contact.html"
html <- readLines(fileUrl)
close(fileUrl)

# The line below counts the numberof characters there are per specific line in the html code
c(nchar(html[10]),nchar(html[20]),nchar(html[30]),nchar(html[100]))


#5 Reading thru another html

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
lines <- readLines(url, n = 10)

#the code below is from mGalarnyk not fully understand it yet.

w <- c(1, 9, 5, 4, 1, 3, 5, 4, 1, 3, 5, 4, 1, 3, 5, 4, 1, 3)
colNames <- c("filler", "week", "filler", "sstNino12", "filler", "sstaNino12", 
              "filler", "sstNino3", "filler", "sstaNino3", "filler", "sstNino34", "filler", 
              "sstaNino34", "filler", "sstNino4", "filler", "sstaNino4")
d <- read.fwf(url, w, header = FALSE, skip = 4, col.names = colNames)
d <- d[, grep("^[^filler]", names(d))]
sum(d[, 4])
