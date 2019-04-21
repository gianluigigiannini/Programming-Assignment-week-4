library(dplyr)
setwd("~/Desktop/UCI HAR Dataset")
##first I'm going to create a table for each condition (train and test) containing only the information about mean and sd.

##read subject data with labels
subject_test_ID <- read.table("test/subject_test.txt")
colnames(subject_test_ID) <- "ID"

##read excercise type data
test_labels <- read.table("test/y_test.txt")
colnames(test_labels) <- "training session"

##read test sets and select only the mean and sd values.
X_test <- read.table("test/X_test.txt")
features <- read.table("features.txt")
features <- features[ ,2]
colnames(X_test) <- features
selected_var <- features[grep("mean\\(\\)|std\\(\\)", features)]
X_test <- X_test[ ,selected_var]

##assign labels to the excercise type
activity_labels <- read.table("activity_labels.txt")
test_labels$activitylabel <- factor(test_labels$'training session', labels = as.character(activity_labels[,2]))
activity <- test_labels[,2]

##create one bid data set for the selected train data
test <- cbind(subject_test_ID, activity, X_test)


##do the same for the train dataset
subject_train_ID <- read.table("train/subject_train.txt")
colnames(subject_train_ID) <- "ID"
train_labels <- read.table("train/y_train.txt")
colnames(train_labels) <- "training session"
X_train <- read.table("train/X_train.txt")
features <- read.table("features.txt")
features <- features[ ,2]
colnames(X_train) <- features
selected_var1 <- features[grep("mean\\(\\)|std\\(\\)", features)]
X_train <- X_train[ ,selected_var1]
train_labels$activitylabel <- factor(train_labels$'training session', labels = as.character(activity_labels[,2]))
activity <- train_labels[,2]
train <- cbind(subject_train_ID, activity, X_train)

##merge the two datasets, and arrange them
total <- rbind(train, test)
total <- arrange(total, ID)

##From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
total_mean <- total %>% group_by(ID, activity) %>% summarize_each(funs(mean))
write.table(total_mean, file = "part5.txt", row.names = FALSE, col.names = TRUE)

