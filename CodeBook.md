##Feature Selection 

###The raw data features

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

The complete list of variables of each feature vector is available in "./UCI HAR Dataset/features.txt"

###The tidy data features

The features of this tidy data set 'MergedDataSet.txt' are a subset of the features of the raw data set. Each of the features is either the mean value or standard deviation of the feature:

* TimeBodyAccMeanValueInXAxis
* TimeBodyAccMeanValueInYAxis
* TimeBodyAccMeanValueInZAxis
* TimeBodyAccStandardDeviationInXAxis
* TimeBodyAccStandardDeviationInYAxis
* TimeBodyAccStandardDeviationInZAxis
* TimeGravityAccMeanValueInXAxis
* TimeGravityAccMeanValueInYAxis
* TimeGravityAccMeanValueInZAxis
* TimeGravityAccStandardDeviationInXAxis
* TimeGravityAccStandardDeviationInYAxis
* TimeGravityAccStandardDeviationInZAxis
* TimeBodyAccJerkMeanValueInXAxis
* TimeBodyAccJerkMeanValueInYAxis
* TimeBodyAccJerkMeanValueInZAxis
* TimeBodyAccJerkStandardDeviationInXAxis
* TimeBodyAccJerkStandardDeviationInYAxis
* TimeBodyAccJerkStandardDeviationInZAxis
* TimeBodyGyroMeanValueInXAxis
* TimeBodyGyroMeanValueInYAxis
* TimeBodyGyroMeanValueInZAxis
* TimeBodyGyroStandardDeviationInXAxis
* TimeBodyGyroStandardDeviationInYAxis
* TimeBodyGyroStandardDeviationInZAxis
* TimeBodyGyroJerkMeanValueInXAxis
* TimeBodyGyroJerkMeanValueInYAxis
* TimeBodyGyroJerkMeanValueInZAxis
* TimeBodyGyroJerkStandardDeviationInXAxis
* TimeBodyGyroJerkStandardDeviationInYAxis
* TimeBodyGyroJerkStandardDeviationInZAxis
* TimeBodyAccMagnitudeMeanValue
* TimeBodyAccMagnitudeStandardDeviation
* TimeGravityAccMagnitudeMeanValue
* TimeGravityAccMagnitudeStandardDeviation
* TimeBodyAccJerkMagnitudeMeanValue
* TimeBodyAccJerkMagnitudeStandardDeviation
* TimeBodyGyroMagnitudeMeanValue
* TimeBodyGyroMagnitudeStandardDeviation
* TimeBodyGyroJerkMagnitudeMeanValue
* TimeBodyGyroJerkMagnitudeStandardDeviation
* FrequencyBodyAccMeanValueInXAxis
* FrequencyBodyAccMeanValueInYAxis
* FrequencyBodyAccMeanValueInZAxis
* FrequencyBodyAccStandardDeviationInXAxis
* FrequencyBodyAccStandardDeviationInYAxis
* FrequencyBodyAccStandardDeviationInZAxis
* FrequencyBodyAccJerkMeanValueInXAxis
* FrequencyBodyAccJerkMeanValueInYAxis
* FrequencyBodyAccJerkMeanValueInZAxis
* FrequencyBodyAccJerkStandardDeviationInXAxis
* FrequencyBodyAccJerkStandardDeviationInYAxis
* FrequencyBodyAccJerkStandardDeviationInZAxis
* FrequencyBodyGyroMeanValueInXAxis
* FrequencyBodyGyroMeanValueInYAxis
* FrequencyBodyGyroMeanValueInZAxis
* FrequencyBodyGyroStandardDeviationInXAxis
* FrequencyBodyGyroStandardDeviationInYAxis
* FrequencyBodyGyroStandardDeviationInZAxis
* FrequencyBodyAccMagnitudeMeanValue
* FrequencyBodyAccMagnitudeStandardDeviation
* FrequencyBodyAccJerkMagnitudeMeanValue
* FrequencyBodyAccJerkMagnitudeStandardDeviation
* FrequencyBodyGyroMagnitudeMeanValue
* FrequencyBodyGyroMagnitudeStandardDeviation
* FrequencyBodyGyroJerkMagnitudeMeanValue
* FrequencyBodyGyroJerkMagnitudeStandardDeviation

The second tidy data set 'TidyDataSet.txt' contains the average of each variable for each activity and each subject:

* AverageOfTimeBodyAccMeanValueInXAxis
* AverageOfTimeBodyAccMeanValueInYAxis
* AverageOfTimeBodyAccMeanValueInZAxis
* AverageOfTimeBodyAccStandardDeviationInXAxis
* AverageOfTimeBodyAccStandardDeviationInYAxis
* AverageOfTimeBodyAccStandardDeviationInZAxis
* AverageOfTimeGravityAccMeanValueInXAxis
* AverageOfTimeGravityAccMeanValueInYAxis
* AverageOfTimeGravityAccMeanValueInZAxis
* AverageOfTimeGravityAccStandardDeviationInXAxis
* AverageOfTimeGravityAccStandardDeviationInYAxis
* AverageOfTimeGravityAccStandardDeviationInZAxis
* AverageOfTimeBodyAccJerkMeanValueInXAxis
* AverageOfTimeBodyAccJerkMeanValueInYAxis
* AverageOfTimeBodyAccJerkMeanValueInZAxis
* AverageOfTimeBodyAccJerkStandardDeviationInXAxis
* AverageOfTimeBodyAccJerkStandardDeviationInYAxis
* AverageOfTimeBodyAccJerkStandardDeviationInZAxis
* AverageOfTimeBodyGyroMeanValueInXAxis
* AverageOfTimeBodyGyroMeanValueInYAxis
* AverageOfTimeBodyGyroMeanValueInZAxis
* AverageOfTimeBodyGyroStandardDeviationInXAxis
* AverageOfTimeBodyGyroStandardDeviationInYAxis
* AverageOfTimeBodyGyroStandardDeviationInZAxis
* AverageOfTimeBodyGyroJerkMeanValueInXAxis
* AverageOfTimeBodyGyroJerkMeanValueInYAxis
* AverageOfTimeBodyGyroJerkMeanValueInZAxis
* AverageOfTimeBodyGyroJerkStandardDeviationInXAxis
* AverageOfTimeBodyGyroJerkStandardDeviationInYAxis
* AverageOfTimeBodyGyroJerkStandardDeviationInZAxis
* AverageOfTimeBodyAccMagnitudeMeanValue
* AverageOfTimeBodyAccMagnitudeStandardDeviation
* AverageOfTimeGravityAccMagnitudeMeanValue
* AverageOfTimeGravityAccMagnitudeStandardDeviation
* AverageOfTimeBodyAccJerkMagnitudeMeanValue
* AverageOfTimeBodyAccJerkMagnitudeStandardDeviation
* AverageOfTimeBodyGyroMagnitudeMeanValue
* AverageOfTimeBodyGyroMagnitudeStandardDeviation
* AverageOfTimeBodyGyroJerkMagnitudeMeanValue
* AverageOfTimeBodyGyroJerkMagnitudeStandardDeviation
* AverageOfFrequencyBodyAccMeanValueInXAxis
* AverageOfFrequencyBodyAccMeanValueInYAxis
* AverageOfFrequencyBodyAccMeanValueInZAxis
* AverageOfFrequencyBodyAccStandardDeviationInXAxis
* AverageOfFrequencyBodyAccStandardDeviationInYAxis
* AverageOfFrequencyBodyAccStandardDeviationInZAxis
* AverageOfFrequencyBodyAccJerkMeanValueInXAxis
* AverageOfFrequencyBodyAccJerkMeanValueInYAxis
* AverageOfFrequencyBodyAccJerkMeanValueInZAxis
* AverageOfFrequencyBodyAccJerkStandardDeviationInXAxis
* AverageOfFrequencyBodyAccJerkStandardDeviationInYAxis
* AverageOfFrequencyBodyAccJerkStandardDeviationInZAxis
* AverageOfFrequencyBodyGyroMeanValueInXAxis
* AverageOfFrequencyBodyGyroMeanValueInYAxis
* AverageOfFrequencyBodyGyroMeanValueInZAxis
* AverageOfFrequencyBodyGyroStandardDeviationInXAxis
* AverageOfFrequencyBodyGyroStandardDeviationInYAxis
* AverageOfFrequencyBodyGyroStandardDeviationInZAxis
* AverageOfFrequencyBodyAccMagnitudeMeanValue
* AverageOfFrequencyBodyAccMagnitudeStandardDeviation
* AverageOfFrequencyBodyAccJerkMagnitudeMeanValue
* AverageOfFrequencyBodyAccJerkMagnitudeStandardDeviation
* AverageOfFrequencyBodyGyroMagnitudeMeanValue
* AverageOfFrequencyBodyGyroMagnitudeStandardDeviation
* AverageOfFrequencyBodyGyroJerkMagnitudeMeanValue
* AverageOfFrequencyBodyGyroJerkMagnitudeStandardDeviation

The variables are renamed to pascal naming convention because it's easy to read, especially for long variable names.

##Data Transformation

The raw data set were partitioned into two sets named 'test' and 'train'. Each set has 3 files:

subject_test.txt : a vector of subjects who participated in the experiments  
y_test.txt : a vector of activities performed by the subjects  
X_test.txt : a data table of values produced by the accelerometer and gyroscope 3-axial raw signals  

The 'test' set can be found in './UCI HAR Dataset/test' directory.  
The 'train' set can be found in './UCI HAR Dataset/train' directory.  

###Steps to produce 'MergedDataSet.txt'

* The 3 files in each set were combined by columns.
* Then the two sets were combined by rows.
* The activity is replaced with the actual activity label.
* Each variable name is scrubbed of non-alphabetical characters.

###Steps to produce 'TidyDataSet.txt'

* Split 'MergedDataSet.txt' by activity and subject
* Take the mean of each variable
* Update the variable names to indicate they are the average of multiple observations
