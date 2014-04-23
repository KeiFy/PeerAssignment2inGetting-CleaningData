## Load txt file in working directory into R, including activity, subject and data in both training and
## testing.
TestData <- read.table("X_test.txt")
TrainData <- read.table("X_train.txt")
activityTest <- read.table("y_test.txt")
activityTrain <- read.table("y_train.txt")
subjectTrain <- read.table("subject_train.txt")
subjectTest <- read.table("subject_test.txt")
features <- read.table("features.txt")

## Merges the training data set and the test data set
Data <- rbind(TestData,TrainData)

##Use features.txt file to name each column of "Data". Extracts only the measurements on 
##the mean (Not include "meanFreq") and standard deviation for each measurement
colnames(Data) <- features[,2]
ColumnsNeeded <- append(grep("mean[^Freq]",names(Data)),grep("std",names(Data)))
DataRequired <- Data[,ColumnsNeeded] #DataRequired is the result data set of extraction

## Merge "activityTest" and "activityTrain" into ActivityID. 
ActivityID <- rbind(activityTest,activityTrain)

## Creat "Activity" which contains names of activity corresponding to "ActivityID"
Activity <- ActivityID[,1]
ActivityName <- c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING"
                  ,"STANDING","LAYING")
for (i in 1:6){
        Activity <- gsub(i,ActivityName[i],Activity)
}

## Merge subjectTest and subjctTrain into SubjectID
SubjectID <- rbind(subjectTest,subjectTrain)

## combind "SubjectID","ActivityID","Activity","DataRequired" to create "firstDataSet"
firstDataSet <- cbind(SubjectID,ActivityID,Activity,DataRequired)

## name the first three columns of "firstDataSet"
names(firstDataSet)[1:3] <- c("SubjectID","ActivityID","Activity")

## "firstDataSet" is the dataset meeting with first four requirements.

## Creates a second, independent tidy data set with the average of each variable 
## for each activity and each subject
numbercol <- ncol(firstDataSet)
secondData <- matrix(0,nrow=180,ncol=(numbercol-3))

for (i in 1:30){
        for (j in 1:6){
                subData <- firstDataSet[which(firstDataSet$SubjectID==i & firstDataSet$ActivityID==j),4:numbercol]
                secondData[(6*(i-1)+j),]<- colMeans(subData)      
        }
}

secondData <- data.frame(secondData) 
TidyDataSet <- cbind(rep(1:30,each=6),rep(1:6,30),rep(ActivityName,30),secondData)

## Name "TidyDataSet" with new column names
NamesWithMean <- rep(NA,66)
for (i in 4:numbercol){
        names(firstDataSet)[i]<-gsub("-",".",names(firstDataSet)[i])
        names(firstDataSet)[i]<-gsub("\\(","",names(firstDataSet)[i])
        names(firstDataSet)[i]<-gsub("\\)","",names(firstDataSet)[i])
        NamesWithMean[i-3] <- paste("Average.",names(firstDataSet)[i],sep="")
}
names(TidyDataSet) <- c("SubjectID","ActivityID","Activity",NamesWithMean)
write.table(TidyDataSet,file="Tidy Data Set.txt",row.names=F,col.names=T)


