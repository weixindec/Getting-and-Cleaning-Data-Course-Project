#Introduction
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

#Variables
##Original data files
* features.txt: Names of the 561 features.
* activity_labels.txt: Names and IDs for each of the 6 activities.
* X_train.txt: Features for 21 of the 30 volunteers.
* subject_train.txt:ID of the volunteer related to each of the observations in X_train.txt.
* y_train.txt: ID of the activity related to each of the observations in X_train.txt.
* X_test.txt: Features for 9 of the 30 volunteers.
* subject_test.txt: ID of the volunteer related to each of the observations in X_test.txt.
* y_test.txt: ID of the activity related to each of the observations in X_test.txt.

##Created by run_analysis.R
* train: Merged dataset from subject_train.txt, y_train.txt and X_train.txt
* test: Merged dataset from subject_test.txt, y_test.txt and X_test.txt
* combined: Merged dataset from train and test
* mean_std: Logical vector used to extract the desired data according to features.txt
* result: Contains average of each variable for each activity and each subject
* Averages.txt: txt file created with write.table() using row.name=FALSE on 'result'
