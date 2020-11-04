
#Setting url
con = url("http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en")
htmlCode = read_lines(con)
close(con)
htmlCode

#Use XML to read

library(XML)

url <- "http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en"

#internal nodes is to get the complete strucuture out

html <- htmlTreeParse(url, useInternalNodes = T)
xpathSApply(html, "//title", xmlValue)




#Webscraping using get httr
library(httr); html2= GET(url)
content2 = content(html2, as="text")
parsedHtml = htmlParse(content2, asText = TRUE)
xpathSApply(parsedHtml, "//title", xmlValue)


#Accessing websites with passwords
pg1 = GET("http://httpbin.org/basic-auth/user/passwd")
pg1
#Shows status 401 - means not authenticated

#Accessing with password

pg2 = GET("http://httpbin.org/basic-auth/user/passwd",
  authenticate("user", "passwd"))

pg2
#Status 200 means authenticated

#can now look into stuff
names(pg2)


#Using handles to save authentication
google = handle("http://google.com")
pg1 = GET(handle = google, path = "/")
pg2 = GET(handle = google, path = "search")

