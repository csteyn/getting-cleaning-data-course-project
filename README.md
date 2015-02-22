# Getting and Cleaning Data Course Project
This repository is created as part of the requirements for the Coursera: Getting and Cleaning Data course project. Presented by Johns Hopkins University

2015/02/22

#Course Instruction
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. 
The goal is to prepare tidy data that can be used for later analysis. 

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data for the project can be found at: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

You should create one R script called run_analysis.R that does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#What you find in this repository
README.md: This file
CodeBook.md: Information about raw and tidy data set and transformation required to clean the raw data set
run_analysis.R: R script to transform raw data set into a tidy data set

#How to create the tidy data set
1. Download data from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
2. Unzip raw data and copy the directory UCI HAR Dataset to the cloned repository root directory
3. Open a R console and set the working directory to the repository root (use setwd())
4. Source run_analisys.R script (it requires the plyr package): source('run_analysis.R')
5. In the root directory you will find the tidy data file: avg_by_act_sub.txt.
