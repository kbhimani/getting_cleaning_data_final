
# Create the "data" directory if it doesn't exist and download the file
if(!file.exists("./data")){
    dir.create("./data")
    }
DataFileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(DataFileURL,destfile="./data/FinalAssignmentDataset.zip")

# Unzip dataSet
unzip(zipfile="./data/FinalAssignmentDataset.zip",exdir="./data")

# Read training data
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

# Read test data
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

# Read Feature Table
feature_names <- read.table("./data/UCI HAR Dataset/features.txt")

# Read Activity labels
activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")

#Assign Column Names to training & test datasets
colnames(x_train) <- feature_names[,2]
colnames(y_train) <- "activityId"
colnames(subject_train) <- "subjectId"

colnames(x_test) <- feature_names[,2]
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"

colnames(activity_labels) <-c("activityId", "activityType")

# Merge the datasets
merge_train <- cbind(subject_train,x_train,y_train)
merge_test <- cbind(subject_test,x_test,y_test)
final_set <- rbind(merge_train,merge_test)

# Extract columns related to mean & standard deviation
colNames <- colnames(final_set)

mean_and_std <- (grepl("activityId" , colNames) | 
                     grepl("subjectId" , colNames) | 
                     grepl("mean.." , colNames) | 
                     grepl("std.." , colNames) 
)
final_set_mean_std <- final_set[ , mean_and_std == TRUE]

# Add activity labels
final_set_with_activity_names <- merge(final_set_mean_std, activity_labels,by = 'activityId',all.x=TRUE)

# Calculate mean and sort by subject_id and activity_id
final_tidy_set <- aggregate(. ~subjectId + activityId + activityType, final_set_with_activity_names,mean)
final_tidy_set <- final_tidy_set[order(final_tidy_set$subjectId, final_tidy_set$activityId),]

# Write to the file
write.table(final_tidy_set, "./data/final_tidy_set.txt", row.names=FALSE)
