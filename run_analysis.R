###################################################################################################
## Download data set and ensure it is in the R working directory, then load library to work in R ## 
###################################################################################################
library(data.table)
library(dplyr)

## read features.txt  and activity_labels.txt store in variables featureNames and activityLabels ##
featureNames <- read.table("UCI HAR Dataset/features.txt")
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)

## read subject_train.txt, y_train.txt, and X_train.txt and store into training data 
subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)
activityTrain <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)
featuresTrain <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)

## read subject_test.txt, y_test.txt, and X_test.txt and store into test data
subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)
activityTest <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)
featuresTest <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)

##############################################################################################
## We can now complete part 1 of the project by merging the training and test data into one ##
##############################################################################################

subject <- rbind(subjectTrain, subjectTest)
activity <- rbind(activityTrain, activityTest)
features <- rbind(featuresTrain, featuresTest)

## The following line of code uses the data stored in featureNames to name to columns in features ##
colnames(features) <- t(featureNames[2])

## Merge the data from features, activity, and subject into completeData ##
colnames(activity) <- "Activity"
colnames(subject) <- "Subject"
completeData <- cbind(features,activity,subject)

################################################################################################
# We now extract just the measurements on the mean and standard deviation for each measurement.#
# as stated in part 2.                                                                         #
################################################################################################

columnsWithMeanSTD <- grep(".*Mean.*|.*Std.*", names(completeData), ignore.case=TRUE)
requiredColumns <- c(columnsWithMeanSTD, 562, 563)
dim(completeData)

extractedData <- completeData[,requiredColumns]
dim(extractedData)

#################################################################################################
# This portion now transforms the basic activity names to descriptive (part 3)                  #
#################################################################################################

extractedData$Activity <- as.character(extractedData$Activity)
for (i in 1:6){
  extractedData$Activity[extractedData$Activity == i] <- as.character(activityLabels[i,2])
}

extractedData$Activity <- as.factor(extractedData$Activity)

#################################################################################################
# Labels data set with descriptive variable names as per (part 4)
# Acc replaced with Accelerometer
# Gyro replaced with Gyroscope
# Mag replaced with Magnitude
# 'f' replaced with Frequency 
# 't' replaced with Time
# tBody replaced with TimeBody
#################################################################################################

names(extractedData)
names(extractedData)<-gsub("Acc", "Accelerometer", names(extractedData))
names(extractedData)<-gsub("Gyro", "Gyroscope", names(extractedData))
names(extractedData)<-gsub("BodyBody", "Body", names(extractedData))
names(extractedData)<-gsub("Mag", "Magnitude", names(extractedData))
names(extractedData)<-gsub("^t", "Time", names(extractedData))
names(extractedData)<-gsub("^f", "Frequency", names(extractedData))
names(extractedData)<-gsub("tBody", "TimeBody", names(extractedData))
names(extractedData)<-gsub("-mean()", "Mean", names(extractedData), ignore.case = TRUE)
names(extractedData)<-gsub("-std()", "STD", names(extractedData), ignore.case = TRUE)
names(extractedData)<-gsub("-freq()", "Frequency", names(extractedData), ignore.case = TRUE)
names(extractedData)<-gsub("angle", "Angle", names(extractedData))
names(extractedData)<-gsub("gravity", "Gravity", names(extractedData))

## Load new variable names 
names(extractedData)

#############################################################################################################
# From data set in step 4, create a tidy data set with average of each variable for each activity + subject #
#############################################################################################################

extractedData$Subject <- as.factor(extractedData$Subject)
extractedData <- data.table(extractedData)
tidyData <- aggregate(. ~Subject + Activity, extractedData, mean)

## sort tidyData by Subject and Activity and write into Tidy.txt (to be uploaded to GitHub)
tidyData <- tidyData[order(tidyData$Subject,tidyData$Activity),]
write.table(tidyData, file = "Tidy.txt", row.names = FALSE)
