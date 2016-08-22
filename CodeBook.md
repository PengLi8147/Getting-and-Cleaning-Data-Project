# Peer Graded Assignment: Getting and Cleaning Data Course Project

Name: Peng Li

## Data description

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

## Project Description

The run_analysis.R perform the following steps:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Variable Description

### Files that read into my analysis from the zip file are:

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels that contains the avtivity ID range from 1 to 6

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels that contains the avtivity ID range from 1 to 6

- 'subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

### Variables created during the analysis:

features: A 561-feature vector with time and frequency domain variables
train_set: Train data set
train_label: A vector of activity ID for train data set
test_set: Test data set
test_label: A vector of activity ID for test data set
subject_train: A vector of subject ID for train data set
subject_test: A vector of subject ID for test data set
activity_label: Activity label with activity ID and their corresponding activity names 
activity_ID: A combined vector of activity ID for whole raw data set
subject: A combined vector of subject ID for whole raw data set

### Other feature variables

The following variables measure the mean and the standard deviation of each record for any given subject and activity.
 
The detailed description of the measurement infromation can be found in the features_info.txt file included in the data zip file.

- tBodyAcc_mean_X
- tBodyAcc_mean_Y
- tBodyAcc_mean_Z
- tGravityAcc_mean_X
- tGravityAcc_mean_Y
- 	.
- 	.
- 	.
- fBodyAccJerk_std_Y
- fBodyAccJerk_std_Z
- fBodyGyro_std_X
- fBodyGyro_std_Y
- fBodyGyro_std_Z
- fBodyAccMag_std
- fBodyAccJerkMag_std
- fBodyGyroMag_std
- fBodyGyroJerkMag_std
















