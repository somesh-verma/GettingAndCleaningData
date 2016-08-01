## Getting and Cleaning Data Course Project - CodeBook for Data Transformation


### Summary
This Codebook is constructed to provide additional information of the Getting and Cleaning. The data used in the codebook is downloaded from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

### Required Software Packages
We will be working with R Studio (Version 0.98.1091) and using the following three libraries - "plyr", "dplyr" and "stringr"

### Detailed Description
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

### Attribute Information
For each record in the dataset it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment.

### Project Procedures:
a R script called run_analysis.R is created with the following 5 steps:
#### 1. Merge the traning and the test sets to create one data set.
A set of 8 text files from the data folder are read:  
-  **features.txt**, 
-  **activity_labels.txt**,  
-  **subject_train.txt**,  
-  **X_train.txt**,  
-  **y_train.txt**
-  **subject_test.txt**, 
-  **X_test.txt** , 
-  **y_test.txt**

Column names are first assigned before merging.

#### 2. Load the features.txt as well as activity_labels.txt. While loading the features.txt we will also split the variable names using "-" to identify what function has been used to create the variables. Eg. mean() or std().
#### 3. Join the activity_labels.txt with y_train.txt to create dexcriptive labels for the activity.
#### 4. While loading the X_train and Y_train, we will use the variable names extracted from features.txt.
#### 5. We will then join the three data sets (X_train/test, y_train/test and subject_train/test) columwise and then merge the training and testing data.
#### 6. We will then extract the only those attribute which has been generated using mean() and std() function and then calculate the average of each of the metrics per Subject and per activity. The output file will generated using "write.table" without any option apart from filename and the dataset name. The output file is called "avgDataPerSubjectPerActivity.txt" 

#### The result of avgDataPerSubjectPerActivity.txt consists of following variables:
 [1] "ActivityName"                                                  
 [2] "SubjectID"                                                     
 [3] "TimeDomainBodyAccelerometer-mean()-X Axis (Average)"           
 [4] "TimeDomainBodyAccelerometer-mean()-Y Axis (Average)"           
 [5] "TimeDomainBodyAccelerometer-mean()-Z Axis (Average)"           
 [6] "TimeDomainBodyAccelerometer-std()-X Axis (Average)"            
 [7] "TimeDomainBodyAccelerometer-std()-Y Axis (Average)"            
 [8] "TimeDomainBodyAccelerometer-std()-Z Axis (Average)"            
 [9] "TimeDomainGravityAccelerometer-mean()-X Axis (Average)"        
[10] "TimeDomainGravityAccelerometer-mean()-Y Axis (Average)"        
[11] "TimeDomainGravityAccelerometer-mean()-Z Axis (Average)"        
[12] "TimeDomainGravityAccelerometer-std()-X Axis (Average)"         
[13] "TimeDomainGravityAccelerometer-std()-Y Axis (Average)"         
[14] "TimeDomainGravityAccelerometer-std()-Z Axis (Average)"         
[15] "TimeDomainBodyAccelerometerJerk-mean()-X Axis (Average)"       
[16] "TimeDomainBodyAccelerometerJerk-mean()-Y Axis (Average)"       
[17] "TimeDomainBodyAccelerometerJerk-mean()-Z Axis (Average)"       
[18] "TimeDomainBodyAccelerometerJerk-std()-X Axis (Average)"        
[19] "TimeDomainBodyAccelerometerJerk-std()-Y Axis (Average)"        
[20] "TimeDomainBodyAccelerometerJerk-std()-Z Axis (Average)"        
[21] "TimeDomainBodyGyroscope-mean()-X Axis (Average)"               
[22] "TimeDomainBodyGyroscope-mean()-Y Axis (Average)"               
[23] "TimeDomainBodyGyroscope-mean()-Z Axis (Average)"               
[24] "TimeDomainBodyGyroscope-std()-X Axis (Average)"                
[25] "TimeDomainBodyGyroscope-std()-Y Axis (Average)"                
[26] "TimeDomainBodyGyroscope-std()-Z Axis (Average)"                
[27] "TimeDomainBodyGyroscopeJerk-mean()-X Axis (Average)"           
[28] "TimeDomainBodyGyroscopeJerk-mean()-Y Axis (Average)"           
[29] "TimeDomainBodyGyroscopeJerk-mean()-Z Axis (Average)"           
[30] "TimeDomainBodyGyroscopeJerk-std()-X Axis (Average)"            
[31] "TimeDomainBodyGyroscopeJerk-std()-Y Axis (Average)"            
[32] "TimeDomainBodyGyroscopeJerk-std()-Z Axis (Average)"            
[33] "TimeDomainBodyAccelerometerMagnitude-mean() (Average)"         
[34] "TimeDomainBodyAccelerometerMagnitude-std() (Average)"          
[35] "TimeDomainGravityAccelerometerMagnitude-mean() (Average)"      
[36] "TimeDomainGravityAccelerometerMagnitude-std() (Average)"       
[37] "TimeDomainBodyAccelerometerJerkMagnitude-mean() (Average)"     
[38] "TimeDomainBodyAccelerometerJerkMagnitude-std() (Average)"      
[39] "TimeDomainBodyGyroscopeMagnitude-mean() (Average)"             
[40] "TimeDomainBodyGyroscopeMagnitude-std() (Average)"              
[41] "TimeDomainBodyGyroscopeJerkMagnitude-mean() (Average)"         
[42] "TimeDomainBodyGyroscopeJerkMagnitude-std() (Average)"          
[43] "FrequencyDomainBodyAccelerometer-mean()-X Axis (Average)"      
[44] "FrequencyDomainBodyAccelerometer-mean()-Y Axis (Average)"      
[45] "FrequencyDomainBodyAccelerometer-mean()-Z Axis (Average)"      
[46] "FrequencyDomainBodyAccelerometer-std()-X Axis (Average)"       
[47] "FrequencyDomainBodyAccelerometer-std()-Y Axis (Average)"       
[48] "FrequencyDomainBodyAccelerometer-std()-Z Axis (Average)"       
[49] "FrequencyDomainBodyAccelerometerJerk-mean()-X Axis (Average)"  
[50] "FrequencyDomainBodyAccelerometerJerk-mean()-Y Axis (Average)"  
[51] "FrequencyDomainBodyAccelerometerJerk-mean()-Z Axis (Average)"  
[52] "FrequencyDomainBodyAccelerometerJerk-std()-X Axis (Average)"   
[53] "FrequencyDomainBodyAccelerometerJerk-std()-Y Axis (Average)"   
[54] "FrequencyDomainBodyAccelerometerJerk-std()-Z Axis (Average)"   
[55] "FrequencyDomainBodyGyroscope-mean()-X Axis (Average)"          
[56] "FrequencyDomainBodyGyroscope-mean()-Y Axis (Average)"          
[57] "FrequencyDomainBodyGyroscope-mean()-Z Axis (Average)"          
[58] "FrequencyDomainBodyGyroscope-std()-X Axis (Average)"           
[59] "FrequencyDomainBodyGyroscope-std()-Y Axis (Average)"           
[60] "FrequencyDomainBodyGyroscope-std()-Z Axis (Average)"           
[61] "FrequencyDomainBodyAccelerometerMagnitude-mean() (Average)"    
[62] "FrequencyDomainBodyAccelerometerMagnitude-std() (Average)"     
[63] "FrequencyDomainBodyAccelerometerJerkMagnitude-mean() (Average)"
[64] "FrequencyDomainBodyAccelerometerJerkMagnitude-std() (Average)" 
[65] "FrequencyDomainBodyGyroscopeMagnitude-mean() (Average)"        
[66] "FrequencyDomainBodyGyroscopeMagnitude-std() (Average)"         
[67] "FrequencyDomainBodyGyroscopeJerkMagnitude-mean() (Average)"    
[68] "FrequencyDomainBodyGyroscopeJerkMagnitude-std() (Average)"

