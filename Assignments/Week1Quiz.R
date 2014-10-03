###Week 1 quiz

setwd("C:/Users/hdung/Desktop/Getting and Cleaning Data")

##Question 1
if (!file.exists("./idahohousing.csv")) {
    fileUrl1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
    download.file(fileUrl1, destfile = "./idahohousing.csv")
    dateDownloadedfileUrl1 <- date()
}
idahohousingData <- read.table("./idahohousing.csv", sep = ",", header = TRUE)
homeValues <- idahohousingData$VAL
#24 indicates property value $1,000,000+
length(homeValues[homeValues == 24 & !is.na(homeValues)])


##Question 3
if (!file.exists("./naturalgasaquisition.xlsx")) {
    fileUrl2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
    download.file(fileUrl2, destfile = "./naturalgasaquisition.xlsx", mode = "wb")
    dateDownloadedfileUrl2 <- date()
}
library(xlsx)
colIndex <- 7:15
rowIndex <- 18:23
dat <- read.xlsx("./naturalgasaquisition.xlsx", sheetIndex = 1, colIndex = colIndex, rowIndex = rowIndex)
sum(dat$Zip*dat$Ext,na.rm=T)


##Question 4
#https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml
#xmlTreeParse doesn't work with https - missing parameters perhaps?!
library(XML)
fileUrl3 <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
xmlDoc <- xmlTreeParse(fileUrl3, useInternal = TRUE)
rootNode <- xmlRoot(xmlDoc)
zipCodes <- xpathSApply(rootNode, "//zipcode", xmlValue)
length(zipCodes[zipCodes == "21231"])


##Question 5
if (!file.exists("./idahohousing5.csv")) {
    fileUrl4 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
    download.file(fileUrl4, destfile = "./idahohousing5.csv")
    dateDownloadedfileUrl4 <- date()
}
library(data.table)
DT <- fread("./idahohousing5.csv")

Rprof("x1.out", line.profiling = TRUE)
replicate(1000, {mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)})
Rprof(NULL)
summaryRprof("x1.out", lines = "show")

Rprof("x2.out", line.profiling = TRUE)
replicate(1000, {rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]})
Rprof(NULL)
summaryRprof("x2.out", lines = "show")

Rprof("x3.out", line.profiling = TRUE)
replicate(1000, sapply(split(DT$pwgtp15,DT$SEX),mean))
Rprof(NULL)
summaryRprof("x3.out", lines = "show")

Rprof("x4.out", line.profiling = TRUE)
replicate(1000, tapply(DT$pwgtp15,DT$SEX,mean))
Rprof(NULL)
summaryRprof("x4.out", lines = "show")

Rprof("x5.out", line.profiling = TRUE)
replicate(1000, mean(DT$pwgtp15,by=DT$SEX))
Rprof(NULL)
summaryRprof("x5.out", lines = "show")

Rprof("x6.out", line.profiling = TRUE)
replicate(1000, DT[,mean(pwgtp15),by=SEX])
Rprof(NULL)
summaryRprof("x6.out", lines = "show")


system.time(replicate(1000, {mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)}))
system.time(replicate(1000, {rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]}))
system.time(replicate(1000, sapply(split(DT$pwgtp15,DT$SEX),mean)))
system.time(replicate(1000, tapply(DT$pwgtp15,DT$SEX,mean)))
system.time(replicate(1000, mean(DT$pwgtp15,by=DT$SEX)))
system.time(replicate(1000, DT[,mean(pwgtp15),by=SEX]))
