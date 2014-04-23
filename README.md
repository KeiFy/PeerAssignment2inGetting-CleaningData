==================================================================
Tidy Data Set Generation From
Human Activity Recognition Using Smartphones Dataset
==================================================================
By KeiFy 2:42 PM 4/23/2014

This README.md contains CodeBook and explains how to use run_analysis.R to obtain the average of each variable for each activity and each subject from Human Activity Recognition Using Smartphones Dataset,variables being the measurements on the mean and standard deviation for each measurement.

Function can be divided into parts:
1. Load the files from Human Activity Recognition Using Smartphones Dataset.
2. Merge dataset of train and test.
3. Extract measurements on the mean and standard deviation and names them properly
4. Calculate average of these measurements and put the results together as a dataset
5. Export new dataset as "Tidy Data Set.txt"

Important Notes:

In order to run the run_analysis.R sucessfully, you need to have these files from the Human Activity Recognition Using Smartphones Dataset in the working directory: 
"X_test.txt"
"X_train.txt"
"y_test.txt"
"y_train.txt"
"subject_train.txt"
"subject_test.txt"
"features.txt"

You can download these files from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

After sucessfully having "Tidy Data Set.txt", if you want to load this new data set into R or R-Studio, first put the file into working directory and run this line:

TidyDataSet <- read.table("Tidy Data Set.txt",header=T)

==================================================================
CodeBook of "Tidy Data Set.txt"
==================================================================
##Variables
* SubjectID
	contain numbers from 1 to 30. Each number represent one individual
* ActivityID:
	1=WALKING
	
2=WALKING_UPSTAIRS
	
3=WALKING_DOWNSTAIRS
	
4=SITTING
5
	5=STANDING
	
6=LAYING

* Activity:
	contain six strings:WALKING, WALKING_UPSTAIRS
, WALKING_DOWNSTAIRS
, SITTING
, 				STANDING
,LAYING

* Average.tBodyAcc.mean.X
* Average.tBodyAcc.mean.Y
* Average.tBodyAcc.mean.Z
* Average.tGravityAcc.mean.X
* Average.tGravityAcc.mean.Y
* Average.tGravityAcc.mean.Z
* Average.tBodyAccJerk.mean.X
* Average.tBodyAccJerk.mean.Y
* Average.tBodyAccJerk.mean.Z
* Average.tBodyGyro.mean.X
* Average.tBodyGyro.mean.Y
* Average.tBodyGyro.mean.Z
* Average.tBodyGyroJerk.mean.X
* Average.tBodyGyroJerk.mean.Y
* Average.tBodyGyroJerk.mean.Z
* Average.tBodyAccMag.mean
* Average.tGravityAccMag.mean
* Average.tBodyAccJerkMag.mean
* Average.tBodyGyroMag.mean
* Average.tBodyGyroJerkMag.mean
* Average.fBodyAcc.mean.X
* Average.fBodyAcc.mean.Y
* Average.fBodyAcc.mean.Z
* Average.fBodyAccJerk.mean.X
* Average.fBodyAccJerk.mean.Y
* Average.fBodyAccJerk.mean.Z
* Average.fBodyGyro.mean.X
* Average.fBodyGyro.mean.Y
* Average.fBodyGyro.mean.Z
* Average.fBodyAccMag.mean
* Average.fBodyBodyAccJerkMag.mean
* Average.fBodyBodyGyroMag.mean
* Average.fBodyBodyGyroJerkMag.mean
* Average.tBodyAcc.std.X
* Average.tBodyAcc.std.Y
* Average.tBodyAcc.std.Z
* Average.tGravityAcc.std.X
* Average.tGravityAcc.std.Y
* Average.tGravityAcc.std.Z
* Average.tBodyAccJerk.std.X
* Average.tBodyAccJerk.std.Y
* Average.tBodyAccJerk.std.Z
* Average.tBodyGyro.std.X
* Average.tBodyGyro.std.Y
* Average.tBodyGyro.std.Z
* Average.tBodyGyroJerk.std.X
* Average.tBodyGyroJerk.std.Y
* Average.tBodyGyroJerk.std.Z
* Average.tBodyAccMag.std
* Average.tGravityAccMag.std
* Average.tBodyAccJerkMag.std
* Average.tBodyGyroMag.std
* Average.tBodyGyroJerkMag.std
* Average.fBodyAcc.std.X
* Average.fBodyAcc.std.Y
* Average.fBodyAcc.std.Z
* Average.fBodyAccJerk.std.X
* Average.fBodyAccJerk.std.Y
* Average.fBodyAccJerk.std.Z
* Average.fBodyGyro.std.X
* Average.fBodyGyro.std.Y
* Average.fBodyGyro.std.Z
* Average.fBodyAccMag.std
* Average.fBodyBodyAccJerkMag.std
* Average.fBodyBodyGyroMag.std
* Average.fBodyBodyGyroJerkMag.std

The Naming Rule in Tidy Data set.txt basically follow Human Activity Recognition Using Smartphones Dataset:

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

Besides these, explanations of "mean", "std", "Average":
1."mean" represent means of one measurement of one individual in one specific activity
2."std" represent standard deviation of one measurement of one individual in one specific activity
3."Average" represent average of all means or stds of one individual in one specific activity

##Transformations performed to clean up the data
1. Merge dataset of train and test.
2. Names the merged dataset with names from "features.txt"
3. According to requirements, extract measurements on the mean and standard deviation.
4. Calculate average of these measurements and put the results together as a dataset

