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

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis

The Project includes the following files:

- README.MD - Outlines the procedure of the whole analysis 
- CodeBook.MD - Describes the experiment data and variables included in the codes and data
- run_analysis.R - R script that performs this analysis includng merge, clean-up, transform, and summarize the data.
- tidydata.txt - The completed tidydata outputed by this run_analysis.R script.

## Procedure

1. Download the zip file using download.file
2. Unzip the file and read the train and test data sets as well as the data containing activity and subject information 
3. Merge the train and test data sets into one data set
4. processes the merged data set (extract the relevant variables, adds descriptive variable names, etc.)
5. Summarize the data to have the average of each variable for each activity and each subject
6. Writes the tidy data set to tidydata.txt

The detailed interpretation of the script has been noted for each line of codes in the run_analysis.R scrip









