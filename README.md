***This repo contains solution to the Getting and Cleaning Data's Course Project***

You can run the run_analysis.R by (you have to have the "UCI HAR Dataset" in the same directory): 
~~~
     Rscript run_analysis.R  
~~~
The output of the script is a test.txt file with tidy data set with the average of each variable for each activity and each subject

* The CodeBook.md explains each variable.

The script run_analysis.R does the following things:

* reading data sets (from X_test/train.txt) for both groups (test and training) and binding together in one data frame 

* reading column names and applying to the data frame

* choosing only mean and standard deviation variables from all available

* reading labels (from y_test/train.txt files) and adding as an extra column

* reading activity labels (from activity_labels.txt) and adding names to the data frame as an extra column 

* reading subjects (from subject_test/train.txt) and adding as an extra column 

* calculating mean for each subject and activity type using aggregate function

* writing table to the output file - test.txt 