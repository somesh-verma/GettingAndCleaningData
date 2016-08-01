## Getting And Cleaning Data Course Project - Somesh Verma

### Introduction
As part of this project, we have taken the data dump from UCI ML Repository and contains data from wearable devices. In this particular case, its a samsung device worn around the waist.

###How to Use
The extracted data is available "UCI HAR Dataset". This should be the working directory for the code to work. All file names is referenced from this location. The downloaded data is split into multiple files and also broken down under test/train. There are over 500+ variables in the raw data. As part of this excercise, we have merged multiple files into a single dataset (columwise) and then joined up the data from test and train by appending the rows. we have then only extracted the varibles which give the "mean()" and "std()" and taken average of the values based on per Subject and per Activity for each of the variables.

The codebook.md will give you more information on the stepwise transformation.

By running the "run_analysis.R" withount any input will create a dump file ("avgDataPerSubjectPerActivity.txt") as described above in the "UCI HAR Dataset".