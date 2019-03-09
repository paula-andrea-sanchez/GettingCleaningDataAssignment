### Variables and Data

In this programming assignment I created a tidy data set that shows the mean and std value of each feature/variable in the Human Activity Recognition Using Smartphones Data Set for each activity per subject used in the study. 

There where 30 subjects involved in study and 6 different types of activities:

1. walking
2. upstairs (walking upstairs)
3. downstairs (walking upstairs)
4. sitting
5. standing
6. laying                                           

(total activity-subject combinations: 180)

### Work performed

After loading every text file containing the variables set and the subject and activity data for the test and training data sets, I bind the variables sets by rows. Then, I load the feature text file that contained the variable names, selected only the ones realated to the mean or std operations and create two vectors with the indexes and names for the columns related to mean or std operations. I selected onñy the columns of interest (related with mean or std operation) of the data frame that contained all the variable sets information. Next, I add two factor columns to this last data frame. These columns had the subject and activity information from the subject and activity text files. Then, I change de numerical factor of the activity columns to a character factor containing the six values that appear above. Finally, I named the columns of the data frame with the original names provided in the Human Activity Recognition study, group the data frame by the activity and subject varibles, summarize the information usind the summarize_all function from dpylr library and save the results in a csv file.

