#Notes on Editing Variables

#Fixing character vectors

if(!file.exists("./data")){
  dir.create("./")
}

fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile = "./cameras.csv")
camData <- read.csv("./cameras.csv")
names(camData)

#Turning all column names to lower
tolower(names(camData))
# 
# [1] "address"                      "direction"                    "street"                      
# [4] "crossstreet"                  "intersection"                 "location.1"                  
# [7] "x2010.census.neighborhoods"   "x2010.census.wards.precincts" "zip.codes"  

#fix location.1

splitNames = strsplit(names(camData), "\\.")


splitNames[[6]][1]

#write function that retrieves first element of each

getFirstelement <- function(x){x[1]}
#sapply can apply functions to lists
sapply(splitNames, getFirstelement)


#Fixing using the sub command
#replacing _ with "
sub("\\.","", names(camData),)

#gsub to replace multiple instances of a character
gsub("\\.","", names(camData),)


#Finding values using grep()
grep("Almaeda", camData$intersection)

#Finding value and putting in a table
grepl("Almaeda", camData$intersection)


#Can use this to subset
camData2 <- camData[grepl("Almaeda", camData$intersection)]


#set grep() value = TRUE to return complete values
grep("Almaeda", camData$intersection, value = TRUE)



#Regualr expressions

# ^+text will match lines at the start

# $+text will match lines at the end

#All forms of the word bush
#[Bb][Uu][Ss][Hh]

#these can be combined

#[1-9] range of characters

#[^?.]$ looks at the end of each line and looks for anything that is not ? or .

# . represents any character
# 9.11 will search for 9-11 9a11 and so forth


# | matches either on the side
# flood|fire matches flood or fire


#^[Gg]ood|[Bb]ad 
# Search for any good at the start of the line and any bad at the middle

#^([Gg]ood|[Bb]ad) looks for good and bad at the beginning


#[Gg]eorge ([Ww]\.)? [Bb]ush this means that w. is optional


# * repeated number of times
#(.*) looks for characters in middle of () repeated any number of times


# + includes at least one 
#[0-9]+(.*)[0-9]+












