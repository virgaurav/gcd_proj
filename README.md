#Getting and Cleaning DATA_ Course Proj
========
This repository is created for the course project of Coursera Course- Getting and Cleaning Data. It contains code run_analysis.R, which can be run process raw data and transform it into tidy data. In addition to the code it also contains CodeBook.md which documents the transformations performed on the data and other details about the variables in the data set.

##Data Source
The data for this project is the accelerometer data obtained from a smartphone during a study on tracking physical activity of test subjects. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

##How to run the code
1. Download the data from the above link and unzip it to obtain the folder 'UCI HAR DATASET'.
2. Place the 'UCI HAR DATASET' forlder inside a new folder named'data' in your working directory.
3. Now run the code from your working directory
4. As output, it will generate a tidy_data file which will be stored in 'data' folder.
5. The code needs 'data.table' and 'reshape2' packages to execute. Make sure you have them installed and loaded.
