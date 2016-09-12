# Getting and Cleaning Data Assignment
This is the course project for the Getting and Cleaning Data Coursera course. The data that this project is based on is from a University of California, Irvine (UCI) study on Human Activity Recognition Using Smartphones Data Set. Please refer to License below for the link.

## List of files
*  'README.md'
*  'CodeBook.md': Identifies the identifiers and variables of the data. Elaborates in words the analysis performed to clean up the data under the R code 'run_analysis.txt'
*  'run_analysis.R': Runs the code to read and merge the data, before extracting and labelling the relevant data to create a tidy data set and stores it into 'tidydata.txt' file.
*  'tidydata.txt': Contains the tidy data set which contains the average of each variable for each activity and subject. 

##Work Performed to clean up data
The R script, run_analysis.R, does the following:

1. Download data files
2. Read data 
3. Merge data sets to form one data set
4. Extact only the mean & standard deviation for each measurement
5. Label variable measurements with descriptive names
6. Name the activities as according to the Activity Labels as above
7. Creates a tidy dataset that consists of the average (mean) value of each variable for each subject and activity pair.
The end result is shown in the file tidy.txt

## License:
Use of this dataset in publications must be acknowledged by referencing the following publication [1]

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012, http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.





