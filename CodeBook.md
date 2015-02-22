#Code Book for run_analysis.R
This code was writen for the Coursera: Getting and Cleaning Data - Course Project

2015/02/22

#Description
The run_analysis.R code uses the data contained in the UCI HAR Dataset and transforms it into a clean data set avg_by_act_sub.txt

The code was produced in R version 3.1.2 (2014-10-31) -- "Pumpkin Helmet"
Copyright (C) 2014 The R Foundation for Statistical Computing
Platform: i386-w64-mingw32/i386 (32-bit)

#Raw Data
The raw data can be down loaded from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
The UCI HAR Dataset needs to be downloaded into your working directory.

#Raw data files
The raw data contains the following files that are read in to R:
features.txt
activity_labels.txt
subject_train.txt
x_train.txt
y_train.txt
subject_test.txt
x_test.txt
y_test.txt

The other data sets are not required for this analysis.

#Transformation overview
The plyr package must be installed in R.
This script transforms the raw data to a clean data file (avg_by_act_sub.txt) by: 
1. Merging the training and the test data sets to create a single data set;
2. Extracting the mean and standard deviation for each measurement; 
3. Asigning descriptive activity names to the activities in the data set;
4. Relabeling the data set with descriptive variable names; and 
5. Creating a second, independent tidy data set with the average of each variable for each activity and each subject.

#The tidy data set
From the intermediate data set a tidy data set is created where numeric variables are averaged for each activity and each subject.

The tidy data set contains 180 observations with 81 variables divided in:

1. An activity label (Activity): WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
2. An identifier of the subject who carried out the experiment (Subject): 1, 3, 5, 6, 7, 8, 11, 14, 15, 16, 17, 19, 21, 22, 23, 25, 26, 27, 28, 29, 30
3. Feature vectors with time and frequency domain signal variables (numeric)

Column names were adjusted by making the follwoing transformations within names:

'Acc' to "Acceleration"
'GyroJerk' to "AngularAcceleration"
'Gyro' to "AngularSpeed"
'Mag' to "Magnitude"
'^t' to "Time"
'^f' to "Frequency"
'\\.mean' to ".Mean"
'\\.std' to ".StdDev"
'Freq\\.' to "Frequency."
'Freq$' to "Frequency"
'BodyBody' to "Body"




