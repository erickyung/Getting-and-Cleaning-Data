##Getting and Cleaning Data

###The raw data

Here is the link to download the raw data set:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Please refer to its README.txt for detailed information on how the data set was gathered and stored.

For more information about this dataset contact: activityrecognition@smartlab.ws

####License:

Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

###How to use this Git repository

1. Fork this Git repository and clone it to your local repository
2. Run RStudio
3. Set the working directory in RStudio to this local repository
4. Open the R script run_analysis.R in RStudio
5. Run the R script run_analysis.R by selecting all lines and clicking on the Run icon

Notes: This repository has already included the raw data set in "./UCI HAR Dataset" directory. If you would like to download the raw data set, make sure to extract the content of the zip file and place it at the root directory of your local repository.

After the script finishes running, there are two tidy data set files created in the root directory:

1. MergedDataSet.txt : combine all observations and extract only the measurements on the mean and standard deviation for each feature
2. TidyDataSet.txt : take the average of each feature for each activity and each subject