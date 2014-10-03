###Week 4 quiz

setwd("C:/Users/hdung/Desktop/Getting and Cleaning Data")

##Question 1
if (!file.exists("./idahohousing4_1.csv")) {
    fileUrl4.1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
    download.file(fileUrl4.1, destfile = "./idahohousing4_1.csv")
    dateDownloadedfileUrl4.1 <- date()
}
idahohousingData <- read.table("./idahohousing4_1.csv", sep = ",", header = TRUE)
strsplit(names(idahohousingData), "wgtp")[123]


##Question 2
if (!file.exists("./GDPdata4_2.csv")) {
    fileUrl4.2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
    download.file(fileUrl4.2, destfile = "./GDPdata4_2.csv")
    dateDownloadedfileUrl4.2 <- date()
}
gdpData <- read.csv("./GDPdata4_2.csv", skip = 4, nrows = 190)
mean(as.numeric(gsub(",", "", gdpData$X.4)))

##Question 3
grep("^United", gdpData$X.3)

##Question 4
if (!file.exists("./educationaldata4_4.csv")) {
    fileUrl4.4 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
    download.file(fileUrl4.4, destfile = "./educationaldata4_4.csv")
    dateDownloadedfileUrl4.4 <- date()
}
educationalData <- read.csv("./educationaldata4_4.csv")
mergedData <- merge(gdpData, educationalData, by.x = "X", by.y = "CountryCode", all = FALSE)
length(grep("[Ff]iscal year end: [Jj]une", mergedData$Special.Notes))

##Question 5
library(quantmod)
amzn <- getSymbols("AMZN", auto.assign = FALSE)
sampleTimes <- index(amzn)
sampleTimesDF <- data.frame(date = sampleTimes, year = format(sampleTimes, "%Y"), dayofweek = format(sampleTimes, "%A"))
length(grep("2012", sampleTimesDF$year))
length(which(sampleTimesDF$year == "2012" & sampleTimesDF$dayofweek == "Monday"))