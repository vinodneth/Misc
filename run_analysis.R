## This script has been prepared to tidy UCI HAR Dataset provided as part of 
## Course 3 Week 4 assignment

## Loading the 2 required packages
library(dplyr)
library(reshape2)

## Loading data files. Files for test and train are kept below the 
## working directory set where this R file also resides
subject_train   <- read.table("train/subject_train.txt")
X_train         <- read.table("train/X_train.txt")
Y_train         <- read.table("train/y_train.txt")
subject_test    <- read.table("test/subject_test.txt")
X_test          <- read.table("test/X_test.txt")
Y_test          <- read.table("test/y_test.txt")
features        <- read.table("features.txt")
activity_labels <- read.table("activity_labels.txt")

## Use labels in activity_labels to get descriptive activity names
activity_train <- data.frame(Activity = activity_labels$V2[Y_train$V1])
activity_test  <- data.frame(Activity = activity_labels$V2[Y_test$V1])

## Enhance data set by providing descriptive variable names
## For Subject_ data set
colnames(subject_train) <- c("Subject")
colnames(subject_test) <- c("Subject")
## For features fron features.txt
colnames(X_train)       <- features$V2
colnames(X_test)       <- features$V2

## Join - subject, activity & X
train <- bind_cols(subject_train, activity_train, X_train)
test  <- bind_cols(subject_test, activity_test, X_test)
## Merge - test and train
data  <- rbind(train, test)

## Extract data to include mean and standard deviations only
## select col 1, 2 and those variable names containing mean() and std()
cols <- c(1,2, grep("(mean|std)\\(\\)", colnames(data)))
tidyData <- data[cols]
write.table(tidyData, file="tidydata.txt", row.name=FALSE) 

## Create a second data set with the average of each variable for each activity 
## and each subject -  (Step 5 of assignment)
meltData <- melt(tidyData,id = c("Subject","Activity"))
avgData <- dcast(meltData, Subject + Activity ~ variable, mean)
write.table(avgData, file="averages.txt", row.name=FALSE) 