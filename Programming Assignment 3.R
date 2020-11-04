library(data.table)
library(readr)
library(dplyr)

#read the data
#data <- data.table::fread('outcome-of-care-measures.csv')
data <- read_csv("/home/coral/outcome-of-care-measures.csv")

data <- data %>%
  mutate( `heart attack` = `Hospital 30-Day Death (Mortality) Rates from Heart Attack`,
          `heart failure` = `Hospital 30-Day Death (Mortality) Rates from Heart Failure`,
          `pneumonia` = `Hospital 30-Day Death (Mortality) Rates from Pneumonia`) 
  

best <- function(state, outcome){
  
  chosen_outcome <- outcome
  chosen_state <- state

  #Check if the entered state name is a unique entry on the column State  
  if(!chosen_state %in% unique(data[["State"]])){
    stop('invalid state')
  }

  if(!chosen_outcome %in% c("heart attack", "heart failure", "pneumonia")){
    stop('invalid outcome')
  }
  
  #filter table thru state name input
  data %>% 
    filter(`State` == chosen_state) %>% 
    a

  
}



#1
data %>% 
  filter(`State` == "SC") %>% 
  arrange(`heart attack`) %>% 
  head(49) %>% 
  View()

#2
data %>% 
  filter(`State` == "NY") %>% 
  arrange(as.numeric(`pneumonia`)) %>% 
  head(49) %>% 
  View()

#3
data %>% 
  filter(`State` == "AK") %>% 
  arrange(as.numeric(`pneumonia`)) %>% 
  head(49) %>% 
  View()

#4
data %>% 
  filter(`State` == "NC") %>% 
  arrange(as.numeric(`heart attack`)) %>% 
  head(49) %>% 
  View()

#5
data %>% 
  filter(`State` == "WA") %>% 
  arrange(as.numeric(`heart attack`)) %>% 
  head(49) %>% 
  View()

#6
data %>% 
  filter(`State` == "TX") %>% 
  arrange(as.numeric(`pneumonia`)) %>% 
  head(49) %>% 
  View()

#7
data %>% 
  filter(`State` == "NY") %>% 
  arrange(as.numeric(`heart attack`)) %>% 
  head(49) %>% 
  View()

#8
data %>% 
  filter(`State` == "HI") %>% 
  arrange(as.numeric(`heart attack`)) %>% 
  head(49) %>% 
  View()

#9
data %>% 
  filter(`State` == "NJ") %>% 
  arrange(desc(as.numeric(`pneumonia`))) %>% 
  head(49) %>% 
  View()

#10
data %>% 
  filter(`State` == "NV") %>% 
  arrange(as.numeric(`heart failure`)) %>% 
  head(49) %>% 
  View()























    
    
    
    
  