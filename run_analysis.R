library(dplyr)

#1. Merges the training and the test sets to create one data set.

  # Load all text files to create data frame
  
  test_labels <- read.table("test/y_test.txt", header=FALSE)
  train_labels <- read.table("train/y_train.txt", header=FALSE)
  test_set <- read.table("test/x_test.txt", header=FALSE)
  train_set <- read.table("train/x_train.txt", header=FALSE)
  subject_test <- read.table("test/subject_test.txt", header=FALSE)
  subject_train <- read.table("train/subject_train.txt", header=FALSE)
  
  
  # Merge the test and training data frames
  
  df <- rbind(train_set, test_set)

#2. Extracts only the measurements on the mean and standard deviation for each measurement.

  # Select measurements that are related to mean or std operations in the feature.txt file
  
  mesu <- read.table("features.txt", header = FALSE)
  mean.mesu <- grep("[Mm]ean", mesu$V2)
  std.mesu <- grep("[Ss]td", mesu$V2)
  
  # Create two vectors with indexes and names of the columns related to mean or std operations
  
  ind.int <- sort(c(mean.mesu, std.mesu))
  mesu.int <- mesu$V2[ind.int]
  
  # From df select columns of interest
  
  df.int <- df[, ind.int]
  

#3. Uses descriptive activity names to name the activities in the data set

  #Create columns subject, activity and study in the merge test and training data frames 
  
  df.int$activity <- as.factor(c(test_labels[,1],train_labels[,1])) 
  
  df.int$subject <- as.factor(c(subject_test[,1], subject_train[,1]))
  
  df.int <- df.int %>% mutate(activity = recode(activity, "1" = "walking", "2" = "upstairs",
                                                               "3"="downstairs", "4" ="sitting",
                                                                "5" = "standing", "6" = "laying"))                                                

#4. Appropriately labels the data set with descriptive variable names.

  colnames(df.int) <- c(as.character(mesu.int), "activity", "subject")

#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

  df.tidy <- df.int %>% group_by_(.dots=c("activity","subject")) %>% summarise_all(funs(mean))
  write.csv(df.tidy, file="tidy-data.txt", row.names = FALSE)

