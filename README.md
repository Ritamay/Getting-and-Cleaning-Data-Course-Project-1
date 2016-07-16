# Getting-and-Cleaning-Data-Course-Project
Getting and Cleaning Data Course Project: Week 4 Assignment


## Assignment Instructions

You should create one R script called run_analysis.R that does the following.

Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names.
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## Steps to work on this course project

1. Download the data source and put into a folder on your local drive. You'll have a ```UCI HAR Dataset``` folder.
  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Put ```run_analysis.R``` in the ```UCI HAR Dataset``` folder. Note: make sure to set the working directory ```setwd()``` to this folder.
3. Run the ```source("run_analysis.R")```, then it will generate the ```Tiny_Data.csv``` in your working directory and it will open up automatically (by 'shell.exec()' funcion).
