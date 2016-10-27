***** About R script ******

File with R code "run_analysis.R" performs following 5 steps as required by the assignment:
1. Merges the training and the test sets to create one data set - downloads and unzips the zip file, reads the training and test datasets and merges them. This step also gives them column names (contained in separate file) and links them to subject_ids
2. Extracts only the measurements on the mean and standard deviation for each measurement - all the columns which do not contain either mean or standard deviation (and ofcourse, activity id & subject id) are discarded.
3. Uses descriptive activity names to name the activities in the data set - adds the activity names
4. Appropriately labels the data set with descriptive variable names - this is already done before in step 1.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject - this is done using the aggregrate function by subject and activities.

****** About variables used in R script *******
1. DataFileURL - URL pointing to the data file to be downloaded
2. x_train, y_train, subject_train - holds the raw training datasets as they are downloaded
3. x_test, y_test, subject_test - holds the raw test datasets
4. feature_names - contains teh correct names for the training & test datasets, which are applied to the column names
5. activity_labels - contains the activity master data i.e. activity IDs and Namese
6. merge_train, merge_test - contains the merged training & test data
7. final_set - contains merged training and test data sets
8. ColNames - list of column names
9. mean_and_std - contains the names of all columns with mean or standard deviation in the data set. It also has activity_id and subject_id
10. final_set_mean_std - contains trimmed  dataset with only columns related to means and standard deviations.
11. final_set_with_activity_names - same as final_set_mean_std but with activity names
12. final_tidy_set - this is the final output of all the analysis and cleaning. This dataset will be exported and posted on Coursera.

****** About the data *******
Cleaned data file contains following data:
- subjectId	- id of user wearing the device
- activityId, activityType
- <XYZ>  in the data is used to denote 3-axial signals in the X, Y and Z directions.
- They contain the mean and standard deviation of accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
- <t> indicates time domain signals and <f> indicates frequency domain signals

Following is the list of all data fields:
- tBodyAcc-mean()-X,tBodyAcc-mean()-Y,tBodyAcc-mean()-Z,tBodyAcc-std()-X,tBodyAcc-std()-Y,tBodyAcc-std()-Z,tGravityAcc-mean()-X,tGravityAcc-mean()-Y,tGravityAcc-mean()-Z,tGravityAcc-std()-X,tGravityAcc-std()-Y,tGravityAcc-std()-Z,tBodyAccJerk-mean()-X,tBodyAccJerk-mean()-Y,tBodyAccJerk-mean()-Z,tBodyAccJerk-std()-X,tBodyAccJerk-std()-Y,tBodyAccJerk-std()-Z,tBodyGyro-mean()-X,tBodyGyro-mean()-Y,tBodyGyro-mean()-Z,tBodyGyro-std()-X,tBodyGyro-std()-Y,tBodyGyro-std()-Z,tBodyGyroJerk-mean()-X,tBodyGyroJerk-mean()-Y,tBodyGyroJerk-mean()-Z,tBodyGyroJerk-std()-X,tBodyGyroJerk-std()-Y,tBodyGyroJerk-std()-Z,tBodyAccMag-mean(),tBodyAccMag-std(),tGravityAccMag-mean(),tGravityAccMag-std(),tBodyAccJerkMag-mean(),tBodyAccJerkMag-std(),tBodyGyroMag-mean(),tBodyGyroMag-std(),tBodyGyroJerkMag-mean(),tBodyGyroJerkMag-std(),fBodyAcc-mean()-X,fBodyAcc-mean()-Y,fBodyAcc-mean()-Z,fBodyAcc-std()-X,fBodyAcc-std()-Y,fBodyAcc-std()-Z,fBodyAcc-meanFreq()-X,fBodyAcc-meanFreq()-Y,fBodyAcc-meanFreq()-Z,fBodyAccJerk-mean()-X,fBodyAccJerk-mean()-Y,fBodyAccJerk-mean()-Z,fBodyAccJerk-std()-X,fBodyAccJerk-std()-Y,fBodyAccJerk-std()-Z,fBodyAccJerk-meanFreq()-X,fBodyAccJerk-meanFreq()-Y,fBodyAccJerk-meanFreq()-Z,fBodyGyro-mean()-X,fBodyGyro-mean()-Y,fBodyGyro-mean()-Z,fBodyGyro-std()-X,fBodyGyro-std()-Y,fBodyGyro-std()-Z,fBodyGyro-meanFreq()-X,fBodyGyro-meanFreq()-Y,fBodyGyro-meanFreq()-Z,fBodyAccMag-mean(),fBodyAccMag-std(),fBodyAccMag-meanFreq(),fBodyBodyAccJerkMag-mean(),fBodyBodyAccJerkMag-std(),fBodyBodyAccJerkMag-meanFreq(),fBodyBodyGyroMag-mean(),fBodyBodyGyroMag-std(),fBodyBodyGyroMag-meanFreq(),fBodyBodyGyroJerkMag-mean(),fBodyBodyGyroJerkMag-std(),fBodyBodyGyroJerkMag-meanFreq()
