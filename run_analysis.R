#####################################################################################################################################
# Coursera Project 
# Peer Graded Assignment: Getting and Cleaning Data Course Project
# run_analysis.R
# Name: Peng Li
#####################################################################################################################################

### The introduction of the project:
# The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. 
# The goal is to prepare tidy data that can be used for later analysis

#####################################################################################################################################

# This script in this project were generated to accomplish the following:

# 1 Merges the training and the test sets to create one data set.
# 2 Extracts only the measurements on the mean and standard deviation for each measurement.
# 3 Uses descriptive activity names to name the activities in the data set
# 4 Appropriately labels the data set with descriptive variable names.
# 5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#####################################################################################################################################

### R Script starts here below:

#####################################################################################################################################

# Download the zip file

rm(list = ls())
fileurl<-"http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl,destfile = "Dataset.zip")


# Read the data files into R 
features <- read.table(unz("Dataset.zip", "UCI HAR Dataset/features.txt"))
train_set <- read.table(unz("Dataset.zip", "UCI HAR Dataset/train/X_train.txt"))
train_label <- read.table(unz("Dataset.zip", "UCI HAR Dataset/train/y_train.txt"))
test_set <- read.table(unz("Dataset.zip", "UCI HAR Dataset/test/X_test.txt"))
test_label <- read.table(unz("Dataset.zip", "UCI HAR Dataset/test/y_test.txt"))
subject_train <- read.table(unz("Dataset.zip", "UCI HAR Dataset/train/subject_train.txt"))
subject_test <- read.table(unz("Dataset.zip", "UCI HAR Dataset/test/subject_test.txt"))
activity_label <- read.table(unz("Dataset.zip", "UCI HAR Dataset/activity_labels.txt"))


# 1. Merge the training and the test sets to create one data set.
dataset <- rbind.data.frame(train_set, test_set)


# Combine the activities and Subjects in Train and Test data set to be used for the completed one data set 
activity_ID <- rbind.data.frame(train_label, test_label)
subject <- rbind.data.frame(subject_train, subject_test)


# 2 Extracts only the measurements on the mean and standard deviation for each measurement.
# Features contains the column names of the data set.
# we are looking through features to find the index of the columns which contains the measurements of mean and standard deviation
ind <- sort(c(grep("-mean", features[,2]), grep("-std", features[,2])))
dataset2 <- dataset[,ind] # This is the dataset extracted to only contains the meansurements on the mean and standard deviation for each measurement


# 3 Uses descriptive activity names to name the activities in the data set

# Map the activity ID combined from Train and Test to the Activity names contained in the Acitivity label data set
rownumber <- 1:length(activity_ID[,1]) # create a variable "rownumber" to keep track of the row number of the original data set
activity_ID <- cbind(rownumber, activity_ID) # add the rownumber to the activity ID data


# merge the activity ID and activity label so as to map the ID to the activity names
activity <- merge(x=activity_ID,y=activity_label, by.x="V1", by.y = "V1", all.x = TRUE, sort = FALSE) 

# Since the merge function didn't keep the order, therefore we revert it back to the orginal order based on the rownumber column created
activity <- activity[order(activity$rownumber),] # re-order this merged data based on the rownumber column which keeps the orginal order
activity_name <- activity[,3] # extract the activity names and asign them to the vector activity_name

# Then combine the dataset with subject and activity 
dataset3 <- data.frame(subject, activity_name, dataset2)


# 4 Appropriately labels the data set with descriptive variable names.

# clean up the features vector which will be used as column names
# Remove parantheses, hyphens, rename some of the variables 
temp <- gsub("\\()", "", features[,2])
temp <- gsub("-std","-StdDev", temp)
temp <- gsub("-mean","-Mean", temp)
temp <- gsub("-", "_",temp)
temp <- gsub("^(t)", "time_",temp)
temp <- gsub("^(f)", "Frequency_",temp)
temp <- gsub("BodyBody", "Body",temp)
featurenames <- temp[ind]  # only keep those features with measurements on the mean and standard deviation


# labels the data set with descriptive variable names
colnames(dataset3) <- c("Subject", "Activity", featurenames)


# 5 create a second, independent tidy data set with the average of each variable for each activity and each subject.

require(dplyr) # calling the "dplyr" package
library(dplyr)
tidydata <- dataset3 %>%
  group_by(Subject, Activity) %>% # group the data by subject and activity
  summarize_each(funs(mean))  # summarize the average of each features grouped by activity and subject


# Export the tidyData set 
write.table(tidydata, file = "tidydata.txt",row.names=FALSE, sep="\t")

