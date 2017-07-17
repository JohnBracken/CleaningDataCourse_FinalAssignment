#The following script is for the final assignment in the Coursera
#'Getting and Cleaning Data' course.  The dplyr package is needed and 
#will be installed and loaded ahead of time in the R console using the following code,
#before running this script:     

#  install.packages("dplyr")
#  library(dplyr)


#Set the initial working directory to download the zipped data for the assignment.
setwd("C:\\Users\\310084562\\Documents\\JHU Coursera Data Science course\\Course 3 Week 4")


#If no data folder is currently present, then create it specifically for the assignment.
if(!file.exists("./AssignmentData")){
  dir.create("./AssignmentData")
}


#Download the data files from the website.
if(!file.exists("./AssignmentData/Dataset.zip")){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL,destfile = "./AssignmentData/Dataset.zip")
}


#The data files were unzipped and then placed into a folder called run_analysis.  Change the working
#directory to this directory.
setwd("./AssignmentData/run_analysis")


#Read in the training and test variable data files into seperate data frames.  Delimited by whitespace
#as default is good enough for these datasets.
train_data <- read.table("X_train.txt")
test_data <- read.table("X_test.txt")


#Read in the feature/variable list as a data frame.  This list will be used as the column header variable names across the
#training and test data frames.
variable_list_frame <- read.table("features.txt")


#Column 2 of this data frame contains the actual variable names.
variable_list <- as.character(variable_list_frame$V2)


#Set the column names of the training and test data to the values of the variable list.
colnames(train_data) <- variable_list
colnames(test_data) <- variable_list


#Read in the activity levels (1 to 6) and convert them to a factor for the training and test data.
Activity_train <- read.table("y_train.txt")
Activity_test <- read.table("y_test.txt")


#Column 1 of the activity data frames are the levels for each observation.  Convert these values to a factor vector.
Activity_train <- as.factor(Activity_train$V1)
Activity_test <- as.factor(Activity_test$V1)


#Replace the levels of the factors with the actual labels of the activities they represent.
Activity_train <- factor(Activity_train,labels=c("Walking","Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying"))
Activity_test <-  factor(Activity_test,labels=c("Walking","Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying"))


#Convert the activity factors to character vectors.
Activity_train <- as.character(Activity_train)
Activity_test <- as.character(Activity_test)


#Add the activity columns to both data sets as the beginning of the data frames.
train_data <- cbind(Activity = Activity_train, train_data)
test_data <- cbind(Activity = Activity_test, test_data)


#Import the subject (volunteer) data and add the subject info as a column at the beginning of each data frame.
subject_train <- read.table("subject_train.txt")
subject_test <- read.table("subject_test.txt")


#Convert the subject data to character vectors.
subject_train <- as.numeric(subject_train$V1)
subject_test <- as.numeric(subject_test$V1)


#Add the subject columns to both data sets as the beginning of the data frames.
train_data <- cbind(Subject = subject_train, train_data)
test_data <- cbind(Subject = subject_test, test_data)


#Merge both datasets into one dataset based on subject ID.
merged_data <- rbind(train_data,test_data)


#Select only the data with columns that contain a mean or standard deviation value and put in a new data frame.
#Make sure to keep the Subject and Activity columns.
reduced_data <- merged_data[,grep("mean|std|Subject|Activity", names(merged_data))]


#Remove the meanFreq columns from the data, since these values are a little more complicated than the simple mean
#and standard deviation columns being asked for in the assignment.
reduced_data <- reduced_data[,-grep("meanFreq", names(reduced_data))]


#Create a data frame of tidy data which will calculate the average of every variable for each subject and each activity.
#Columns 3 to 68 contain the variable data and the first two columns identify the subject and activity for each 
#measurement.
tidy_data_averages <- aggregate(reduced_data[,3:68], by=list(Subject = reduced_data$Subject,Activity =reduced_data$Activity), FUN = "mean")


#Export the tidy dataset to a text file.
write.table(tidy_data_averages, "tidy_dataset_averages.txt", sep ="\t", row.names = FALSE)


#Also export the tidy data set to a csv file, to show on Github.
write.csv(tidy_data_averages,"tidy_dataset_averages.csv", row.names = FALSE)


