###Week 3 quiz

setwd("C:/Users/hdung/Desktop/Getting and Cleaning Data")

##Question 1
if (!file.exists("./idahohousing.csv")) {
    fileUrl1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
    download.file(fileUrl1, destfile = "./idahohousing.csv")
    dateDownloadedfileUrl1 <- date()
}
idahohousingData <- read.table("./idahohousing.csv", sep = ",", header = TRUE)
agricultureLogical <- idahohousingData$ACR == 3 & idahohousingData$AGS == 6
which(agricultureLogical)[1:3]

##Question 2
if (!file.exists("./JeffLeek.jpg")) {
    fileUrl2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
    download.file(fileUrl2, destfile = "./JeffLeek.jpg", mode = "wb")
    dateDownloadedfileUrl2 <- date()
}
library(jpeg)
jeffleek <- readJPEG("./JeffLeek.jpg", native = TRUE)
quantile(jeffleek, c(0.3, 0.8))

##Question 3
if (!file.exists("./GDPdata.csv")) {
    fileUrl3.1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
    download.file(fileUrl3.1, destfile = "./GDPdata.csv")
    dateDownloadedfileUrl3.1 <- date()
}
gdpData <- read.csv("./GDPdata.csv", skip = 4, nrows = 190)

if (!file.exists("./educationaldata.csv")) {
    fileUrl3.2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
    download.file(fileUrl3.2, destfile = "./educationaldata.csv")
    dateDownloadedfileUrl3.2 <- date()
}
educationalData <- read.csv("./educationaldata.csv")

mergedData <- merge(gdpData, educationalData, by.x = "X", by.y = "CountryCode", all = FALSE)
mergedData$X.4 <- as.numeric(gsub(",", "", mergedData$X.4))
length(mergedData$X)
mergedData[order(mergedData$X.4), ][13, "X.3"]

##Question 4
#High income: OECD
mean(mergedData[mergedData$Income.Group == "High income: OECD", "X.1"])
#High income: nonOECD
mean(mergedData[mergedData$Income.Group == "High income: nonOECD", "X.1"])

##Question 5
mergedData$Rank.Group <- cut(mergedData$X.1, quantile(mergedData$X.1, probs=seq(0,1, by=0.20)))
rankVsIncomeGroup <- table(mergedData$Rank.Group, mergedData$Income.Group)
rankVsIncomeGroup["(1,38.6]", "Lower middle income"]

#Another way to get the same result
library(Hmisc)
mergedData$Rank.Group2 <- cut2(mergedData$X.1, g = 5)
rankVsIncomeGroup2 <- table(mergedData$Rank.Group2, mergedData$Income.Group)
rankVsIncomeGroup2["[  1, 39)", "Lower middle income"]