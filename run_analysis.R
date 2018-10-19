#First step is to place all relevant files in a single folder and set it as your working directory
#Then we will load them into r
xtrain <- read.table("X_train.txt")
trainactivity <- read.table("y_train.txt")
header <- read.table("features.txt")
activitylabels <- read.table("activity_labels.txt")
xtest <- read.table("X_test.txt")
testactivity <- read.table("y_test.txt")
trainsubject <- read.table("subject_train.txt")
testsubject <- read.table("subject_test.txt")

#lets add the headers for both train and test sets which will help us merge them later
header <- as.character(header$V2)
colnames(xtrain) <- header
colnames(xtest) <- header

#now lets keep only the mean and standard deviation variables
#looking at the features info file, mean and standard deviation variables are denoted by having "mean()" and "std()"
#in the name. we'll use grepl to subset these columns
xtrain <- xtrain[,which(grepl("mean[()]|std[()]", names(xtrain)))]
xtest <- xtest[,which(grepl("mean[()]|std[()]", names(xtest)))]

#Because certain information is contained in seperate files from the main dataset we will complete
#the train and test sets before merging

#lets add the subject ID column
xtrain$id <- as.vector(trainsubject$V1)
xtest$id <- as.vector(testsubject$V1)

#now the activity column
#first lets translate the numbers that represent activities into their description
activitylabels <- as.character(activitylabels$V2)

trainactivity <- factor(trainactivity$V1, 
                        levels = c(1:6), 
                        labels = c(activitylabels))
testactivity  <- factor(testactivity$V1, 
                        levels = c(1:6), 
                        labels = c(activitylabels))

#merge them into the sets
xtrain$activity <- trainactivity
xtest$activity <- testactivity

#now we merge both sets
uglydata <- rbind(xtrain,xtest)

#lets re-arrange the new set so that it is ordered again by id and then activity
#you'll need the dplyr package installed so use the command below if you do not have it
# install.packages("dplyr")
library(dplyr)
uglydata <- arrange(uglydata, id,  activity)

#we have completed the first 4 steps of the assignment
#lets create a tidy set now that has the the average of each variable for each activity and each subject

#step one will take the averages. we'll turn the dataframe into a datatable to do this
library(data.table)
tidydata <- as.data.table(uglydata)
tidydata <- tidydata[, lapply(.SD, mean), by=list(id, activity)]

#now we make names and factors lower case and get rid of underscores or dots
tidydata$activity <- tolower(tidydata$activity)
names(tidydata) <- tolower(names(tidydata))
tidydata$activity <- gsub("_",  "", tidydata$activity)
names(tidydata) <- gsub("-",  "", names(tidydata))
names(tidydata) <- gsub("[()]",  "", names(tidydata))

#next we give descriptive variable names. the meaning of different abbreviations was taken from the features info file
names(tidydata) <- gsub("^t",  "time", names(tidydata))
names(tidydata) <- gsub("acc",  "acceleration", names(tidydata))
names(tidydata) <- gsub("^f",  "frequency", names(tidydata))
names(tidydata) <- gsub("mag",  "magnitude", names(tidydata))
names(tidydata) <- gsub("gyro",  "gyroscope", names(tidydata))
names(tidydata) <- gsub("std",  "standarddeviation", names(tidydata))

#make activity a factor variable
tidydata$activity <- as.factor(tidydata$activity)

#lastly we'll write the tidy data as a txt file
write.table(tidydata, file = "tidy_data.txt", row.names = FALSE)