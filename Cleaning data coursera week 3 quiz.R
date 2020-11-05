library(dplyr)
library(tidyr)
#Create data directory
if(!file.exists("data")){
  dir.create("data")
}

#Place file url for file download
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
#Download the file
download.file(fileUrl, destfile = "./data/survey.csv")
#Load the file into variable survey
survey <- read.csv("./data/survey.csv")

survey %>% 
  filter(`AGS` == 6) %>% 
  View()

#1 Create logical vector for ACR = 3 and AGS = 6
agricultureLogical <- survey$ACR == 3 & survey$AGS == 6
#Apply which Function to variable to know which are true
which(agricultureLogical)
#  125  238  262

#2 Using jpeg package to read the picture given
#install.packages("jpeg")

picUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
#download the pic
download.file(picUrl, destfile = "./data/pic.jpg", mode = 'wb')

#Reading the image
#pic <- jpeg("./data/pic.jpg")

pic <- jpeg::readJPEG("./data/pic.jpg", native = TRUE)

quantile(pic, probs = c(0.3, 0.8))

#      30%       80% 
#-15258512 -10575416 


#3 Load the Gross Domestic Product data for the 190 ranked countries in this data set:

gdpUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
educUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
#Download both files
download.file(gdpUrl, destfile = "./data/gdp.csv")
download.file(educUrl, destfile = "./data/educ.csv")

gdp <- read.csv("./data/gdp.csv")
educ <- read.csv("./data/educ.csv")

#Matching both csvs using country shortcode
joined <- merge(gdp, educ, by.x = "X", by.y = "CountryCode", all = FALSE)
arr_joined <- arrange(joined, desc(as.numeric(as.character(Gross.domestic.product.2012))))

#4 
arr_joined %>% 
  filter(Income.Group == "High income: OECD") %>% 
  summarize(temp = mean(as.numeric(as.character(`Gross.domestic.product.2012`)),
                                   na.rm = TRUE)) %>% 
  View()

arr_joined %>% 
  filter(Income.Group == "High income: nonOECD") %>% 
  summarize(temp = mean(as.numeric(as.character(`Gross.domestic.product.2012`)),
                        na.rm = TRUE)) %>% 
  View()

#5 Cutting GDP into quantile groups

quant <- quantile(as.numeric(as.character(arr_joined$Gross.domestic.product.2012)),
                  probs = c(0, 0.2, 0.4, 0.6, 0.8, 1), na.rm = TRUE)
arr_joined %>% 
  mutate()

arr_joined2 <- arr_joined %>% 
  select(`Gross.domestic.product.2012`, `Income.Group`) %>% 
  mutate(gdpRank = 
           as.numeric(as.character(arr_joined$Gross.domestic.product.2012))) %>% 
  mutate(level = ifelse(gdpRank >= quant[1] & gdpRank < quant[2], "20%",
                        ifelse(gdpRank >= quant[2] & gdpRank < quant[3], "40%",
                               ifelse(gdpRank >= quant[3] & gdpRank < quant[4], "60%",
                                      ifelse(gdpRank >= quant[4] & gdpRank < quant[5], "80%",
                                             "100%"))))) %>% 
  filter(!is.na(`level`)) 
                            

arr_joined2 %>% 
  pivot_wider(id_cols = level, names_from = Income.Group, values_from = gdpRank) %>% 
  
  View()


  

