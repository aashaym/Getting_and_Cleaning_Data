
library(plyr)
library(dplyr)

## setting  the directory path for the folder 
path<-getwd()
filetest<-file.path(path, "test")
filetrain<-file.path(path, "train")

## LOAD TEST data from the folder 
x_test<-read.table(file.path(filetest,"X_test.txt"))
y_test<-read.table(file.path(filetest,"Y_test.txt"))
subject_test<-read.table(file.path(filetest,"subject_test.txt"))

## LOAD TRAIN data from the folder

x_train<-read.table(file.path(filetrain,"X_train.txt"))
y_train<-read.table(file.path(filetrain,"Y_train.txt"))
subject_train<-read.table(file.path(filetrain,"subject_train.txt"))

## combining the data from TRAIN and TEST folders
x_data<-rbind(x_train,x_test)
y_data<-rbind(y_train,y_test)
subject_data<-rbind(subject_train,subject_test)

features <- read.table("features.txt")
## Extracts only the measurements on the mean and standard deviation for each measurement.
mean_stad_features <- grep("-(mean|std)\\(\\)", features[, 2])

## subseting columns
x_data <- x_data[, mean_stad_features]

## correct the column names
names(x_data) <- features[mean_stad_features, 2]


# #Use descriptive activity names to name the activities in the data set


activities <- read.table("activity_labels.txt")

# #update  with  activity names
y_data[, 1] <- activities[y_data[, 1], 2]

## correct column name
names(y_data) <- "activity"


# Appropriately label the data set with descriptive variable names


# correct column name
names(subject_data) <- "subject"

# bind all the data in a single data set
all_data <- data.frame(cbind(x_data, y_data, subject_data))


# Create a second, independent tidy data set with the average of each variable
# for each activity and each subject


# 66 <- 68 columns but last two (activity & subject)
average_of_data <- ddply(.all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(average_of_data, "tidy.txt", sep="   ",row.name=FALSE)
