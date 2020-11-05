
#Week 4 Cleaning data quiz

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile = "./data/comm.csv")
#load data
comdata <- read.csv("./data/comm.csv")
#split names using wgtp
cnames <- names(comdata)

new <- strsplit(cnames, "^wgtp")
#get 123rd element
new[[123]]
# [1] ""   "15"

#load gdp again
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileUrl, destfile = "./data/gdp.csv")
#load data
gdp <- read.csv("./data/gdp.csv", nrows = 190, skip =4)

gdp1 <- gdp %>% 
  select(X.4) %>% 
  mutate(gdpnum = as.numeric(as.character(gsub(",","",X.4)))) %>% 
  summarize(temp = mean(`gdpnum`, na.rm = TRUE)) %>% 
  View()


#4


fileUrl1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
fileUrl2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileUrl1, destfile = "./data/gdp.csv")
download.file(fileUrl2, destfile = "./data/educ.csv")

gdp <- read.csv("./data/gdp.csv", skip = 4)
educ <- read.csv("./data/educ.csv")

joined <- merge(gdp, educ, by.x = "X", by.y = "CountryCode", all = TRUE)
endJune <- grep("Fiscal year end: June", joined$Special.Notes)
NROW(endJune)


#Amazon stock data
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)

library(lubridate)
#from rpubs

amzn2012 <- sampleTimes[grep("^2012", sampleTimes)]
NROW(amzn2012)
#250

NROW(amzn2012[weekdays(amzn2012) == "Monday"])
#[1] 47




