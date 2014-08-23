setwd("C:/Users/hdung/Desktop/Getting and Cleaning Data/UCI HAR Dataset")

##Load the activity names
activityLabels <- read.table("./activity_labels.txt")
colnames(activityLabels) <- c("ActivityID", "ActivityName")
#Replace underscore with space so the activity names appear like natural English
activityLabels$ActivityName <- sub("_", " ", activityLabels$ActivityName)

##Load the feature names
features <- read.table("./features.txt")
colnames(features) <- c("FeatureID", "FeatureName")
#We are only interested in mean and standard deviation features
interestedFeatures <- grep("[-]mean[(][)]|[-]std[(][)]", features$FeatureName)

##Load the Test group of volunteers
testSubjects <- read.table("./test/subject_test.txt")
colnames(testSubjects) <- c("SubjectID")

##Load the activities from the Test group
testActivities <- read.table("./test/y_test.txt")
colnames(testActivities) <- c("ActivityID")

##Load the data set for the Test group
testData <- read.table("./test/X_test.txt")
colnames(testData) <- features$FeatureName
#Get the interested features - mean and standard deviation
interestedTestData <- testData[, interestedFeatures]

##Associate the Test subjects with their activities and data set
testDataGroup <- cbind(testSubjects, testActivities, interestedTestData)

##Load the Training group of volunteers
trainSubjects <- read.table("./train/subject_train.txt")
colnames(trainSubjects) <- c("SubjectID")

##Load the activities from the Training group
trainActivities <- read.table("./train/y_train.txt")
colnames(trainActivities) <- c("ActivityID")

##Load the data set for the Training group
trainData <- read.table("./train/X_train.txt")
colnames(trainData) <- features$FeatureName
#Get the interested features - mean and standard deviation
interestedTrainData <- trainData[, interestedFeatures]

##Associate the Training subjects with their activities and data set
trainDataGroup <- cbind(trainSubjects, trainActivities, interestedTrainData)

##Merge both (Test and Training) sets of data
data <- rbind(testDataGroup, trainDataGroup)
#Show the activities by their names
data <- merge(activityLabels, data, by.x = "ActivityID", by.y = "ActivityID")
#Remove the activity id from the data set
data <- data[, !(colnames(data) %in% c("ActivityID"))]

##Rename variables
colnames(data) <- sub("BodyBody", "Body", colnames(data))
colnames(data) <- sub("tBody", "TimeBody", colnames(data))
colnames(data) <- sub("tGravity", "TimeGravity", colnames(data))
colnames(data) <- sub("fBody", "FrequencyBody", colnames(data))
colnames(data) <- sub("Mag-", "Magnitude-", colnames(data))

colnames(data) <- sub("-mean\\()-X", "MeanValueInXAxis", colnames(data))
colnames(data) <- sub("-mean\\()-Y", "MeanValueInYAxis", colnames(data))
colnames(data) <- sub("-mean\\()-Z", "MeanValueInZAxis", colnames(data))
colnames(data) <- sub("-std\\()-X", "StandardDeviationInXAxis", colnames(data))
colnames(data) <- sub("-std\\()-Y", "StandardDeviationInYAxis", colnames(data))
colnames(data) <- sub("-std\\()-Z", "StandardDeviationInZAxis", colnames(data))

colnames(data) <- sub("-mean\\()", "MeanValue", colnames(data))
colnames(data) <- sub("-std\\()", "StandardDeviation", colnames(data))

##Sort data
data <- data[order(data$SubjectID, data$ActivityName), ]

##Create a new tidy data set with the average of each variable for each activity and each subject
##library(data.table)
##DT <- data.table(data)
activityFactor <- factor(data$ActivityName)
subjectFactor <- factor(data$SubjectID)
dataPerActivityPerSubject <- split(data, list(activityFactor, subjectFactor))
dataMean <- lapply(dataPerActivityPerSubject,
                   function(x){
                       subjectActivityMean <- colMeans(x[, 3:length(colnames(x))])
                       result <- as.data.frame(matrix(data = subjectActivityMean,
                                                      nrow = 1,
                                                      ncol = length(subjectActivityMean)))
                       colnames(result) <- names(subjectActivityMean)
                       cbind(x[1, c("SubjectID", "ActivityName")], result)
                   })
dataMean <- data.frame(Reduce(rbind, dataMean))
rownames(dataMean) <- 1:nrow(dataMean)
colnames(dataMean) <- sub("Time", "AverageOfTime", colnames(dataMean))
colnames(dataMean) <- sub("Frequency", "AverageOfFrequency", colnames(dataMean))

