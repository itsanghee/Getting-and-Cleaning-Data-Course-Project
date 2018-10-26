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

The columns pertaining to `subject` and `activity` in the dataset were used to classify the various measurements that were taken.
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
  
  
