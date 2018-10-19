# Project Codebook

## Codebook Description
This codebook accompanies the "Getting and Cleaning Data" course project in which we tidy data from the Human Activity Recognition database.
First part describes the raw data with info from their own codebook and readme. 
Second part describes how to create 


## Study design and data processing

## Raw Data Description
Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

### Collection of the raw data
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

### Notes on the original (raw) data 
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

Activity Labels
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

## Creating the tidy datafile

### Guide to create the tidy data file
1. Download project data from here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Create a folder which you will set as the working directory and will place the relevant files in
3. Extract the following files from the zip folder into your working directory folder: "activity_labels.txt" "features.txt" "subject_test.txt" "subject_train.txt" "X_test.txt" "X_train.txt" "y_test.txt" "y_train.txt"
4. Run the run_analysis.R which will output the tidy data as a txt file
5. Congrats you're done!

### Proccessing of the data
The script takes the following steps:
1) Merging train and test data sets
2) Adding "id" and "activity" variables from external files
3) Filtering for only the mean and standard deviation variables 
4) Adding the header with variable names to the dataset
5) Creating a summary dataframe with the averages of each variable by id and then activity
6) Tidying the variable names and factor names by making them lowercase, removing dots or dashes and expanding abbreviations
7) Create txt file with final tidy summary table

## Description of the tidy_data.txt file
Dimensions of the dataset: 180 X 68

Variables present in the dataset: 

 [1] "id"                                                          "activity"                                                   
 [3] "timebodyaccelerationmeanx"                                   "timebodyaccelerationmeany"                                  
 [5] "timebodyaccelerationmeanz"                                   "timebodyaccelerationstandarddeviationx"                     
 [7] "timebodyaccelerationstandarddeviationy"                      "timebodyaccelerationstandarddeviationz"                     
 [9] "timegravityaccelerationmeanx"                                "timegravityaccelerationmeany"                               
[11] "timegravityaccelerationmeanz"                                "timegravityaccelerationstandarddeviationx"                  
[13] "timegravityaccelerationstandarddeviationy"                   "timegravityaccelerationstandarddeviationz"                  
[15] "timebodyaccelerationjerkmeanx"                               "timebodyaccelerationjerkmeany"                              
[17] "timebodyaccelerationjerkmeanz"                               "timebodyaccelerationjerkstandarddeviationx"                 
[19] "timebodyaccelerationjerkstandarddeviationy"                  "timebodyaccelerationjerkstandarddeviationz"                 
[21] "timebodygyroscopemeanx"                                      "timebodygyroscopemeany"                                     
[23] "timebodygyroscopemeanz"                                      "timebodygyroscopestandarddeviationx"                        
[25] "timebodygyroscopestandarddeviationy"                         "timebodygyroscopestandarddeviationz"                        
[27] "timebodygyroscopejerkmeanx"                                  "timebodygyroscopejerkmeany"                                 
[29] "timebodygyroscopejerkmeanz"                                  "timebodygyroscopejerkstandarddeviationx"                    
[31] "timebodygyroscopejerkstandarddeviationy"                     "timebodygyroscopejerkstandarddeviationz"                    
[33] "timebodyaccelerationmagnitudemean"                           "timebodyaccelerationmagnitudestandarddeviation"             
[35] "timegravityaccelerationmagnitudemean"                        "timegravityaccelerationmagnitudestandarddeviation"          
[37] "timebodyaccelerationjerkmagnitudemean"                       "timebodyaccelerationjerkmagnitudestandarddeviation"         
[39] "timebodygyroscopemagnitudemean"                              "timebodygyroscopemagnitudestandarddeviation"                
[41] "timebodygyroscopejerkmagnitudemean"                          "timebodygyroscopejerkmagnitudestandarddeviation"            
[43] "frequencybodyaccelerationmeanx"                              "frequencybodyaccelerationmeany"                             
[45] "frequencybodyaccelerationmeanz"                              "frequencybodyaccelerationstandarddeviationx"                
[47] "frequencybodyaccelerationstandarddeviationy"                 "frequencybodyaccelerationstandarddeviationz"                
[49] "frequencybodyaccelerationjerkmeanx"                          "frequencybodyaccelerationjerkmeany"                         
[51] "frequencybodyaccelerationjerkmeanz"                          "frequencybodyaccelerationjerkstandarddeviationx"            
[53] "frequencybodyaccelerationjerkstandarddeviationy"             "frequencybodyaccelerationjerkstandarddeviationz"            
[55] "frequencybodygyroscopemeanx"                                 "frequencybodygyroscopemeany"                                
[57] "frequencybodygyroscopemeanz"                                 "frequencybodygyroscopestandarddeviationx"                   
[59] "frequencybodygyroscopestandarddeviationy"                    "frequencybodygyroscopestandarddeviationz"                   
[61] "frequencybodyaccelerationmagnitudemean"                      "frequencybodyaccelerationmagnitudestandarddeviation"        
[63] "frequencybodybodyaccelerationjerkmagnitudemean"              "frequencybodybodyaccelerationjerkmagnitudestandarddeviation"
[65] "frequencybodybodygyroscopemagnitudemean"                     "frequencybodybodygyroscopemagnitudestandarddeviation"       
[67] "frequencybodybodygyroscopejerkmagnitudemean"                 "frequencybodybodygyroscopejerkmagnitudestandarddeviation" 
