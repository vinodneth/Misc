## https://github.com/walsh9/tidy-data/blob/master/run_analysis.R
# Load required packages: dplyr, reshape2
library(dplyr)
library(reshape2)

# Read files. Must have data in working directory.
subject_train   <- read.table("train/subject_train.txt")
X_train         <- read.table("train/X_train.txt")
Y_train         <- read.table("train/y_train.txt")
subject_test    <- read.table("test/subject_test.txt")
X_test          <- read.table("test/X_test.txt")
Y_test          <- read.table("test/y_test.txt")
features        <- read.table("features.txt")
activity_labels <- read.table("activity_labels.txt")

# Use descriptive activity names to name the activities in the data set
activity_train <- data.frame(Activity = activity_labels$V2[Y_train$V1])
activity_test  <- data.frame(Activity = activity_labels$V2[Y_test$V1])

# Appropriately labels the data set with descriptive variable names. 
colnames(subject_train) <- c("Subject")
colnames(subject_test) <- c("Subject")
colnames(X_train)       <- features$V2
colnames(X_test)       <- features$V2

train <- bind_cols(subject_train, activity_train, X_train)
test  <- bind_cols(subject_test, activity_test, X_test)

# Merge the training and the test sets to create one data set.
data  <- rbind(train, test)

# Extract only the measurements on the mean and standard deviation for each measurement. 
# - get columns with names containing "mean()" or "std()"
cols <- c(1,2, grep("(mean|std)\\(\\)", colnames(data)))
tidyData <- data[cols]
write.table(tidyData, file="tidydata.txt", row.name=FALSE) 

# Create a second, independent tidy data set with the average of each variable for each activity and each subject.
meltData <- melt(tidyData,id = c("Subject","Activity"))
avgData <- dcast(meltData, Subject + Activity ~ variable, mean)
write.table(avgData, file="averages.txt", row.name=FALSE) 