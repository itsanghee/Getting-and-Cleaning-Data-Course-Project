# CodeBook for Getting and Cleaning Data Course Project
This is the codebook for my Getting and Cleaning Data Course Project. In order to make the best use of this file, you will have to download
the source data and run the R script `run_analysis.R`

The premise of this project is exploring one of the most exciting areas in data science right now - wearable computing. Companies like 
Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course 
website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site 
where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


## Data
The source data for this project can be found here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The data sets provided have been organized and combined into a single data set which can be found in `tidy.txt`

## Data Variables

### Identifiers

These two columns pertaining to `subject` and `activity` in each row of data in the dataset were used to classify the various measurements that were taken.

- `subject`
  Used to identify which subject was having measurements taken (1-30, out of 30 participants)
- `activity`
  Used to identify which of the 6 activities the subject was undertaking while having his/her measurements taken (self descriptive)
  
  - `WALKING`
  - `WALKING_UPSTAIRS`
  - `WALKING_DOWNSTAIRS`
  - `SITTING`
  - `STANDING`
  - `LAYING`
  
### Measurements
  
These are the remaining columns in each row of data that describe the measurements taken for `subject` and `activity` in 3-axial signals in the X, Y, and Z directions. 

There are two domains of signals which the measurements fall under:

- Time domain signals whose measurements have been captured by the accelerometer and gyroscope. These were originally denoted by the prefix `t` to denote time.
- Frequency domain signals whose measurements resulted from applying a FFT (Fast Fourier Transform) to some of the `t` signals. These were originally denoted by the prefix `f` to denote frequency. 

The following are the various variable measurements which the data set recorded based on the identifiers of `subject` and `activity`

  - tBodyAcc-XYZ
  - tGravityAcc-XYZ
  - tBodyAccJerk-XYZ
  - tBodyGyro-XYZ
  - tBodyGyroJerk-XYZ
  - tBodyAccMag
  - tGravityAccMag
  - tBodyAccJerkMag
  - tBodyGyroMag
  - tBodyGyroJerkMag
  - fBodyAcc-XYZ
  - fBodyAccJerk-XYZ
  - fBodyGyro-XYZ
  - fBodyAccMag
  - fBodyAccJerkMag
  - fBodyGyroMag
  - fBodyGyroJerkMag
  - gravityMean
  - tBodyAccMean
  - tBodyAccJerkMean
  - tBodyGyroMean
  - tBodyGyroJerkMean

