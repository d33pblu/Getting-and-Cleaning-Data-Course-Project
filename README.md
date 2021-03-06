# Getting and Cleaning Data Course Project
This repository contains the run_analysis.R script to create the tidy dataset and the codebook with descriptions of the data (raw & tidy)

## Project Description
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Project Goals
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## R Script

### Processing of the data
The script makes the following changes and transformations of the original data:
1) Merging train and test data sets
2) Adding "id" and "activity" variables from external files
3) Filtering for only the mean and standard deviation variables 
4) Adding the header with variable names to the dataset
5) Creating a summary dataframe with the averages of each variable by id and then activity
6) Tidying the variable names and factor names by making them lowercase, removing dots or dashes and expanding abbreviations
7) Create txt file with final tidy summary table

### Guide to create the tidy data file
1. Download project data from here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Create a folder which you will set as the working directory and will place the relevant files in
3. Extract the following files from the zip folder into your working directory folder: "activity_labels.txt" "features.txt" "subject_test.txt" "subject_train.txt" "X_test.txt" "X_train.txt" "y_test.txt" "y_train.txt"
4. Run the run_analysis.R which will output the tidy data as a txt file
5. Congrats you're done!
