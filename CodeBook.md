### Description

The tidy dataset, *tidy_mean.txt* which is the output from running the *run_analysis.R* script is created though following five steps. These five steps describe how the UCI HAR Dataset is transformed into the tidy dataset and summarize the selected features, the kinds of activities and the individuals who performed those activities. 

### Step1: Merges the training and the test sets to create one data set.

*X_train.txt* and *X_test.txt* together provide the various measurements that are obtained from accelerometer and gyroscope embedded in Samsung Galaxy S II. Those two files are combined to form a 561-variable by 10299-observation dataset.

### Step2: Extracts only the measurements on the mean and standard deviation for each measurement. 

*features.txt* contains the list of 561 features. The mean and standard deviation of measurements are extracted from the list through the following command:

`features_mean_std <- features[grep("-(mean|std)\\(\\)", features$names), ]`

where features stores the indices and names of the measurements in the features.txt file

### Step3: Uses descriptive activity names to name the activities in the data set

*y_train.txt* and *y_test.txt* together hold the activity identifiers for the 10299 observations. activity_labels.txt consists of the 6 descriptive activity names as follow:

1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING
 
These descriptive activity names replaces the activity identifiers and are applied for the activity-wise mean calculations. 

### Step4: Appropriately labels the data set with descriptive variable names.

The 66 feature names which constitute the column names of the tidy dataset are as follow: 

tBodyAcc-mean()-X
tBodyAcc-mean()-Y
tBodyAcc-mean()-Z
tBodyAcc-std()-X
tBodyAcc-std()-Y
tBodyAcc-std()-Z
tGravityAcc-mean()-X
tGravityAcc-mean()-Y
tGravityAcc-mean()-Z
tGravityAcc-std()-X
tGravityAcc-std()-Y
tGravityAcc-std()-Z
tBodyAccJerk-mean()-X
tBodyAccJerk-mean()-Y
tBodyAccJerk-mean()-Z
tBodyAccJerk-std()-X
tBodyAccJerk-std()-Y
tBodyAccJerk-std()-Z
tBodyGyro-mean()-X
tBodyGyro-mean()-Y
tBodyGyro-mean()-Z
tBodyGyro-std()-X
tBodyGyro-std()-Y
tBodyGyro-std()-Z
tBodyGyroJerk-mean()-X
tBodyGyroJerk-mean()-Y
tBodyGyroJerk-mean()-Z
tBodyGyroJerk-std()-X
tBodyGyroJerk-std()-Y
tBodyGyroJerk-std()-Z
tBodyAccMag-mean()
tBodyAccMag-std()
tGravityAccMag-mean()
tGravityAccMag-std()
tBodyAccJerkMag-mean()
tBodyAccJerkMag-std()
tBodyGyroMag-mean()
tBodyGyroMag-std()
tBodyGyroJerkMag-mean()
tBodyGyroJerkMag-std()
fBodyAcc-mean()-X
fBodyAcc-mean()-Y
fBodyAcc-mean()-Z
fBodyAcc-std()-X
fBodyAcc-std()-Y
fBodyAcc-std()-Z
fBodyAccJerk-mean()-X
fBodyAccJerk-mean()-Y
fBodyAccJerk-mean()-Z
fBodyAccJerk-std()-X
fBodyAccJerk-std()-Y
fBodyAccJerk-std()-Z
fBodyGyro-mean()-X
fBodyGyro-mean()-Y
fBodyGyro-mean()-Z
fBodyGyro-std()-X
fBodyGyro-std()-Y
fBodyGyro-std()-Z
fBodyAccMag-mean()
fBodyAccMag-std()
fBodyBodyAccJerkMag-mean()
fBodyBodyAccJerkMag-std()
fBodyBodyGyroMag-mean()
fBodyBodyGyroMag-std()
fBodyBodyGyroJerkMag-mean()
fBodyBodyGyroJerkMag-std()

### Step5: Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

*subject_train.txt* and *subject_test.txt* both constitute the identifications of the 30 volunteers who performed the activities for the 10299 observations.

The numeral measurement data with the descriptive feature names, the activity labels and the subject identifiers are merged into one data frame, tidy_data. Finally, tidy_mean which contains the averages of the features against each activity and each subject are produced with following command:  

`tidy_mean <- aggregate(tidy_data, list(Activity = tidy_data$activity, Subject = tidy_data$subject), mean)` 

The tidy_mean dataset is stored in the *tidy_mean.txt* as the final result of the five steps.
