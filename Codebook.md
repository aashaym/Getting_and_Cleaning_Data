Introduction
The script run_analysis.R.does 5 steps in cleaning, combining and measuring the data.

First Step:-Combining, all the x and y data both in test and train are extracted  according to x-axis and y-axis.Both the folders combimed according to their axis. 
combined together by using the rbind() function.The  files will have the same number of columns as in the original data .
Second Step:-Subsetting & Substituting
 Names with the mean and standard deviation measures in the  feature.txt are extacteted and substituted as column names.
Third Step:-Activities     
As activity data is addressed with values 1:6, we take the activity names and IDs from activity_labels.txt and they are substituted in the dataset.
Fourth Step:- Binding all the Data
  This stage  I am going to bind data with column names 
Final Step:- Data manupulation:- we generate a new dataset with all the average measures for each subject and activity type (30 subjects * 6 activities = 180 rows). The output file is called tidy.txt, and uploaded to this repository.

Variables
x_train, y_train, x_test, y_test, subject_train and subject_test contain the data from the downloaded files.
x_data, y_data and subject_data merge the previous datasets for analysis.
features contains the correct names for the x_data dataset, which are applied to the column names stored in mean__stad_features,  vector used to extract the desired data.
A similar approach is taken with activity names through the activities variable.
all_data merges x_data, y_data and subject_data in a big dataset.
Lastly, tidy.txt contains the relevant averages which will be later stored in a .txt file. ddply() from the plyr package is used to apply colMeans() and ease the development.