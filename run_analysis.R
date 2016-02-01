library(dplyr)

## STEP 1: Merges the training and the test sets to create one data set

# read data into data frames
x_train <- read.table("X_train.txt")
y_train <- read.table("y_train.txt")
subject_train <- read.table("subject_train.txt")

x_test <- read.table("X_test.txt")
y_test <- read.table("y_test.txt")
subject_test <- read.table("subject_test.txt")

# add column name for subject files
names(subject_train) <- "subjectID"
names(subject_test) <- "subjectID"

# add column names for measurement files
featureNames <- read.table("features.txt")
names(x_train) <- featureNames$V2
names(x_test) <- featureNames$V2

# add column name for label files
names(y_train) <- "activity"
names(y_test) <- "activity"

# create combined data set
train <- cbind(subject_train, y_train, x_train)
test <- cbind(subject_test, y_test, x_test)
combined <- rbind(train, test)

## STEP 2: Extracts only mean and standard deviation for each measurement.

# get columns with mean() or std() in names
mean_std <- grepl("mean\\(\\)", names(combined)) | grepl("std\\(\\)", names(combined))

# ensure that we also keep the subjectID and activity columns
mean_std[1:2] <- TRUE

combined <- combined[, mean_std]

## STEP 3: Uses descriptive activity names to name the activities
## in the data set.
## STEP 4: Appropriately labels the data set with descriptive
## activity names. 

# convert the activity column from integer to factor
combined$activity <- factor(combined$activity, labels=c("Walking","Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying"))


## STEP 5: Creates a second, independent tidy data set with the
excludedColumns = which(names(combined) %in% c("subjectID", "activity"))
result <- ddply(combined, .(subjectID, activity), .fun=function(x){colMeans(x[,-excludedColumns])})

write.table(result, "averages_data.txt", row.name=FALSE)
