library(readr)
library(dplyr)


hw1 <- read_csv("/home/coral/datasciencercoursera_codes/hw1_data.csv")

#12
hw1 %>% 
  head() %>% 
  View()

#13
hw1 %>% 
  nrow()

#14
hw1 %>% 
  tail() %>% 
  View()

#15
hw1$Ozone[47]

#16
hw1 %>% 
  subset(is.na(`Ozone`)) %>%
  nrow()

#17
hw1 %>% 
  select(Ozone) %>%
  summarize(temp = mean(Ozone, na.rm = TRUE)) %>% 
  View()
  