
##set working directory
setwd('C:\\Users\\608366607\\Downloads\\getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset')

##activity_labels contains the descriptive activity names. Links the class labels with their activity name. 
activity_labels = read.table('activity_labels.txt',header=FALSE);
colnames(activity_labels) <- c("ActivityID", "Activity")



##The complete list of variables of each feature vector is available in 'features.txt'
features = read.table('features.txt',header=FALSE);
colnames(features) <- c("Index", "Feature")



#################################################################################
###################Load and prepare test data####################################
#################################################################################

subject_test = read.table('./test/subject_test.txt',header=FALSE);
colnames(subject_test) <- c('subjectID')

X_test = read.table('./test/X_test.txt',header=FALSE);
colnames(X_test) <- as.character(features$Feature)

Y_test = read.table('./test/Y_test.txt',header=FALSE);
colnames(Y_test) <- c("ActivityID")


complete_test_dataSet <- cbind(subject_test, Y_test, X_test)

#################################################################################
#################################################################################
#################################################################################




#################################################################################
###################Load and prepare training data################################
#################################################################################

subject_train = read.table('./train/subject_train.txt',header=FALSE);
colnames(subject_train) <- c('subjectID')

X_train = read.table('./train/X_train.txt',header=FALSE);
colnames(X_train) <- as.character(features$Feature)

Y_train = read.table('./train/Y_train.txt',header=FALSE);
colnames(Y_train) <- c("ActivityID")

complete_train_dataSet <- cbind(subject_train, Y_train, X_train)

#################################################################################
#################################################################################
#################################################################################


#################################################################################
########Merge the training and the test sets to create one data set.#############
#################################################################################

complete_dataSet <- rbind(complete_train_dataSet, complete_test_dataSet)

#################################################################################
#################################################################################
#################################################################################



#########################################################################################
##Extract only the measurements on the mean and standard deviation for each measurement##
#########################################################################################

subset_complete_dataSet <- complete_dataSet[c(1,2,grep("mean",names(complete_dataSet)), grep("std",names(complete_dataSet)))]

#########################################################################################
#########################################################################################
#########################################################################################



#########################################################################################
#####Use descriptive activity names to name the activities in the data set###############
#########################################################################################

subset_complete_dataSet <- merge(subset_complete_dataSet, activity_labels, by="ActivityID", all.x=TRUE)

#########################################################################################
#########################################################################################
#########################################################################################



#########################################################################################
##########Appropriately labels the data set with descriptive variable names##############
#########################################################################################

colNames <- colnames(subset_complete_dataSet)
for(i in 1:length(colNames))
{
        colNames[i] <- gsub('\\()','',colNames[i])
        colNames[i] <- gsub('Mag','Magnitude',colNames[i])
        colNames[i] <- gsub('^(f)','Freq-',colNames[i])
        colNames[i] <- gsub('^(t)','Time-',colNames[i])
        colNames[i] <- gsub('std','StdDev',colNames[i])
        colNames[i] <- gsub('mean','Mean',colNames[i])
        colNames[i] <- gsub('Acc','Accel',colNames[i])
}

colnames(subset_complete_dataSet) <- colNames

#########################################################################################
#########################################################################################
#########################################################################################



#####################################################################################################################
##creates a second, independent tidy data set with the average of each variable for each activity and each subject.##
###########################The code then writes the tidy_data set to a file##########################################

tidy_data <- aggregate(subset_complete_dataSet[,colnames(subset_complete_dataSet) != 'Activity'], by=list(subset_complete_dataSet$ActivityID,subset_complete_dataSet$subjectID), FUN=mean, na.rm=TRUE)

drop <- c('Group.1','Group.2')
tidy_data <- tidy_data[,!(names(tidy_data) %in% drop)]

write.table(tidy_data, './tidyData.txt',row.names=FALSE,sep='\t');

#####################################################################################################################
#####################################################################################################################
#####################################################################################################################




