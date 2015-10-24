## Getting and Cleaning Data Project

## 1st and 3rd Part
## 1.Merges the training and the test sets to create one data set.
## 3.Uses descriptive activity names to name the activities in the data set

## Loading the files 
test <- read.csv("X_test.txt",header = FALSE,sep = "",stringsAsFactors=FALSE)             
test_labels <- read.csv("y_test.txt",header = FALSE,sep = "",stringsAsFactors=FALSE)
test_sub <- read.csv("subject_test.txt",header = FALSE,sep = "",stringsAsFactors=FALSE)

train <- read.csv("X_train.txt",header = FALSE,sep = "",stringsAsFactors=FALSE)
train_labels <- read.csv("y_train.txt",header = FALSE,sep = "")
train_sub <- read.csv("subject_train.txt",header = FALSE,sep = "",stringsAsFactors=FALSE)

act_labels <- read.csv("activity_labels.txt",header = FALSE,sep = "",stringsAsFactors=FALSE)
feat <- read.csv("features.txt",header = FALSE,sep = "",stringsAsFactors=FALSE)

## changing some colunms name in the Test data frames
names(test_sub)[names(test_sub)=="V1"] <- "Subject"
names(test_labels)[names(test_labels)=="V1"] <- "Labels"
names(act_labels) <- c("actid","activity")

## attaching Subject and activity labels to the Test data frame
testWsub <- cbind(test,test_sub)
testWsubWlabels <- cbind(testWsub,test_labels)


## merging the activity data frame to the Test one, that way we will have the activities names, this is Part 3 
## Uses descriptive activity names to name the activities in the data set
testWsubWlabelsWact <-  merge(testWsubWlabels,act_labels ,by.x = "Labels",by.y = "actid",all = FALSE)

## changing some colunms name in the Train data frames
names(train_sub)[names(train_sub)=="V1"] <- "Subject"
names(train_labels)[names(train_labels)=="V1"] <- "Labels"

## attaching Subject and activity labels to the Test data frame
trainWsub <- cbind(train,train_sub)
trainWsubWlabels <- cbind(trainWsub,train_labels)

## merging the activity data frame to the Train one, that way we will have the activities names, this is Part 3
## Uses descriptive activity names to name the activities in the data set
trainWsubWlabelsWact <-  merge(trainWsubWlabels,act_labels ,by.x = "Labels",by.y = "actid",all = FALSE)

## Merging Test and Train data frames
testWtrain <- rbind(testWsubWlabelsWact,trainWsubWlabelsWact)

## Loosing the Label colunm, we have the activities names already
testWtrainFinal <- testWtrain[,2:564]  

## Naming all the columns using the feature data frame
names(testWtrainFinal)[1:561] <- feat[,2]



## 2nd Part
## 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
testWtrainWmeanstd <- testWtrainFinal[,grep("mean[^Freq]|std[^Freq]", names(testWtrainFinal),value =TRUE)]

## 4.Appropriately labels the data set with descriptive variable names. 
## I left the original names. They are descriptive enough to anyone who reads them. 


## 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
## First I did the same thing as in Part 2, but adding the Subject and Activity Colunms
testWtrainWmstdWactSub <- testWtrainFinal[,grep("mean[^Freq]|std[^Freq]|activity|Subject", names(testWtrainFinal),value =TRUE)]

## Then I grouped that data set per Subject and Activity and apply the mean function to each variable
testWtrain_grouped <- testWtrainWmstdWactSub %>% group_by(activity,Subject) %>% summarise_each(funs(mean))


