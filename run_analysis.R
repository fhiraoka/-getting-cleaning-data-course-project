## Getting and Cleaning Data Course Project
## Fumito Hiraoka

## Step 1: Merges the training and the test sets to create one data set.

## load the train and the test datasets
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")

## merge two datasets
x <- rbind(x_train, x_test)

## Step2: Extracts only the measurements on the mean and standard deviation for each measurement.

## load the 561 feature variables  
features <- read.table("./UCI HAR Dataset/features.txt")

## extract the mean and standard deviation of each measurement
features_mean_std <- features[grep("-(mean|std)\\(\\)", features$V2), ]  

## subset the features of interest from the original dataset 
x <- x[ , features_mean_std$V1]

## Step 3: Uses descriptive activity names to name the activities in the data set

## load and combine the activity identifiers 
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
y <- rbind(y_train, y_test)

## Load the six activity names  
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")

## replace the activity identifiers with the descriptive activity names 
y <- activities[y$V1, "V2"]
names(y) <- "Activity"

## Step4: Appropriately labels the data set with descriptive variable names.

## the second column of features_mean_std holds the descriptive feature names.  
names(x) <- features_mean_std$V2

## Step 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## load and combine the subject data  
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
subject <- rbind(subject_train, subject_test)
names(subject) <- "Subject"

## merge the subject identifiers, the activity labels, and the measurement data  
tidy_data <- cbind(subject, y, x)

## find the mean of each features per subject and per activity  
tidy_mean <- aggregate(tidy_data, list(Activity = tidy_data$y, Subject = tidy_data$Subject), mean)

## get rid of the redundant columns 
tidy_mean <- tidy_mean[ , c("Subject", "Activity", as.character(features_mean_std$V2))]

## create the output file
write.table(tidy_mean, "tidy_mean.txt", row.name = FALSE)

 


