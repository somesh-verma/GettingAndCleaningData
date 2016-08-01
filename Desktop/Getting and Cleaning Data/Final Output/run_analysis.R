library(plyr)
library(dplyr)
require(stringr)

#Lets load the Activity Labels into activity_labels
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE, col.names = c("ID", "ActivityName"))

#Lets load the data from features.txt into features and also extract features which have Mean or Std in thier name into selectedFeature variable
features <- read.table("UCI HAR Dataset/features.txt", header = FALSE, col.names = c("ID", "FeatureName"))

#Since the variable names have mean() or std() seperated from either end by "-", we will use "-" to split the string and add it as a new column using cbind
features <- cbind(features,FunctionName=str_split_fixed(features$FeatureName,"-",3)[,2])

#List of Features having mean() and std() as function using filter function on "FunctionName" column
selectedFeature <- filter(features, FunctionName=="mean()" | FunctionName=="std()")

#Now lets load the test and training set. For both these set, while loading the y_test/train, 
#we will join the loaded data set with activity_label to make it descriptive and finally join all the three data sets using cbind

#First lets load the test data
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", 
                     header=FALSE, col.names = features$FeatureName, check.names = FALSE)
y_test <- join(read.table("UCI HAR Dataset/test/y_test.txt", 
                          header=FALSE, col.names = "ID"), activity_labels, by="ID")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", 
                           header=FALSE, col.names = "Subject ID")
joinedUpTestData <- cbind(x_test, y_test, subject_test)

#Now lets load the training data
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", 
                            header=FALSE, col.names = features$FeatureName, check.names = FALSE)
y_train <- join(read.table("UCI HAR Dataset/train/y_train.txt", 
                      header=FALSE, col.names = "ID"), activity_labels, by="ID")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", 
                      header=FALSE, col.names = "Subject ID")
joinedUpTrainingData <- cbind(x_train, y_train, subject_train)

#Lets join the rows of the training and test data
fullDataSet <- rbind(joinedUpTestData, joinedUpTrainingData)
fullDataSetSelectedColumn <- cbind(fullDataSet[,c(selectedFeature$ID)],ActivityName=fullDataSet$ActivityName, SubjectID=fullDataSet$Subject.ID)

#Lets give descriptive names to the column
names(fullDataSetSelectedColumn)<-gsub("^f", "FrequencyDomain", names(fullDataSetSelectedColumn))
names(fullDataSetSelectedColumn)<-gsub("^t", "TimeDomain", names(fullDataSetSelectedColumn))
names(fullDataSetSelectedColumn)<-gsub("Mag", "Magnitude", names(fullDataSetSelectedColumn))
names(fullDataSetSelectedColumn)<-gsub("Acc", "Accelerometer", names(fullDataSetSelectedColumn))
names(fullDataSetSelectedColumn)<-gsub("BodyBody", "Body", names(fullDataSetSelectedColumn))
names(fullDataSetSelectedColumn)<-gsub("Gyro", "Gyroscope", names(fullDataSetSelectedColumn))
names(fullDataSetSelectedColumn)<-gsub("-X", "-X Axis", names(fullDataSetSelectedColumn))
names(fullDataSetSelectedColumn)<-gsub("-Y", "-Y Axis", names(fullDataSetSelectedColumn))
names(fullDataSetSelectedColumn)<-gsub("-Z", "-Z Axis", names(fullDataSetSelectedColumn))

#Taking Average for every metric based on Activity and Subject
avgDataPerSubjectPerActivity <- summarise_each(group_by(fullDataSetSelectedColumn, ActivityName, SubjectID), funs(mean))

#And now lets append average to each variable name
names(avgDataPerSubjectPerActivity)<-gsub("$", " (Average)", names(avgDataPerSubjectPerActivity))
names(avgDataPerSubjectPerActivity)<-gsub("^ActivityName.*$", "ActivityName", names(avgDataPerSubjectPerActivity), perl=TRUE)
names(avgDataPerSubjectPerActivity)<-gsub("SubjectID.*$", "SubjectID", names(avgDataPerSubjectPerActivity), perl=TRUE)

#Finally, lets dump the data into a file
write.table(avgDataPerSubjectPerActivity, file="avgDataPerSubjectPerActivity.txt")
