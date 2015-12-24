# Getting-and-Cleaning-Data
This repository is Behram Khan’s project submission for the course “Getting and Cleaning Data”.


An R script “run_analysis.R” is present in the repository that performs the tasks mentioned in the project deliverables.

The very first line of the “run_analysis.R” files points to the working directory. This line needs to be modified to point to the working directory before running the script on your local machine.


The script does the following.

# Merges the training and the test sets to create one data set

The script first loads and prepare the test and the training data set before both the data sets are merged to create one data set. Comments like “Load and prepare test data”, “Load and prepare training data” and “Merge the training and the test sets to create one data set” in the code clearly show the part of the code responsible for performing this task.

# Extracts only the measurements on the mean and standard deviation for each measurement
The script then extracts the measurements on the mean and standard deviation for each measurement. The one line code under the comment “Merge the training and the test sets to create one data set” performs this task.
# Uses descriptive activity names to name the activities in the data set
The script uses descriptive activity names to name the activities in the data set. The code under the comment “Uses descriptive activity names to name the activities in the data set” performs this task.
# Appropriately labels the data set with descriptive variable names.
The code under the comment which is the same as the above heading labels the data set with descriptive variable names.
# creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Finally the script creates a second, independent tidy data set with the average of each variable for each activity and each subject and writes the tidy data set to a file “tidyData.txt”.
