###Week 2 quiz

setwd("C:/Users/hdung/Desktop/Getting and Cleaning Data")

##Question 1
github <- oauth_endpoints("github")
myapp <- oauth_app("github", "aafb404285d13a45c690", "d15a899417031582c647e5fd8c086ecf485303cf")
github_token <- oauth2.0_token(github, myapp)
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
cont <- content(req)
library(jsonlite)
jsonContent <- toJSON(cont, pretty = TRUE)
jsonData <- fromJSON(jsonContent)
names(jsonData)
jsonData[jsonData$name == "datasharing", ][["created_at"]]

##Question 2
if (!file.exists("./americancommunitysurvey.csv")) {
    fileUrl2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
    download.file(fileUrl2, destfile = "./americancommunitysurvey.csv")
    dateDownloadedfileUrl2 <- date()
}
acs <- read.table("./americancommunitysurvey.csv", sep = ",", header = TRUE)
library(sqldf)
sqldf("select pwgtp1 from acs where AGEP < 50")

##Question 3
sqldf("select distinct AGEP from acs")

##Question 4
url <- "http://biostat.jhsph.edu/~jleek/contact.html"
#library(httr)
#html <- GET(url)
#htmlContentAsText <- content(html, as = "text") #this is a single line of text
htmlCodes <- readLines(url)
nchar(htmlCodes[10])
nchar(htmlCodes[20])
nchar(htmlCodes[30])
nchar(htmlCodes[100])

##Question 5
if (!file.exists("./question5.txt")) {
    fileUrl5 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
    download.file(fileUrl5, destfile = "./question5.txt")
    dateDownloadedfileUrl5 <- date()
}
fwf <- read.fwf(file = "./question5.txt", skip = 4, widths = c(10, 9, 4, 9, 4, 9, 4, 9, 4))
sum(fwf[, 4])