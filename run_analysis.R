## run_analysis.R code
## Coursera: Getting and Cleaning Data - Course Project
## by Carl Steyn
## 2015/02/22

# run_analysis.R transforms the UCI HAR Dataset into a clean data set.

# The UCI HAR Dataset needs to be downloaded into your working directory.

# The raw data can be down loaded from:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

# This script transforms the raw data to a clean data file by : 
# 1. Merge the training and the test data sets to create a single data set;
# 2. Extract the mean and standard deviation for each measurement; 
# 3. Asign descriptive activity names to the activities in the data set;
# 4. Relabels the data set with descriptive variable names; and 
# 5. Creates a second, independent tidy data set with the average
#       of each variable for each activity and each subject. 


## The plyr package is required for this analysis
require(plyr)


## Read raw data from UCI HAR Dataset loaded into working directory

features <- read.table("./UCI HAR Dataset/features.txt", header=FALSE)
activity_labels <- read.table(
        "./UCI HAR Dataset/activity_labels.txt",
        header=FALSE,
        col.names=c("ActivityId", "Activity")
        )
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt",header=FALSE)
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt",header=FALSE)
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt",header=FALSE)
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt",header=FALSE)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt",header=FALSE)
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt",header=FALSE)

## 1. Merge the training and the test data sets to create a single data set:

## Binding data
training_data <- cbind(cbind(x_train, subject_train), y_train)
test_data <- cbind(cbind(x_test, subject_test), y_test)
all_data <- rbind(training_data, test_data)

## Label columns
features[,2] <-factor(features[,2], levels = c(levels(features[,2]), "Subject", "ActivityId"))
labels <- rbind(features, c(562, "Subject"), c(563, "ActivityId"))[,2]
names(all_data) <- labels

## 2. Extract the mean and standard deviation for each measurement;

data_mean_std <- all_data[,grepl("mean|std|Subject|ActivityId", names(all_data))]

## 3. Asign descriptive activity names to the activities in the data set;

data_mean_std <- join(data_mean_std, activity_labels, by = "ActivityId", match = "first")
data_mean_std <- data_mean_std[,-1]

## 4. Relabels the data set with descriptive variable names;

# Remove parentheses
names(data_mean_std) <- gsub('\\(|\\)',"",names(data_mean_std), perl = TRUE)
# Make syntactically valid names
names(data_mean_std) <- make.names(names(data_mean_std))
# Make clearer names
names(data_mean_std) <- gsub('Acc',"Acceleration",names(data_mean_std))
names(data_mean_std) <- gsub('GyroJerk',"AngularAcceleration",names(data_mean_std))
names(data_mean_std) <- gsub('Gyro',"AngularSpeed",names(data_mean_std))
names(data_mean_std) <- gsub('Mag',"Magnitude",names(data_mean_std))
names(data_mean_std) <- gsub('^t',"Time",names(data_mean_std))
names(data_mean_std) <- gsub('^f',"Frequency",names(data_mean_std))
names(data_mean_std) <- gsub('\\.mean',".Mean",names(data_mean_std))
names(data_mean_std) <- gsub('\\.std',".StdDev",names(data_mean_std))
names(data_mean_std) <- gsub('Freq\\.',"Frequency.",names(data_mean_std))
names(data_mean_std) <- gsub('Freq$',"Frequency",names(data_mean_std))
names(data_mean_std) <- gsub('BodyBody', "Body", names(data_mean_std))
                             

## 5. Creates a second, independent tidy data set with the average
##      of each variable for each activity and each subject. 

avg_by_act_sub = ddply(data_mean_std, .(Subject, Activity), numcolwise(mean))
write.table(avg_by_act_sub, file = "avg_by_act_sub.txt", row.name = FALSE)
